import sympy as sp
import functools


symbols = sp.symbols('x_0:3_0:3', real=True)
R = sp.Matrix(symbols).reshape(3, 3)


def get_SO3(eqs):
    for i in range(3):
        eqs.append(R[:, i].dot(R[:, i]) - 1)
        eqs.append(R[:, i].dot(R[:, (i + 1) % 3]))
        eqs.append(R[:, i].dot(R[:, (i + 2) % 3]))

    eqs.append(R.det() - 1)

    sol = sp.solve(eqs, symbols)[0]
    return sp.Matrix(sol).reshape(3, 3)


task_1a1_eqs = []
task_1a1_eqs.append(R[0, 1] - 1)
task_1a1_eqs.append(R[1, 0] - 1)

task_1a2_eqs = []
task_1a2_eqs.append(R[0, 0] - sp.Rational(5, 13))
task_1a2_eqs.append(R[1, 1] - 1)
task_1a2_eqs.append(R[2, 0] - sp.Rational(12, 13))

print(get_SO3(task_1a1_eqs))
print(get_SO3(task_1a2_eqs))
