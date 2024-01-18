// https://twitter.com/redFrik/status/1464534258173849611 ; f0
var b = (1 .. 13).asArray.rotate(3);
var n = GrayNoise.ar * SinOsc.ar(1 / b / 99, 0).max(0);
var f = 62.5 * b;
var c = f * [6, 3, 7, 5, 1, 8, 4, 2];
var x = BBandPass.ar(n, f, SinOsc.ar(0.5, 0) + SinOsc.ar(b / 999, 0) / 99 + 0.1) * (SinOsc.ar(b / 666, 0) + 2);
var y = BBandPass.ar(n, c, 9 ** SinOsc.ar(b / 333, 0) / 99) * 666 / c;
var z = BBandPass.ar(n, c / 2, 9 ** SinOsc.ar(b / 222, 0) / 99) * 888 / c;
Splay.ar(x + y + z * SinOsc.ar(0.001, b / 9).max(0))

//---- https://twitter.com/redFrik/status/1464534258173849611 ; f0
y={|...x|ar(BBandPass,*x)};ar(Splay,y.(n=ar(GrayNoise,ar(a=SinOsc,1/(b=(1..13).rotate(3))/99).max),f=62.5*b,ar(a,0.5)+ar(a,b/999)/99+0.1,ar(a,b/666)+2)+y.(n,c=f*[6,3,7,5,1,8,4,2],9**ar(a,b/333)/99,666/c)+y.(n,c/2,9**ar(a,b/222)/99,888/c)*ar(a,1e-3,b/9).max)
