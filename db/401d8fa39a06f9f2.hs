-- saw ; ln 2021-04-16 https://lukasnowok.github.io/spectrology/
let tr = impulse AR (xLine AR 1 1000 20 DoNothing) 0
    e = envGen AR tr 1 0 1 DoNothing (envPerc 0 0.1)
in saw AR (tRand 'a' 50 (xLine AR 50 5000 20 DoNothing) tr) * e * 0.1
