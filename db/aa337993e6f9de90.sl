/* SelectX ; as sequencer */
let n = 10;
let a = [517 403 89 562 816 107 241 145 90 224];
let c = n / 2;
let f = SelectX(LfSaw(0.5, 0) * c + c, a);
Saw(f) * 0.1
