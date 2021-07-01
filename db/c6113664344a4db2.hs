-- select ; nested mce
let n = 10
    a = mce [mce [517, 403, 89], mce [562, 816, 107], mce [241, 145, 90, 224]]
    c = n / 2
    f = select (lfSaw kr (mce [0.5, 0.75]) 0 * c + c) a
in saw ar f * 0.1
