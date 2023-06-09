%Jakub Piekarek
%Wartosci nominalne
TzewN=-20;  % Celcius
TwewN=20;   % Celcius
TpN=15;     % Celcius
PgN=15000;  % WAT %bylo 20000
Vw=2.5*2*2; %m3, indeks 264(202) 
Vp=Vw*2;    %m3   %bylo Vw/2
cpp=1000;   %J/(kgK)
rop=1.2;    %kg/m3

%Identyfikacja parametrów statycznych
fPN = Vp / (24*60*60 / 4 ); %wymiana powietrza 4 razy na dobe
Kd = (PgN-cpp*rop*fPN*(TwewN-TzewN))/(2*(TwewN-TzewN) +7*(TwewN-TpN));
K1 = 2*Kd; % 2 razy wieksza material konsturkcja
Kp=(Kd*(TpN-TzewN))/(TwewN-TpN);

%Parametry dynamiczne
Cvv=cpp*rop*Vw;
Cvp=cpp*rop*Vp;

%Warunki poczatkowych
Tzew0 = TzewN;
Fp0 = fPN;
Pg0 = PgN;

%Stan równowagi
Twew0=Tzew0+(Pg0/(K1+(cpp*rop*Fp0)+(Kp*Kd)/(Kp+Kd)));
Tp0=(Kp*Twew0+Kd*Tzew0)/(Kp+Kd);

%zaklocenie
czas=700; %bylo 50000
czas_skok=0;
dTzew=0;
dPg=0.2*PgN;
dFp=0;


%lab4 dPg=0.2*PgN czas_skok=0
%wyswietlanie wykresow
 
% %/////wiersz 1\\\\\
tiledlayout(1,1);
% %Warunki poczatkowe
 Twew0=Tzew0+(Pg0/(K1+(cpp*rop*Fp0)+(Kp*Kd)/(Kp+Kd)));
 Tp0=(Kp*Twew0+Kd*Tzew0)/(Kp+Kd);
% %symulacja
 [t]=sim('PiekarekLabNr3_si', czas);
% %wykresy
    nexttile(1);
 plot(t.tout,t.Tp,Color="#FF00FF"), hold on;
 legend("T0=20, T=140");
  
 dPg=0.2*PgN;
 k=9/dPg;
 L=[k];
 M=[140,1];
 T0=20;
 czas_skok=0;

 [t]=sim('PiekarekLabNr4_si', czas);
    nexttile(1);
 plot(t.tout,t.aT,Color="#0000FF"), hold on;
 legend("T0=20 T=140","Wykres z transmitacji");



