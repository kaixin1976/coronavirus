clear;
global beta gama k population
load('weijianwei');

gama=regress(dR(1:end-1), Infected(1:end-1) );
%k=regress(dI(1:end-1)+gama*Infected(1:end-1), Exposed(1:end-1));
beta=regress(-dS(1:end-1), Susceptible(1:end-1).*Infected(1:end-1)/population);
beta1=regress(dI(1:end-1)+gama*Infected(1:end-1),Susceptible(1:end-1).*Infected(1:end-1)/population);
start_date=datetime(Date(1));


[t,x]=ode45('sir', [0,100], [Susceptible(1), Infected(1), Recovered(1)+Dead(1)]);
dates=start_date + caldays(0:length(t)-1);

% the full SIR graph 
plot(dates, x(:,1),'-', dates, x(:,2), '--', dates, x(:,3), '-.k')
title('SIR model');
xlabel('date');
ylabel('numbers');
legend('Susceptible', 'Infected', 'Removed', '3');

% train data fitness

% test data fitness

