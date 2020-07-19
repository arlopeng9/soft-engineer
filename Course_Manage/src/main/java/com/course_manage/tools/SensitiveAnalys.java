package com.course_manage.tools;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class SensitiveAnalys {
    public static List<String> ReadCsv(String path) {
        List<String> list = new ArrayList<String>(); // 保存读取到的CSV数据
        try {
            File file = new File(path); // 判断文件是否存在
                BufferedReader reader = new BufferedReader(new FileReader(path)); // 读取CSV文件
                String line = null; // 循环读取每行
                while ((line = reader.readLine()) != null) {
                    String[] row = line.split(",", -1); // 分隔字符串（这里用到转义）,CSV大部分都是,或者|来分隔数据的，这里看情况来作决定，存储到List<Object>里
                    list.add(row[1]);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    public static String word_analys(String word){
        List<String> list = SensitiveAnalys.ReadCsv("D:\\Document\\Course_Manage\\src\\main\\resources\\lexicon.csv");
        Iterator<String> iterator = list.iterator();
        String lexicon;
        String temp = "";
        while (iterator.hasNext()){
            lexicon = iterator.next();
            for(int i=0;i<lexicon.length();i++)
                temp += "*";
            word = word.replaceAll(lexicon,temp);
        }
        return word;
    }
}
