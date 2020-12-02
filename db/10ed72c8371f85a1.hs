-- henonN ; with SC3 default initial parameters
let x = mouseX KR 20 sampleRate Linear 0.1
in henonN AR x 1.4 0.3 0 0 * 0.1
