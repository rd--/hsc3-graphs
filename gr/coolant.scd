// coolant (jmcc) #2

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~overlap_texture.({
    var p = 10;
    Klank.ar(
        [
            `[Array.fill(p, { 40 + 2000.0.rand }),nil,nil],
            `[Array.fill(p, { 40 + 2000.0.rand }),nil,nil]
        ],
        OnePole.ar(
            BrownNoise.ar([0.002,0.002]),
            0.95
        )
    )
},sustainTime:4,transitionTime:4,overlap:2);
