// DustRange ; mean iot=0.0005 ~= to density=2000, dustRange spacing is more uniform
[
	DustRange.ar(0.0001, 0.001) * 0.1,
	Dust.ar(2000) * 0.05
]
