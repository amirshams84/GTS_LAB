##################
docker pull centos:latest
docker run -it centos:latest
#############
yum update -y

yum install -y epel-release yum-utils
yum install -y ansible git gcc gcc-c++ make net-tools sudo which wget file patch libtool texinfo tar unzip bzip2 bzip2-devel man-pages
yum install -y openssl openssl-devel readline readline-devel sqlite-devel tk-devel zlib zlib-devel ncurses-devel python-pip mc

yum install -y centos-release-scl
yum install -y rh-python36

echo 'source scl_source enable rh-python36' >> ~/.bashrc
source ~/.bashrc
yum install -y python36-setuptools
sudo yum install -y "Development Tools"
pip install --upgrade pip
yum clean all
###########
docker commit 750af0e54017 midway:1
docker run -it midway:1
###########
yum install -y R

mkdir -p /usr/local/lib/R
mkdir -p /usr/local/lib/R/etc
echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'curl')" >> /usr/local/lib/R/etc/Rprofile.site
mkdir -p /usr/local/lib/R/site-library
chown root /usr/local/lib/R/site-library
chmod g+wx /usr/local/lib/R/site-library
echo "R_LIBS_USER='/usr/local/lib/R/site-library'" >> /usr/local/lib/R/etc/Renviron
echo "R_LIBS=\${R_LIBS-'/usr/local/lib/R/site-library:/usr/local/lib/R/library:/usr/lib/R/library'}" >> /usr/local/lib/R/etc/Renviron
###########
docker commit 750af0e54017 midway:2
docker run -it midway:2
###########
yum install -y nodejs
pip install tornado==4.5.3
pip install jupyterhub

pip install notebook
pip install jupyterlab
pip install jupyter_contrib_nbextensions
npm install -g configurable-http-proxy
pip install ipykernel
pip install sas_kernel
pip install bash_kernel
jupyter contrib nbextension install --user

Rscript -e "install.packages(c('repr', 'IRdisplay', 'IRkernel'), type = 'source', repos ='https://cran.rstudio.com/')"
Rscript -e "IRkernel::installspec(user = FALSE)"
#############


############
docker commit 3ebc5d9b5974 midway:2
docker run -it midway:2
docker run -i -t -p 8000:8000 midway:2 bash -c "source ~/.bashrc; jupyter lab --notebook-dir=. --ip='0.0.0.0' --port=8000 --no-browser --allow-root"
##########
python -m pip install ipykernel
python -m pip install sas_kernel
python -m pip install bash_kernel
jupyter contrib nbextension install --user
docker commit 3ebc5d9b5974 midway:4
#####################
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
source ~/.bashrc
conda activate
echo "conda activate" >> ~/.bashrc
conda update -n base conda -y
conda install -c conda-forge bc cython boost ncurses certifi openssl pandas perl libgfortran pigz zlib graphviz python-levenshtein jinja2 gsl imagemagick coreutils xlsxwriter pandoc -y
conda install -c anaconda wget nomkl numpy scipy matplotlib six python-dateutil openblas xlrd -y


conda install -c r r -y

conda install -c r r-tidyverse -y
conda install -c r r-dplyr -y
conda install -c r r-rcpp -y
conda install -c r r-irkernel r-gtools r-gridextra r-gridbase -y
conda install -c conda-forge r-plot3d -y
conda install -c conda-forge r-png -y
conda install -c conda-forge r-raster -y
conda install -c conda-forge r-ggpubr -y
conda install -c bioconda r-vegan -y

conda install -c conda-forge nodejs r-dendextend -y
conda install -c conda-forge r-cowplot -y
conda install -c conda-forge r-svglite -y
conda install -c conda-forge r-gdtools -y
conda install -c r r-cairo -y
conda install -c bioconda r-extrafont -y
conda install nbconvert -y








docker rm $(docker ps -a -q)
docker rmi -f $(docker images -q)
