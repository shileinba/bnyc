package com.yonyou.study.function_coding;

import com.yonyou.study.bo.Student;

import java.util.Arrays;
import java.util.Comparator;

public class Lambdademo1 {
    public static void main(String[] args) {
        Student[] students = new Student[6];
        students[0] = new Student("张三", 18, 1.75);
        students[1] = new Student("李四", 23, 1.80);
        students[2] = new Student("王五", 20, 1.65);
        students[3] = new Student("赵六", 17, 1.70);
        students[4] = new Student("钱七", 22, 1.65);
        students[5] = new Student("孙八", 16, 1.75);
        //输出排序前的学生数组
        for (int i = 0; i < students.length; i++) {
            Student student = students[i];
            System.out.println(student.getName() + "," + student.getAge() + "," + student.getHeight());
        }


        Arrays.sort(students, new Comparator<Student>() {
            @Override
            public int compare(Student o1, Student o2) {
                return o1.getAge() - o2.getAge();//升序

            }
        });
        System.out.println("=======================================");
        //输出排序后的学生数组
        for (int i = 0; i < students.length; i++) {
            Student student = students[i];
            System.out.println(student.getName() + "," + student.getAge() + "," + student.getHeight());
        }

    }
}
