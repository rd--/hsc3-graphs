{- https://twitter.com/alln4tural/status/1529413845231587328 (an) ; edit (rd) -}
0:23.collect { :k |
	0:7.collect { :i |
		let ph = [
			SinOsc({ i * k ^ i / (2 ^ -2:4).atRandom } ! 2, 0),
			Decay(Dust(1 / 4 ^ i), SinOsc(0.1, 0) + k + i),
			k * 999
		].product;
		SinOsc(i * k * k, ph)
	}.product
}.Mix
