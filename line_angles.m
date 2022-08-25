% This function receives a input vector [l m n] and returns
% the angles alpha, beta and gamma;
% input vector has to be [l m n]

function vec = line_angles(vec_input)

    alpha = acosd(vec_input(1));
    beta = acosd(vec_input(2));
    gamma = acosd(vec_input(3));
    
    % retorna os resultados em matriz coluna
    vec = [alpha;beta;gamma];
    % Now print its value to the command window.
    fprintf('alpha = %.0f, beta = %.0f, gama=%.0f', alpha, beta, gamma);

       
end
