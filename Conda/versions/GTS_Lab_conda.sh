##################
docker pull centos:latest
docker run -it centos:latest
#############
yum update -y
yum install -y epel-release yum-utils
yum install -y ansible git gcc gcc-c++ make net-tools sudo which wget file patch libtool texinfo tar unzip bzip2 bzip2-devel man-pages
yum install -y openssl openssl-devel readline readline-devel sqlite-devel tk-devel zlib zlib-devel ncurses-devel python-pip mc
#############
#############
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
echo 'conda activate' >> ~/.bashrc
source ~/.bashrc
############
conda env update -f gtslab_conda.yaml