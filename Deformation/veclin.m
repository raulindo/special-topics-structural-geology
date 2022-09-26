%rotina para o cálculo da atitude de uma linha, a partir do vetor
%de cossenos diretores que a representa, considerando-se um sistema
%de coordenadas com leste, norte e para cima positivos, e linhas
%representadas como vetores apontando para o hemisfério inferior.
%Arthur Endlein 2015
function atti = veclin(x)
atti(2) = atand(-x(3)/norm(x(1:2)));
atti(1) = mod(atan2d(x(1), x(2)), 360);
end
