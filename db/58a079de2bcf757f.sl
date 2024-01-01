var k = 8;
var tbl = [0 0 0 0 1 0 1 0 1 0 1 0 1 0].asRandomTable(1111).asLocalBuf;
var w = TrigRoundRobin(k * 2, Impulse(k, 0).kr);
var f = TableRand(w, tbl).LinExp(0, 1, 111, 1111);
var o = SinOsc(f, 0) * Perc(w, 1 / 111, 1, -1);
o.Splay / 3
