

function y=sir(t,x)
    global beta gama population
    beta=3
    gama=0.5
    y=[-beta*x(1)*x(2)/population,beta*x(1)*x(2)/population-gama*x(2), gama*x(2)]';
    
    