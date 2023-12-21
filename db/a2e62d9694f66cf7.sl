(* tutorial 2.1 ; triangle *)
var n = 9;
(0 .. n).collect { :i |
	var harmonicnumber = 2 * i + 1;
	var mult = (-1 ^ (harmonicnumber - 1 / 2)) * (1 / (harmonicnumber * harmonicnumber));
	SinOsc(440 * harmonicnumber, 0) * mult
}.Sum / n
