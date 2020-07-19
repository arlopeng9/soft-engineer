package com.course_manage.tools;

import com.course_manage.entity.Course;

import java.util.ArrayList;
import java.util.List;

public class listslide {
    public static List<Integer> listslideinitial(List<Course> courses){
        int mooc=0;
        int whu=0;
        int beijing=0;
        int tingsua = 0;
        int hua = 0;
        int tongji = 0;
        int fudan=0;
        int xiada = 0;
        int hagong = 0;
        int zeda = 0;
        int nanjing = 0;
        int xibei = 0;
        int beiyou = 0;
        for(int i=0;i<courses.size();i++){
            if ("Mooc大学".equals(courses.get(i).getSchool())) {
                mooc++;
            }
            if ("武汉大学".equals(courses.get(i).getSchool())) {
                whu++;
            }
            if ("北京大学".equals(courses.get(i).getSchool())) {
                beijing++;
            }
            if ("清华大学".equals(courses.get(i).getSchool())) {
                tingsua++;
            }
            if ("华中科技大学".equals(courses.get(i).getSchool())) {
                hua++;
            }
            if ("同济大学".equals(courses.get(i).getSchool())) {
                tongji++;
            }
            if ("复旦大学".equals(courses.get(i).getSchool())) {
                fudan++;
            }
            if ("厦门大学".equals(courses.get(i).getSchool())) {
                xiada++;
            }
            if ("哈尔滨工业大学".equals(courses.get(i).getSchool())) {
                hagong++;
            }
            if ("浙江大学".equals(courses.get(i).getSchool())) {
                zeda++;
            }
            if ("南京大学".equals(courses.get(i).getSchool())) {
                nanjing++;
            }
            if ("西北工业大学".equals(courses.get(i).getSchool())) {
                xibei++;
            }
            if ("北京邮电大学".equals(courses.get(i).getSchool())) {
                beiyou++;
            }

        }
        List<Integer> school = new ArrayList<Integer>();
        school.add(mooc);
        school.add(whu);
        school.add(beijing);
        school.add(tingsua);
        school.add(hua);
        school.add(tongji);
        school.add(fudan);
        school.add(xiada);
        school.add(hagong);
        school.add(zeda);
        school.add(nanjing);
        school.add(xibei);
        school.add(beiyou);
        school.add(courses.size()-(mooc+whu+beijing+tingsua+tongji+hua+fudan+xiada+hagong+zeda+nanjing+xibei+beiyou));
        return school;
    }
}
