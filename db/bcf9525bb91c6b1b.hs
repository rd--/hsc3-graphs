-- standardL ; frequency control
sinOsc ar (standardL ar 40 (mouseX kr 0.9 4 Linear 0.2) 0.5 0 * 800 + 900) 0 * 0.1
