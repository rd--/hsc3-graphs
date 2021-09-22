// tw 0224 (f0) - http://www.fredrikolofsson.com/f0blog/?q=node/617
{var c = 200000
;var b = LocalBuf.new(c, 2).clear
;var d = BufRd.ar(2, b, SinOsc.ar(#[2, 3] * 9, 0) * c, 0, 2)
;BufWr.ar(SinOsc.ar(3 / #[2, 3], 0) / 3, b, SinOsc.ar([99, 145], 0).abs * c, 1)
;d.flop.sum * 0.5}
