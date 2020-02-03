# coronavirus
this is a projection model for novel cronavirus epidemic happening in China .

You can run sir_run.m in matlab which uses the given ODE (Ordinary Differential Equition)  parameters to generate numeric solution for 
SIR ODEs . It also plots the numeric solution to visualize the trend of the epidemic (when will flatten and when will be maximum point )

You probably think the model exaggerate the situation , however, that is the best optimzation (to beta and gama) I could get now. 
If you want to try to further optimize, you can modify and run 1stopt-optimize.mff （open in 1stopt) by adding in more training data 
and revising the (x0,y0 and z0) initial data to get better beta and gama , please let me know if you get better ones .

There's some screenshots for projection I have done today (2020-2-3) using the parameters described in sir-ode-100-10.pdf, hoping I or other people could get more correct parameters later .

And at last, regarding the most import question, what is SIR (Susceptible-Infected-Removed ) Model， it is a famous epidemic projection model,  please get more information from Internet or read the book (in Chinese, that how I learn SIR) I put in the repository .
