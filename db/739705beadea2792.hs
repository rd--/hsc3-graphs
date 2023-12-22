-- max ; rate selection ; derive from right
let f = (sinOsc kr 0.2 0 `max` sinOsc ar 0.9 0) * 200 + 300
in sinOsc ar f 0 * 0.1
