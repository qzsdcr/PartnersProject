







<!-- joinform1 로 대체 됨 -->






<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원가입</h3>
	<form action="join">
		아이디 : <input type="text" name="memid" /> <input type="button"
			value="중복확인" /> <br /> 비밀번호 : <input type="text" name="mempass" />
		<br /> 비밀번호 확인 : <input type="text" name="mempass" /> <br /> 이름 : <input
			type="text" name="memname" /> 
			
			<br /> 
			성별 :
			<input type="radio" name="memsex" value="남성" />남성
			<input type="radio" name="memsex" value="여성" />여성

			<br />
		<br /> <input type="text" name="membirth" placeholder="주민등록번호 앞 6글자"
			size="18" /> -ㅇㅇㅇㅇㅇㅇㅇ<br /> 
			이메일 : <input type="email" name="mememail" />
		<br /> 핸드폰 번호 : <input type="tel" name="mempnum" /> 예) 010-1111-2222
		<p>활동지역 :</p>
          	<input type="checkbox" name="memaddress" value="가산" />가산 
		    <input type="checkbox" name="memaddress" value="구로" />구로 
		    <input type="checkbox" name="memaddress" value="강남" />강남 
		    <input type="checkbox" name="memaddress" value="여의도" />여의도 
		    <input type="checkbox" name="memaddress" value="판교" />판교 <br /> 
			
		<p>선호음식</p>
		<input type="checkbox" name="memlikemenu" value="한식" />한식 <input
			type="checkbox" name="memlikemenu" value="중식" />중식 <input
			type="checkbox" name="memlikemenu" value="양식" />양식 <input
			type="checkbox" name="memlikemenu" value="분식" />분식 <input
			type="checkbox" name="memlikemenu" value="잡식" />잡식 <br /> 
			<input	type="submit" value="확인" />
	</form>



</body>
</html>