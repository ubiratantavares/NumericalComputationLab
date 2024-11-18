/*
Resolução de equação não-linear transcendental: método da força bruta.
Programa escrito em c# que implementa os métodos da classe BruteForce.
Autor: Ubiratan Tavares
Data: 07 de novembro de 2024.
*/


using System;
using System.Collections.Generic;

public class BruteForce
{
    private Func<double, double> func;
    private double a;
    private double b;
    private int numPoints;
    private List<(double, double)> roots;

    public BruteForce(Func<double, double> func, double a, double b, int numPoints = 1000)
    {
        this.func = func;
        this.a = a;
        this.b = b;
        this.numPoints = numPoints;
        this.roots = new List<(double, double)>();
    }

    // Método para calcular o passo
    private double CalculateStep()
    {
        return (b - a) / numPoints;
    }

    // Método para verificar se os sinais são opostos
    private bool AreOppositeSigns(double x1, double x2)
    {
        return func(x1) * func(x2) < 0;
    }

    // Método para encontrar raízes usando força bruta
    public List<(double, double)> FindRoots()
    {
        double step = CalculateStep();
        roots.Clear();

        for (int i = 0; i <= numPoints; i++)
        {
            double x = a + i * step;
            if (AreOppositeSigns(x, x + step))
            {
                roots.Add((x, x + step));
            }
        }

        return roots;
    }

    // Método para verificar se a lista está vazia
    private bool IsListEmpty()
    {
        return roots.Count == 0;
    }

    // Método para exibir o resultado
    public void DisplayResult()
    {
        if (IsListEmpty())
        {
            Console.WriteLine("Não encontrou raíz(es) no intervalo.");
        }
        else
        {
            Console.WriteLine("Há raíz(es) no(s) sub-intervalo(s):");
            foreach (var interval in roots)
            {
                Console.WriteLine($"({interval.Item1}, {interval.Item2})");
            }
        }
    }
}
