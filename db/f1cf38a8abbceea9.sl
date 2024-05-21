{- Musikinformatik/clothesline/examples ; requires nthPrime -}
let n = 180;
{
	let primes = 2:n.collect { :index |
		1:index.collect { :each |
			each.nthPrime
		}.scramble.keepAtMost(8)
	}.++.asSet.asList;
	let freq = primes.LinLin(primes.min, primes.max, 200, 10000) * 0.5.randomFloat(1.5);
	let amp = { 0.4.randomFloat } ! freq.size;
	let decay = { 2.4.randomFloat } ! freq.size;
	(Dust([4 14 40]) * [1 0.4 0.1] * 0.02).collect { :tr |
		RingzBank(
			tr,
			freq,
			amp,
			decay
		)
	}.Splay
} !> 2
