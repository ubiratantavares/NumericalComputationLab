/*
Resolução de equação não-linear transcendental: método da força bruta.
Programa escrito em c++ que testa a implementação da classe BruteForce.
Autor: Ubiratan Tavares
Data: 07 de novembro de 2024.
Comando para compilação: g++ -o brute_force_test BruteForce.cpp BruteForceTest.cpp -lm
*/

#include <iostream>
#include <cmath>
#include "BruteForce.h"

// Função que define f(x) = e^x - 2
double function(double x) {
    return std::exp(x) - 2;
}

int main() {
    BruteForce finder(function, 0.0, 1.0, 100000);
    finder.find_roots();
    finder.display_result();
    return 0;
}
