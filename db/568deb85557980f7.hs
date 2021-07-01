-- equal_to ; operators
let o = sinOsc kr 1 0
    t = [o >** 0
        ,o >=** 0
        ,o <** 0
        ,o <=** 0
        ,o ==** 0
        ,(o <** 0.001) * (o >** (-0.001))]
    f = [220, 330, 440, 550, 660, 770]
    p = envPerc 0.01 1
    e = envGen kr (mce t) 0.1 0 1 DoNothing p
in mix (sinOsc ar (mce f) 0 * e)
