# Catalytic-combustion
The project is about a reactor consisting of a ceramic pipe where one of the walls is covered by a thin solid catalytic layer. The mechanism is described as follows: while the gas is flowing through the pipe, the pollutant substance present in the gas react with the thin layer developing thermal energy.

The project concerns numerical analysis; precisely a DAE system where there are both PDE and ODE. The coupling zone takes palce along the catalytic layer.
This was modeled as follows: 
  - Gas Region (PDE - Parabolyic): Method Of Lines using implicit Euler (1st order accuracy)
  - Solid Region (ODE): Finite Difference Method using central differences (2nd order accuracy).
  - Boundary Conditions: forward and backward differences (1st order accuracy). BC include both initial conditions and Neumann condition of     zero flux.

The final DAE system has a sparse matrix, hence a sparse solver is used. MATLAB is used.

The scope is to plot and visualize the gas concentration through the reactor along the x-axis for fixed y. The plots are both 3D and 2D.

More detailed description can be found in "Catalytic-combustion.pdf" and more detailed explanation of modeling and corresponding reults in "Catalytic-combustion-PPT.pdf".
