% Esse script vai aplicar a equa��o de Cauchy
% entrada: plano (dipdir,dip e matriz de tens�es)
% no caso, como a matriz � sim�trica, apenas 6 elementos s�o necess�rios
% (considerar o nosso sistema de refer�ncia:
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

% calcula o polo do plano com a fun��o constru�da
pole = plane2cossdir(dipdir, dip, false); % o resultado � um vetor do polo 1x3
pole = reshape(pole,3,1); % reshape do pole saindo de 1x3 para 3x1

% "s" - � o vetor tens�o da matriz de stress no plano dado
s = stress_matrix*pole; 
fprintf('O vetor total tra��o [%.2f;%0.2f;%0.2f]\n', s(1),s(2),s(3))
fprintf('A magnitude do vetor tra��o � %.2f Mpa\n', norm(s)) % calcula e imprime a magnitude do vetor total usando norm()
% transforma o vetor tra��o em atitude novamente
cossdir2line(s);


% tens�o normal sobre o plano
% calcula a magntude da tens�o normal sobre o plano
mag_sn = abs(dot(s,pole)); 
% a orienta��o do vetor normal sobre o plano � o pr�prio polo multiplicado pela magnitude;
snvetor = pole*mag_sn;
fprintf('O vetor de esfor�o normal [%.2f;%0.2f;%0.2f]\n', snvetor(1),snvetor(2),snvetor(3));
% printa a magnitude do vetor esfor�o normal
fprintf('A magnitude do vetor esfor�o normal sobre o plano � %.2f MPa\n', mag_sn);
% transforma o vetor tens�o normal ao plano em atitude novamente
cossdir2line(snvetor); % essa � a linha do polo do plano

% tens�o cisalhante sobre o plano
ssvetor = s - snvetor;
% a magnitude do vetor esfor�o cisalhante � S - esfor�o normal
mag_ss = norm(s)-mag_sn;
% os componentes do vetor cisalhante s�o os componentes do vetor total s -
% os componentes do vetor tens�o normal
fprintf('O vetor de esfor�o cisalhante [%.2f;%0.2f;%0.2f]\n', ssvetor(1), ssvetor(2), ssvetor(3));
% printa a magnitude do vetor esfor�o cisalhante
fprintf('A magnitude do vetor esfor�o cisalhante sobre o plano � %.2f Mpa\n', mag_ss);
% transforma o vetor esfor�o cisalhante ao plano em atitude novamente
cossdir2line(ssvetor); % essa � uma linha contida no plano
% calcular o rake da tens�o cisalhante com a linha
% rake � o �ngulo que uma linha faz com o strike do plano
% primeiro define o strike
if dipdir>=0 && dipdir <90
    strike = dipdir+270;
else
    strike = dipdir-90;
end
% converte a linha do strike, horizontal para vetor
strike_vector = line2cossdir(strike, 0, false);
%calcula �ngulo entre strike e esofor�o cisalhante pela dedu��o do produto
%escalar; 
rake = acosd(dot(strike_vector,ssvetor)/(norm(ssvetor)*norm(strike_vector)));
% printa o �ngulo rake
fprintf('O rake � %.2f�\n', rake);



% as magnitudes das tens�es principais (elips�ide de tens�o) podem ser
% obtidas a partir dos autovalores (eigenvalues) da matriz sim�trica

