; PlayBuf ; play once
(let ((b (ctl "buf" 0))) (PlayBuf 1 b (BufRateScale b) 1 0 noLoop doNothing))
