console.log('review');

//모달 초기화
function reviewInit() {
	$('.modal-dialog').html(
		"<div class='modal-content modal-review' style='border: 3px solid #DFA01E !important;'>" +
		"<div class='modal-header' style='background-color: #113351; color: #fff; border-bottom: 3px solid #DFA01E;'>" +
		"<button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>" +
		"<h4 class='modal-title' id='myModalLabel'>レビュー登録</h4>" +
		"</div>" +
		"<div class='modal-body'>" +
		"<div class='review-form d-flex flex-row'>" +
		"<span class='align-middle' style='margin-right: 1rem;'>評価</span>" +
		"<div class='review-rating'>" +
		"<input type='radio' id='star5' name='review-star' value='5' />" +
		"<label class='full' for='star5'></label>" +
		"<input type='radio' id='star4half' name='review-star' value='4.5' />" +
		"<label	class='half' for='star4half'></label>" +
		"<input type='radio' id='star4' name='review-star' value='4' />" +
		"<label class='full' for='star4'></label>" +
		"<input type='radio' id='star3half' name='review-star' value='3.5' />" +
		"<label class='half' for='star3half'></label>" +
		"<input type='radio' id='star3' name='review-star' value='3' />" +
		"<label class='full' for='star3'></label>" +
		"<input type='radio' id='star2half' name='review-star' value='2.5' />" +
		"<label class='half' for='star2half'></label>" +
		"<input type='radio' id='star2' name='review-star' value='2' />" +
		"<label class='full' for='star2'></label>" +
		"<input type='radio' id='star1half' name='review-star' value='1.5' />" +
		"<label class='half' for='star1half'></label>" +
		"<input type='radio' id='star1' name='review-star' value='1' />" +
		"<label class='full' for='star1'></label>" +
		"<input type='radio' id='starhalf' name='review-star' value='0.5' />" +
		"<label class='half' for= 'starhalf'></label>" +
		"</div>" +
		"</div>" +
		"<div class='form-group'>" +
		"<label> 内容</label>" +
		"<textarea name='content' class='form-control' maxlength='1000'></textarea>" +
		"</div>" +
		"<div class= 'form-group'>" +
		"<label> 作成者</label>" +
		"<input name='writer' class='form-control' readonly>" +
		"</div>" +
		"<div class='form-group'>" +
		"<label>登録日</label>" +
		"<input name='regDate' class='form-control'>" +
		"</div>" +
		"</div>" +
		"<div class='modal-footer' style='background-color: #113351; color:#fff; border-top: 3px solid #DFA01E;'>" +
		"<button id='regReview' type='button' class='btn btn-poka-green'>登録</button>" +
		"<button id='modReview' type='button' class='btn btn-poka-warning'>修正</button>" +
		"<button id='removeReview' type='button' class='btn btn-poka-danger'>削除</button>" +
		"<button id='closeBtn' type='button' class='btn btn-poka-main' data - dismiss='modal'> 閉じる</button>" +
		"</div>" +
		"</div>"
	);
}

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


var reviewService = (function() {
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
		console.log('review displayTime()');

		var dateObj = new Date(regDate);
		var today = new Date();
		var str = "";


		//작성일이 오늘 날짜와 같으면
		if (dateObj.getDate() == today.getDate()) {
			//오늘 작성한 댓글 '시:분:초'으로 표시
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [(hh < 10 ? '0' : '') + hh, ':',
			(mi < 10 ? '0' : '') + mi, ':',
			(ss < 10 ? '0' : '') + ss].join('');
		} else { //그렇지 않으면
			//이전에 작성한 댓글은 '연/월/일'으로 표시
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();

			return [yy, '/',
				(mm < 10 ? '0' : '') + mm, '/',
				(dd < 10 ? '0' : '') + dd].join('');
		}
		//단, 10미만의 값은 0을 추가
	}

	return {
		reviewDate: reviewDate, get: get, modify: modify,
		remove: remove, getList: getList, add: add
	};
})();