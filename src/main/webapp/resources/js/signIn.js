$(function() {
	$(document).ready(function() {
		//이메일 선택시 데이터 전송
		$('select[name=emailSelection], #mail2').change(function() {

			if ($(this).val() == "direct") {

				$('#mail2').val("");
				$("#mail2").attr("readonly", false);
				$('#mail2').focus();

			} else {

				$('#mail2').val($(this).val());

				$("#mail2").attr("readonly", true);
			}
			
			$('#email').val($('#mail1').val() + '@' + $('#mail2').val());
		});
		
		//파일의 확장자나 크기의 사전 처리
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 1048576;	//1MB
		
		function checkExtension(fileName, fileSize){
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드 할 수 없습니다.");
				return false;
			}
			return ture;
		}//END 파일의 확장자나 크기의 사전 처리
		
		//파일 업로드 처리
		$("#uploadBtn").on("click", function(e){
			var formData = new FormData();
			var inputFile = $("input[name='img']");
			var files = inputFile[0].files;
			
			for(var i = 0; i<files.lenth;i++){
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				url: '/uploadAjaxAction2',
				processData: false,
				contentType: false,
				data:formData,
				type:'POST',
				dataType:'json',
				success:function(result){
					console.log(result);
				}
			}); //$.ajax
		});//END 파일 업로드 처리
		
	});
});


//프로필 이미지 미리보기
function setThumbnail(event) { 
   var reader = new FileReader();
   	reader.onload = function(event) { 
	   var img = document.getElementById("view_img"); 
	 
	   img.setAttribute("src", event.target.result); 
   }; 
   reader.readAsDataURL(event.target.files[0]); 
}

//아이디 중복검사
function chkId(userid, callback, error){
	
	//사용가능한 아이디
	$('.id_ok').css("display", "inline-block");
	$('.id_already').css("display", "none");
	if($("#user_id").val() == ""){
		$('.id_ok').css("display", "none");
		$('.id_already').css("display", "none");
	}
	$.get("/user/chkId/" + userid,
		function(result){
			if(result == "success") {	//사용불가, 중복값있음
				$('.id_already').css("display", "inline-block");
				$('.id_ok').css("display", "none");
			}
		}
			).fail(function(xhr, status, er){
				if(error){
					error(er);
					alert('에러발생');
				}
			});
}

//닉네임 중복검사
function chkNik(nickname, callback, error){
	
	//사용가능한 아이디
	$('.nik_ok').css("display", "inline-block");
	$('.nik_already').css("display", "none");
	
	if($("#nickname").val() == ""){
		$('.nik_ok').css("display", "none");
		$('.nik_already').css("display", "none");
	}
	$.get("/user/chkNick/" + nickname,
		function(result){
			if(result == "success") {	//사용불가, 중복값있음
				$('.nik_already').css("display", "inline-block");
				$('.nik_ok').css("display", "none");
			}
		}
			).fail(function(xhr, status, er){
				if(error){
					error(er);
					alert('에러발생');
				}
			});
}

//비밀번호 체크
function chkPw(){
	var pw = document.getElementById('user_pw');
	var pw_re = document.getElementById('user_pw_re');
	
	
	if(pw.value != pw_re.value){	//일치
		$('.pw_no').css("display", "inline-block");
		$('.pw_ok').css("display", "none");
	}else{ //불일치
		$('.pw_ok').css("display", "inline-block");
		$('.pw_no').css("display", "none");
	}
}



