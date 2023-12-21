(* SplayAz ; Stereo ; 2->2 *)
var osc = SinOsc([333, 555], 0) * 0.1;
var orientation = MouseX(0, 1, 0, 0.2);
SplayAz(2, osc, 1, 1, 2, 0, orientation, true)
