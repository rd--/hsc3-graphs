-- gendy1 ; modulate distributions ; distributions change the duration structure and spectrum
let x = mouseX kr 0 7 Linear 0.1
    y = mouseY kr 0 7 Linear 0.1
in gendy1Id 'α' ar x y 1 1 440 660 0.5 0.5 12 12 * 0.2
