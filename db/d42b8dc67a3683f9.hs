-- sndfileVarIn ; vDiskIn with "brackets" ; if readChan is empty all channels are read
sinOsc ar 440 0 * 0.05 + sndfileVarIn ("dsk", 0, []) "20.2-LW+RD.flac" (sinOsc kr 0.1 0 * 0.015 + 1) Loop
