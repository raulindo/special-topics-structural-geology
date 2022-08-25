% This function receives cosine directors of a line and returns 
% the atitude data orientation
% vec é um vetor [l m n]

function lin = cossdir2line(vec)
 
 % Primeiro passo, teste se a linha está aponatando para cima ou para baixo
 % se n é positivo, está aponatando para cima e por isso jogamos ele para
 % baixo multiplicando por -1
 if vec(3)>0
     vec = -1*vec;
     l = vec(1); m = vec(2); n = vec(3);
 else
     l = vec(1); m = vec(2); n = vec(3);
     
 end
 
 % Plunge
 % n = -sin(Plunge)
 plunge = -asind(n);
 
 % Trend
 % l = sin(T)*cos(P) - E
 % m = cos(T)*cos(P) - N
 
 if m==0 % quer dizer que trend é Oeste-Leste
     if l>0
         trend = 90;
     else
         trend = 270;
     end
 end
     
 if l==0 % quer dizer que trend é norte-sul
     if m>0
         trend = 0;
     elseif m<0
         trend = 180;
     end
 end
 
 if l>0 && m>0
     % estamos no primeiro quadrante
     trend = atand(l/m);
 end
 
 if l>0 && m<0
     % estamos no segundo quadrante
     trend = atand(l/m)+180;
 end
 
 if  l<0 && m<0
     % estamos no terceiro quadrante
     trend = atand(l/m);
 end
 
 if l<0 && m>0
     % estamos no quarto quadrante
     trend = atand(l/m);
 end
 
 
 lin = [trend plunge];
 % Now print its value to the command window.
 fprintf('a linha é (%.0f,%.0f)', trend,plunge)

end
