clear;
global beta gama k N
N = 1.4e+9 ;

load('weijianwei');
%gama = regress(dR(1:end-1), Infected(1:end-1) );
%beta = regress(dI(1:end-1)+ b*Removed(1:end-1), Susceptible(1:end-1).*Infected(1:end-1)/N);


beta=0.492112631178384; %optimized by using 1stopt
gama=0.421005009555275; %optimized by using 1stopt

start_date=datetime(Date(1));
data_len = length(Date);

[t,x]=ode45('sir', [0,400], [N-104 100 10]);
dates=start_date + t;

% plot the the full SIR graph 
figure;
plot(dates, x(:,1),'-', dates, x(:,2), '--', dates, x(:,3), '-.k')
title('Full SIR');
xlabel('date');
ylabel('numbers');
legend('Susceptible', 'Infected', 'Removed', '3');

% Plot Susceptible
figure;
len = length(Date) ;
plot(dates(1:len+30), x(1:len+30,1), '--');
hold on
idates=datetime(Date);
plot(idates(1:len), Susceptible, '-o') ;

title('Susceptible ');
xlabel('date');
ylabel('numbers');
legend( 'sir', 'weijianwei','2');
hold off


% Plot Infected
figure;
len = length(Date) ;
plot(dates(1:len+60), x(1:len+60,2), '--');
hold on
idates=datetime(Date);
plot(idates(1:len), Infected, '-o') ;

title('Infected ');
xlabel('date');
ylabel('numbers');
legend( 'sir', 'weijianwei','2');
hold off


% Plot Removed (recovered and dead)
figure;
len = length(Date) ;
plot(dates(1:len+30), x(1:len+30,3), '--');
hold on
idates=datetime(Date);
plot(idates(1:len), Removed, '-o') ;

title('Removed ');
xlabel('date');
ylabel('numbers');
legend( 'sir', 'weijianwei','2');
hold off

% test data fitness

