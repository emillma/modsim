x = sym('x');

f = (x - 1) .* (x - 2) .* (x - 3) + 1;


J = jacobian(f, x);

f = matlabFunction(f, 'Vars', {x});
J = matlabFunction(J, 'Vars', {x});

x0 = 3;

result = NewtonsMethodTemplate(f, J, x0);

residual = vecnorm(f(result), inf, 1);

semilogy(residual);
grid on;
ylabel('Residual')
xlabel('Iteration')
title('Task 1c')
