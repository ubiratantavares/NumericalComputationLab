import sys

sys.path.append("/home/bira/github/NumericalComputationLab")

from core.algebraic_equations.one_equation.nonlinear.transcendential.bracketing import Bisection, BisectionIterative, BisectionRecursive
from context.solver import Solver

func = lambda x : x ** 2. - 9.

bisection = Bisection()

try:
    intervalos = bisection.buscar_subintervalos(func, -4.5, 4.5, 1)
    print(intervalos)
    classes = [BisectionIterative(), BisectionRecursive()]
    for classe in classes:
        solver = Solver(classe)
        for intervalo in intervalos:
            params = [func, intervalo[0], intervalo[1], 1e-9]
            root = solver.execute(params)
            print(f'x = {root:.6f}, f(x) = {abs(func(root)):.6f}')
except ValueError as e:
    print(e)