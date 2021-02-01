tspan = [0:3600*24:100*24*3600]; %time in minutes,

a = 1.4 * 10^(-6);
b = 3.1 * 10^(-8);
b_d = 5.6 * 10^(-16);
d = 2.8 * 10^(-8);
i1 = 2.6 * 10^(-6);
n = 1.4 * 10^(-6);
r = 2.8 * 10^(-7);
q_i = 2.7 * 10^(-6);
q_z = 2.7 * 10^(-6);
d_q = 2.8 * 10^(-5);

%No quarantine
H0 = (b-d)/b_d;
X0 = zeros(5,1);
X0(1) = H0;

%opts = odeset('RelTol',1e-3);
options=odeset('AbsTol',1000, 'RelTol',10e-3);
[t,x] = ode45(@w_quarantine , tspan, X0, options);

plot(t,x);
title('With quarantine');
legend('Healthy', 'Infected', 'Zombies', 'Dead', 'Quarantine');

