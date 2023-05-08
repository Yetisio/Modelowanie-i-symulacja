%Jakub Piekarek
%Wartosci nominalne
TzewN=-20;  % Celcius
TwewN=20;   % Celcius
TpN=15;     % Celcius
PgN=20000;  % WAT
Vw=2.5*2*2; %m3, indeks 264(202) 
Vp=Vw/2;    %m3
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
%Twew0=Tzew0+(Pg0/(K1+(cpp*rop*Fp0)+(Kp*Kd)/(Kp+Kd)));
%Tp0=(Kp*Twew0+Kd*Tzew0)/(Kp+Kd);

%zaklocenie
czas=50000;
czas_skok=5000;
dTzew=0;
dPg=0;
dFp=0;

%wyswietlanie wykresow
tiledlayout(3,2);
%/////wiersz 1\\\\\
%dTzew=2
dTzew=2;
%Warunki poczatkowe
Twew0=Tzew0+(Pg0/(K1+(cpp*rop*Fp0)+(Kp*Kd)/(Kp+Kd)));
Tp0=(Kp*Twew0+Kd*Tzew0)/(Kp+Kd);
%symulacja
[t]=sim('PiekarekLabNr3_si', czas);
%wykresy
nexttile(1);
plot(t.tout,t.Twew,Color="#FF00FF"), hold on;
nexttile(2);
plot(t.tout,t.Tp,Color="#0000FF"), hold on;

%Tzew0=TzewN+2, Pg0=0.7*PgN
%Warunki poczatkowe
Tzew0 = TzewN+2; Fp0 = fPN; Pg0 = 0.7*PgN;
Twew0=Tzew0+(Pg0/(K1+(cpp*rop*Fp0)+(Kp*Kd)/(Kp+Kd)));
Tp0=(Kp*Twew0+Kd*Tzew0)/(Kp+Kd);
%symulacja
[t]=sim('PiekarekLabNr3_si', czas);
%wykresy
nexttile(1);
plot(t.tout,t.Twew,Color="#FF0000"), hold on;
nexttile(2);
plot(t.tout,t.Tp,Color=	"#77AC30"), hold on;

%Tzew0=TzewN+2, Pg0=0.7*PgN, Fp0=0.8*fPN
%Warunki poczatkowe
Tzew0 = TzewN+2; Fp0 = 0.8*fPN; Pg0 = 0.7*PgN;
Twew0=Tzew0+(Pg0/(K1+(cpp*rop*Fp0)+(Kp*Kd)/(Kp+Kd)));
Tp0=(Kp*Twew0+Kd*Tzew0)/(Kp+Kd);
%symulacja
[t]=sim('PiekarekLabNr3_si', czas);
%wykresy
nexttile(1);
plot(t.tout,t.Twew, Color="#FF7000"),grid on, hold on, title("Temperatura wewnetrzna - dTzew=2"), xlabel("Czas [s]"), ylabel("Temperatura [^oC]");
legend("PgN, TzewN, Fpn","70%PgN, TzewN+2, FpN", "70%PgN, TzewN+2, 80%FpN");
nexttile(2);
plot(t.tout,t.Tp,Color="#000000"),grid on, hold on, title("Temperatura poddasza - dTzew=2"), xlabel("Czas [s]"), ylabel("Temperatura [^oC]");
legend("PgN, TzewN, Fpn","70%PgN, TzewN+2, FpN", "70%PgN, TzewN+2, 80%FpN");

%/////wiersz 2\\\\\
%dPg=0.15*PgN
dTzew = 0; dPg = 0.15*PgN; dFp = 0;
%Warunki poczatkowe
Tzew0 = TzewN; Pg0 = PgN; Fp0 = fPN;
Twew0=Tzew0+(Pg0/(K1+(cpp*rop*Fp0)+(Kp*Kd)/(Kp+Kd)));
Tp0=(Kp*Twew0+Kd*Tzew0)/(Kp+Kd);
%symulacja
[t]=sim('PiekarekLabNr3_si', czas);
%wykresy
nexttile(3);
plot(t.tout,t.Twew,Color="#FF00FF"), hold on;
nexttile(4);
plot(t.tout,t.Tp,Color="#0000FF"), hold on;

%dPg=0.15*PgN, Pg0=0.7*PgN, Fp0=fPN
dTzew = 0; dPg = 0.15*PgN; dFp = 0;
%Warunki poczatkowe
Tzew0 = TzewN+2; Pg0 = 0.7*PgN; Fp0 = fPN;
Twew0=Tzew0+(Pg0/(K1+(cpp*rop*Fp0)+(Kp*Kd)/(Kp+Kd)));
Tp0=(Kp*Twew0+Kd*Tzew0)/(Kp+Kd);
%symulacja
[t]=sim('PiekarekLabNr3_si', czas);
%wykresy
nexttile(3);
plot(t.tout,t.Twew,Color="#FF00FF"), hold on;
nexttile(4);
plot(t.tout,t.Tp,Color="#0000FF"), hold on;

