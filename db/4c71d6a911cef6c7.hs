-- sndfileIn ; diskIn form of sndfileDiskIn
sinOsc ar 440 0 * 0.05 + sndfileIn ("dsk", 0, []) "20.2-LW+RD.flac" Loop
