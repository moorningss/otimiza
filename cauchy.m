% MINIMIZAÇÃO CAUCHY
function [x, k, flag_erro] = cauchy(f_handle, x0, metodo_busca, max_iter)
    epsilon = 1e-5;  
    
    x = x0;
    k = 0; 
    flag_erro = false; % Assume sem erro inicialmente
    
    g = f_handle(x, 1);
    fx = f_handle(x, 0);
    
    % Loop principal de descida do gradiente
    while norm(g) > epsilon && k < max_iter
        d = -g; % Direção de descida (Cauchy)
        
        % Chama a busca linear unificada passando o limite global de iterações
        [t, ks] = busca_linear(metodo_busca, f_handle, x, d, max_iter);
        
        % Se a busca linear falhou ou estourou o limite interno
        if ks >= max_iter || t <= 0 || isnan(t) || isinf(t)
            flag_erro = true;
            k = max_iter; 
            break;     
        end

        % Atualiza o ponto atual
        x = x + t * d;
        
        % Avalia a função e o gradiente no novo ponto
        g = f_handle(x, 1);
        fx = f_handle(x, 0);

        % Verifica se gerou valores inválidos (NaN ou Inf)
        if isnan(fx) || isinf(fx) || any(isnan(g)) || any(isinf(g))
            flag_erro = true;
            k = max_iter; 
            break;     
        end
        
        k = k + 1;
    end
    
    % Se atingiu o teto de iterações sem convergir para a tolerância
    if k >= max_iter && norm(g) > epsilon
        flag_erro = true;
    end
end