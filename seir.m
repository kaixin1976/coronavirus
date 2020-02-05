% S' = -beta * S * I / N , susceptible 
% C' = beta * S * I / N - c * C , contacted 
% O' = c * C - o * O  , Observed or seperated 
% E' = o * O - e * E , Suspectd and in hospital
% I' = e * E - gama * I , Infective and in hospital  
% R' = gama * I , Removed
% S + C + O + E +I + R = N


function y=seir(t,x)
    global beta gama  c o e N
    y=[-beta*x(1)*x(5)/N,beta*x(1)*x(5)/N-c*x(2),c*x(2)-o*x(3),o*x(3)-e*x(4),e*x(4)-gama*x(5), gama*x(5)]';