-- cOsc ; modulate beat frequency with mouseX ; requires=tbl
cOsc AR (control KR "tbl" 0) 200 (mouseX KR 0 4 Linear 0.2) * 0.1
