% banco de funções de more garbow hustow 
function [f, n, m, x0] = banco_f(p)
    switch p
        case 1
            f = @rosen; 
            n = 2;
            m = 2; 
            x0 = [-1.2; 1];
        case 2
            f = @badscb; 
            n = 2;
            m = 3; 
            x0 = [1; 1];
        case 3
            f = @badscp; 
            n = 2;
            m = 2; 
            x0 = [0; 1];
        case 4
            f = @band; 
            n = 10;
            m = n; 
            x0 = -ones(n, 1); % Vetor coluna de tamanho 'n' preenchido com -1
        case 5
            f = @bard; 
            n = 3;
            m = 15; 
            x0 = [1; 1; 1];
        case 6
            f = @bd; 
            n = 4;
            m = 20; 
            x0 = [25; 5; -5; -1];
        case 7
            f = @beale; 
            n = 2;
            m = 3; 
            x0 = [1; 1];
        case 8
            f = @biggs; 
            n = 6;
            m = 13; 
            x0 = [1; 2; 1; 1; 1; 1];
        case 9
            f = @box; 
            n = 3;
            m = 10; 
            x0 = [0; 10; 20];
        case 10
            f = @froth; 
            n = 2;
            m = 2; 
            x0 = [0.5; -2];
        case 11
            f = @gauss; 
            n = 3;
            m = 15; 
            x0 = [0.4; 1; 0];
        case 12
            f = @helix; 
            n = 3;
            m = 3; 
            x0 = [-1; 0; 0];
        case 13
            f = @kowosb; 
            n = 4;
            m = 11; 
            x0 = [0.25; 0.39; 0.415; 0.39];
        case 14
            f = @meyer; 
            n = 3;
            m = 16; 
            x0 = [0.02; 4000; 250];
        case 15
            f = @osb1; 
            n = 5;
            m = 33; 
            x0 = [0.5; 1.5; -1; 0.01; 0.02];
        case 16
            f = @osb2; 
            n = 11;
            m = 65; 
            x0 = [1.3; 0.65; 0.65; 0.7; 0.6; 3; 5; 7; 2; 4.5; 5.5];
        case 17
            f = @sing; 
            n = 4;
            m = 4; 
            x0 = [3; -1; 0; 1];
        case 18
            f = @watson; 
            n = 20;
            m = 31; 
            x0 = zeros(n, 1);
        case 19
            f = @wood; 
            n = 4;
            m = 6; 
            x0 = [-3; -1; -3; -1];
        case 20
            f = @lin; 
            n = 5;% nesta função, a autora dizia que era n variable com m>=n, entao defini 5 e 10 seguindo a regra dela 
            m = 10; 
            x0 = ones(n, 1); % Vetor coluna de tamanho 'n' preenchido com 1
        case 21
            f = @trid; 
            n = 10;
            m = n; 
            x0 = -ones(n, 1); 
        case 22 
            f = @vardim; 
            n = 5;
            m = n + 2; % por causa da especificação da autora 
            j = (1:n)'; % Cria um vetor coluna de 1 até n, para auxiliar no x0
            x0 = 1 - (j / n); % formula ja do banco de f  
        case 23 
            f = @singx;
            n = 16; % precisa ser multiplo de 4, regra 
            m = n;  
            x0 = zeros(n, 1); 
            %preenchimento do vetor coluna x0
            x0(1:4:n) = 3; % posições de 4 em 4 como no banco de f 
            x0(2:4:n) = -1;    
            x0(3:4:n) = 0; 
            x0(4:4:n) = 1;   
        case 24
            f = @rosex;
            n = 10; 
            m = n;  
            x0 = zeros(n, 1); 
            x0(1:2:n) = -1.2; % posições ímpares 
            x0(2:2:n) = 1;    % posições pares
        case 25
            f = @pen2;
            n = 5; 
            m = 2*n;  
            x0 = (1/2) * ones(n, 1);% como manda a função 
        case 26
            f = @pen1; 
            n = 10; % msm valor do autor
            m = n + 1; 
            x0 = (1:n)'; % Cria o vetor coluna [1; 2; 3....
        case 27 
            f = @lin1; 
            n = 8;
            m = 10;
            x0 = ones(n, 1);
        case 28 
            f = @lin0; 
            n = 8;
            m = 10;
            x0 = ones(n, 1);
        case 29 
            f = @jensam; 
            n = 2;% obrigatoriamente n=2
            m = 10;% valor usado pelo autor 
            x0 = [0.3;0.4];
        case 30 
            f = @trig; 
            n = 8;
            m = n;
            x0 = ones(n, 1)/n;
        case 31 
            f = @ie; 
            n = 10;
            m = n;
            j = (1:n)';
            h = 1/(n+1);
            t = j*h;
            x0 = t.*(t-1); % formula ja do banco de f
        case 32 
            f = @gulf; 
            n = 3;
            m = 100; 
            x0 = [5; 2.5; 0.15];
        case 33
            f = @bv; 
            n = 10;
            m = n;
            j = (1:n)';
            h = 1/(n+1);
            t = j*h;
            x0 = t.*(t-1); % formula ja do banco de f
        otherwise
            error('Problema p = %d não está no banco de funções.', p);
    end
end