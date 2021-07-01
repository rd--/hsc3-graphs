-- whiteNoiseM ; Control.Monad.ap
uid_st_eval
(do x <- return (-) `ap` whiteNoiseM ar `ap` whiteNoiseM ar
    return (x * 0.05))
