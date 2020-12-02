-- rShufflerB ; controls
let b = control KR "buf" 0
    k nm def = meta_control KR nm def
in X.rShufflerB b
   (k "readLocationMinima" 0.0 (0,1,"lin",0.01,""))
   (k "readLocationMaxima" 0.05 (0,1,"lin",0.01,""))
   (k "readIncrementMinima" 1.99975 (0.25,4,"lin",0.01,""))
   (k "readIncrementMaxima" 2.00025 (0.25,4,"lin",0.01,""))
   (k "durationMinima" 0.25 (0,0.5,"lin",0.01,"s"))
   (k "durationMaxima" 0.30 (0,0.5,"lin",0.01,"s"))
   (k "envelopeAmplitudeMinima" 0.8 (0.5,1.0,"amp",0.01,""))
   (k "envelopeAmplitudeMaxima" 0.9 (0.5,1.0,"amp",0.01,""))
   (k "envelopeShapeMinima" 0.5 (0,1,"lin",0.01,""))
   (k "envelopeShapeMaxima" 0.6 (0,1,"lin",0.01,""))
   (k "envelopeSkewMinima" 0.4 (0,1,"lin",0.01,""))
   (k "envelopeSkewMaxima" 0.6 (0,1,"lin",0.01,""))
   (k "stereoLocationMinima" 0.0 (0,1,"lin",0.01,"")) -- ie. not (-1,1)
   (k "stereoLocationMaxima" 1.0 (0,1,"lin",0.01,""))
   (k "interOffsetTimeMinima" 0.0500 (0,0.25,"lin",0.001,"s"))
   (k "interOffsetTimeMaxima" 0.0525 (0,0.25,"lin",0.001,"s"))
   (k "ftableReadLocationIncrement" 1.0 (0.25,4.0,"lin",0.1,""))
   (k "readIncrementQuanta" 0.0 (0,1,"lin",0.1,""))
   (k "interOffsetTimeQuanta" 0.0 (0,1,"lin",0.1,""))
