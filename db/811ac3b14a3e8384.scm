; PlayBuf ; infinite loop
(let ((b (ctl "buf" 0))) (PlayBuf 1 b (BufRateScale b) 1 0 loop doNothing))
