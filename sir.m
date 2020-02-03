

function y=sir(t,x)
    global beta gama N
    y=[-beta*x(1)*x(2)/N,beta*x(1)*x(2)/N-gama*x(2), gama*x(2)]';
    
    