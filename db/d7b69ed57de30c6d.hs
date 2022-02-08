-- diskIn ; requires=dsk ; c.f. sndfileIn
let (buf, nc) = (control kr "dsk" 0, 2) in diskIn nc buf Loop
