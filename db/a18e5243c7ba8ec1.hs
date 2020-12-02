-- lfTri ; mouse control
let x = midiCPS (mouseX KR 20 72 Linear 0.2)
    e = xLine KR 0.01 1 20 DoNothing
    o1 = triAS 25 x * (1 - e)
    o2 = lfTri AR x 0 * e
in mce2 o1 o2 * 0.1
