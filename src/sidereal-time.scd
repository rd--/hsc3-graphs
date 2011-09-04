var p = 15;
play({OverlapTexture.ar({
var z = Array.fill(2,{`[Array.fill(p,{exprand(100.0,6000.0)}),
                        nil,
                        Array.fill(p,{2.0 + 4.0.rand})]});
var f = XLine.kr(exprand(40.0,300.0),exprand(40.0,300.0),12);
var t = LFPulse.ar(f,rrand(0.1,0.9),0.002 * LFNoise2.kr(8.0.rand).max(0));
var o = Klank.ar(z,t).distort * 0.1;
CombN.ar(o,0.6,0.5.rand + 0.1,8,1,o.reverse);},4,4,6,2)}))
