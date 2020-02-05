% S' = -beta * S * I / N , susceptible 
% C' = beta * S * I / N - c * C , contacted 
% O' = c * C - o * O  , Observed or seperated 
% E' = o * O - e * E , Suspectd and in hospital
% I' = e * E - gama * I , Infective and in hospital  
% R' = gama * I , Removed
% S + C + O + E +I + R = N
clear;
global beta gama c o e N
N = 1.4e+9 ;

load('weijianwei');
gama = regress(dR(1:end-1), I(1:end-1) );
e = regress(dI(1:end-1) + gama * I(end-1), E(1:end-1) );
o = regress(dE(1:end-1) + e*E(1:end-1), O(1:end-1) );
c = regress(dO(1:end-1) + o*O(1:end-1), C(1:end-1));
beta = regress(dC(1:end-1) + c*C(1:end-1), S1(1:end-1)*I(end-1)/N ); 
%beta = regress(dS1(1:end-1), -S1(1:end-1)*I(end-1)/N);

start_date=datetime(Date(1));
data_len = length(Date);

[t,x]=ode45('seir', [0,400], [1399999514 529 234 54 170 28]);
dates=start_date + t;

% plot the the full SIR graph 
figure;
plot(dates, x(:,1),'-', dates, x(:,2), '--', dates, x(:,3), '-.k')

plot(dates, x(:,1),'-', dates, x(:,2), '--', dates, x(:,3), '-.k',dates, x(:,4), '--', dates, x(:,5), '--', dates, x(:,6), '--');
title('Full SIR');
xlabel('date');
ylabel('numbers');
legend('S', 'C', 'O','E','I','R', '6');
sir_len = 20
% Plot Susceptible
figure;
len = length(Date) ;
plot(dates(1:len+sir_len), x(1:len+sir_len,1), '--');
hold on
idates=datetime(Date);
plot(idates(1:len), S, '-o') ;

title('Susceptible ');
xlabel('date');
ylabel('numbers');
legend( 'sir', 'weijianwei','2');
hold off


% Plot Infected
figure;
len = length(Date) ;
plot(dates(1:len+sir_len), x(1:len+sir_len,5)+x(1:len+sir_len,6), '--');
hold on
idates=datetime(Date);
plot(idates(1:len), I+R, '-o') ;

title('Infected ');
xlabel('date');
ylabel('numbers');
legend( 'sir', 'weijianwei','2');
hold off


% Plot Removed (recovered and dead)
figure;
len = length(Date) ;
plot(dates(1:len+sir_len), x(1:len+sir_len,3), '--');
hold on
idates=datetime(Date);
plot(idates(1:len), R, '-o') ;

title('Removed ');
xlabel('date');
ylabel('numbers');
legend( 'sir', 'weijianwei','2');
hold off

% test data fitness

