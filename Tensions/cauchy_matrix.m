% Esse script vai aplicar a equacao de Cauchy
% entrada: plano (dipdir,dip e matriz de tensões)
% no caso, como a matriz e simetrica, apenas 6 elementos sao necessários
% (considerar o nosso sistema de referência:
% x = E y = N z = vertical para cima )

xx = -20 ; xy = 0 ; xz = 0;
yx = xy ; yy = 20; yz = 00;
zx = xz ; zy = yz ; zz = 0;

stress_matrix = [xx xy xz;
                 yx yy yz;
                 zx zy zz];
             
dipdir = 90;
dip = 90;

pole = plane2cossdir(dipdir, dip, false); % o resultado e um vetor do polo 1x3
pole = reshape(pole,3,1); % reshape do pole saindo de 1x3 para 3x1
fprintf('O polo do plano é [%.2f;%0.2f;%0.2f]\n----------------------\n', pole(1),pole(2),pole(3))

s = stress_matrix*pole; % esse e o vetor tensao da matriz de stress no plano dado
fprintf('O vetor total tracao [%.2f;%0.2f;%0.2f]\n', s(1),s(2),s(3))
fprintf('A magnitude do vetor tracao e %.2f Mpa\n', norm(s)) % calcula e imprime a magnitude do vetor total usando norm()
% transforma o vetor tracao em atitude novamente
cossdir2line(s);


% tensao normal sobre o plano
% calcula a magntude da tensao normal sobre o plano
mag_sn = dot(s,pole); 
% a orientacao do vetor normal sobre o plano e o próprio polo multiplicado pela magnitude;
snvetor = pole*mag_sn;
fprintf('O vetor de esforco normal [%.2f;%0.2f;%0.2f]\n', snvetor(1),snvetor(2),snvetor(3));
% printa a magnitude do vetor esforco normal
fprintf('A magnitude do vetor esforco normal sobre o plano e %.2f MPa\n', mag_sn);
% transforma o vetor tensao normal ao plano em atitude novamente
cossdir2line(snvetor); % essa e a linha do polo do plano

% esforco cisalhante sobre o plano
ssvetor = s - snvetor;
% a magnitude do vetor esforco cisalhante é S - esforco normal
mag_ss = sqrt(ssvetor(1)^2+ssvetor(2)^2 + ssvetor(3)^2);
% os componentes do vetor cisalhante sao os componentes do vetor total s -
% os componentes do vetor tensao normal
fprintf('O vetor de esforco cisalhante [%.2f;%0.2f;%0.2f]\n', ssvetor(1), ssvetor(2), ssvetor(3));
% printa a magnitude do vetor esforco cisalhante
fprintf('A magnitude do vetor esforco cisalhante sobre o plano e %.2f Mpa\n', mag_ss);

% transforma o vetor esforco cisalhante ao plano em atitude novamente
cossdir2line(ssvetor); % essa e uma linha contida no plano


% calcular o rake da tensao cisalhante com a linha
% rake e o ângulo que uma linha faz com o strike do plano
% primeiro define o strike
if dipdir>=0 && dipdir <90
    strike = dipdir+270;
else
    strike = dipdir-90;
end
% converte a linha do strike, horizontal para vetor
strike_vector = line2cossdir(strike, 0, false);
%calcula ângulo entre strike e esforco cisalhante pela deducao do produto
%escalar; 
rake = acosd(dot(strike_vector,ssvetor)/(norm(ssvetor)*norm(strike_vector)));
% printa o ângulo rake
fprintf('O rake e %.2fº\n', rake);



% as magnitudes das tensões principais (elipsóide de tensao) podem ser
% obtidas a partir dos autovalores (eigenvalues) da matriz simetrica

