-- rEvent ; p+px=freq ; z*z=ampl ; w=gate
let f _ (w,_,_,z,_,_,_,p,px,_) = sinOsc AR (midiCPS (p + px)) 0 * w * z * z * 4
in mix (rEventVoicer 16 f) * control KR "gain" 1
