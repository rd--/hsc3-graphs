-- henonN ; with Sc3 default initial parameters
let x = mouseX kr 20 sampleRate Linear 0.1
in henonN ar x 1.4 0.3 0 0 * 0.1
