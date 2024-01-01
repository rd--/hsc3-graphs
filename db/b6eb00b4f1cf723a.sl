var buf = [200 300 400 500 600 800].asLocalBuf;
SinOsc(WrapIndex(buf, MouseX(0, 6 * 3, 0, 0.1)), 0) * 0.1
