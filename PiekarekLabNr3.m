%Jakub Piekarek
%wartosci nominalne
TzewN=-20;  % Celcius
TwewN=20;   % Celcius
TpN=15;     % Celcius
PgN=20000;  % WAT
Vw=2.5*2*2; %indeks 264202 
Vp=Vw/2;
cpp=1000; 
rop=1.2;

%paramtetry
%K1,Kp,Kd,fPN;
%cvw,cvp

%zalozenia zadania
%Identyfikacja
fPN = Vp / (24*60*60 / 4 ); %wymiana powietrza 4 razy na dobe
Kd = (PgN-cpp*rop*fPN*(TwewN-TzewN))/(2*(TwewN-TzewN) +7*(TwewN-TpN));
K1 = 2*Kd; % 2 razy wieksza material konsturkcja
Kp=(Kd*(TpN-TzewN))/(TwewN-TpN);

%parametry dynamiczne
Cvv=cpp*rop*Vw;
Cvp=cpp*rop*Vp;

%paramtery warunkow poczatkowych
Tzew0=TzewN;
Fp0 = fPN;
Pg0=PgN;
%liczenie lab3
%stan równowagi
Twew0=Tzew0+(Pg0/(K1+(cpp*rop*Fp0)+(Kp*Kd)/(Kp+Kd)));
Tp0=(Kp*Twew0+Kd*Tzew0)/(Kp+Kd);
%Twew0= TwewN;
%Tp0=TpN;

%zaklocenie
czas=50000;
czas_skok=5000;
dTzew=0;
dPg=0;
dFp=0;

%przypisanie do zmiennej symulacji
[t]=sim('PiekarekLabNr3_si', czas);
%wyswietlanie wykresow
figure,plot(t.tout,t.Twew);
figure,plot(t.tout,t.Tp);
