docker pull amirshams/centos
export LC_ALL=en_US.utf8

docker run -it qiime2/core:latest

docker pull continuumio/anaconda3
docker run -it continuumio/anaconda3 /bin/bash
conda update conda -y
conda install conda-build -y
conda install jupyter -y
conda install -c conda-forge jupyterlab -y
conda install -c plotly plotly plotly-orca psutil -y



conda install -c anaconda wget nomkl numpy scipy matplotlib scikit-bio six python-dateutil openblas -y


conda install -c conda-forge bc cython boost ncurses certifi openssl pandas perl libgfortran pigz zlib graphviz python-levenshtein jinja2 gsl imagemagick coreutils xorg-libx11 xvfbwrapper orange3 -y


conda install -c bioconda mothur biom-format -y

conda install -c r r -y
conda install -c bioconda bioconductor-phyloseq -y

mkdir -p /LAB /DATA /RESULT /EXEC /LIBRARY /TEMP
chmod -R 0755 /LAB /DATA /RESULT /EXEC /LIBRARY /TEMP

mkdir -p /EXEC/usearch
wget https://github.com/amirshams84/16S/blob/master/usearch?raw=true -O /EXEC/usearch/usearch
chmod -R 0755 /EXEC/usearch/

docker run -i -t -v $(pwd)/LAB:/LAB -v $(pwd)/DATA:/DATA -v $(pwd)/RESULT:/RESULT -v $(pwd)/LIBRARY:/LIBRARY -p 8000:8000 biominerlab:latest /bin/bash -c "jupyter lab --notebook-dir=/LAB --ip='*' --port=8000 --no-browser --allow-root"
docker run -i -t -v $(pwd)/LAB:/LAB -v $(pwd)/DATA:/DATA -v $(pwd)/RESULT:/RESULT -v $(pwd)/LIBRARY:/LIBRARY -p 8000:8000 biominerlab:latest /bin/bash -c "jupyter notebook --notebook-dir=/LAB --ip='*' --port=8000 --no-browser --allow-root"