(* Changed ; fixed number of sample impulses ; https://fredrikolofsson.com/f0blog/impulse-train/ *)
var dur = 1;
var num = 8;
Changed(Sweep(0, num / dur).Min(num).Ceiling, 0)
