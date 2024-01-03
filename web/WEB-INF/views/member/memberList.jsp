
<%@page import="com.study.member.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="oracle.jdbc.proxy.annotation.Pre" %>
<%@ page import="com.study.member.service.IMemberService" %>
<%@ page import="com.study.member.service.MemberServiceImpl" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp"%>


<div class="container">

	<!-- START : 검색 폼  -->
	<div class="panel panel-default collapse in" id="id_search_area">
		<div class="panel-body">
			<form name="search" action="memberList.wow" method="post" class="form-horizontal">
				<input type="hidden" name="curPage" value="${paging.curPage}"> <input type="hidden" name="rowSizePerPage" value="${paging.rowSizePerPage}">
				<div class="form-group">
					<label for="id_searchType" class="col-sm-2 control-label">검색</label>
					<div class="col-sm-2">
						<select id="id_searchType" name="searchType" class="form-control input-sm">
							<option value="NM" ${search.searchType eq 'NM' ? "selected='selected'" : ""}>이름</option>
							<option value="ID" ${search.searchType eq 'ID' ? "selected='selected'" : ""}>아이디</option>
							<option value="HP" ${search.searchType eq 'HP' ? "selected='selected'" : ""}>핸드폰번호</option>
						</select>
					</div>
					<div class="col-sm-2">
						<input type="text" name="searchWord" class="form-control input-sm" value="${search.searchWord}" placeholder="검색어">
					</div>
					<div>
						<label for="id_searchJob" class="col-sm-1 col-sm-offset control-label">직업</label>
						<div class="col-sm-2">
							<select id="id_searchJob" name="searchJob" class="form-control input-sm" >
								<option value="">-- 전체 --</option>
								<c:forEach items="${jobList}" var="code">
									<option value="${code.commCd}" ${search.searchJob eq code.commCd ? "selected='selected'" : ""} >${code.commNm}</option>
								</c:forEach>
							</select>
						</div>
						<label for="id_searchHobby" class="col-sm-1 col-sm-offset control-label">취미</label>
						<div class="col-sm-2">
							<select id="id_searchHobby" name="searchHobby" class="form-control input-sm">
								<option value="">-- 전체 --</option>
								<c:forEach items="${hobbyList}" var="code">
									<option value="${code.commCd}" ${search.searchHobby eq code.commCd ? "selected='selected'" : ""}>${code.commNm}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-9 text-right">
						<button type="button" id="id_btn_reset" class="btn btn-sm btn-default">
							<i class="fa fa-sync"></i> &nbsp;&nbsp;초기화
						</button>
					</div>
					<div class="col-sm-1 text-right">
						<button type="submit" class="btn btn-sm btn-primary ">
							<i class="fa fa-search"></i> &nbsp;&nbsp;검 색
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- END : 검색 폼  -->

	<!-- START : 목록건수 및 새글쓰기 버튼  -->
	<div class="row" style="margin-bottom: 10px;">
		<div class="col-sm-3 form-inline">
			전체 ${paging.totalRowCount}건 조회
			<select id="id_rowSizePerPage" name="rowSizePerPage" class="form-control input-sm">
				<c:forEach var="i" begin="10" end="50" step="10">
					<option value="${i}" >${i}</option>
				</c:forEach>
			</select>
		</div>
	</div>
	<!-- END : 목록건수 및 새글쓰기 버튼  -->

	<h3>회원목록</h3>
	<div>
		<a href="memberForm.wow" class="btn btn-primary btn-sm pull-right">회원 등록</a>
	</div>
	<table class="table table-striped table-bordered">
		<caption class="hidden">회원목록 조회</caption>
		<colgroup>
			<col style="width: 15%"/>
			<col/>
			<col style="width: 20%"/>
			<col style="width: 20%"/>
			<col style="width: 15%"/>
			<col style="width: 15%"/>
		</colgroup>
		<thead>
		<tr>
			<th>ID</th>
			<th>회원명</th>
			<th>HP</th>
			<th>생일</th>
			<th>직업</th>
			<th>마일리지</th>
		</tr>
		</thead>

			<tbody>
			<c:forEach items="${memberVOList}" var="member">
			<tr>
				<td>${member.memId}</td>
				<td><a href="memberView.wow?memId=${member.memId}">
						${member.memName}	</a></td>
				<td>${member.memHp}</td>
				<td>${member.memBir}</td>
				<td>${member.memJobNm}</td>
				<td>${member.memMileage}</td>
			</tr>
			</c:forEach>
			</tbody>
	</table>

	<!-- START : 페이지네이션  -->
	<nav class="text-center">
		<ul class="pagination">

			<!-- 첫 페이지  -->
			<li><a href="memberList.wow?curPage=1" data-page="1"><span aria-hidden="true">&laquo;</span></a></li>


			<!-- 이전 페이지 -->
			<c:if test="${paging.curPage > paging.rowSizePerPage}">
				<li><a href="memberList.wow?curPage=${paging.firstPage - 1}}" data-page="${paging.firstPage - 1}}"><span aria-hidden="true">&lt;</span></a></li>
			</c:if>

			<!-- 페이지 넘버링  -->
			<c:forEach var="i" step="1" begin="${paging.firstPage}" end="${paging.lastPage}">
				<li ${paging.curPage eq i ? "class='active'" : ""}><a href="memberList.wow?curPage=${i}"  data-page="${i}" >${i}</a></li>
			</c:forEach>

			<!-- 다음  페이지  -->
			<c:if test="${paging.totalPageCount != paging.lastPage}">
				<li><a href="memberList.wow?curPage=" data-page="${paging.lastPage + 1}"><span aria-hidden="true">&gt;</span></a></li>
			</c:if>

			<!-- 마지막 페이지 -->
			<li><a href="memberList.wow?curPage=${paging.totalPageCount}" data-page="${paging.totalPageCount}"><span aria-hidden="true">&raquo;</span></a></li>
		</ul>
	</nav>
	<!-- END : 페이지네이션  -->

