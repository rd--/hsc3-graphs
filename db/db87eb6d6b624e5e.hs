-- setResetFF ; d0 is the set trigger, d1 the reset trigger
let d0 = dust 'β' AR 5
    d1 = dust 'γ' AR 5
in brownNoise 'α' AR * setResetFF d0 d1 * 0.1
