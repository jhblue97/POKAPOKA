var followService = (function(){
	
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
	
	return { list1 : list1, list2 : list2};
})();