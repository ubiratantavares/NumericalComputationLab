% BruteForceTest.m

% Função principal
function BruteForceTest
    % Parâmetros
    a = 0;
    b = 1;
    num_points = 100000;

    % Definindo a função
    func = @(x) exp(x) - 2;  % f(x) = e^x - 2

    % Encontrando as raízes
    roots = brute_force(func, a, b, num_points);

    % Exibindo o resultado
    display_result(roots);
end
