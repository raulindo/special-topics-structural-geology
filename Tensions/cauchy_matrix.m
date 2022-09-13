% Esse script vai aplicar a equação de Cauchy
% entrada: plano (dipdir,dip e matriz de tensões)
% no caso, como a matriz é simétrica, apenas 6 elementos são necessários
% (considerar o nosso sistema de referência:
% x = E; y = N; z = vertical para cima

xx = -10 ; xy = 0 ; xz = 0;
yx = xy ; yy = -10 ; yz = 00;
zx = xz ; zy = yz ; zz = -10;

% construcao da matriz de Cauchy
stress_matrix = [xx xy xz;
                 yx yy yz;
                 zx zy zz];
             
% dados do plano de entrada
dipdir = 90;
dip = 45;

% calcula o polo do plano com a função construída
pole = plane2cossdir(dipdir, dip, false); % o resultado é um vetor do polo 1x3
pole = reshape(pole,3,1); % reshape do pole saindo de 1x3 para 3x1

% "s" - é o vetor tensão da matriz de stress no plano dado
s = stress_matrix*pole; 
fprintf('O vetor total tração [%.2f;%0.2f;%0.2f]\n', s(1),s(2),s(3))
fprintf('A magnitude do vetor tração é %.2f Mpa\n', norm(s)) % calcula e imprime a magnitude do vetor total usando norm()
% transforma o vetor tração em atitude novamente
cossdir2line(s);


% tensão normal sobre o plano
% calcula a magntude da tensão normal sobre o plano
mag_sn = abs(dot(s,pole)); 
% a orientação do vetor normal sobre o plano é o próprio polo multiplicado pela magnitude;
snvetor = pole*mag_sn;
fprintf('O vetor de esforço normal [%.2f;%0.2f;%0.2f]\n', snvetor(1),snvetor(2),snvetor(3));
% printa a magnitude do vetor esforço normal
fprintf('A magnitude do vetor esforço normal sobre o plano é %.2f MPa\n', mag_sn);
% transforma o vetor tensão normal ao plano em atitude novamente
cossdir2line(snvetor); % essa é a linha do polo do plano

% tensão cisalhante sobre o plano
ssvetor = s - snvetor;
% a magnitude do vetor esforço cisalhante é S - esforço normal
mag_ss = norm(s)-mag_sn;
% os componentes do vetor cisalhante são os componentes do vetor total s -
% os componentes do vetor tensão normal
fprintf('O vetor de esforço cisalhante [%.2f;%0.2f;%0.2f]\n', ssvetor(1), ssvetor(2), ssvetor(3));
% printa a magnitude do vetor esforço cisalhante
fprintf('A magnitude do vetor esforço cisalhante sobre o plano é %.2f Mpa\n', mag_ss);
% transforma o vetor esforço cisalhante ao plano em atitude novamente
cossdir2line(ssvetor); % essa é uma linha contida no plano
% calcular o rake da tensão cisalhante com a linha
% rake é o ângulo que uma linha faz com o strike do plano
% primeiro define o strike
if dipdir>=0 && dipdir <90
    strike = dipdir+270;
else
    strike = dipdir-90;
end
% converte a linha do strike, horizontal para vetor
strike_vector = line2cossdir(strike, 0, false);
%calcula ângulo entre strike e esoforço cisalhante pela dedução do produto
%escalar; 
rake = acosd(dot(strike_vector,ssvetor)/(norm(ssvetor)*norm(strike_vector)));
% printa o ângulo rake
fprintf('O rake é %.2fº\n', rake);



% as magnitudes das tensões principais (elipsóide de tensão) podem ser
% obtidas a partir dos autovalores (eigenvalues) da matriz simétrica

