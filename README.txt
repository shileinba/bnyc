00-README -- 持续更新

使用GIT 进行项目文档管理
1.初始化仓库
创建一个目录（任意名称 ，比如，git_bnyc）， git init
2.添加远程项目地址 [https://github.com/shileinba/bnyc.git]
git remote add origin https://github.com/shileinba/bnyc.git
3.克隆复制到本地
git clone https://github.com/shileinba/demo.git

文件文件：
1. 添加文件 ：
git add .
git commit -m "任意文字"
git push

2. 拉取更新文件
git pull https://github.com/shileinba/demo.git

3.

【需要注意FAQ】
1. 无法clone 报443端口连接失败的问题：
1）github中，必须设置为 public ,不能设置为private
2) 本地不能提交空文件夹，必须要有具体的文件，比如readme，才能commit ，并且push成功

2. idea中commit push提示用户认证错误
1） 需要设置 github的token
如何获取user token
https://blog.csdn.net/u014303349/article/details/133833184
-- 点击用户头像，settings
-- developer settings
-- personal access token
-- generate new token

