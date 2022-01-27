package com.menu.vo;


import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class WeekMenuTable {//순서 3
    //List<MealDivision>, 식당, 시작(날짜,String), 끝(날짜,String)
    String restaurantName;
    String startDate;
    String endDate;
    List<MealDivision> mdList = new ArrayList<>(); // 요일+식단표 가져오기 , new 중요
}
