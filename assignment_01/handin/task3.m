a = 1.4e-6;
b = 3.1e-8;
b_d =5.6e-16;
d = 2.8e-8;
i = 2.6e-6;
n = 1.4e-6;
r = 2.8e-7;
q_i = 2.7e-6;
q_z = 2.7e-6;
d_q = 2.8e-5;
H_0 =(b-d)/b_d ;

T = linspace(0, 100*24*3600, 1000);

[t_1, x_1] = ode45(@(t, x)f_1(t, x, a, b, b_d, d, i, n, r) , T, [H_0; 0; 0; 0 ]);

[t_2, x_2] = ode45(@(t,x)f_2(t, x, a, b, b_d, d, i, n, r, q_i, q_z, d_q), T, [H_0; 0; 0; 0; 0]);

subplot(1,2,1)
plot(t_1, x_1);
title('Without quarantine');
legend('Healthy', 'Infected', 'Zombies', 'Dead');

subplot(1,2,2)
plot(t_2, x_2);
title('With quarantine');
legend('Healthy', 'Infected', 'Zombies', 'Dead', 'Quarantine');

function dxdt = f_1(t, x, a, b, b_d, d, i, n, r)
    % x = [H; I ;Z;D]
    
    dxdt = [(b-d)*x(1) - b_d*x(1)^2-i*x(1)*x(3);
            -(a+d)*x(2) + i*x(1)*x(3);
            a*x(2)+r*x(4) - n*x(1)*x(3);
            d*(x(1) + x(2)) - r*x(4) + n*x(1)*x(3)];
end

function dxdt = f_2(t, x, a, b, b_d, d, i, n, r, q_i, q_z, d_q)
% x = [H; I ;Z;D;Q]
    dxdt = [( b-d)*x(1) - b_d*x(1)^2 - i*x(1)*x(3);
            -(a+d+q_i)*x(2) + i*x(1)*x(3);
            a*x(2) + r*x(4) - n*x(1)*x(3) - q_z*x(3);
            d*(x(1) + x(2)) - r*x(4) + n*x(1)*x(3) + d_q*(5);
            q_i*x(2) + q_z*x(3) - d_q*x(5)];
end

