% Esse script vai aplicar a equação de Cauchy
% entrada: plano (dipdir,dip e matriz de tensões)
% no caso, como a matriz é simétrica, apenas 6 elementos são necessários
% (considerar o nosso sistema de referência:
% x = E y = N z = vertical para cima )

xx = -20 ; xy = 0 ; xz = 0;
<<<<<<< HEAD
yx = xy ; yy = 20 ; yz = 00;
zx = xz ; zy = yz ; zz = 0;
=======
yx = xy ; yy = 20 ; yz = 0;
zx = xz ; zy = yz ; zz = 00;
>>>>>>> 56a606eb1e90e3a1b7850217e94ee428879e3f31

stress_matrix = [xx xy xz;
                 yx yy yz;
                 zx zy zz];
             
% dipdir = 135;
dip = 90;

dd = linspace(0,360,361);
i = 1;
normal_mag = [];
shear_mag = [];
while i<=361
    pole = plane2cossdir(dd(i), dip, false); % o resultado é um vetor do polo 1x3
    pole = reshape(pole,3,1); % reshape do pole saindo de 1x3 para 3x1
    
    s = stress_matrix*pole; % esse é o vetor tensão da matriz de stress no plano dado
    fprintf('O vetor total tracao [%.2f;%0.2f;%0.2f]\n', s(1),s(2),s(3))
    fprintf('A magnitude do vetor tracao e %.2f Mpa\n', norm(s)) % calcula e imprime a magnitude do vetor total usando norm()
    % transforma o vetor tração em atitude novamente
    cossdir2line(s);
    
    
<<<<<<< HEAD
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
=======
    % tensão normal sobre o plano
    % calcula a magntude da tensao normal sobre o plano
    mag_sn = abs(dot(s,pole)); 
    % a orientação do vetor normal sobre o plano é o próprio polo multiplicado pela magnitude;
    snvetor = pole*mag_sn;
    fprintf('O vetor de esforco normal [%.2f;%0.2f;%0.2f]\n', snvetor(1),snvetor(2),snvetor(3));
    % printa a magnitude do vetor esforço normal
    fprintf('A magnitude do vetor esforco normal sobre o plano e %.2f MPa\n', mag_sn);
    % transforma o vetor tensão normal ao plano em atitude novamente
    cossdir2line(snvetor); % essa é a linha do polo do plano
>>>>>>> 56a606eb1e90e3a1b7850217e94ee428879e3f31
    
    % esforco cisalhante sobre o plano
    ssvetor = s - snvetor;
<<<<<<< HEAD
    % a magnitude do vetor esforco cisalhante é S - esforco normal
    mag_ss = sqrt(ssvetor(1)^2+ssvetor(2)^2 + ssvetor(3)^2);
    % os componentes do vetor cisalhante sao os componentes do vetor total s -
    % os componentes do vetor tensao normal
    fprintf('O vetor de esforco cisalhante [%.2f;%0.2f;%0.2f]\n', ssvetor(1), ssvetor(2), ssvetor(3));
    % printa a magnitude do vetor esforco cisalhante
    fprintf('A magnitude do vetor esforco cisalhante sobre o plano e %.2f Mpa\n', mag_ss);

=======
    % a magnitude do vetor esforço cisalhante é S - esforço normal
    mag_ss = norm(s)-mag_sn;
    % os componentes do vetor cisalhante são os componentes do vetor total s -
    % os componentes do vetor tensão normal
    fprintf('O vetor de esforco cisalhante [%.2f;%0.2f;%0.2f]\n', ssvetor(1), ssvetor(2), ssvetor(3));
    % printa a magnitude do vetor esforço cisalhante
    fprintf('A magnitude do vetor esforco cisalhante sobre o plano e %.2f Mpa\n', mag_ss);
>>>>>>> 56a606eb1e90e3a1b7850217e94ee428879e3f31
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
    fprintf('O rake e %.2f\n', rake);

    normal_mag(i) = mag_sn;
    shear_mag(i) = mag_ss;
    i = i+1;
end


plot(dd, normal_mag, 'linewidth', 1, 'color','b')
hold on

plot(dd, shear_mag, 'linewidth', 1, 'color','r')

<<<<<<< HEAD
legend({'Normal Stress \sigma_n','Shear Stress \sigma_s'},'Location','southeast')
title('EE=-20Mpa; NN=20Mpa e demais componentes iguais a zero;  Strike variando de 0-360')
=======
legend({'Normal Stress \sigma_n','Shear Stress \sigma_s'},'Location','northeast')
title('EE=-20Mpa;  Strike variando de 0-360')
>>>>>>> 56a606eb1e90e3a1b7850217e94ee428879e3f31
xlabel('dip direction')
ylabel('\sigma (MPa)')
xticks(linspace(0,360,9))

