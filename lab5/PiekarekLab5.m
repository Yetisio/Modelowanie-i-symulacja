%Jakub Piekarek  
%Badanie Kp i Ti na 5 jaki maja wplyw na model okazac kilka wykresow
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
 

 tiledlayout(2,3);
% WIERSZ 1
  dPg=0.2*PgN;
  k=9/dPg;
  L=[k];
  M=[140,1];
  T0=20;
  T=140;
  czas_skok=10;
  Kp1=(0.9*T)/(k*T0);
  Ti=3.33*T0;
  dU=5;
  [t]=sim('PiekarekLab5_si', czas);
  nexttile(1);
  plot(t.aT,Color="#0000FF"), hold on;
  legend("Wykres pierworny z Kp i Ti");
  Kp1=0.5*((0.9*T)/(k*T0));
  Ti=3.33*T0;
  %symulacja
  [t]=sim('PiekarekLab5_si', czas);
  %wykresy
  nexttile(2);
  plot(t.aT,Color="#FF00FF"), hold on;
  legend("Wykres zmiany Kp na Kp*0.5");
  Kp1=((0.9*T)/(k*T0));
  Ti=0.2*(3.33*T0);
  %symulacja
  [t]=sim('PiekarekLab5_si', czas);
  %wykresy
  nexttile(3);
  plot(t.aT,Color="#00000F"), hold on; 
  legend("Wykres zmiany Ti na Ti*0.2");
  
  %WIERSZ 2

  Kp1=(0.9*T)/(k*T0);
  Ti=3.33*T0;
  dU=5;
  [t]=sim('PiekarekLab5_si', czas);
  nexttile(4);
  plot(t.aT,Color="#0000FF"), hold on;
  legend("Wykres pierworny z Kp i Ti");


  Kp1=2*((0.9*T)/(k*T0));
  Ti=3.33*T0;
  dU=5;
  [t]=sim('PiekarekLab5_si', czas);
  nexttile(5);
  plot(t.aT,Color="#FF00FF"), hold on;
  legend("Wykres zmiany z Kp*2");


  Kp1=(0.9*T)/(k*T0);
  Ti=5*3.33*T0;
  dU=5;
  [t]=sim('PiekarekLab5_si', czas);
  nexttile(6);
  plot(t.aT,Color="#00000F"), hold on;
  legend("Wykres zmiany z Ti*5 ");

