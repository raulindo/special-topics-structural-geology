% Esse script vai aplicar a equação de Cauchy
% entrada: plano (dipdir,dip e matriz de tensões)
% no caso, como a matriz é simétrica, apenas 6 elementos são necessários
% (considerar o nosso sistema de referência:
% x = E y = N z = vertical para cima )

xx = -20 ; xy = 0 ; xz = 0;
yx = xy ; yy = 20 ; yz = 00;
zx = xz ; zy = yz ; zz = 20;

stress_matrix = [xx xy xz;
                 yx yy yz;
                 zx zy zz];
             
% dipdir = 135;
dip = 30;

dd = linspace(0,360,361);
i = 1;
normal_mag = [];
shear_mag = [];
while i<=361
    pole = plane2cossdir(dd(i), dip, false); % o resultado é um vetor do polo 1x3
    pole = reshape(pole,3,1); % reshape do pole saindo de 1x3 para 3x1
    
    s = stress_matrix*pole; % esse é o vetor tensão da matriz de stress no plano dado
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
    if dd(i)>=0 && dd(i) <90
        strike = dd(i)+270;
    else
        strike =dd(i)-90;
    end
    % converte a linha do strike, horizontal para vetor
    strike_vector = line2cossdir(strike, 0, false);
    %calcula ângulo entre strike e esoforço cisalhante pela dedução do produto
    %escalar; 
    rake = acosd(dot(strike_vector,ssvetor)/(norm(ssvetor)*norm(strike_vector)));
    % printa o ângulo rake
    fprintf('O rake é %.2fº\n', rake);

    normal_mag(i) = mag_sn;
    shear_mag(i) = mag_ss;
    i = i+1;
end


plot(dd, normal_mag, 'linewidth', 1, 'color','b')
hold on

plot(dd, shear_mag, 'linewidth', 1, 'color','r')

legend({'Normal Stress \sigma_n','Shear Stress \sigma_s'},'Location','northeast')
title('EE=-20Mpa; NN=20Mpa; ZZ=20Mpa;  Strike variando de 0-360')
xlabel('dip direction')
ylabel('\sigma (MPa)')
xticks(linspace(0,360,9))

