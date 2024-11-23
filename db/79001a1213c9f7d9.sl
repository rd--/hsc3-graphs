/* PlayBuf ; normal playback at same speed of recording */
let sf = SfAcquireMono('Floating');
PlayBuf(1, sf, 1, 0, 0, 1, 0) * 0.25
