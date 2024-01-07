(********** Pitch shift input ; Jmcc **********)
PitchShift(
	AudioIn([1, 2]) * 0.5, (* stereo audio input *)
	0.04, (* grain size *)
	MouseX(0, 2, 0, 0.2), (* mouse x controls pitch shift ratio *)
	0, (* pitch dispersion *)
	0.004(* time dispersion *)
)
