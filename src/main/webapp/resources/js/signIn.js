$(function() {
	$(document).ready(function() {
		//이메일 선택시 데이터 전송
		$('select[name=emailSelection]').change(function() {

			if ($(this).val() == "direct") {

				$('#mail2').val("");
				$("#mail2").attr("readonly", false);
				$('#mail2').focus();

			} else {

				$('#mail2').val($(this).val());

				$("#mail2").attr("readonly", true);
			}
			
			$('#email').val($('#mail1').val() + $('#mail2').val());
		});
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
