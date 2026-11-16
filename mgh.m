 %% Vamos avaliar as funções para termos os valores de f e de g
function calcular = mgh(f,n,m,x, ordem)
if ordem == 0
    fvec = f(n, m, x, 1);
    calcular = fvec'*fvec;
elseif ordem == 1
    [fvec, J] = f(n, m, x, 3);
    calcular = 2*J'*fvec;
else 
     error('Error in the variable ordem')
end
