package com.yonyou.study.function_coding;

import java.util.Arrays;
import java.util.Comparator;

public class Demo3 {
    public static void main(String[] args) {
        //有一个字符串数组，里面有一些人的名字，都是英文名字，请按照名字的英文首字母排序,忽略首字母大小
        String[] names=new String[]{"Tom","lisi","angela","zhaoliu","Mike","Jack","Bob","Andy","caocao","Rose"};
//        Arrays.sort(names, new Comparator<String>() {
//            @Override
//            public int compare(String o1, String o2) {
//                return o1.compareToIgnoreCase(o2);
//            }
//        });
        //Arrays.sort(names, (o1,o2)->o1.compareToIgnoreCase(o2));

        // 使用场景：如果某个Lambda表达式里只调用一个特定类型的实例方法，并且前面参数列表中的第一个参数是作为方法的主调，后面的所有参数都是作为该实例方法的入参的，则此时就可以使用特定类型的方法引用
        Arrays.sort(names, String::compareToIgnoreCase);

        System.out.println(Arrays.toString(names));
    }
}

