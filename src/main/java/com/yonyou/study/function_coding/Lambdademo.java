package com.yonyou.study.function_coding;

public class Lambdademo {
    public static void main(String[] args) {
        Animal a = new Animal() {
            @Override
            public void eat() {
                System.out.println("狗吃骨头");
            }
        };
        a.eat();


        System.out.println("============================");
        Swim s1 = new Swim() {
            @Override
            public void swim() {
                System.out.println("学生游泳贼快");
            }
        };

        Swim s2 = () -> {
            System.out.println("学生游泳贼快");
        };
    }

}

abstract class Animal {
    abstract void eat();
}

//函数式接口:有且仅有一个抽象方法的接口
@FunctionalInterface//声明函数式接口的注解
interface Swim {
    void swim();
}

