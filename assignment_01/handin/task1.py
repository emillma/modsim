import numpy as np
import sympy as sp
from sympy import init_printing
from sympy import init_session
from sympy.solvers import solve
init_printing()

# %% System 1
x = sp.Matrix(sp.symbols('x1:3'))
x1, x2 = x
u = sp.Matrix(sp.symbols('u1:4', positive=True))
u1, u2, u3 = u
a, b, c = sp.symbols('a:c', positive=True)

x1_dot = a*u1-b*sp.sqrt(x1)
x2_dot = (a/x1)*(u1*(u2 - x2) + c*(u3 - x2))
x_dot = sp.Matrix((x1_dot, x2_dot))


solution = solve(x_dot, x)
subdict = dict(zip(x, solution[0]))
A = sp.simplify(x_dot.jacobian(x).subs(subdict))
sp.pprint(A)
B = sp.simplify(x_dot.jacobian(u).subs(subdict))
sp.pprint(B)
sp.pprint(A.eigenvals())


# %% System 2
x = sp.Matrix(sp.symbols('x1:3'))
x1, x2 = x
c, g, x_d, k = sp.symbols('c, g, x_d, k', positive=True)

x1_dot = x2
x2_dot = -c*x2 - g*(1-(x_d/x1)**k)
x_dot = sp.Matrix((x1_dot, x2_dot))


solution = solve(x_dot, x)
subdict = dict(zip(x, solution[0]))
A = sp.simplify(x_dot.jacobian(x).subs(subdict))
sp.pprint(A)
B = sp.simplify(x_dot.jacobian(u).subs(subdict))
sp.pprint(B)
sp.pprint(A.eigenvals())

# %% System 3
x_vec = sp.Matrix(sp.symbols('x,y'))
x, y = x_vec

x1_dot = sp.Piecewise((y-x/(sp.ln(sp.sqrt(x**2 + y**2))),
                       x_vec != sp.zeros(*x_vec.shape)),
                      (0, True))

x2_dot = sp.Piecewise((-x-y/(sp.ln(sp.sqrt(x**2 + y**2))),
                       x_vec != sp.zeros(*x_vec.shape)),
                      (0, True))
x_dot = sp.Matrix((x1_dot, x2_dot))


solution = (0,0)
subdict = dict(zip(x_vec, solution))
A = sp.simplify(x_dot.jacobian(x_vec).subs(subdict))
sp.pprint(A)
B = sp.simplify(x_dot.jacobian(u).subs(subdict))
sp.pprint(B)
sp.pprint(A.eigenvals())

# %%
