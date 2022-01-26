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
    <script>
        /*유효성검사*/
        /*jquery 사용도 설정*/

    </script>
</head>
<body>
<form action="/printMenu.do">
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

    <input type="date" name="startDate">
    <input type="date" name="endDate">

    <!--버튼 생성-->

</form>
</body>
</html>
