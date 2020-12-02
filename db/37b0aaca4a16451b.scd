// https://twitter.com/redFrik/status/1166129504747773954
{a=LFTri
;b=PitchShift
;c=LFPulse
;f={|i|i+3.33+ar(a,3/3333)}!3%3*33*(3/3pi+kr(c,3e-3*3))
;q=ar(a,3*3**[3.3,3]+(ar(a,[3,pi])),3,ar(c,pi)/3*ar(a,3e-3))
;r=ar(Splay,(ar(a,f,3,_+3!3).reduce('*').tanh*[3,333*ar(a,3/3333),33])).sin+q/3
;r+sum({|i|ar(b,r,3/33,3/3+i*3,3/33,3/33)}!3)/6}
