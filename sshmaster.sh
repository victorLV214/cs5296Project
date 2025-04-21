
# 切换到jenkins用户
sudo su - jenkins
# 生成SSH密钥
ssh-keygen -t rsa -b 4096
# 查看公钥
cat ~/.ssh/id_rsa.pub
# 退出jenkins用户
exit
