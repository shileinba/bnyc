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
        //第一种 ： 传统写法，输出排序前的学生数组
        for (int i = 0; i < students.length; i++) {
            Student student = students[i];
            System.out.println(student.getName() + "," + student.getAge() + "," + student.getHeight());
        }

        // 第二种 ：用灰色标记Comparator提示可以进行Lambda表达式进行简化，进入该方法的声明，该方法有声明函数式接口的注解，说明该匿名内部类可以使用Lambda表达式进行化简
        Arrays.sort(students, new Comparator<Student>() {
            @Override
            public int compare(Student o1, Student o2) {
                return o1.getAge() - o2.getAge();//升序

            }
        });

        // 第三种 ：方法同上
        Arrays.sort(students, (Student o1, Student o2)->{
            return o1.getAge()-o2.getAge();//升序
        });
        // 第四种 ：进一步简化lamda写法
        /**
         * 参数类型全部可以省略不写
         * 如果只有一个参数，参数类型省略的同时“()”也可以省略，但多个参数不能省略“()”
         * 如果Lambda表达式只有一行代码，大括号可以不写，同时要省略分号”;”，如果这行代码是return语句，也必须去掉return
         */
        Arrays.sort(students, ( o1,  o2) -> o1.getAge()-o2.getAge());

        // 第五种 ：静态方法引用 类名::静态方法。 使用场景：如果某个Lambda表达式里只调用一个静态方法，并且“->”前后参数的形式一致，就可以使用静态方法
        Arrays.sort(students, Student::compareAge);

        System.out.println("=========== 按年龄排序  ============");
        //输出排序后的学生数组
        for (int i = 0; i < students.length; i++) {
            Student student = students[i];
            System.out.println(student.getName() + "," + student.getAge() + "," + student.getHeight());
        }

        // 第六种 ：实例方法引用 对象名::实例方法
        Student t=new Student();
        //Arrays.sort(students, ( o1,  o2) -> t.compareByHeight(o1,o2));
        Arrays.sort(students, t::compareByHeight);

        System.out.println("=========== 按身高排序  ============");
        //输出排序后的学生数组
        for (int i = 0; i < students.length; i++) {
            Student student = students[i];
            System.out.println(student.getName() + "," + student.getAge() + "," + student.getHeight());
        }

    }
}
