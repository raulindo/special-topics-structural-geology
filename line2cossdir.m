% This function receives a line in (Trend, Plunge)
% and return the cosine directors of this line
% has to determine if printing = true or false
function vec = line2cossdir(T,P,p)
    
    l = sind(T)*cosd(P);
    m = cosd(T)*cosd(P);
    n = -sind(P);
    
    % retorna os resultados em matriz coluna
    vec = [l;m;n];
    % Now print its value to the command window.
    if p==true
        fprintf('l = %.4f, m = %.4f, n=%.4f', l, m, n);
    end
    
end