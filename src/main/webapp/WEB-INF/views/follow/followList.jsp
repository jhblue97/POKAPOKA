<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.followbox {
    position: fixed;
    bottom: 0;
    right: 30px;
    width: 300px;
    height: 400px;
    background-color: #fff;
    font-family: 'Lato', sans-serif;

    -webkit-transition: all 600ms cubic-bezier(0.19, 1, 0.22, 1);
    transition: all 600ms cubic-bezier(0.19, 1, 0.22, 1);
z-index: 999;
    display: -webkit-flex;
    display: flex;

    -webkit-flex-direction: column;
    flex-direction: column;
}

.followbox--tray {
    bottom: -350px;
}

.followbox--closed {
    bottom: -400px;
}

.followbox__title {
    border-bottom: none;
}

.followbox__title {
    min-height: 50px;
    padding-right: 10px;
    background-color: #DFA01E;
    cursor: pointer;

    display: -webkit-flex;
    display: flex;

    -webkit-align-items: center;
    align-items: center;
}

.followbox__title h5 {
    height: 50px;
    margin: 0 0 0 15px;
    line-height: 50px;
    position: relative;
    padding-left: 20px;

    -webkit-flex-grow: 1;
    flex-grow: 1;
}

.followbox__title h5 a {
    color: #fff;
    max-width: 195px;
    display: inline-block;
    text-decoration: none;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.followbox__body {
  overflow-y: scroll;
  height:100%;
  }
/*======================Chat Box Ends=====================================================*/


</style>
<script>
(function($) {
    $(document).ready(function() {
        var $followbox = $('.followbox'),
            $followboxTitle = $('.followbox__title'),
            $followboxCredentials = $('.followbox__credentials');
        $followboxTitle.on('click', function() {
            $followbox.toggleClass('followbox--tray');
        });
    });
})(jQuery);

</script>
<div class="container">
	<div class="row">
	    <div class="followbox followbox--tray ">
		    <div class="followbox__title ">
		        <h5><a href="javascript:void(0)"><i class="fas fa-user-friends"></i>  follow / follower</a></h5>
		    </div>
		    <div class="followbox__body">
			    <ul class="list-group list-group-flush">
				    <li class="list-group-item d-flex justify-content-between align-items-center">
				  	follow
				  	<span id="followcnt" class="badge badge-primary badge-pill"></span>
				  	</li>
				  	<!-- ?????? ???????????? -->
				  	<div id="followList" class="dropdown"></div>
				
				</ul>
				<ul class="list-group list-group-flush ">
					  <li class="list-group-item d-flex justify-content-between align-items-center">
					 follower
<!-- 					   <span class="badge badge-primary badge-pill">2</span> -->
					  </li>
					  <!-- ????????? ????????? -->
					  <div id="followerList" class="dropdown"></div>

				</ul>
			</div>
		</div>
	</div>
</div>
<script src="/resources/js/follow.js"></script> 
<script>
$(function(){
	var userid = '<sec:authentication property="principal.user.user_id"/>';
	var followList = $('#followList');
	var followerList = $('#followerList');
	showFollow();
	showFollower();
	
	//????????? ?????????
	function showFollow(){
		followService.list1(
		{ userid:userid},
			function(list){
				//????????? ????????? ????????? li??? ????????? ????????? ??????
				if(list == null || list.length == 0){
					followList.html('');
					return;
				}
			
				//????????? ????????? ????????? li??? div ??????
				var str ="";
				for(var i=0; i<list.length; i++){
					str += "<li class='list-group-item d-flex justify-content-between align-items-center list-group-item-action' id='dropdownMenu2' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>" + 
						"<div class='d-flex w-100 justify-content-between align-items-center'>" +
				      "<img src='"+ list[i].img +"' class='img-thumbnail' style='width:50px; height:50px;'>" +
				      "<p class='mb-1'>"+ list[i].follow +"</p>" +
				      "<small class='text-muted col-6'><i class='fas fa-circle' style='color:lightgreen;'></i> ?????????</small></div>" + 
				      "<div class='dropdown-menu' aria-labelledby='dropdownMenu2'>" +
					    "<button class='dropdown-item'>????????????</button>" +
					    "<button class='dropdown-item' onclick='followDel(\""+ list[i].fno +"\")'>???????????????</button></div>";
				}
				followList.html(str);
			}
				
		);//END list1
	}//END showFollow
	
	//????????? ?????????
	function showFollower(){
		followService.list2(
				{ userid:userid},
					function(list){
						//????????? ????????? ????????? li??? ????????? ????????? ??????
						if(list == null || list.length == 0){
							followerList.html('');
							return;
						}
					
						//????????? ????????? ????????? li??? div ??????
						var str ="";
						for(var i=0; i<list.length; i++){
							str += "<li class='list-group-item d-flex justify-content-between align-items-center list-group-item-action' id='dropdownMenu2' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>" +
								"<div class='d-flex w-100 justify-content-between align-items-center'>" +
						      "<img src='"+ list[i].img +"' class='img-thumbnail' style='width:50px; height:50px;'>" +
						      "<p class='mb-1'>"+ list[i].follower +"</p>" +
						      "<small class='text-muted col-6'><i class='fas fa-circle' style='color:lightgreen;'></i> ?????????</small></div>" +
						      "<div class='dropdown-menu' aria-labelledby='dropdownMenu2'>" +
							    "<button class='dropdown-item' type='button'>????????????</button>";
						}
						followerList.html(str);
					}
						
				);//END list1
	}
	
	
	
})
//????????? ??????
function followDel(fno){
	
$.get('/follow/' + fno,
	function(result){
		if(result=="success"){
			callback(result);
			alert('???????????? ?????????????????????.');
			showFollow();
		}
	}
	).fail(function(xhr, status, error){
		if(error){
			error(error);
			alert('????????????');
		}
	});
	
}//END ????????? ??????
</script>