00-README -- 持续更新

一、使用GIT 进行项目文档管理
1.初始化仓库
创建一个目录（任意名称 ，比如，git_bnyc）， git init
2.添加远程项目地址 [https://github.com/shileinba/bnyc.git]
git remote add origin https://github.com/shileinba/bnyc.git
3.克隆复制到本地
git clone https://github.com/shileinba/demo.git

4.文件操作：
1）添加文件 ：
git add .
git commit -m "任意文字"
git push origin master

2）拉取更新文件
git pull https://github.com/shileinba/demo.git

3）

二、【需要注意FAQ】
1. 无法clone 报443端口连接失败的问题：
1）github中，必须设置为 public ,不能设置为private
2) 本地不能提交空文件夹，必须要有具体的文件，比如readme，才能commit ，并且push成功
3）有时候是网络的问题，连接github不太稳定；

2. idea中commit push提示用户认证错误
1） 需要设置 github的token
如何获取user token
https://blog.csdn.net/u014303349/article/details/133833184
-- 点击用户头像，settings
-- developer settings
-- personal access token
-- generate new token
2)  gitbash 中使用 git 命令

三、资源
1. git-bash下载 ：https://git-scm.com/downloads/win
2. JDK 下载 ： https://url81.ctfile.com/d/19524381-37913945-572341 解压密码 ：3360

四、GIT知识点
1. branch 和 tag的区别
    https://blog.csdn.net/weixin_67727883/article/details/139315400
    branch是动态的，tag是静态。
2. merge 和 rebase的区别
   https://blog.csdn.net/2401_83915664/article/details/138009224?spm=1001.2101.3001.6650.1&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EOPENSEARCH%7EPaidSort-1-138009224-blog-87279684.235%5Ev43%5Epc_blog_bottom_relevance_base6&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EOPENSEARCH%7EPaidSort-1-138009224-blog-87279684.235%5Ev43%5Epc_blog_bottom_relevance_base6&utm_relevant_index=2
   https://blog.csdn.net/qq_30614345/article/details/130736404
   都是合并分支
3.git fetch 命令
   用于从远程存储库中获取最新的更改，但并不会直接更新您的本地分支。它只是将远程存储库中的内容下载到本地 Git 仓库中，您可以通过合并操作将其合并到本地分支中。
4.git pull 命令相当于执行了 git fetch 和 git merge 命令的组合操作。
    https://cloud.tencent.com/developer/article/2283593
5. Git中Update和Pull的区别
    pull 包含了 update命令
    https://blog.csdn.net/weixin_42704604/article/details/142918341
6. git remote add origin ，origin的含义
    origin 是指代码库的链接。 比如：[https://github.com/shileinba/bnyc.git]
    https://www.php.cn/faq/487235.html

21. 查询MYSQL数据库版本
SELECT VERSION();

31. maven install 和 package的区别
https://blog.csdn.net/u013452335/article/details/83415237/
package是把jar打到本项目的target下，而install时把target下的jar安装到本地仓库，供其他项目使用.

6.