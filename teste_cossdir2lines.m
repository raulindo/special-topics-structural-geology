% scipt para testar transformação de linhas em  cossenos diretores e
% retornar para a linha;
% it takes 0-360 and intermediate trends in every quadrant to test the
% conversion

n = 1;
trend = [0 45 90 135 180 225 270 315 360];
plunge = 45;
while n <= 9
    %trend = input('Qual o trend: ');
    %plunge = input('Qual o plunge: ');
    t = trend(n);
    linha = line2cossdir(t,plunge,false);

    cossdir2line(linha);
    n = n+1;
end