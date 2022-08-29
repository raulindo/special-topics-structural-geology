% This function receives a plane in (Ruom do Mergulho, Mergulho)
% and return the cosine directors of this plane
% has to determine if printing = true or false
% sistema do plano é clar (dip direction (R), dip (M)) 

% atitudes de planos medidas em rumo do mergulho e mergulho



function plane = cossdir2plane(vec)

     % Primeiro passo, teste se a linha está aponatando para cima ou para baixo
     % se n é positivo, está aponatando para cima e por isso jogamos ele para
     % baixo multiplicando por -1
    
     l = vec(1); m = vec(2); n = vec(3);
     
     % Plunge
     % n = cosd(M);
     dip = acosd(n);
     
     % dipdir
     % l = sind(R) * sind(M); - E
     % m = cosd(R) * sind(M); - N
     
     if m==0 % quer dizer que dip dir é Oeste-Leste
         if l>0
             dipdir = 90;
         else
             dipdir = 270;
         end
     end
         
     if l==0 % quer dizer que dipdir é norte-sul
         if m>0
             dipdir = 0;
         elseif m<0
             dipdir = 180;
         end
     end
     
     if l>0 && m>0
         % estamos no primeiro quadrante
         dipdir = atand(l/m);
     end
     
     if l>0 && m<0
         % estamos no segundo quadrante
         dipdir = atand(l/m)+180;
     end
     
     if  l<0 && m<0
         % estamos no terceiro quadrante
         dipdir = atand(l/m)+180;
     end
     
     if l<0 && m>0
         % estamos no quarto quadrante
         dipdir = atand(l/m)+360;
     end
     
     
     plane = [dipdir dip];
     % Now print its value to the command window.
     fprintf('o plano é (%3.0f,%.1f)\n--------------------------\n', dipdir,dip)
    
 end


