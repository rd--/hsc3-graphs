-- out ; multiple out ; channel layout is L=440,660 and R=441,661
let f = mce2 (mce2 440 660) (mce2 441 661)
in out 0 (sinOsc AR f 0 * 0.1)
