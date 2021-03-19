syms t x
lambda = -2;

f = lambda * x;
dfdx = jacobian(f, x);

f = matlabFunction(f, 'Vars', [t, x]);
dfdx = matlabFunction(dfdx, 'Vars', [t, x]);

x0 = 1;
t0 = 0;
tf = 2;

dt = 0.2;
T = t0:dt:tf;

result = ImplicitEulerTemplate(f, dfdx, T, x0);
x_true = exp(lambda * T);

plot(T, result); hold on;
plot(T, x_true);
legend('Implicit', 'True')
title('Problem 2b')
