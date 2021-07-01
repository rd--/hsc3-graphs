-- poll ; will not poll once with a trigger of one, use impulse with frequency zero
let k = control kr "k" 0.3
    x = negate (k * 1.1)
    t = impulse kr 0 0 {- 1 -}
in mrg2 x (poll t x (-1) (label "x"))
