/*
Resolução de equação não-linear transcendental: método da força bruta.
Programa escrito em java que implementa os métodos da classe BruteForce.
Autor: Ubiratan Tavares
Data: 07 de novembro de 2024.
*/

import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;

public class BruteForce {
    
    private Function<Double, Double> func;
    private double a;
    private double b;
    private int numPoints;
    private List<double[]> roots;

    // Construtor para inicializar a função, os limites e o número de pontos
    public BruteForce(Function<Double, Double> func, double a, double b, int numPoints) {
        this.func = func;
        this.a = a;
        this.b = b;
        this.numPoints = numPoints;
        this.roots = new ArrayList<>();
    }

    // Método para calcular o passo
    private double calculateStep() {
        return (b - a) / numPoints;
    }

    // Método para verificar se os sinais são opostos
    private boolean areOppositeSigns(double x1, double x2) {
        return func.apply(x1) * func.apply(x2) < 0;
    }

    // Método para encontrar raízes usando força bruta
    public List<double[]> findRoots() {
        double step = calculateStep();
        roots.clear();

        for (int i = 0; i <= numPoints; i++) {
            double x = a + i * step;
            if (areOppositeSigns(x, x + step)) {
                roots.add(new double[] {x, x + step});
            }
        }
        return roots;
    }

    // Método para verificar se a lista está vazia
    private boolean isListEmpty() {
        return roots.isEmpty();
    }

    // Método para exibir o resultado
    public void displayResult() {
        if (isListEmpty()) {
            System.out.println("Não encontrou raíz(es) no intervalo.");
        } else {
            System.out.println("Há raíz(es) no(s) sub-intervalo(s):");
            for (double[] interval : roots) {
                System.out.printf("(%f, %f) ", interval[0], interval[1]);
            }
            System.out.println();
        }
    }
}
