"EnvSpec"
| freqEnv ampEnv |
freqEnv := EnvSpec levels: #(1000 20) times: #(0.5).
ampEnv := EnvSpec levels: #(0.1 0) times: #(2).
Saw freq: freqEnv asEnvGen mul: ampEnv asEnvGen
