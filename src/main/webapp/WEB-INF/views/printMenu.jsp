<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인화면</title>
    <style>

        h4 { text-align: center; }

        tr,td{
            vertical-align: top;/*맨위 한줄띄우기 지우기*/
        }

        ul{
            list-style-type: none; /*<li> 앞에 점 지우기*/
            padding-left: 0px;/*들여쓰기 지우기*/

        }

        th{
            vertical-align:center;
        }

        .foodName{
            text-align: center;
        }

    </style>
</head>
<body>


    <h4 style="a">식단구성표</h4>
    <h4>식당명 : <c:out value="${weekMenuTable.restaurantName}"/>, 기간 : <c:out value="${weekMenuTable.startDate}"/>~<c:out value="${weekMenuTable.endDate}"/></h4>
    <table border="1" bordercolor="blue" width ="1000" height="300" align = "center" style="table-layout:fixed;">
        <thead>

            <tr>
                <th>구분</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
                <th>일</th>
            </tr>
        </thead>


        <c:forEach items="${weekMenuTable.mdList}" var="weekMenu">
        <tr>
            <!--조식,중식,석식,간식 나와야함-->
            <th>조식</th>
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

</body>
</html>
