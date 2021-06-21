-- pitch ; control param
let initFreq = control KR "initFreq" 440.0
    minFreq = control KR "minFreq" 60.0
    maxFreq = control KR "maxFreq" 4000.0
    execFreq = control KR "execFreq" 100.0
    maxBinsPerOctave = control KR "maxBinsPerOctave" 16.0
    median = control KR "median" 1.0
    ampThreshold = control KR "ampThreshold" 0.01
    peakThreshold = control KR "peakThreshold" 0.5
    downSample = control KR "downSample" 1.0
    clar = control KR "clar" 0.0
    p = pitch (soundIn 0) initFreq minFreq maxFreq execFreq maxBinsPerOctave median ampThreshold peakThreshold downSample clar
in sinOsc AR (mceChannel 0 p) 0 * 0.1
