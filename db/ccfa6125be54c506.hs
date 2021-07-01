-- gendy1 ; modulate number of CPs
let x = mouseX kr 1 13 Linear 0.1
in gendy1Id 'α' ar 1 1 1 1 440 660 0.5 0.5 12 x * 0.2
