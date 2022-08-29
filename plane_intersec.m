% essa fun��o recebe dois planos em Rumo de Mergulho e Mergulho (CLAR)
% e retorna a linha de intersec��o entre eles

function vec_intersec = plane_intersec(r1, m1, r2, m2)
  % r1, m1 = rumo e mergulho do plano 1
  % r2, m2 = rumo e mergulho do plano 2
  
  vec1 = plane2cossdir(r1, m1, false);
  %alpha1 = vec1(1); beta1 = vec1(2); gamma1 = vec1(3);

  vec2 = plane2cossdir(r2, m2, false);
  %alpha2 = vec2(1); beta2 = vec2(2); gamma2 = vec2(3);
  
  % CALCULA O PRODUTO VETORIAL MAS N�O � UNIT�RIO
  cross_product = cross(vec1,vec2);
  
  % para deixar unit�rio divide o cross pela magnitude
  vec_intersec = cross_product/norm(cross_product);
  
  % testa se a linha est� pra cima, como o sistema de coordenadas
  % caso esteja pra cima, o z ser� positivo e precisamos jogar para baixo
  % multiplicando por -1
  if vec_intersec(3)>0
      vec_intersec = -vec_intersec;
  end
      
  l = vec_intersec(1);
  m = vec_intersec(2);
  n = vec_intersec(3);
  
  % Now print its value to the command window.
  fprintf('l = %.4f, m = %.4f, n=%.4f', l, m, n);
  
end