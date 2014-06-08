// slow beating sines (jmcc)

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~xfade_texture.({
    var n = 20; // n*3 components in each channel
    var d = 5.0; // beat freq deviation
    var p = Array.new(3*n);
    var q = Array.new(3*n);
    n.do({
        var freq = (24 + 60.rand).midicps;
        p.add(freq);
        p.add(freq + d.rand2);
        p.add(freq + d.rand2);
    });
    n.do({
        arg i;
        var freq = p.at(3*i);
        q.add(freq + d.rand2);
        q.add(freq + d.rand2);
        q.add(freq + d.rand2);
    });
    z = [`[p, nil, Array.rand(3*n, 0, 2pi)],
         `[q, nil, Array.rand(3*n, 0, 2pi)]
    ];
    Klang.ar(z) * (0.1/n);
}, 4, 4);

// ritual hymn in praise of the god of the LS-3000 life support unit.
