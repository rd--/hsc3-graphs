-- poll ; multichannel expansion (requires labels be equal length...)
let t = impulse kr (mce2 10 5) 0
    l = line kr 0 (mce2 1 5) (mce2 1 2) DoNothing
in poll t l 0 (mce2 (label "t1") (label "t2"))
