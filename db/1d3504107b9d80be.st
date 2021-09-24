"raisedTo ; **"
| a |
a := SinOsc freq: 100 phase: 0 * 0.1.
Mce with: a with: (a raisedTo: 10)
