% Miłosz Mikulski 254171 
%wartości nominalne
TzewN=-20;
TwewN=20;
TpN=15;
PgN=10000;
Vw=2.5*7*1;
Vp=0.5*Vw;
cpp=1000;
rop=1.2;
%identyfikacja parametrów statycznych
FpN=Vp/((24*60*60)/3.5);
Kd=(PgN-cpp*rop*FpN*(TwewN-TzewN))/(2*(TwewN-TzewN)+7*(TwewN-TpN));
K1=2*Kd;
Kp=Kd*(TpN-TzewN)/(TwewN-TpN);
%parametry "dynamiczne"
Cvp=cpp*rop*Vp;
Cvw=cpp*rop*Vw;
%Warunki poczatkowe
Tzew0=TzewN+0;
Pg0=PgN*1;
Fp0=FpN*0.8;
%Stany równowagi
%Twew0=TwewN;
%Tp0=TpN;
Twew0=Tzew0+(Pg0/(K1+(cpp*rop*Fp0)+(Kp*Kd)/(Kp+Kd)));
Tp0=(Kp*Twew0+Kd*Tzew0)/(Kp+Kd);

%Czesc 31
%zaklocenie
czas=5000;
czas_skok=500;
dTzew=0;
dPg=0;
dFp=0.2*FpN;

%symulacja
[t]=sim('mikulskiLab3Si',czas);
%wykresy
figure,plot(t.tout,t.aTwew);
figure,plot(t.tout,t.aTp);