% scipt para testar transformação de linhas em  cossenos diretores e
% retornar para a linha;
% it takes 0-360 and intermediate trends in every quadrant to test the
% conversion

n = 1;
dipdir = [0 45 90 135 180 225 270 315 360];
dip = 45;
while n <= 9
    %trend = input('Qual o trend: ');
    %plunge = input('Qual o plunge: ');
    dd = dipdir(n);
    plano = plane2cossdir(dd,dip,false);

    cossdir2plane(plano);
    n = n+1;
end