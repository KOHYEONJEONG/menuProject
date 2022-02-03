<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>출력화면</title>
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

        body {
        <%--인쇄 배경색, 이거해도 안되면 (인쇄-기타설정-옵션->배경 그래픽)--%>
            -webkit-print-color-adjust: exact;
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

            function getParameterByName(name) {//URL에 파라미터를 가져오기 위해서 사용
                name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
                var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                    results = regex.exec(location.search);
                return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
            };

            var start = getParameterByName('startDate');
            var sdt = new Date(start);//시작날짜

            var end = getParameterByName('endDate');
            var edt = new Date(end);//마지막날짜

            //사이기간
            var dateDiff= Math.ceil((edt.getTime() - sdt.getTime())/(1000*3600*24))+1;//첫날포함
            var arrDay = new Array("","月","火","水","木","金","土","日");

            /*
            //테스트 - 첫날 요일 구하기
            var todayLabel = arrDay[sdt.getDay()];//시작 요일가져옴

            //테스트 - 마지막 요일구하기
            var endLabel = arrDay[edt.getDay()];//마지막 요일가져옴

            //arrDay.forEach(element => console.log(element));*/

            var array_day = document.getElementsByClassName("day");

            var day = sdt.getDate()-1;//일

            for(var i=sdt.getDay(); i<=sdt.getDay()+dateDiff-1; i++){
                var month = (1+sdt.getMonth());//월
                day++;
                var format = "("+(("00"+month.toString()).slice(-2))+"/"+(("00"+day.toString()).slice(-2))+")";
                array_day[i-1].innerText= array_day[i-1].innerText +format;
            }

        };
    </script>
</head>
<body>


    <h3>식단구성표</h3>

    <!-- 현재년도 -->
<%--    <c:set var="now" value="<%=new java.util.Date()%>" />
    <c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy.MM.dd"/> 현재</c:set>--%>
    <h4><c:out value="${param.startDate}"/> 현재</h4>

    <h4>식당명 : <c:out value="${weekMenuTable.restaurantName}"/>, 기간 : <c:out value="${weekMenuTable.startDate}"/>~<c:out value="${weekMenuTable.endDate}"/></h4>
    <table border="1" bordercolor="blue" width ="1000" height="300" align = "center" style="table-layout:fixed;">
        <thead>
            <tr>
                <!--날짜수정해야함-->
                <!--startDate랑 endDate로 가져와야할듯 함.-->
                <th>구분</th>
                <th class="day">月</th>
                <th class="day">火</th>
                <th class="day">水</th>
                <th class="day">木</th>
                <th class="day">今</th>
                <th class="day">土</th>
                <th class="day">日</th>
            </tr>
        </thead>

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
