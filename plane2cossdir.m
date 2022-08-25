% This function receives a plane in (Ruom do Mergulho, Mergulho)
% and return the cosine directors of this plane
% has to determine if printing = true or false
% sistema do plano é clar (dip direction (R), dip (M)) 

function out = plane2cossdir(R,M,p)
    % atitudes de planos medidas em rumo do mergulho e mergulho
    l = sind(R) * sind(M);
    m = cosd(R) * sind(M);
    n = cosd(M);

    % Final output to define function
    out = [l m n];
    % Now print its value to the command window.
    if p==true
        fprintf('l = %.4f, m = %.4f, n=%.4f', l, m, n);
    end


end
