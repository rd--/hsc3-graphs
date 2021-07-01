-- whiteNoise ; monad constructor ; clone
uid_st_eval (fmap ((* mce [0.02,0.04]) . mce) (replicateM 2 (whiteNoiseM ar)))
