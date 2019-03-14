##################
docker pull centos:latest
docker run -it centos:latest
#############
yum update -y
yum install -y epel-release yum-utils
yum install -y ansible git gcc gcc-c++ make net-tools sudo which wget file patch libtool texinfo tar unzip bzip2 bzip2-devel man-pages
yum install -y openssl openssl-devel readline readline-devel sqlite-devel tk-devel zlib zlib-devel ncurses-devel python-pip mc
#############
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
echo 'conda activate' >> ~/.bashrc
source ~/.bashrc
############
docker commit 750af0e54017 midway:1
docker run -it midway:1
############
#settingup base
conda install -c conda-forge bc cython boost ncurses certifi openssl pandas perl libgfortran pigz graphviz python-levenshtein jinja2 gsl imagemagick coreutils xlsxwriter pandoc -y
conda install -c anaconda wget nomkl numpy==1.14.5 numpy-base==1.14.5 scipy six python-dateutil -y
conda install -c anaconda libgcc-ng==7.2.0 -y

conda install -c biocore mafft fasttree scikit-bio -y

conda install -c defaults -c bioconda ucsc-bedgraphtobigwig=366 ucsc-fetchchromsizes=366 ucsc-wigtobigwig=366 ucsc-bigwiginfo=366 ucsc-bedclip=366 ucsc-bedtobigbed=366 ucsc-bigbedtobed=366 ucsc-bigwigtowig=366 ucsc-twobittofa=366 \
ucsc-fatotwobit=366 ucsc-bigwiginfo=366 ucsc-bigwigtobedgraph=366  ucsc-liftover=366 ucsc-bigWigAverageOverBed=366 ucsc-bigwigmerge=366 ucsc-bigbedinfo=366 ucsc-bigbedsummary=366 bedtools=2.27.1 \
cutadapt=1.18.0 bedops=2.4.35 bowtie=1.2.2 bowtie2=2.3.4.2 bwa=0.7.17 samtools=1.9.0 sambamba=0.6.6 picard=2.18.7 metaseq=0.5 preseq=2.0.3 -y
conda install -c defaults -c bioconda ucsc-bigwigmerge=366 ucsc-bigbedinfo=366 ucsc-bigbedsummary=366 -y
conda install -c defaults -c bioconda bedtools=2.27.1 cutadapt=1.18.0 bedops=2.4.35 bowtie=1.2.2 bowtie2=2.3.4.2 bwa=0.7.17 samtools=1.9.0 sambamba=0.6.6 picard=2.18.7 metaseq=0.5 preseq=2.0.3 -y
conda install -c defaults -c bioconda perl-threaded=5.22.0 homer=4.9.1 idr=2.0.4.2 -y
conda install -c bioconda fastqc multiqc -y

conda install -c r r -y
conda install -c r r-tidyverse r-ggplot2 r-tibble r-dplyr r-rcpp r-gtools r-gridextra r-gridbase r-cairo -y
conda install -c conda-forge r-plot3d r-png r-raster r-ggpubr r-ggally r-ggthemes r-dendextend r-cowplot r-svglite r-gdtools r-optparse -y
conda install -c bioconda biom-format r-extrafont -y
############
docker commit 750af0e54017 midway:2
docker run -it midway:2
############



conda install -c conda-forge tornado==4.5.3 nodejs jupyter jupyterhub jupyterlab mono matplotlib==2.2.3 -y

conda install -c r r-irkernel -y
conda install -c anaconda ipykernel nb_conda -y

conda install -c conda-forge jupyter_contrib_nbextensions nb_conda_kernels -y
jupyter contrib nbextension install --user