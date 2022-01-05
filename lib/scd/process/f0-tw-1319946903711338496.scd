// https://twitter.com/redFrik/status/1319946903711338496
{
    inf.do({
        arg i;
        var a = {
            var c = [0, 0.804, 1.944, 3.084, 3.888, 5.028, 5.832, 6.972, 7.776, 8.916, 10.056, 10.86];
            var d = 1.to(9).choose;
            var z = {
                var f = LFTri.kr(1 / 99, 0) * 9 + (12 * 3.to(6).choose + c.at([0, 2, 3, 5, 7, 8, 10].choose)).midicps;
                var y = SinOscFB.ar(f, LFTri.kr(1 + i / 50, 0) + 1 / 2);
                Pan2.ar(y, LFTri.kr(i / 70, 0), 1 / 2)
            }.dup(d).sum;
            CombN.ar(z, 0.2, 0.2, 1).tanh * 0.1
        }.play(Server.default, 0, 9);
        (d * 9 + 3).wait;
        a.release(12)
    })
}.fork
