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
czas=500; %bylo 50000
czas_skok=300;
dTzew=0;
dPg=0;
dFp=0;
%wyswietlanie wykresow
tiledlayout(2,2);
dPg=0.2*PgN;
k=9/dPg;
L=[k];
M=[140,1];
T0=20;
T=140;
Kp1=(0.9*T)/(k*T0);
Ti=3.33*T0;
dU=5;
%Rysowanie wykresow 
% ----WIERSZ 1---- LEWY
    %Tzew0 = TzewN Fp0 = fPN;
%Tzad0=Tp0
    Tzad0=Tp0;
    dTzad = 5;
    Tzad=Tzad0+dTzad;
    Tzew0 = TzewN;
    Fp0 = fPN;
    dTzew=0;
    dFp=0;
    [t]=sim('PiekarekLab6_si', czas);
    nexttile(1)
    plot(t.tout,t.Tp,Color="#007000"), hold on;

%Tzad0=Tp0+5
    Tzad0=Tp0+5;
    dTzad = 5;
    Tzad=Tzad0+dTzad;
    Tzew0 = TzewN;
    Fp0 = fPN;
    dTzew=0;
    dFp=0;
    [t]=sim('PiekarekLab6_si', czas);
    nexttile(1)
    plot(t.tout,t.Tp,Color="#000000"), hold on;

%Tzad0=Tp0+10
    Tzad0=Tp0+10;
    dTzad = 5;
    Tzad=Tzad0+dTzad;
    Tzew0 = TzewN;
    Fp0 = fPN;
    dTzew=0;
    dFp=0;
    [t]=sim('PiekarekLab6_si', czas);
    nexttile(1)
    plot(t.tout,t.Tp,Color="#F07000"),grid on, hold on, title("Temperatura poddasza dla Fp0=FpN, Tzew0=TzewN"), xlabel("Czas [s]"), ylabel("Temperatura [^oC]");
    legend("Tzad=Tzad0+dTzad, dTzad=5, Tzad0=15 ","Tzad=Tzad0+dTzad, dTzad=5, Tzad0=20 ", "Tzad=Tzad0+dTzad, dTzad=5, Tzad0=25", 'Location', 'NorthWest');


% ----WIERSZ 1---- PRAWY
    %Tzew0=TzewN  Fp0=fPN*25;
%Tzad0=Tp0
    Tzad0=Tp0;
    dTzad = 5;
    Tzad=Tzad0+dTzad;
    Tzew0=TzewN;
    Fp0=fPN*25;
    [t]=sim('PiekarekLab6_si', czas);
    nexttile(2)
    plot(t.tout,t.Tp,Color="#007000"), hold on;

%Tzad0=Tp0+5
    Tzad0=Tp0+5;
    dTzad = 5;
    Tzad=Tzad0+dTzad;
    Tzew0=TzewN;
    Fp0=fPN*25;
    [t]=sim('PiekarekLab6_si', czas);
    nexttile(2)
    plot(t.tout,t.Tp,Color="#000000"), hold on;

%Tzad0=Tp0+10
    Tzad0=Tp0+10;
    dTzad = 5;
    Tzad=Tzad0+dTzad;
    Tzew0=TzewN;
    Fp0=fPN*25;
    [t]=sim('PiekarekLab6_si', czas);
    nexttile(2)
    plot(t.tout,t.Tp,Color="#F07000"),grid on, hold on, title("Temperatura poddasza dla Fp0 = 25 * FpN, Tzew0 = TzewN"), xlabel("Czas [s]"), ylabel("Temperatura [^oC]");
    legend("Tzad=Tzad0+dTzad, dTzad=5, Tzad0=15 ","Tzad=Tzad0+dTzad, dTzad=5, Tzad0=20 ", "Tzad=Tzad0+dTzad, dTzad=5, Tzad0=25", 'Location', 'NorthWest');    

% ----WIERSZ 2---- LEWY
    %Tzew0=TzewN+3 Fp0=fPN
%Tzad0=Tp0
    Tzad0=Tp0;
    dTzad = 5;
    Tzad=Tzad0+dTzad;
    Tzew0=TzewN+3;
    Fp0=fPN;
    [t]=sim('PiekarekLab6_si', czas);
    nexttile(3)
    plot(t.tout,t.Tp,Color="#007000"), hold on;

%Tzad0=Tp0+5
    Tzad0=Tp0+5;
    dTzad = 5;
    Tzad=Tzad0+dTzad;
    Tzew0=TzewN+3;
    Fp0=fPN;
    [t]=sim('PiekarekLab6_si', czas);
    nexttile(3)
    plot(t.tout,t.Tp,Color="#000000"), hold on;

%Tzad0=Tp0+10
    Tzad0=Tp0+10;
    dTzad = 5;
    Tzad=Tzad0+dTzad;
    Tzew0=TzewN+3;
    Fp0=fPN;
    [t]=sim('PiekarekLab6_si', czas);
    nexttile(3)
    plot(t.tout,t.Tp,Color="#F07000"),grid on, hold on, title("Temperatura poddasza dla Tzew0 = TzewN + 3, Fp0 = FpN"), xlabel("Czas [s]"), ylabel("Temperatura [^oC]");
    legend("Tzad=Tzad0+dTzad, dTzad=5, Tzad0=15 ","Tzad=Tzad0+dTzad, dTzad=5, Tzad0=20 ", "Tzad=Tzad0+dTzad, dTzad=5, Tzad0=25", 'Location', 'NorthWest');  

% ----WIERSZ 2---- PRAWY
    %Tzew0=TzewN+3 Fp0=fPN*0.7
%Tzad0=Tp0
    Tzad0=Tp0;
    dTzad = 5;
    Tzad=Tzad0+dTzad;
    Tzew0=TzewN+3;
    Fp0=fPN*25;
    [t]=sim('PiekarekLab6_si', czas);
    nexttile(4)
    plot(t.tout,t.Tp,Color="#007000"), hold on;

%Tzad0=Tp0+5
    Tzad0=Tp0+5;
    dTzad = 5;
    Tzad=Tzad0+dTzad;
    Tzew0=TzewN+3;
    Fp0=fPN*25;
    [t]=sim('PiekarekLab6_si', czas);
    nexttile(4)
    plot(t.tout,t.Tp,Color="#000000"), hold on;

%Tzad0=Tp0+10
    Tzad0=Tp0+10;
    dTzad = 5;
    Tzad=Tzad0+dTzad;
    Tzew0=TzewN+3;
    Fp0=fPN*25;
    [t]=sim('PiekarekLab6_si', czas);
    nexttile(4)
    plot(t.tout,t.Tp,Color="#F07000"),grid on, hold on, title("Temperatura poddasza dla Tzew0 = TzewN + 3, Fp0 = 25 * FpN"), xlabel("Czas [s]"), ylabel("Temperatura [^oC]");
    legend("Tzad=Tzad0+dTzad, dTzad=5, Tzad0=15 ","Tzad=Tzad0+dTzad, dTzad=5, Tzad0=20 ", "Tzad=Tzad0+dTzad, dTzad=5, Tzad0=25", 'Location', 'NorthWest');     
%Kp odpowiedzialne szybkosc regulacji 
%Ti za zmniejszanie przeregulowywań

