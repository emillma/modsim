function dxdt = no_quarantine(t,x)
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

    dxdt = zeros(4,1);

    dxdt(1) = b*x(1) - b_d*x(1)^2 - d*x(1) - i1*x(1)*x(3); %H_dot
    dxdt(2) = i1*x(1)*x(3) - d*x(2) - a*x(2); %I_dot
    dxdt(3) = a*x(2) + r*x(4) - n*x(1)*x(3); %Z_dot
    dxdt(4) = n*x(1)*x(3) + d*x(1) + d*x(2) - r*x(4);% D_dot
end
