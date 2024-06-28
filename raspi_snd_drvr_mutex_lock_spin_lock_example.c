raspi sound  driver mutex example source code.


mutex_lock(variable), mutex_unlock(variable) in drivers example with raspi.
spin_lock(var), spin_unlock(variable)
// https://github.com/raspberrypi/linux/blob/rpi-4.1.y/sound/arm/aaci.c


//##mutex
mutex_lock(variable);
//perform task here

//perform task here
mutex_unlock(variable);


//####spin
mutex_lock(variable);
//perform task here

//perform task here

mutex_unlock(variable);
