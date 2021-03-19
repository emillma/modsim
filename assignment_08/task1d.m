x = sym('x', [2 1]);

f = [x(1) - 1 + (cos(x(2)) .* x(1) + 1) .* cos(x(2));
    -x(1) .* sin(x(2)) .* (cos(x(2)) .* x(1) + 1)];

J = jacobian(f, x);

f = matlabFunction(f, 'Vars', {x});
J = matlabFunction(J, 'Vars', {x});

x0 = [1; 3];

result = NewtonsMethodTemplate(f, J, x0);

residual = vecnorm(f(result), inf, 1);

J([1; pi]) %not full rank
semilogy(residual);
grid on;
ylabel('Residual')
xlabel('Iteration')
title('Task 1d')
