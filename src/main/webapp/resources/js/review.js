console.log("review");

var reviewService = (function() {
	// 리뷰 목록 - getList
	function getList(param, callback, error) {
		console.log('get Review List');

		var gno = param.gno;
		var page = param.page || 1;

		$.getJSON('/review/pages/' + gno + '/' + page + '.json',
			function(result) {
				if (callback) {
					callback(result.list);	//댓글 목록만
					//callback(result.reviewCnt, result.list);	//댓글 수, 댓글 목록
				}
			}
		).fail(function(xhr, status, er) {
			if (error) {
				error(er);
			}
		});
	}

	// 리뷰 개별 조회 - get

	function get(rno, callback, error) {
		console.log('get Review');

		$.get('/review/' + rno + '.json',
			function(result) {
				if (callback) {
					callback(result);
				}
			}
		).fail(function(xhr, status, er) {
			if (error) {
				error(er);
			}
		});
	}

	// 리뷰 등록 - add
	function add(review, callback, error) {
		console.log('add Review');
		$.ajax({
			type: 'post',
			url: '/review/add',
			data: JSON.stringify(review),
			contentType: 'application/json; charset=UTF-8',
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});//END ajax()
	}

	// 리뷰 수정 - modify
	function modify(review, callback, error) {
		console.log('mod Review');

		$.ajax({
			type: 'put',
			url: '/review/' + review.rno,
			data: JSON.stringify(review),
			contentType: 'application/json; charset=UTF-8',
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});//END ajax()
	}

	// 리뷰 삭제 - remove
	function remove(rno, writer, callback, error) {
		console.log('remove Review');

		$.ajax({
			type: 'delete',
			url: '/review/' + rno,
			data: JSON.stringify({ rno: rno, writer: writer }),
			contentType: 'application/json; charset=UTF-8',
			success: function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});//END ajax()

	}

	// 리뷰 등록 일자 - reviewDate
	function reviewDate(regDate) {
		console.log('review displayTime()' );
		
		var dateObj = new Date(regDate);
		var today   = new Date();
		var str     = "";


		//작성일이 오늘 날짜와 같으면
		if(dateObj.getDate() == today.getDate()) {  
			//오늘 작성한 댓글 '시:분:초'으로 표시
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
						
			return [ (hh < 10 ? '0' : '') + hh, ':', 
					 (mi < 10 ? '0' : '') + mi, ':', 
					 (ss < 10 ? '0' : '') + ss      ].join(''); 			
		} else { //그렇지 않으면
			//이전에 작성한 댓글은 '연/월/일'으로 표시
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			
			return [ yy, '/', 
					 (mm < 10 ? '0' : '') + mm, '/', 
					 (dd < 10 ? '0' : '') + dd      ].join(''); 	
		}	
		//단, 10미만의 값은 0을 추가
	}

	return {
		reviewDate: reviewDate, get: get, modify: modify,
		remove: remove, getList: getList, add: add
	};
})();