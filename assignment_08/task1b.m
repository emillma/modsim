x = sym('x', [2 1]);

f = [x(1) * x(2) - 2;
    x(1).^4/4 + x(2).^3/3 - 1];

J = jacobian(f, x);

f = matlabFunction(f, 'Vars', {x});
J = matlabFunction(J, 'Vars', {x});

x0 = [-1; -1];

result = NewtonsMethodTemplate(f, J, x0);

residual = vecnorm(f(result), inf, 1);

semilogy(residual);
grid on;
ylabel('Residual')
xlabel('Iteration')
title('Task 1b')