%dPg=0.15*PgN, Pg0=0.7*PgN, Fp0=0.8fPN
dTzew = 0; dPg = 0.15*PgN; dFp = 0;
%Warunki poczatkowe
Tzew0 = TzewN+2; Pg0 = 0.7*PgN; Fp0 = 0.8*fPN;
Twew0=Tzew0+(Pg0/(K1+(cpp*rop*Fp0)+(Kp*Kd)/(Kp+Kd)));
Tp0=(Kp*Twew0+Kd*Tzew0)/(Kp+Kd);
%symulacja
[t]=sim('PiekarekLabNr3_si', czas);
%wykresy
nexttile(3);
plot(t.tout,t.Twew, Color="#FF7000"),grid on, hold on, title("Temperatura wewnetrzna - dPg = 15%PgN"), xlabel("Czas [s]"), ylabel("Temperatura [^oC]");
legend("PgN, TzewN, Fpn","70%PgN, TzewN+2, FpN", "70%PgN, TzewN+2, 80%FpN");
nexttile(4);
plot(t.tout,t.Tp,Color="#000000"),grid on, hold on, title("Temperatura poddasza - dPg = 15%PgN"), xlabel("Czas [s]"), ylabel("Temperatura [^oC]");
legend("PgN, TzewN, Fpn","70%PgN, TzewN+2, FpN", "70%PgN, TzewN+2, 80%FpN");

%/////wiersz 3\\\\\
%dFp=0.3*fPN
dTzew = 0; dPg = PgN; dFp = 0.3*fPN;
%Warunki poczatkowe
Tzew0 = TzewN; Pg0 = PgN; Fp0 = fPN;
Twew0=Tzew0+(Pg0/(K1+(cpp*rop*Fp0)+(Kp*Kd)/(Kp+Kd)));
Tp0=(Kp*Twew0+Kd*Tzew0)/(Kp+Kd);
%symulacja
[t]=sim('PiekarekLabNr3_si', czas);
%wykresy
nexttile(5);
plot(t.tout,t.Twew,Color="#FF00FF"), hold on;
nexttile(6);
plot(t.tout,t.Tp,Color="#0000FF"), hold on;

%dFp=0.3fPN, Tzew0=Tzew+2, Pg0=0.7PgN
dTzew = 0; dPg = PgN; dFp = 0.3*fPN;
%Warunki poczatkowe
Tzew0 = TzewN+2; Pg0 = 0.7*PgN; Fp0 = fPN;
Twew0=Tzew0+(Pg0/(K1+(cpp*rop*Fp0)+(Kp*Kd)/(Kp+Kd)));
Tp0=(Kp*Twew0+Kd*Tzew0)/(Kp+Kd);
%symulacja
[t]=sim('PiekarekLabNr3_si', czas);
%wykresy
nexttile(5);
plot(t.tout,t.Twew,Color="#FF0000"),hold on;
nexttile(6);
plot(t.tout,t.Tp,Color=	"#77AC30"),hold on;

%dFp=0.3fPN, Tzew0=Tzew+2, Pg0=0.7PgN, Fp0=0.8*fPN
dTzew = 0; dPg = PgN; dFp = 0.3*fPN;
%Warunki poczatkowe
Tzew0 = TzewN+2; Pg0 = 0.7*PgN; Fp0 = 0.8*fPN;
Twew0=Tzew0+(Pg0/(K1+(cpp*rop*Fp0)+(Kp*Kd)/(Kp+Kd)));
Tp0=(Kp*Twew0+Kd*Tzew0)/(Kp+Kd);
%symulacja
[t]=sim('PiekarekLabNr3_si', czas);
%wykresy
nexttile(5);
plot(t.tout,t.Twew, Color="#FF7000"),grid on, hold on, title("Temperatura wewnetrzna - dFp = 0.3*FpN"), xlabel("Czas [s]"), ylabel("Temperatura [^oC]");
legend("PgN, TzewN, Fpn","70%PgN, TzewN+2, FpN", "70%PgN, TzewN+2, 80%FpN");
nexttile(6);
plot(t.tout,t.Tp,Color="#000000"),grid on, hold on, title("Temperatura poddasza - dFp = 0.3*FpN"), xlabel("Czas [s]"), ylabel("Temperatura [^oC]");
legend("PgN, TzewN, Fpn","70%PgN, TzewN+2, FpN", "70%PgN, TzewN+2, 80%FpN");