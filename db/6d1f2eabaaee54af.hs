-- sndfileIn ; requires=buf ; a sndfileIn graph is equal to the below, excepting that here the number of channels is written out
sinOsc ar 440 0 * 0.05 + diskIn 2 (control kr "dsk" 0) Loop
