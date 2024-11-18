/*
Resolução de equação não-linear transcendental: método da força bruta.
Programa escrito em c# que testa a implementação da classe BruteForce.
Autor: Ubiratan Tavares
Data: 07 de novembro de 2024.
Comando para compilação: dentro do diretório BruteForceApp executar dotnet build
Comando para execução: dentro do diretório BruteForceApp e após a compilação bem-sucedida, executar dotnet run
*/


using System;

public class Program 
{
    public static double Function(double x)
    {
        return Math.Exp(x) - 2;
    }

    public static void Main()
    {
        var finder = new BruteForce(Function, 0, 1, 100000);
        finder.FindRoots();
        finder.DisplayResult();
    }
}
