from core.numerical_method import NumericalMethod

class Solver:

    def __init__(self, classe: NumericalMethod):
        self.__classe = classe

    def execute(self, params):    
        if not params or len(params) == 0:
           raise ValueError("Invalid input parameters")    
        return self.__classe.solve(params)
