x = sym('x', [2 1]);

cost = 100.*(x(2) - x(1)).^2 + (x(1) - 1).^4;
f = jacobian(cost, x)';


J = jacobian(f, x);

f = matlabFunction(f, 'Vars', {x});
J = matlabFunction(J, 'Vars', {x});

x0 = [10; 10];

result = NewtonsMethodTemplate(f, J, x0);

residual = vecnorm(result - [1;1], inf, 1);

semilogy(residual);
grid on;
ylabel('Residual')
xlabel('Iteration')
title('Task 1e')
