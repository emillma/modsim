tspan = [0 5];
x0 = 0.5;
[t_a,x_a] = ode45(@(t,y) y^2, tspan, x0);

x0 = 0;
[t_b,x_b] = ode45(@(t,y) sqrt(abs(y)), tspan, x0);

subplot(2,1,1);
plot(t_a, x_a)

subplot(2,1,2);
plot(t_b, x_b)
