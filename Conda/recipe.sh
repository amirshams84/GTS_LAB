#############
docker pull amirshams/centos
#############
export LC_ALL=en_US.utf8
#############
sudo yum install centos-release-scl -y
sudo yum install rh-python36 -y
scl enable rh-python36 bash
#############
sudo yum install epel-release -y
sudo yum install nodejs -y
pip install --upgrade pip
#############
python -m pip install jupyterhub
npm install -g configurable-http-proxy
python -m pip install notebook
python -m pip install jupyterlab
############
sudo docker commit 0e7600b77c61 midway:1

docker rm $(docker ps -a -q)
