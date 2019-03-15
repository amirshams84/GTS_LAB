##################
docker pull amirshams/miniconda
docker run -it -v $(pwd)/GTS_Lab:/GTS_LAB -p 8000:8000 amirshams/miniconda
conda update -n base conda -y
conda env create -n GTS_Lab --file GTS_Lab.yaml 
echo 'conda activate GTS_Lab' >> ~/.bashrc
conda install -c bioconda bedtools samtools sambamba homer
docker run -it -v $(pwd)/GTS_Lab:/GTS_LAB -p 8000:8000 amirshams/gtslab:1 
jupyter lab --notebook-dir=/GTS_LAB --ip='0.0.0.0' --port=8000 --no-browser --allow-root