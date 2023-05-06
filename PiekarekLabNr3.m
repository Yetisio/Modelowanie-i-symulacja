%Jakub Piekarek
TzewN=-20;
TwewN=20;
TpN=15;
PgN=20000;
Vw=2.5*2*2;
Vp=Vw/2;
cpp=1000; 
rop=1.2;

%paramtetry
%K1,Kp,Kd,fPN;
%cvw,cvp

Cvv=cpp*rop*Vw;
Cvp=cpp*rop*Vp;
%zalozenia zadania
fPN = Vp / (24*60*60 / 4 ); %wymiana powietrza 4 razy na dobe

Kd = (PgN-cpp*rop*fPN*(TwewN-TzewN))/(2*(TwewN-TzewN) +7*(TwewN-TpN));
K1 = 2*Kd; % 2 razy wieksza material konsturkcja

Kp=(Kd*(TpN-TzewN))/(TwewN-TpN);


%Twew0= TwewN;
%Tp0=TpN;
Tzew0=TzewN;
Fp0 = fPN;
Pg0=PgN;

%liczenie lab3
Tp0= (PgN+(Kd*K1*Tzew0)+(K1+Kp+Tzew0)+(cpp*rop*Fp0*Kd*Tzew0)+(cpp*rop*Fp0*Kp*Tzew0)+(Kd*Kp*Tzew0))/(K1+Kd+(cpp*rop*Fp0*Kd)-(Kd*Kp));
Twew0=Kd/Kp*(Tp0-Tzew0)+Tp0;

czas=50000;
%stoptime zamiast 10 50000
czas_skok=5000;
dTzew=0;
dPg=0;
dFp=0;
[t]=sim('PiekarekLabNr3_si', czas);
figure,plot(t.tout,t.Twew);
figure,plot(t.tout,t.Tp);
