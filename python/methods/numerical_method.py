from abc import ABC, abstractmethod

from core import numerical_method

class NumericalMethod(ABC):
    
    @abstractmethod
    def solve(self, params):
        pass
