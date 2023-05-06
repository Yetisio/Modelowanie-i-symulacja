TzewN = -20; % Celcius
TwewN = 20; %celcius
TpN = 15; % Celcius
PgN = 10000; % WAT
Vw = 2.5*5*3;% pomieszczenie (5,3) 2 ostatnie cyfry indexu
Vp = 0.5 * Vw;
cp = 1000;
pp = 1.2;
t0=0;
%Ientyfikacja
FpN = Vp/(24*60*60/2.5);
Kd = (PgN-cp*pp*FpN*(TwewN-TzewN))/(2*(TwewN-TzewN) +7*(TwewN-TpN));
K1 = 2*Kd;
Kp = 7*Kd;
%parametry dynamiczne
Cvw = cp*pp*Vw;
Cvp = cp*pp*Vp;
%warunki poczatkowe
Tzew0 = TzewN + 0;
Pg0 = PgN*1.0;
Fp0 = FpN*1.0;
%stan równowagi
%Twew0=Pg0*(K1+cp*pp*Fp0)+Tzew0;
%Tp0= Pg0/Kd +Twew0;
Twew0=TwewN;
Tp0=TpN;
czas = 50000;

czas_skok = 5000;
dTzew = 1;
dPg=0;
dFp=0;

[t]=sim("SimOwczarekLab1",czas);

figure,plot(t.tout,t.mojaTwew);
figure,plot(t.tout,t.mojeTp);