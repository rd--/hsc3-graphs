-- sndfileDiskIn ; either diskIn or vDiskIn with "brackets" to allocate and read and then close and free the sndfile buffer
sinOsc ar 440 0 * 0.05 + sndfileDiskIn ("dsk", 0, [0, 1]) "20.2-LW+RD.flac" Nothing Loop
