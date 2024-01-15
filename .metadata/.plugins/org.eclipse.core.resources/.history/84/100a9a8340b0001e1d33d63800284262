<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp"></jsp:include>

<c:set value="${bdto.bvo }" var="bvo" />


<div class="container-md3" style="width: 500px;">
<div>
	<div class="mb-3">
		<label for="title" class="form-label">title</label>
		<input type="text" name="title" class="form-control" id="title" disabled value="${bvo.title}">
	</div>
</div>
<div>
	<div class="mb-3">
		<label for="writer" class="form-label">writer</label>
		<input type="text" name="writer" class="form-control" id="writer" disabled value="${bvo.writer}">
	</div>
</div>
<div>
	<div class="mb-3">
		<label for="content" class="form-label">content</label>
		<textarea class="form-control" id="content" name="content"  rows="3" disabled>${bvo.content}</textarea>
	</div>
</div>

<a href="/board/list"><button type="button" class="btn btn-primary">List</button></a>
<a href="/board/modify?bno=${bvo.bno }"><button>수정</button></a>
<a href="/board/remove?bno=${bvo.bno }"><button>삭제</button></a>
<hr>
<br>
	<!-- 댓글 등록 라인 -->
	<div class="input-group mb-3">
  		<span class="input-group-text" id="cmtWriter">${bvo.writer }</span>
  		<input type="text" class="form-control" id="cmtText" aria-label="Amount (to the nearest dollar)">
  		<button type="button" class="btn btn-success" id="cmtPostBtn">Post</button>
	</div>


	<!-- 댓글 표시 라인 -->
	<ul class="list-group list-group-flush" id="cmtListArea"> 
  		<li class="list-group-item">
  			<div class="mb-3">
  				<div class="fw-bold">Writer</div>
  				content
  			</div>
  			<span class="badge rounded-pill text-bg-warning">modAt</span>
  		</li>
	</ul>
	<!-- 댓글 더보기 버튼 -->
<div>
	<button type="button" id="moreBtn" data-page="1" class="btn btn-dark" style="visivility:hidden">MORE+</button>
</div>

<!-- 파일 표시 라인 -->
<c:set value="${bdto.flist }" var="flist"></c:set>
	<div class="col-12">
	<label for="f" class="form-label"></label>
		<ul class="list-group list-group-flush">
			<c:forEach items="${flist }" var="fvo">
				<li class="list-group-item">
					<c:choose>
						<c:when test="${fvo.fileType == 1}">
							<div>
								<img alt="" src="/upload/${fvo.saveDir }/${fvo.uuid}_th_${fvo.fileName}">
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<!-- 일반 파일 표시할 아이콘 -->
								<i class="bi bi-file-earmark-bar-graph"></i>
							</div>
						</c:otherwise>
					</c:choose>
					<div class="ms-2 me-auto">
						<div class="fw-bold">${fvo.fileName }</div>
						<a href="/upload/${fvo.saveDir }/${fvo.uuid}_${fvo.fileName}" download="${fvo.fileName }">
							<svg xmlns="http://www.w3.org/2000/svg" width="37" height="37" fill="currentColor" class="bi bi-brightness-high-fill" viewBox="0 0 16 16">
  								<path d="M12 8a4 4 0 1 1-8 0 4 4 0 0 1 8 0zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
							</svg>
						</a>
					</div>
				</li>
			</c:forEach>
			</ul>
	</div>
	
<!-- 모달창 라인 -->
<div class="modal" id="myModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Writer</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div class="input-group mb-3">
      		<input type="text" class="form-control" id="cmtTextMod" >
   	 	    <button type="button" class="btn btn-primary" id="cmtModBtn">Post</button>
      	</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

	
</div>
<script type="text/javascript">
let bnoVal = `<c:out value="${bdto.bvo.bno}" />`;
console.log(bnoVal);
</script>

<script src="/resources/js/boardComment.js"></script>
<script type="text/javascript">
spreadCommentList(bnoVal);
</script>
<jsp:include page="../layout/footer.jsp"></jsp:include>




