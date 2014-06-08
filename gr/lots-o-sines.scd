"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~xfade_texture.({
    var n = 60; // n sines in each channel (twice as many during cross-fade)
    var z = [`[Array.fill(n, { 40 + 10000.0.linrand} ), nil, nil],
        `[Array.fill(n, { 40 + 10000.0.linrand} ), nil, nil]
    ];
    Klang.ar(z, 1, 0) * (0.1/n);
}, 4, 4);
