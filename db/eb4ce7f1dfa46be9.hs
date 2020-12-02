-- equal_to ; operators
let o = sinOsc KR 1 0
    t = [o >** 0
        ,o >=** 0
        ,o <** 0
        ,o <=** 0
        ,o ==** 0
        ,(o <** 0.001) * (o >** (-0.001))]
    f = [220, 330, 440, 550, 660, 770]
    p = envPerc 0.01 1
    e = envGen KR (mce t) 0.1 0 1 DoNothing p
in mix (sinOsc AR (mce f) 0 * e)
