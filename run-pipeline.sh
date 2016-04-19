#USAGE: bash run-pipeline.sh
#produces plots

python wordcount.py books/isles.txt isles.dat
python wordcount.py books/abyss.txt abyss.dat

python plotcount.py books/isles.dat isles.pdf
python plotcount.py books/isles.dat abyss.pdf

zip analysis.zip isles.dat abyss.dat

