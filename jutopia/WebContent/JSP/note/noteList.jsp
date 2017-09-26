<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Basic</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="./CSS/note/noteList.css" rel="stylesheet" type="text/css">
<script>

    // 페이지 클릭시 호출
    function movePage(page_num) {
        var f = document.searchForm;
        f.page_num.value = page_num;
        f.submit();
    }

    // 삭제할때 호출
    function noteDelete(note_num) {
        if (!confirm("쪽지를 삭제할까요?")) return;

        // post 방식으로 삭제 호출 
        $.post('noteDelete.do', {note_num: note_num},
            function (check) {
                
                location.reload();
               
            }
        );
    }
</script>
</head>

<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<form name="searchForm" id="searchForm">
					<input type="hidden" name="page_num" value="${page_num}" />
					<input type="hidden" name="note_num" id="note_num" value="${note_num}" />

					<div class="row" style="padding-bottom: 10px;">
						<div class="col-md-8">
							<!-- <a href="reservationForm.do" class="btn btn-primary">예약 페이지</a> -->
							<a href="noteForm.do" class="btn btn-primary">쪽지보내기</a> <a
								href="noteList.do" class="btn btn-primary">회원 페이지</a>

						</div>
						<div class="col-md-4 text-right">
							<p style="padding: 10px;">
								     답변 쪽지수 : <span class="badge" style="background-color: #5cb85c;">${totalCount - unreadCount}</span> /
					                             미답변 쪽지수 : <span class="badge">${unreadCount}</span> /
					                             총 보낸쪽지수 : <span class="badge">${totalCount}</span>
							</p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<table class="table table-bordered table-responsive" style="table-layout:fixed">
								<thead>
									<tr>
										<th>쪽지번호</th>
										<th>보낸사람</th>
										<th>받는사람</th>
										<th width="32%">보낸내용</th>
										<th>답변유무</th>
										<th>보낸낸일시</th>
										<th>답변일시</th>
										<th>삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${fn:length(noteList) > 0}">
											<c:forEach var="list" items="${noteList}" varStatus="status">
												<tr id="tr_${status.index}">
													<td>${list.note_num}</td>
													<td>${list.note_sender}</td>
													<td>${list.note_recipient}</td>
													 <td class="text-left" style="text-overflow:ellipsis; overflow:hidden;">
													 <a href="noteShowForm.do?note_num=${list.note_num}"> ${list.note_contents}</a></td>
													
													<td><c:choose>
															<c:when test="${fn:length(list.note_reply) > 0}">
																<span class="btn btn-success" data-toggle="collapse"
																	data-target="#collapse_${list.note_num}"
																	aria-expanded="false"
																	aria-controls="collapse_${list.note_num}">답변함</span>
															</c:when>
															<c:otherwise>
																<span class="btn btn-default">미답변</span>
															</c:otherwise>
														</c:choose>
													</td>
													<td>${list.note_send_time}</td>
													<td>${list.note_reply_time}</td>
													<td>
														<button type="button" onclick="noteDelete(${list.note_num})" class="btn btn-danger">삭제</button>
													</td>
												</tr>
												<c:if test="${fn:length(list.note_reply) > 0}">
													<tr id="tr_reply_${list.note_num}">
														<td colspan="8" style="padding: 0; word-break: break-all;"">
															<div class="collapse" id="collapse_${list.note_num}"
																style="margin: 10px;">
																<div class="well text-left"
																	style="margin: 0; display: flex; padding: 10px;">
																	${list.note_reply}</div>
															</div>
														</td>
													</tr>
												</c:if>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="7">보낸 쪽지들이 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>

				</form>
			</div>
		</div>
		<div class="row text-center">
			<div class="col-lg-12">${page}</div>
		</div>
	</div>

	<!-- 답변 Modal -->
	<div class="modal fade" id="modal_reply_detail" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">답변내용</h4>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>