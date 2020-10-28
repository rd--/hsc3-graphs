// lots-o-sins (jmcc) #2
Texture.xfade(
{var n = 60 // n sines in each channel (twice as many during cross-fade)
;var z = [`[Array.fill(n, { 40 + 10000.0.linrand} ), nil, nil],
          `[Array.fill(n, { 40 + 10000.0.linrand} ), nil, nil]]
;Klang.ar(z, 1, 0) * (0.1/n)
}, 4, 4)
