package com.yonyou.study.function_coding;

public class Demo4 {
    public static void main(String[] args) {
//        CarFactory cf=new CarFactory() {
//            @Override
//            public Car getCar(String name){
//                return new Car(name);
//            }
//        };
//        CarFactory cf=name ->  new Car(name);

        // 使用场景：如果某个Lambda表达式里只是创建对象，并且“->”前后参数的形式一致，就可以使用构造器引用
        CarFactory cf = Car::new;
        Car c1 = cf.getCar("奥迪");
        System.out.println(c1.getName());

    }
}

interface CarFactory {
    Car getCar(String name);
}

class Car {
    private String name;

    public Car() {
    }

    public Car(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

