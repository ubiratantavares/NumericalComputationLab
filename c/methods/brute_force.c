/*
Resolução de equação algébrica pelo método de força bruta.
Autor: Ubiratan Tavares
Data: 07 de novembro de 2024.
Comando para compilação: gcc -o brute_force brute_force.c -lm
*/

#include <stdio.h>
#include <math.h>

// função para calcular o passo
double calculate_step(double a, double b, int num_points) {
    return (b - a) / num_points;
}

// função para verificar se os sinais são opostos
int are_opposite_signs(double (*func)(double), double a, double b) {
    return func(a) * func(b) < 0;
}

// função de busca forçada para encontrar raízes
void brute_force(double (*func)(double), double a, double b, int num_points) {
    double step = calculate_step(a, b, num_points);
    int found_root = 0;
    printf("Intervalos onde há raízes\n");
    for (int i = 0; i <= num_points; i++) {
        double x = a + i * step;
        if (are_opposite_signs(func, x, x + step)) {
            printf("(%lf, %lf)\n", x, x + step);
            found_root = 1;
	}
    }
    if (!found_root) {
        printf("Não encontrou raíz(es) no intervalo.\n");
    }
}

// função que define f(x) = e^x - 2
double function(double x) {
    return  exp(x) - 2;
}

// função principal
int main() {
    double a =  0.0, b = 1.0;
    int num_points = 100000;
    brute_force(function, a, b, num_points);
    return 0;
}
