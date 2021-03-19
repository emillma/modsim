close all;
clc

%RK1
A1 = 0;
c1 = 0;
b1 = 1;
RK1 = struct('A',A1,'b',b1,'c',c1);

%RK2
A2 = [0  0; 1/2 0];
c2 = [0; 1/2];
b2 = [0; 1];
RK2 = struct('A',A2,'b',b2,'c',c2);

%RK4
A4 = [0 0 0 0; 1/2 0 0 0; 0 1/2 0 0; 0 0 1 0];
c4 = [0; 1/2; 1/2; 1];
b4 = [1/6; 1/3; 1/3; 1/6];
RK4 = struct('A',A4,'b',b4,'c',c4);

% Task 2
dt1 = 0.4;
lambda = -2.1/dt1;

T1 = 0:dt1:2;
x0 = 1;
func = @(t,x) lambda*x;
actual_solution = exp(lambda*T1);

% Simulate RK1-4
X1 = ERKTemplate(RK1,func,T1,dt1,x0);
X2 = ERKTemplate(RK2,func,T1,dt1,x0);
X4 = ERKTemplate(RK4,func,T1,dt1,x0);

% Task 3
u = 5;
state0 = [2;0];
dt2 = 0.1;
t_final = 25;
T2 = 0:dt2:t_final;

[time,statetraj] = ode45(@(t,x)vanderpol(t, x, u),[0 t_final], state0);
vanderpol_func = @(t,x) vanderpol(t, x, u);
X_vanderpol = ERKTemplate(RK4,vanderpol_func,T2,dt2,state0);


% plot RK1-RK4
figure()
hold on;
plot(T1,X1);
plot(T1,X2);
plot(T1,X4); 
plot(T1,actual_solution)
ylabel('x(t)');
xlabel('Time [s]');
legend('RK1', 'RK2','RK4', 'Actual solution');
grid on

% Plot vanderpol
figure()
plot(statetraj(:,1), statetraj(:,2),X_vanderpol(1,:),X_vanderpol(2,:));
xlabel('x(t)'); ylabel('y(t)'); legend('ODE45', 'RK4');
grid on

figure()
plot(time(1:end-1), time(2:end) - time(1:end-1));
xlabel('Time [s]'); ylabel('delta'); legend('timedelta');
grid on

figure()
subplot(2,1,1)
plot(time,statetraj(:,1),T2,X_vanderpol(1,:));
ylabel('x(t)'); legend('ODE45', 'RK4');
grid on

subplot(2,1,2)
plot(time,statetraj(:,2),T2,X_vanderpol(2,:));
ylabel('y(t)'); xlabel('Time [s]'); legend('ODE45', 'RK4');
grid on