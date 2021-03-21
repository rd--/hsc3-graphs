// <https://swiki.hfbk-hamburg.de/MusicTechnology/899> (tw ; tim walters)
{var s =
 {arg k
 ;var f = {|i| var x = Impulse.kr(0.5**i/k); var y = SinOsc; y.ar(i,y.ar(i+k**i)/Decay.kr(x,[i,i+1],k))}
 ;(f!6).sum}
;Mix.ar((GVerb.ar((s!16).sum,1)/512).flop)}
