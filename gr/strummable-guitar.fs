\ strummable guitar (jmcc) #11

: scale 52 57 62 67 71 76 ;

: str { sc ix }
    0 1 linear 0.2 MouseX.kr { x }
    x 0.25 ix 0.1 * + > HPZ1.kr abs { t }
    t 0.05 Decay.kr PinkNoise.ar * { n }
    sc MIDICPS Recip { dt }
    n dt dt 4 CombL.ar { s }
    s ix 0.2 * 0.5 - 1 Pan2.ar ;

: strs 52 0 str 57 1 str + 62 2 str + 67 3 str + 71 4 str + 76 5 str + ;

strs play
