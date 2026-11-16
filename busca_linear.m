% Busca Linear: Armijo, Seção Áurea e Bisseção
function [t, k_busca] = busca_linear(metodo, f_handle, x, d, limite_global)
    switch metodo
        case 1 % ARMIJO 
            alpha = 0.5;
            eta = 1e-4; 
            t = 1; % Chute inicial padrão para o passo de Armijo
            k_busca = 0;
            
            g = f_handle(x, 1);
            fx = f_handle(x, 0);
            
            % Loop de backtracking respeitando o limite global de iterações
            while k_busca < limite_global 
                fxtd = f_handle(x + t*d, 0);
                teste = fx + eta * t * (g'*d); 
                
                % Se satisfaz a condição de suficiência de Armijo, aceita o passo
                if fxtd <= teste
                    return; 
                end 
                
                % Caso contrário, reduz o passo pelo fator alpha
                t = alpha * t; 
                k_busca = k_busca + 1; 
            end 
            
            % Se esgotou o limite sem aceitar o passo, retorna t negativo (sinaliza falha)
            t = -1; 
            
        case 2 % SEÇÃO ÁUREA 
            a = 0; 
            s = 1; 
            b = 2*s; 
            f_s = f_handle(x+s*d, 0); 
            f_b = f_handle(x+b*d, 0); 
            k_do_b = 0; 
            
            % Fase de expansão do intervalo inicial
            while f_b < f_s && k_do_b < limite_global 
                a = s; 
                s = b; 
                f_s = f_b; 
                b = 2*b; 
                f_b = f_handle(x+b*d, 0); 
                k_do_b = k_do_b + 1; 
            end 
            
            p1 = (3 - sqrt(5)) / 2; 
            p2 = ((-1) + sqrt(5)) / 2; 
            u = a + (b - a) * p1; 
            v = a + (b - a) * p2; 
            f_u = f_handle(x+u*d, 0); 
            f_v = f_handle(x+v*d, 0); 
            
            ep = 0.0004; 
            k_busca = 0;
            
            % Minimização unidimensional por Seção Áurea
            while (b - a) > ep && k_busca < limite_global 
                if f_u < f_v 
                    b = v; 
                    v = u; 
                    f_v = f_u; 
                    u = a + (b - a) * p1; 
                    f_u = f_handle(x+u*d, 0); 
                else 
                    a = u; 
                    u = v; 
                    f_u = f_v; 
                    v = a + (b - a) * p2; 
                    f_v = f_handle(x+v*d, 0); 
                end 
                k_busca = k_busca + 1; 
            end 
            t = (a + b) / 2; 
            
        case 3 % BISSEÇÃO 
            a = 0;
            g_a = f_handle(x, 1); 
            d_dir_a = g_a' * d; 
            b = 1; 
            g_b = f_handle(x + b*d, 1); 
            d_dir_b = g_b' * d; 
            k_exp = 0; 
            
            % Expansão do intervalo para a Bisseção
            while d_dir_b < 0 && k_exp < limite_global 
                a = b; 
                d_dir_a = d_dir_b; 
                b = 2 * b; 
                g_b = f_handle(x + b*d, 1); 
                d_dir_b = g_b' * d; 
                k_exp = k_exp + 1; 
            end 
            
            ep = 0.0004; 
            k_busca = 0; 
            
            % Refinamento por Bisseção da derivada direcional
            while (b - a) > ep && k_busca < limite_global 
                t_m = (a + b) / 2; 
                g_m = f_handle(x + t_m*d, 1); 
                d_dir_m = g_m' * d; 
                
                if d_dir_m < 0 
                   a = t_m; 
                else 
                   b = t_m; 
                end 
                k_busca = k_busca + 1; 
            end 
            t = (a + b) / 2; 
            
        otherwise 
            error('Método inválido. Use 1 para Armijo, 2 para Seção Áurea ou 3 para Bisseção.'); 
    end 
end