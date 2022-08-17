// Release ; fixed duration envelope that releases (deletes) the sound on completion
Release.ar(SinOsc.ar(440, 0) * 0.1, 0.01, 3, 7)
