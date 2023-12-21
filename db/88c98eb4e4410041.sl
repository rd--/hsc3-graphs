(* tutorial 2.1 ; square *)
var n = 9;
(0 .. n).collect { :i |
	var harmonicnumber = 2 * i + 1;
	SinOsc(440 * harmonicnumber, 0) / harmonicnumber
}.Sum / n
