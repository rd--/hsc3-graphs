\ strummable guitar (jmcc) #11

: scale 52 57 62 67 71 76 ;

: str { ix sc }
    0 1 linear 0.2 MouseX.kr { x }
    x 0.25 ix 0.1 * + > HPZ1.kr abs { t }
    t 0.05 Decay.kr PinkNoise.ar * { n }
    sc MIDICPS Recip { dt }
    n dt dt 4 CombL.ar { s }
    s ix 0.2 * 0.5 - 1 Pan2.ar ;

: strs 0 52 str 1 57 str + 2 62 str + 3 67 str + 4 71 str + 5 76 str + ;

strs play
