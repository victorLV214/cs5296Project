
# 准备清华源 
sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup
sudo tee /etc/apt/sources.list > /dev/null <<EOF
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ noble main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ noble-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ noble-backports main restricted universe multiverse
EOF
#update the source
sudo apt update
# update system
# sudo apt upgrade -y
# install tools 
sudo apt install -y wget curl vim git unzip net-tools htop
#install java for jenkins
sudo apt install -y openjdk-17-jdk
java -version
#set env val
JAVA_CMD=$(which java)
JAVA_PATH=$(readlink -f $JAVA_CMD)
JAVA_HOME=${JAVA_PATH%/bin/java}
echo $JAVA_HOME
echo "export JAVA_HOME=${JAVA_HOME}" | sudo tee /etc/profile.d/java.sh
echo 'export PATH=$PATH:$JAVA_HOME/bin' | sudo tee -a /etc/profile.d/java.sh
source /etc/profile.d/java.sh
echo $JAVA_HOME

#install docker env
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl enable docker

sudo usermod -aG docker $USER
sudo docker run hello-world
# docker ps

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install -y jenkins
# 启动Jenkins
sudo systemctl start jenkins
# Jenkins开机自启
sudo systemctl enable jenkins
# 检查Jenkins
sudo systemctl status jenkins
# 查看初始管理员密码
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
