; PlayBuf ; play once
(let ((b (ctl kr "buf" 0))) (PlayBuf 1 ar b (BufRateScale kr b) 1 0 noLoop doNothing))
