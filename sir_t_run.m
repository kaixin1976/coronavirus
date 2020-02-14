clear;
global a b  N
N = 1.4e+9 ;
load('weijianwei');
u_t = dR ./ dI ; % u(t)
lamda_t = (dI + dR) ./ (I .* S / N); %lamda(t)

%plot lamda(t) and u(t)
dates = datetime(Date);
figure;
plot(dates, lamda_t, '--', dates, u_t, '--');
xlabel('date');
ylabel('numbers');
legend('lamda_t', 'u_t');

% fit lamda(t) using exponential 
train_len = 24
x0 = [1, 0 ] ;
x = 1:1:train_len;
a = lsqcurvefit(@decay,x0, x, lamda_t(1:train_len));

%plot to see the fitness of the exponential
y = a(1) * exp(a(2) * x ) ;
dates = datetime(Date);
len = length(y);
figure;
plot(dates(1:len), y , '--',dates(1:len), lamda_t(1:len), '-o');
xlabel('date');
ylabel('numbers');
legend('lamda decay', 'lamda real');

% fit u(t)
x0 = [1, 0 ] ;
x = 1:1:train_len;
b = lsqcurvefit(@decay,x0, x, u_t(1:train_len));

% plot to see the fitness
y = b(1) * exp(b(2) * x ) ;
dates = datetime(Date);
len = length(y);
figure;
plot(dates(1:len), y , '--',dates(1:len), u_t(1:len), '-o');
xlabel('date');
ylabel('numbers');
legend('u decay', 'u real');

start_date=datetime(Date(1));
data_len = length(Date);

[t,y1]=ode45('sir_t', [0,100], [1399999802	170	28]);
dates=start_date + t;

% plot the the full SIR graph 
figure;
plot( dates, y1(:,2), '--', dates, y1(:,3), '-.k') ;

grid on ;
set(gca, 'XMinorGrid', 'on' );
title('Full SIR');
xlabel('date');
ylabel('numbers');
legend('Infected', 'Removed', '3');

% Plot Susceptible
figure;
len = length(Date) ;
plot(dates(1:len+10), y1(1:len+10,1), '--');
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
plot(dates(1:len+20),y1(1:len+20,2), '--');
hold on
idates=datetime(Date);
plot(idates(1:len), I, '-o') ;

title('Infective ');
xlabel('date');
ylabel('numbers');
legend( 'sir', 'weijianwei','2');
hold off


% Plot Removed (recovered and dead)
figure;
len = length(Date) ;
plot(dates(1:len+20), y1(1:len+20,3), '--');
hold on
idates=datetime(Date);
plot(idates(1:len), R, '-o') ;

title('Removed ');
xlabel('date');
ylabel('numbers');
legend( 'sir', 'weijianwei','2');
hold off

%close all ;




