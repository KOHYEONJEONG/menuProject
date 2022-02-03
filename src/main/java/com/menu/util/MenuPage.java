package com.menu.util;

import com.menu.controller.HomeController;
import com.menu.vo.WeekMenuTable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

public class MenuPage {
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    //페이징한 값 저장하게.
    //요일별로 행수?를 구해서 max값을 기준으로 길어지면 다음페이지에 출력하게
    int maxPage;//요일 중 row가 가장 큰 값
    int currentPage;//페이지
    int remainder;//나머지 행
    int pageBlock = 20;//보여질 범위
    List<WeekMenuTable> weekMenuTableList =new ArrayList<>();;

}
