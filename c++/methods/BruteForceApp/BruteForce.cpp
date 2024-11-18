/*
Resolução de equação não-linear transcendental: método da força bruta.
Programa escrito em c++ que implementa os métodos da classe BruteForce.
Autor: Ubiratan Tavares
Data: 07 de novembro de 2024.
*/


// BruteForce.cpp
#include "BruteForce.h"
#include <iostream>
#include <cmath>

BruteForce::BruteForce(std::function<double(double)> func, double a, double b, int num_points)
    : func(func), a(a), b(b), num_points(num_points) {}

    double BruteForce::calculate_step() const {
        return (b - a) / num_points;
    }

    bool BruteForce::are_opposite_signs(double x1, double x2) const {
        return func(x1) * func(x2) < 0;
    }

    std::vector<std::pair<double, double>> BruteForce::find_roots() {
        double step = calculate_step();
        roots.clear();

        for (int i = 0; i <= num_points; ++i) {
            double x = a + i * step;
            if (are_opposite_signs(x, x + step)) {
                roots.emplace_back(x, x + step);
            }
        }
        return roots;
    }

    bool BruteForce::is_list_empty() const {
        return roots.empty();
    }

    void BruteForce::display_result() const {
        if (is_list_empty()) {
            std::cout << "Não encontrou raíz(es) no intervalo." << std::endl;
        } else {
            std::cout << "Há raíz(es) no(s) sub-intervalo(s): ";
            for (const auto& interval : roots) {
                std::cout << "(" << interval.first << ", " << interval.second << ") ";
            }
            std::cout << std::endl;
        }
    }
