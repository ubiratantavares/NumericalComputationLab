import numpy as np

class BruteForce:

    def __init__(self, func, a, b, num_points=1000):
        self.func = func
        self.a = a
        self.b = b
        self.num_points = num_points
        self.roots = []

    def calculate_step(self):
        return (self.b - self.a) / self.num_points

    def are_opposite_signs(self, x1, x2):
        return self.func(x1) * self.func(x2) < 0

    def find_roots(self):
        step = self.calculate_step()
        for i in range(self.num_points + 1):
            x = self.a + i * step
            if self.are_opposite_signs(x, x + step):
                self.roots.append((x, x + step))    
        return self.roots

    def is_list_empty(self):
        return len(self.roots) == 0

    def display_result(self):
        if self.is_list_empty():
            print("Não encontrou raíz(es) no intervalo.")
        else:
            print("Há raíz(es) no(s) sub-intervalo(s):", self.roots)

