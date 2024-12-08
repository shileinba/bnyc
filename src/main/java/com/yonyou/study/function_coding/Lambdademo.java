package com.yonyou.study.function_coding;

/**
 * 函数式编程思想概论 : https://baijiahao.baidu.com/s?id=1791743660971172652&wfr=spider&for=pc
 * 代码网页 ：https://blog.csdn.net/weixin_44456914/article/details/142728122
 */
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
/**
 * 分析这段代码：
 *
 * Animal由于只是抽象类不是接口，所以不能使用Lambda表达式替代
 *
 * 而Swim是接口，且只有一个抽象方法所以能被Lambda表达式替代
 *
 * **为什么这个Lambda能替代？**因为能推断出上下文，Swim s2能推断出是一个接口，后面的方法体代码能代码能推断出只有一个抽象方法，所以能推断出原来的代码如s1。
 * ————————————————
 *
 *                             版权声明：本文为博主原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接和本声明。
 *
 * 原文链接：https://blog.csdn.net/weixin_44456914/article/details/142728122
 */
