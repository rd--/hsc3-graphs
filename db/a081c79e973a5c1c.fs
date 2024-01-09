\ analog bubbles (Jmcc) #1
: offset [ 8 7.23 ] 0 lfsaw 3 * 80 + ;
: freq offset 0.4 0 lfsaw 24 * + midicps ;
freq 0 sinosc 0.04 * 0.2 0.2 4 combn
