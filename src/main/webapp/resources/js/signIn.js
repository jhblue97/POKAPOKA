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
				url: '/',
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
$('.id_input').on("propertychange change keyup paste input", function(){

	console.log("keyup 테스트");	

});