</div>

</body>

<script type="text/javascript">

	// 각 이벤트 등록
	// 페이지 링크 클릭, event전파방지, data속성값읽고 form태그 내의 input name=curPage값 바꾸기
	//submit

	const elPagination = document.querySelectorAll('ul.pagination li a')
	let formInput = document.querySelector("input[name=curPage]")
	const formTag = document.querySelector(".form-horizontal")


	elPagination.forEach(el => {
		el.addEventListener("click", (e) => {
			e.preventDefault()
			formInput.value = el.dataset['page']
			formTag.submit()

		})
	})




	// $('ul.pagination li a[data-page]').click(function(e) {
	//     e.preventDefault();
	//     let page = $(this).data("page");
	//
	// }); // ul.pagination li a[data-page]


	//form태그내의 버튼 클릭
	//이벤트전파방지, curPage 값 1로
	//submit


	const submitBtn = document.querySelector("button[type=submit]")
	submitBtn.addEventListener("click", (e) => {
		e.preventDefault()
		formInput.value = 1
		formTag.submit()

	})



	// $form.find("button[type=submit]").click(function(e) {
	//
	// });




	// 목록 갯수 변경
	// id_rowSizePerPage 변경되었을 때
	// 페이지 1, 목록수 = 현재값 으로 변경 후 서브밋
	$('#id_rowSizePerPage').change(function(e) {

	}); // '#id_rowSizePerPage'.change

	document.querySelector("#id_rowSizePerPage").addEventListener("change", (e) => {
		let a = document.querySelector("input[name=rowSizePerPage]")
		a.value = e.target.value
		formTag.submit()
	})




	// 초기화 버튼 클릭
	const resetBtn = document.querySelector("#id_btn_reset")
	const formTitle = document.querySelector("#id_searchType")
	const formSearch = document.querySelector("input[name=searchWord]")
	const formHobby = document.querySelector("#id_searchHobby")
	const formJob = document.querySelector("#id_searchJob")

	resetBtn.addEventListener("click", () => {
		formTitle.value = ""
		formSearch.value = ""
		formInput.value = 1
		formHobby.value = ""
		formJob.value = ""
		formTag.submit()
	})

</script>

</html>