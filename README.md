# Physics Spring Simulation

## Install

This simulation use Processing. You can download the Processing application [here](https://processing.org/download) to run my simulation.

## Simulation

This project use tree classes :
- A particule class
- A spring class
- A physical object class

Particules are move using Newton's laws. Particules get forces from the spring. The physical object class regroup particules and springs.

The simuation is made in different stage :
- `collision` : keep the object in the scene
- `update` : apply force and calculate acceleration, speed and the new position
- `show` : show particules and springs


## How to use and modify

You can change the coefficient of friction.

You can add other object with `Obj_from_square`. You can add particule or spring with the `add` method of the physical object class.