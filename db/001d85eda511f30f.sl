(* Env ; asEnvGenWithDoneAction *)
var e = Env([440 440 324 10000], [4 2 1], 2, nil, nil, 0);
var f = e.asEnvGenWithDoneAction(1, 2);
SinOsc(f, 0) * 0.1
