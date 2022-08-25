% essa função recebe dois planos em Rumo de Mergulho e Mergulho (CLAR)
% e calcula o ângulo entre eles

function angle = angle_bet_planes(r1, m1, r2, m2)
  % r1, m1 = rumo e mergulho do plano 1
  % r2, m2 = rumo e mergulho do plano 2
  
  vec1 = plane2cossdir(r1, m1, false);
  l1 = vec1(1); m1 = vec1(2); n = vec1(3);
  
  vec2 = plane2cossdir(r2, m2, false);
  l2 = vec2(1); m2 = vec2(2); n2 = vec2(3);
  
  % Y = acosd( X ) returns the inverse cosine (cos-1) of the elements of X in degrees.
  angle = acosd(l1*l2 + m1*m2 + n*n2);
  
  % se o ângulo é obtuso, retorna o valor para agudo
  if angle>90
      angle = 180-angle
  
  % Now print its value to the command window.
  fprintf('O ângulo entre os planos (%.0f/%.0f) e (%.0f/%.0f) é %.0fº', r1, m1, r2, m2, angle);

end