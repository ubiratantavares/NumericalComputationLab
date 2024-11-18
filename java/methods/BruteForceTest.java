/*
Resolução de equação não-linear transcendental: método da força bruta.
Programa escrito em java que testa a implementação da classe BruteForce.
Autor: Ubiratan Tavares
Data: 07 de novembro de 2024.
*/

public class BruteForceTest {

    // Função que define f(x) = e^x - 2
    public static double function(double x) {
        return Math.exp(x) - 2;
    }

    public static void main(String[] args) {
        // Criando um objeto BruteForce, passando a função, intervalo e número de pontos
        BruteForce finder = new BruteForce(BruteForceTest::function, 0, 1, 100000);
        
        // Encontrando as raízes
        finder.findRoots();
        
        // Exibindo o resultado
        finder.displayResult();
    }
}
