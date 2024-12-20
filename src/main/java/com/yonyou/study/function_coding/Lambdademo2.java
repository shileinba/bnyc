package com.yonyou.study.function_coding;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Lambdademo2 {
    public static void main(String[] args) {
        //需求：创建一个登录窗口，登录窗口中包含一个登录按钮
        JFrame win = new JFrame("登录窗口");
        win.setSize(300, 200);
        win.setLocationRelativeTo(null);//居中显示
        win.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        //创建一个面板，把按钮添加到面板中
        JPanel panel = new JPanel();
        win.add(panel);

        //创建一个按钮
        JButton button = new JButton("登录");
        panel.add(button);

        //java要求必须给按钮添加一个点击事件监听器对象，这样就可以监听用户事件，做出反应
        button.addActionListener((ActionEvent e) -> {
            System.out.println("登录成功");
        });

        //简化lamda写法
        /**
         * 参数类型全部可以省略不写
         * 如果只有一个参数，参数类型省略的同时“()”也可以省略，但多个参数不能省略“()”
         * 如果Lambda表达式只有一行代码，大括号可以不写，同时要省略分号”;”，如果这行代码是return语句，也必须去掉return
         */
        button.addActionListener(e -> System.out.println("登录成功"));

        win.setVisible(true);
    }
}

