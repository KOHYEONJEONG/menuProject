<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-01-26
  Time: 오전 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>검색화면</title>
    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous">
    </script>

    <script>
        /*유효성검사 : 두날짜 기간이 사이가 7일이 넘어가지 않게하기*/
        /*startDate=2021-12-29&endDate=2022-01-26*/
        $(document).ready(function (){

        });
    </script>

</head>
<body>
<form action="/printMenu.do" name="menuForm" method="get">
    <select name="restaurantName">
        <!--서버에는 restaurantName = R01로 전송함.-->
        <option value="RO1">여민관</option>
        <option value="R02">춘추관</option>
    </select>

    <select name="mealName">
        <!--서버에는 restaurantName = R01로 전송함.-->
        <option value="MO1">조식</option>
        <option value="M02">중식</option>
        <option value="M03">석식</option>
        <option value="M04">간식</option>
    </select>

    <input type="date" name="startDate" id="startDateId">
    <input type="date" name="endDate" id="endDateId">

    <!--버튼 생성-->
    <input type="button" value="조회" onclick="check(this.form)">

    <input type="submit" value="전송">
</form>
</body>
</html>
