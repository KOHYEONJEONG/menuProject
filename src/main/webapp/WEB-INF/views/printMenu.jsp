<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인화면</title>
    <style>

        h3,h4{ text-align: center; margin: 0;}

        tr,td{
            vertical-align: top;/*맨위 한줄띄우기 지우기*/
        }

        ul{
            list-style-type: none; /*<li> 앞에 점 지우기*/
            padding-left: 0px;/*들여쓰기 지우기*/
        }
/*
        th{
            vertical-align:center;
        }*/

        .foodName{
            text-align: center;
        }

    </style>

    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous">
    </script>

    <script>
        <!--검색한 요일별로 보여지기 -->
        window.onload=function() {

            function getParameterByName(name) {
                name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
                var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                    results = regex.exec(location.search);
                return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
            }

            var start = getParameterByName('startDate');
            alert(start);
            var end = getParameterByName('endDate');
            alert(end);

            //end - start = 남은 기간

            /*검색요일날로 데이터포맷해서 넣어주기.*/
            //ex)수요일부터 검사했으면 앞에 날짜는 안나옴?
            //월 = null
            //화 = null
            //수 = 수(10/1)
        }
    </script>
</head>
<body>


    <h3 style="a">식단구성표</h3>

    <!-- 현재년도 -->
    <c:set var="now" value="<%=new java.util.Date()%>" />
    <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy.MM.dd"/> 현재</c:set>
    <h4><c:out value="${sysYear}"/></h4>

    <h4>식당명 : <c:out value="${weekMenuTable.restaurantName}"/>, 기간 : <c:out value="${weekMenuTable.startDate}"/>~<c:out value="${weekMenuTable.endDate}"/></h4>
    <table border="1" bordercolor="blue" width ="1000" height="300" align = "center" style="table-layout:fixed;">
        <thead>
            <tr>
                <!--날짜수정해야함-->
                <!--startDate랑 endDate로 가져와야할듯 함.-->
                <th>구분</th>
                <th id="mon">月</th>
                <th id="tue">火</th>
                <th id="wed">水</th>
                <th id="thu">木</th>
                <th id="fri">今</th>
                <th id="sat">土</th>
                <th id="sun">日</th>
            </tr>
        </thead>

        <!--파라미터 조식을 -->
        <c:choose>
            <c:when test="${param.mealName eq '조식'}">
                <c:set var="begin" value="0"></c:set>
                <c:set var="end" value="0"></c:set>
            </c:when>
            <c:when test="${param.mealName eq '중식'}">
                <c:set var="begin" value="1"></c:set>
                <c:set var="end" value="1"></c:set>
            </c:when>
            <c:when test="${param.mealName eq '석식'}">
                <c:set var="begin" value="2"></c:set>
                <c:set var="end" value="2"></c:set>
            </c:when>
            <c:when test="${param.mealName eq '간식'}">
                <c:set var="begin" value="3"></c:set>
                <c:set var="end" value="3"></c:set>
            </c:when>
            <c:when test="${param.mealName eq '전체'}">
                <c:set var="begin" value="0"></c:set>
                <c:set var="end" value="3"></c:set>
            </c:when>
        </c:choose>

        <c:forEach items="${weekMenuTable.mdList}" var="weekMenu" begin="${begin}" end="${end}">
        <tr>
            <!--조식,중식,석식,간식 식사구분-->
            <c:choose>
                <c:when test="${weekMenuTable.mdList.get(0) eq weekMenu}">
                   <th>조식</th>
                </c:when>
                <c:when test="${weekMenuTable.mdList.get(1) eq weekMenu}">
                    <th>중식</th>
                </c:when>
                <c:when test="${weekMenuTable.mdList.get(2) eq weekMenu}">
                    <th>석식</th>
                </c:when>
                <c:when test="${weekMenuTable.mdList.get(3) eq weekMenu}">
                    <th>간식</th>
                </c:when>
            </c:choose>

            <!--조식만,중식만 나오게 해야함.-->
            <td>
                <c:set var="foodNameDistinct" value=""/>
                <c:forEach items="${weekMenu.recipeListMon}" var="weekMenuMon">
                    <c:if test="${foodNameDistinct ne weekMenuMon.foodName}">
                    <ul>
                        <li class="foodName" style="background-color: greenyellow;align-content:center;">
                            <c:set var="foodNameDistinct" value="${weekMenuMon.foodName}"/>
                            <c:out value="${foodNameDistinct}"></c:out>
                        </li>
                    </c:if>
                    <!--재료-->
                    <li> <c:out value="${weekMenuMon.ingredientsName}"></c:out> </li>

                </c:forEach>
                    </ul>

            </td>

                <td>
                    <c:set var="foodNameDistinct" value=""/>
                    <c:forEach items="${weekMenu.recipeListTue}" var="weekMenuTue">

                            <c:if test="${foodNameDistinct ne weekMenuTue.foodName}">
                            <ul>
                                <li class="foodName" style="background-color: greenyellow;align-content:center;">
                                    <c:set var="foodNameDistinct" value="${weekMenuTue.foodName}"/>
                                    <c:out value="${foodNameDistinct}"></c:out>
                                </li>
                            </c:if>
                            <!--재료-->
                            <li> <c:out value="${weekMenuTue.ingredientsName}"></c:out> </li>

                    </c:forEach>
                            </ul>

                </td>

                <td>
                    <c:set var="foodNameDistinct" value=""/>
                    <c:forEach items="${weekMenu.recipeListWed}" var="weekMenuWeb">

                        <c:if test="${foodNameDistinct ne weekMenuWeb.foodName}">
                            <ul>
                                <li class="foodName" style="background-color: greenyellow;align-content:center;">
                                <c:set var="foodNameDistinct" value="${weekMenuWeb.foodName}"/>
                                <c:out value="${foodNameDistinct}"></c:out>
                            </li>
                        </c:if>
                        <!--재료-->
                        <li> <c:out value="${weekMenuWeb.ingredientsName}"></c:out> </li>
                    </c:forEach>
                            </ul>
                </td>

                <td>
                    <c:set var="foodNameDistinct" value=""/>
                    <c:forEach items="${weekMenu.recipeListThu}" var="weekMenuThu">

                            <c:if test="${foodNameDistinct ne weekMenuThu.foodName}">
                                <ul>
                                    <li class="foodName" style="background-color: greenyellow;align-content:center;">
                                    <c:set var="foodNameDistinct" value="${weekMenuThu.foodName}"/>
                                    <c:out value="${foodNameDistinct}"></c:out>
                                </li>
                            </c:if>
                            <!--재료-->
                            <li> <c:out value="${weekMenuThu.ingredientsName}"></c:out> </li>

                    </c:forEach>
                                </ul>

                </td>

                <td>
                    <c:set var="foodNameDistinct" value=""/>
                    <c:forEach items="${weekMenu.recipeListFri}" var="weekMenuFri">

                            <c:if test="${foodNameDistinct ne weekMenuFri.foodName}">
                                <ul>
                                    <li class="foodName" style="background-color: greenyellow;align-content:center;">
                                    <c:set var="foodNameDistinct" value="${weekMenuFri.foodName}"/>
                                    <c:out value="${foodNameDistinct}"></c:out>
                                </li>
                            </c:if>
                            <!--재료-->
                            <li> <c:out value="${weekMenuFri.ingredientsName}"></c:out> </li>
                    </c:forEach>
                                </ul>

                </td>

                <td>
                    <c:set var="foodNameDistinct" value=""/>
                    <c:forEach items="${weekMenu.recipeListSat}" var="weekMenuSat">

                            <c:if test="${foodNameDistinct ne weekMenuSat.foodName}">
                                <ul>
                                <li class="foodName" style="background-color: greenyellow;align-content:center;">
                                    <c:set var="foodNameDistinct" value="${weekMenuSat.foodName}"/>
                                    <c:out value="${foodNameDistinct}"></c:out>
                                </li>
                            </c:if>
                            <!--재료-->
                            <li> <c:out value="${weekMenuSat.ingredientsName}"></c:out> </li>

                    </c:forEach>
                                </ul>

                </td>

                <td>
                    <!--금요일(많아질경우 밀림 수정)-->
                    <c:set var="foodNameDistinct" value=""/>
                    <c:forEach items="${weekMenu.recipeListSun}" var="weekMenuSun">

                            <c:if test="${foodNameDistinct ne weekMenuSun.foodName}">
                                <ul>
                                <li class="foodName" style="background-color: greenyellow;align-content:center;">
                                    <c:set var="foodNameDistinct" value="${weekMenuSun.foodName}"/>
                                    <c:out value="${foodNameDistinct}"></c:out>
                                </li>
                            </c:if>
                            <!--재료-->
                            <li> <c:out value="${weekMenuSun.ingredientsName}"></c:out> </li>

                    </c:forEach>
                                </ul>

                </td>


            </tr>

        </c:forEach>

    </table>

    <input type="button" value="메인화면" onclick="location.href='/searchMenu.do'">

</body>
</html>
