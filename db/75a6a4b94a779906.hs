-- vosimOsc
let freq = sinOsc kr (sinOsc kr 0.01 0) 0 `in_exprange` (10,800)
    form1freq = sinOsc kr (mce2 0.5 0.1) 0 `in_exprange` (100,1000)
    form2freq = sinOsc kr 0.39 0 `in_exprange` (100,1000)
    shape = sinOsc kr 10 0
in X.vosimOsc ar freq form1freq form2freq shape * 0.1
