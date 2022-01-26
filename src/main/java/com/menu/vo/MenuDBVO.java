package com.menu.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class MenuDBVO {
    Date menuYmd;
    String menuNm;
    String ingredientsNm;
    String mealNm;

}
