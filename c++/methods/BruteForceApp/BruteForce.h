/*
Resolução de equação não-linear transcendental: método da força bruta.
Programa escrito em c++ que define a classe BruteForce.
Autor: Ubiratan Tavares
Data: 07 de novembro de 2024.
*/

// BruteForce.h
#ifndef BRUTEFORCE_H
#define BRUTEFORCE_H

#include <vector>
#include <functional>
#include <utility>

class BruteForce {

    public:
        BruteForce(std::function<double(double)> func, double a, double b, int num_points = 1000);

        double calculate_step() const;
        bool are_opposite_signs(double x1, double x2) const;
        std::vector<std::pair<double, double>> find_roots();
        bool is_list_empty() const;
        void display_result() const;

    private:
        std::function<double(double)> func;
        double a, b;
        int num_points;
        std::vector<std::pair<double, double>> roots;
};

#endif // BRUTEFORCE_H
