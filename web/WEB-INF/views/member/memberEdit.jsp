
<%@page import="com.study.member.vo.MemberVO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="com.study.member.service.IMemberService" %>
<%@ page import="com.study.member.service.MemberServiceImpl" %>
<%@ page import="com.study.exception.BizNotFoundException" %>
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


<c:if test="${bne != null}">
		<div class="alert alert-warning">해당 멤버를 찾을 수 없습니다</div>
		<a href="memberList.wow" class="btn btn-default btn-sm"> <span class="glyphicon glyphicon-list" aria-hidden="true"></span> &nbsp;목록
		</a>
</c:if>


<c:if test="${bne == null}">
 <div class="container">
	<h3>회원 정보 수정</h3>
	<form action="memberModify.wow" method="post" >
	<table class="table table-striped table-bordered">
		<tbody>
			<tr>
				<th>아이디</th>
				<td>${memberVO.memId} <input type="hidden" name="memId" value="${memberVO.memId}"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="memPass" class="form-control input-sm"
						    pattern="\w{4,}" title="알파벳과 숫자로 4글자 이상 입력"></td>
			</tr>
			<tr>
				<th>회원명</th>
				<td><input type="text" name="memName" class="form-control input-sm" value="${memberVO.memName}"
						   required="required" pattern="[가-힣]{2,}" title="한글로 2글자 이상 입력" ></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="memZip" class="form-control input-sm" value='${memberVO.memZip}'></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="memAdd1" class="form-control input-sm" value='${memberVO.memAdd1}'>
					<input type="text" name="memAdd2" class="form-control input-sm" value='${memberVO.memAdd2}'>
				</td>
			</tr>
			<tr>
				<th>생일</th>
				<td><input type="date" name="memBir" class="form-control input-sm" value='${memberVO.memBir}'></td>
			</tr>
			<tr>
				<th>메일</th>
				<td><input type="email" name="memMail" class="form-control input-sm" required="required" value='${memberVO.memMail}'></td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td><input type="tel" name="memHp" class="form-control input-sm" value='${memberVO.memHp}'></td>
			</tr>
			<tr>
				<th>직업</th>
				<td>

					<select name="memJob" class="form-control input-sm" >
						<option value="">-- 직업 선택 --</option>
						<option value="JB01" ${memberVO.memJob == "JB01" ? "selected = 'selected'" : ""}>주부</option>
						<option value="JB02" ${memberVO.memJob == "JB02" ? "selected = 'selected'" : ""}>은행원</option>
						<option value="JB03" ${memberVO.memJob == "JB03" ? "selected = 'selected'" : ""}>공무원</option>
						<option value="JB04" ${memberVO.memJob == "JB04" ? "selected = 'selected'" : ""}>축산업</option>
						<option value="JB05" ${memberVO.memJob == "JB05" ? "selected = 'selected'" : ""}>회사원</option>
						<option value="JB06" ${memberVO.memJob == "JB06" ? "selected = 'selected'" : ""}>농업</option>
						<option value="JB07" ${memberVO.memJob == "JB07" ? "selected = 'selected'" : ""}>자영업</option>
						<option value="JB08" ${memberVO.memJob == "JB08" ? "selected = 'selected'" : ""}>학생</option>
						<option value="JB09" ${memberVO.memJob == "JB09" ? "selected = 'selected'" : ""}>교사</option>
					</select>=
				</td>
			</tr>
			<tr>
				<th>취미</th>
				<td>

					<select name="memHobby" class="form-control input-sm" >
						<option value="">-- 취미 선택 --</option>
						<option value="HB01" ${memberVO.memHobby == "HB01" ? "selected = 'selected'" : ""}>서예</option>
						<option value="HB02" ${memberVO.memHobby == "HB02" ? "selected = 'selected'" : ""}>장기</option>
						<option value="HB03" ${memberVO.memHobby == "HB03" ? "selected = 'selected'" : ""}>수영</option>
						<option value="HB04" ${memberVO.memHobby == "HB04" ? "selected = 'selected'" : ""}>독서</option>
						<option value="HB05" ${memberVO.memHobby == "HB05" ? "selected = 'selected'" : ""}>당구</option>
						<option value="HB06" ${memberVO.memHobby == "HB06" ? "selected = 'selected'" : ""}>바둑</option>
						<option value="HB07" ${memberVO.memHobby == "HB07" ? "selected = 'selected'" : ""}>볼링</option>
						<option value="HB08" ${memberVO.memHobby == "HB08" ? "selected = 'selected'" : ""}>스키</option>
						<option value="HB09" ${memberVO.memHobby == "HB09" ? "selected = 'selected'" : ""}>만화</option>
						<option value="HB10" ${memberVO.memHobby == "HB10" ? "selected = 'selected'" : ""}>낚시</option>
						<option value="HB11" ${memberVO.memHobby == "HB11" ? "selected = 'selected'" : ""}>영화감상</option>
						<option value="HB12" ${memberVO.memHobby == "HB12" ? "selected = 'selected'" : ""}>등산</option>
						<option value="HB13" ${memberVO.memHobby == "HB13" ? "selected = 'selected'" : ""}>개그</option>
						<option value="HB14" ${memberVO.memHobby == "HB14" ? "selected = 'selected'" : ""}>카레이싱</option>
						<c:forEach items="#{hobbyList}" var="job">
							<option value="HB"
						</c:forEach>

					</select>
				</td>
			</tr>
			<tr>
				<th>마일리지</th>
				<td>${memberVO.memMileage}</td>
			</tr>
			<tr>
				<th>탈퇴여부</th>
				<td>${memberVO.memDelYn}</td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="memberList.wow" class="btn btn-info btn-sm">
					<span class="glyphicon glyphicon-list" aria-hidden="true"></span>
					&nbsp;목록으로
					</a>
					<button type="submit" class="btn btn-primary">
					<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
					&nbsp;&nbsp; 저장
					</button>

						<button type="submit" formaction="memberDelete.wow" class="btn btn-danger btn-sm">
					<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
					&nbsp;&nbsp; 삭제
					</button>


				</td>
			</tr>
		</tbody>
	</table>
	</form>
</div>
</c:if>

</body>
</html>



