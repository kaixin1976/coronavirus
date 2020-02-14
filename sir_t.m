%S' = -lamda * S * I / N , susceptible
%I' = lamda * S * I /N - u * I , infetive , in hospitable 
%R  = u * I  , recovered or dead , not in hospital 
%S  +I + R = N

function y=sir_t(t,x)
    global a b N
    lamda = a(1)*0.8 * exp( t * a(2));
    u = b(1)* exp( t * b(2)*0.1);
    y=[-lamda*x(1)*x(2)/N,lamda*x(1)*x(2)/N-u*x(2), u*x(2)]';
    
    