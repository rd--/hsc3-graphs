// drone plus rhythm (jmcc) #12
(var scale = #[0, 2, 3, 5, 7, 9, 10]
;Texture.overlap({
    var f = (#[24,36].choose + 0.08.rand2).midicps;
    LPF.ar(LFSaw.ar([f, f + 0.2], 0, LFNoise2.kr(f*[0.05, 0.04], 0.06)), rrand(1000,3000));
}, 4, 4, 8)
;Texture.overlap({
    arg i;
    if (i > 1 and: { 0.8.coin }, {
        var f = (#[60, 72].choose + scale.choose + [0.05.rand2, 0.05.rand2]).midicps;
        SinOsc.ar(f, 0, rrand(0.04,0.07));
    }, {
        Silent.ar(2)
    });
}, 4, 6, 3)
;Texture.overlap({
    arg i;
    var isequ = {arg s, tr; tr * Demand.ar(tr, 0, Dseq(s, inf))};
    if (i > 8, {
        var f = (#[48, 60, 72, 84].choose + scale.choose + [0.03.rand2, 0.03.rand2]).midicps;
        var sq = isequ.value([1,1,1,0,0,0].scramble,Impulse.ar([1.5,3,6].choose));
        var sg = LFPulse.ar(f, 0, 0.4, rrand(0.03,0.08));
        RLPF.ar(Decay2.ar(sq, 0.004, rrand(0.2, 0.7),sg),exprand(800,2000),0.1)
    },{ Silent.ar(2) });
}, 6, 6, 6)
;Texture.post_process({arg z; CombN.ar(z, 0.5, 0.5, 6, 1, z.reverse)}))

