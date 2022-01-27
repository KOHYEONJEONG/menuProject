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

    <style>
        #intro {
            border:1px solid #5D5D5D;
            position: absolute;
            width: 700px;
            height: 150px;
            top: 50%;
            left: 50%;
            padding: 5px;
            margin: -100px 0px 0px -330px;
        }
    </style>

    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous">
    </script>

    <script>
        /*true,false로 배열에담아 모두 true면 전송.*/
        //var inval_Arr = new Array(4).fill(false);
        //inval_Arr[0] = true;
        var start =  $('#startDateId').val();

            function checkStatus(){
                var endDate = $("#endDateId");
                var isCheckBox = $('#checkBoxId').is(":checked");
                if(!isCheckBox){
                    endDate.attr("disabled",false);
                    return false;
                }else{
                    endDate.attr("disabled",true); //체크되어있으면
                    return true;
                }
            };

            /*유효성검사 : 마지막날짜 체크박스 해제되어있는경우, 시작날짜 기준으로 그 주까지만 보여지게 만들기.
            /*startDate=2021-12-29&endDate=2022-01-26*/
            function checkDate(){
                var end =  $('#startDateId').val();
                var sDate = new Date(start);
                var result = checkStatus();

                if(result==true){
                    alert(result);
                    var year= sDate.getFullYear();
                    var month=(1+sDate.getMonth());
                    month = month>=10? month:'0'+month;
                    var day = sDate.getDate()+6; //그 주까지 보여지게 변경해야할듯....
                    day = day>=10?day:'0'+day;//삼항연산자
                    end = year+'-'+month+'-'+day;
                    end = $('#endDateId').val(end);
                }else{
                    if(start>end){
                        console.log("시작날짜보다 작아요");
                        console.log(start);
                        console.log(end);
                    }else{
                        console.log(start);
                        console.log(end);
                    }
                }
            };



        function check_form(){//전송
            $("input[name=endDate]").attr("disabled", false);
            document.menuForm.submit();//전송


            <!--만약 기간이 둘다 null이면 현재날짜와 마지막날짜를 알아서 세팅-->


          /*  var form =document.menuForm;

            //false 하나로 있을시 제출못함.
            var validAll = true;

            for(var i=0; i<inval_Arr.length; i++){
                if(inval_Arr[i] == false){
                    validAll = false;;
                }
            }

            if(validAll){//유효성 모두 통과
                document.menuForm.submit();//전송
            }else{
                alert("기간을 다시 확인해주세요.");
            }*/
        }
    </script>

</head>
<body>

<div align="center" id="intro">
<h3>식단구성표</h3>
<h5 style="color: red;">원하시는 식당, 식사구분, 기간을 선택해주세요.</h5>
<form action="/printMenu.do" name="menuForm" method="get">
    식당:
    <select name="restaurantName" id="restaurantNameId" required>
        <!--서버에는 restaurantName = R01로 전송함.-->
        <option value="여민관">여민관</option>
        <option value="춘추관">춘추관</option>
    </select>

    식사구분:
    <select name="mealName" id="mealNameId" required>
        <!--서버에는 restaurantName = R01로 전송함.-->
        <option value="조식">조식</option>
        <option value="중식">중식</option>
        <option value="석식">석식</option>
        <option value="간식">간식</option>
        <option value="전체">전체</option>
    </select>

    기간:
    <input type="date" name="startDate" id="startDateId" oninput="checkDate()" required>
    ~
    <input type="date" name="endDate" id="endDateId" oninput="checkDate()" required>
    <input type="checkbox" id="checkBoxId" oninput="checkStatus()">

    <input type="button" value="전송" onclick="check_form()">
</form>
</div>
</body>
</html>
