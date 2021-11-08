console.log("review");

var reviewService = (function() {
	// 리뷰 목록 - getList
	function getList(param, callback, error) {
		console.log('get Review List');

		var gno = param.gno;
		var page = param.page || 1;

		$.getJSON('/replies/pages/' + gno + '/' + page + '.json',
			function(result) {
				if (callback) {
					callback(result);	//댓글 목록만
					//callback(result.replyCnt, result.list);	//댓글 수, 댓글 목록
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
			data: JSON.stringify(reply),
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
	function reviewDate() {

	}


	return {
		reviewDate: reviewDate, get: get, modify: modify,
		remove: remove, getList: getList, add: add
	};
})();