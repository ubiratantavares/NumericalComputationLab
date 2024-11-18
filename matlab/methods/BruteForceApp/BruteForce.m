% BruteForce.m

% Função para calcular o passo
function step = calculate_step(a, b, num_points)
    step = (b - a) / num_points;
end

% Função para verificar se os sinais são opostos
function result = are_opposite_signs(func, a, b)
    result = func(a) * func(b) < 0;
end

% Função de busca forçada para encontrar raízes
function roots = brute_force(func, a, b, num_points)
    roots = [];
    step = calculate_step(a, b, num_points);

    for i = 0:num_points
        x = a + i * step;
        if are_opposite_signs(func, x, x + step)
            roots = [roots; x, x + step];
        end
    end
end

% Função para verificar se a lista está vazia
function result = is_list_empty(roots)
    result = isempty(roots);
end

% Função para exibir o resultado
function display_result(roots)
    if is_list_empty(roots)
        disp("Não encontrou raíz(es) no intervalo.");
    else
        disp("Há raíz(es) no(s) sub-intervalo(s):");
        disp(roots);
    end
end
