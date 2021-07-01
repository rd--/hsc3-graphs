-- cOsc ; modulate beat frequency with mouseX ; requires=tbl
cOsc ar (control kr "tbl" 0) 200 (mouseX kr 0 4 Linear 0.2) * 0.1
