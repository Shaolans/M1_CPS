./spin -a $1.pml
gcc -DSAFETY -O2 pan.c -o pan
./pan
./pan -D > $1.dot
dot -Tpdf $1.dot -o $1.dot.pdf
