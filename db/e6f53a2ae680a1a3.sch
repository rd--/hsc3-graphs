-- f0 <https://twitter.com/redFrik/status/1343283697840226307>
let b = [2..12] / 12
    f = [136.1, 163.3, 181.4, 204.1, 244.9, 272.1, 326.5, 362.8, 408.2, 489.8, 544.2]
    z = mcefill 11 (\_ -> whitenoise ()) * ((lftri b 0 + 1) / 2) + brownnoise ()
    t = lftri (121 ** lftri ((2 / 121) * b) 0) 0
    d = (lag2 ((1 / 212) > lftri (1/212.1) 0) (2 / b) / 12 * 1.2 + 1.2) / f
    p = pluck z t (2 / 121) d (1 / 2 * 12 / 1.2) ((lftri (b/12) 0 + 1) / 2)
in splay (hpf p 12) 1 (1 / 2.1 / 2) 0 true
