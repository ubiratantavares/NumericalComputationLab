import math
import sys

sys.path.append("/home/bira/github/NumericalComputationLab")

from python.methods.BruteForceApp.brute_force import BruteForce 

def function():
    return lambda x: math.exp(x) - 2  # f(x) = e^x - 2

finder = BruteForce(function(), 0, 1, 100_000)
finder.find_roots()
finder.display_result()
