/* VbJonVerb */
let freq = [1, 2.1, 2.9].collect { :item |
	item * 1000
};
let src = Resonz({ Dust(0.25) } ! 3, freq, 0.01).Sum * 10;
VbJonVerb(src, 0.8, 0.3, 0.8, 0.1, 0.5) + src
