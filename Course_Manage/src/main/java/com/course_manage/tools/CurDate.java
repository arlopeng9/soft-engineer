package com.course_manage.tools;
import java.text.SimpleDateFormat;
import java.util.Date;
public class CurDate {
     private static SimpleDateFormat sdf=new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
     private static SimpleDateFormat sdf1=new  SimpleDateFormat("yyMMdd");

     public static String now(){
            Date date=new Date();
            String resu = sdf.format(date);
            return resu;
     }
    public static String today(){
        Date date=new Date();
        String resu = sdf1.format(date);
        return resu;
    }
}
