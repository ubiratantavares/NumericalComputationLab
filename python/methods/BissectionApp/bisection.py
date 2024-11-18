import numpy as np

from core.numerical_method import NumericalMethod

class Bisection(NumericalMethod):

    def solve(self, params):
        pass

    def calcular_media(self, a, b):
        return (a + b) / 2.0

    def parar(self, func, a, b, tol, m):
        return (abs(b - a) < tol) or (abs(func(m)) < tol)
    
    def sao_sinais_opostos(self, func, a, b):
        return func(a) * func(b) < 0

    def validar_intervalo(self, func, a, b):
        if not self.sao_sinais_opostos(func, a, b):
            raise ValueError("A função deve ter sinais opostos em a e b.")

    def buscar_subintervalos(self, func, a, b, delta=.1):
        pontos = np.arange(a, b + 1, delta)  
        subintervalos = []     
        for ponto in pontos:
            if self.sao_sinais_opostos(func, ponto, ponto + delta):
                subintervalos.append([ponto, ponto + delta])
        if len(subintervalos) == 0:
            raise ValueError(f"Altere o valor do delta.")
        return subintervalos
  
class BisectionIterative(Bisection):

    def solve(self, params):

        f, a, b, tol = params

        self.validar_intervalo(f, a, b)
    
        media = self.calcular_media(a, b)
        
        while not self.parar(f, a, b, tol, media):
            a, b = (a, media) if self.sao_sinais_opostos(f, a, media) else (media, b)
            media = self.calcular_media(a, b)

        return media
    
class BisectionRecursive(Bisection):

    def solve(self, params):

        f, a, b, tol = params
        
        self.validar_intervalo(f, a, b)

        media = self.calcular_media(a, b)

        if self.parar(f, a, b, tol, media):
            return media
    
        params = [f, a, media, tol] if self.sao_sinais_opostos(f, a, media) else [f, media, b, tol]
        return self.solve(params)
