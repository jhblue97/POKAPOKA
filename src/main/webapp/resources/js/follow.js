var followService = (function(){
	
	//팔로우 추가
	function add(follow, callback, error){
		$.ajax({
			type : 'post',
			url : '/follow/new',
			data : JSON.stringify(follow),
			contentType: 'application/json; charset=UTF-8',
			success:function(follow, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status, error){
				if(error){
					error(error);
				}
			}
		});//END ajax
	}//END add()
	
	//팔로우 삭제
	function remove(fno, callback, error){
		$.ajax({
			type : 'delete',
			url : '/follow/' + fno,
			data : JSON.stringify({fno:fno}),
			contentType: 'application/json; charset=UTF-8',
			success:function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status, error){
				if(error){
					error(error);
				}
			}
		});//END ajax
	}//END remove()
	
	//팔로우 목록
	function list1(param, callback, error){
		var userid = param.userid;
		
		$.getJSON('/follow/list1/' + userid,
					function(result){
						if(callback){						
							callback(result);	//팔로우 목록
						}
					}
				).fail(function(xhr, statux, error){
					if(error){
						console.log(statux);
						error(error);
					}
			});
	}//END list1()
	
	//팔로워 목록
	function list2(param, callback, error){
		var userid = param.userid;
		
		$.getJSON('/follow/list2/' + userid,
					function(result){
						if(callback){						
							callback(result);	//팔로워 목록
						}
					}
				).fail(function(xhr, statux, error){
					if(error){
						console.log(statux);
						error(error);
					}
			});
	}//END list2()
	
	return { add: add, list1 : list1, list2 : list2, remove:remove};
})();