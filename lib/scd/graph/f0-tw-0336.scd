// https://sccode.org/1-4Qy ; f0 ; 0336
var d = LFSaw.ar(1 / 9, 0);
var b = LocalBuf(30000).clearBuf;
var c = GrainBuf.ar(2, d, 24, b, -2, 0, 2, 0, -1, 512);
var o = BPF.ar(Saw.ar(d > 0 + 1 / 3 * 99) + c, 99, 4).mean;
RecordBuf.ar(o, b, 0, 1, 0, 1, 1, 1, 0);
c

// ---- tweet0336
RecordBuf.ar(BPF.ar(Saw.ar((d=LFSaw.ar(1/9))>0+1/3*99)+c=GrainBuf.ar(2,d,24,b=LocalBuf(3e4).clear,-2),99,4).mean,b);c
