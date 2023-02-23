<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더</title>
</head>
<body>
   <h1>캘린더</h1>
   <h1>${calendarDetail.menuid}</h1>
   <h1>${calendarDetail.menulist}</h1>
   <h1>${calendarDetail.menufilesrc}</h1>
   <%
      // 현재 년월이 담겨있음  1월은 0, 12월은 11이므로 1을 더해줍니다.
   java.util.Calendar cal = java.util.Calendar.getInstance();
   int nowYear = cal.get(java.util.Calendar.YEAR);
   int nowMonth = cal.get(java.util.Calendar.MONTH) + 1;

   // year년과 month를 받아옴 (이전 달, 다음 달 클릭하였을 때 받아오는 값)
   String fyear = request.getParameter("year");
   String fmonth = request.getParameter("month");

   // 현재 연,월
   int year = nowYear;
   int month = nowMonth;

   // 널값이 아니면 해당하는 fyear값은 year
   if (fyear != null) {
      year = Integer.parseInt(fyear);
   }
   if (fmonth != null) {
      month = Integer.parseInt(fmonth);
   }

   // 넘어온값을 새로운 cal객체 생성한 곳에 입력
   cal.set(year, month - 1, 1);

   // 입력된 년과 달을 값을 다시 year, month로 선언
   year = cal.get(Calendar.YEAR);
   month = cal.get(Calendar.MONTH) + 1;

   int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
   int week = cal.get(Calendar.DAY_OF_WEEK);
   %>



   <%-- 이전 달과 다음 달로 이동하는 링크를 만듭니다. --%>
   <p>
      <%-- 기존코드   <a href="${pageContext.request.contextPath}/calendar?year=<%= year %>&month=<%= month - 1 %>">이전달</a> --%>
      <a
         href="${pageContext.request.contextPath}/calendar?year=${ month == 1 ? year-1 : year }&month=${ month == 1 ? 12 : month-1 }">이전달</a>
      &nbsp; &nbsp; <b>${year}년 &nbsp;&nbsp;${month}월</b> <a
         href="${pageContext.request.contextPath}/calendar?year=${ month == 12 ? year+1 : year }&month=${ month == 12 ? 1 : month+1 }">다음달</a>
      <%-- 기존코드  <a href="${pageContext.request.contextPath}/calendar?year=${year}&month=${month+1}">다음달</a>   --%>


   </p>

   <%-- 현재 월의 캘린더를 출력합니다. --%>
   <table border="1">
      <tr>
         <th>일</th>
         <th>월</th>
         <th>화</th>
         <th>수</th>
         <th>목</th>
         <th>금</th>
         <th>토</th>
      </tr>
      <%-- 현재 월의 1일의 요일을 구합니다. --%>
      <%
         cal.set(year, month - 1, 1);
      int firstDayOfWeek = cal.get(java.util.Calendar.DAY_OF_WEEK);
      %>

      <%
         int date = 1;

      for (int i = 1; i <= 5; i++) {
         out.print("<tr>");

         for (int j = 1; j <= 7; j++) {
            if (i == 1 && j < firstDayOfWeek) {
         out.print("<td></td>");
            } else if (date > endDay) {
         out.print("<td></td>");
            } else {
         out.print("<td>");
         if (j == 1 || j == 7) {
            out.print(date);
         } else {
             out.print(date);
             out.print("<br /><a href='/partners/calendardetail?sikno=0&menudate=" + year + "-" + month + "-" + date + "'>식단</a>");
         }
         out.print("</td>");
         date++;

            }
         }
         out.print("</tr>");
      }
      %>
   </table>


</body>
</html>

