let k = 8;
let tbl = [0 0 0 0 1 0 1 0 1 0 1 0 1 0].asRandomTable(1111).asLocalBuf;
let w = TrigRoundRobin(k * 2, Impulse(k, 0).kr);
let f = TableRand(w, tbl).LinExp(0, 1, 111, 1111);
let o = SinOsc(f, 0) * Perc(w, 1 / 111, 1, -1);
o.Splay / 3
