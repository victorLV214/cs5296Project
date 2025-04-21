# 切换到jenkins用户
sudo su - jenkins
# 创建.ssh目录并设置权限
mkdir -p ~/.ssh
chmod 700 ~/.ssh
# 创建authorized_keys文件
vim ~/.ssh/authorized_keys
# 粘贴主服务器上jenkins用户的公钥内容
# 设置正确的权限
chmod 600 ~/.ssh/authorized_keys
# 退出jenkins用户
exit