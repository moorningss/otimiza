%% PRINCIPAL - OTIMIZACAO.m
clc; clear; close all;

% Parâmetro global de controle de iterações
LIMITEk = 100000;
epsilon = 1e-5;

matriz_tempo = zeros(33, 3);
matriz_iteracao = zeros(33, 3);

fprintf('Iniciando benchmark dos 33 problemas...\n');

% Loop externo para passar por cada problema do banco MGH
for p = 1:33
    [f, n, m, x0] = banco_f(p);
    f_obj = @(x, ordem) mgh(f, n, m, x, ordem); % Wrapper para entrar no Cauchy
    
    % Loop interno para os 3 métodos de busca linear (1: Armijo, 2: Áurea, 3: Bisseção)
    for b = 1:3
        tic; 
        [x_final, k, flag_erro] = cauchy(f_obj, x0, b, LIMITEk);
        tempo_gasto = toc; 
     
        matriz_iteracao(p, b) = k;
        
        % Se estourou o limite ou deu NaN/Inf, o tempo vai para Infinito
        if flag_erro || k >= LIMITEk
            matriz_tempo(p, b) = Inf; 
            matriz_iteracao(p, b) = Inf;
        else
            matriz_tempo(p, b) = tempo_gasto;
        end
    end
    
    fprintf('Problema %02d concluído. (Armijo: %6.4f s / Aurea: %6.4f s / Bisseção: %6.4f s)\n', ...
         p, matriz_tempo(p, 1), matriz_tempo(p, 2), matriz_tempo(p, 3));
end

%% Exibição dos Resultados no Console
fprintf('\n     ITERAÇÕES (33x3) \n');
disp('   Problema | Armijo | Seção Áurea | Bisseção');
disp([(1:33)' matriz_iteracao]);

fprintf('\n     TEMPO (33x3) \n');
disp('   Problema | Armijo | Seção Áurea | Bisseção');
disp([(1:33)' matriz_tempo]);

%% PERFIL DE DESEMPENHO DE DOLAN-MORÉ (Tempo CPU)
[np, ns] = size(matriz_tempo);

% Acha o menor tempo para cada problema
min_val = min(matriz_tempo, [], 2);
min_val(min_val <= 0 | isnan(min_val)) = 1;

% Calcula a matriz de razões R
R = zeros(np, ns);
for p = 1:np
    for s = 1:ns
        if isinf(matriz_tempo(p, s)) || isnan(matriz_tempo(p, s))
            R(p, s) = Inf; 
        else
            R(p, s) = matriz_tempo(p, s) / min_val(p);
        end
    end
end

% Vetor tau para o eixo x do perfil
finite_vals = R(~isinf(R));
if isempty(finite_vals), tau_max = 2; else, tau_max = max(finite_vals); end
tau = linspace(1, max(2, tau_max * 1.1), 1000);

% Proporção de problemas resolvidos
P = zeros(length(tau), ns);
for s = 1:ns
    for i = 1:length(tau)
        P(i, s) = sum(R(:, s) <= tau(i)) / np;
    end
end

% Plotagem do gráfico
figure('Name', 'Perfil de Desempenho de Dolan-More', 'Color', 'w', 'Position', [100, 100, 700, 500]);
hold on;

styles = {'-', '--', '-.'};
colors = [0 0.4470 0.7410; 0.8500 0.3250 0.0980; 0.9290 0.6940 0.1250]; 
names = {'Armijo', 'Seção Áurea', 'Bisseção'};

for s = 1:ns
    stairs(tau, P(:, s), 'LineWidth', 2, 'LineStyle', styles{s}, 'Color', colors(s, :));
end

hold off;
grid on;
grid minor;
xlabel('\tau (Fator de Desempenho)', 'FontSize', 12, 'Interpreter', 'tex');
ylabel('\rho_s(\tau) (Proporção de Problemas Resolvidos)', 'FontSize', 12, 'Interpreter', 'tex');
title('Perfil de Desempenho de Dolan-Moré — Tempo CPU', 'FontSize', 14, 'FontWeight', 'bold');
legend(names, 'Location', 'Southeast', 'FontSize', 11);
axis([1 max(tau) -0.05 1.05]);]);