-- impulse ; frequency 0 returns a single impulse
decay (impulse ar 0 0) 1 * brownNoiseId 'α' ar * 0.1
