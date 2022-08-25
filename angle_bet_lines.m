% essa função recebe duas linhas em trend e plunge e
% calcula o ângulo entre elas

function angle = angle_bet_lines(t1, p1, t2, p2)
  % t1, p1 = trend and plunge line 1
  % t2, p2 = trend and plunge line 2
  
  vec1 = line2cossdir(t1,p1, false);
  l1 = vec1(1); m1 = vec1(2); n1 = vec1(3);
  
  vec2 = line2cossdir(t2,p2, false);
  l2 = vec2(1); m2 = vec2(2); n2 = vec2(3);
  
  % Y = acosd( X ) returns the inverse cosine (cos-1) of the elements of X in degrees.
  angle = acosd(l1*l2 + m1*m2 + n1*n2);
  
  % Now print its value to the command window.
  fprintf('O ângulo entre as linhas (%.0f,%.0f) e (%.0f,%.0f) é %.0f', t1, p1, t2, p2, angle);

end