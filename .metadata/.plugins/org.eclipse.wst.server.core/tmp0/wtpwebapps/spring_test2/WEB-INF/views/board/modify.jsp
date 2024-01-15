<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../layout/header.jsp"></jsp:include>
<c:set value="${bdto.bvo }" var="bvo" />
<h2>Board Modify Page</h2>
<div class="container-md">
<form action="/board/modify" method="post">
<div class="mb-3">
  <label for="bno" class="form-label">bno</label>
  <input type="text" name="bno" class="form-control" id="bno" readonly  value="${bvo.bno }">
</div>
<div class="mb-3">
  <label for="title" class="form-label">title</label>
  <input type="text" name="title" class="form-control" id="title" placeholder="title" value="${bvo.title }">
</div>
<div class="mb-3">
  <label for="writer" class="form-label">writer</label>
  <input type="text" class="form-control"  name="writer" id="writer" readonly  value="${bvo.writer }">
</div>
<div class="mb-3">
  <label for="content" class="form-label">content</label>
  <textarea class="form-control"  name="content" id="content" rows="3">${bvo.content }</textarea>
</div>

<!-- 파일 표시라인 -->
<c:set value="${bdto.flist }" var="flist"></c:set>
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
						<svg xmlns="http://www.w3.org/2000/svg" width="37" height="37" fill="currentColor" class="bi bi-brightness-high-fill" viewBox="0 0 16 16">
  							<path d="M12 8a4 4 0 1 1-8 0 4 4 0 0 1 8 0zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
						</svg>
						<button type="button" data-uuid="${fvo.uuid }" class="btn btn-outline-danger file-x">X</button>
					</div>
				</li>
			</c:forEach>
			</ul>
			
			
<button type="submit" class="btn btn-success" id="regBtn">전송</button>
<a href="/board/list"><button type="button" class="btn btn-primary">리스트</button></a>

</form>
</div>
<script src="/resources/js/boardModify.js"></script>