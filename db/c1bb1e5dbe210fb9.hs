-- setResetFF ; d0 is the set trigger, d1 the reset trigger
let d0 = dustId 'β' ar 5
    d1 = dustId 'γ' ar 5
in brownNoiseId 'α' ar * setResetFF d0 d1 * 0.1
