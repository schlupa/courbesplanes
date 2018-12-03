/* 10  GOTO 330

1020  TEXT : PRINT "J'AI FINI LES CALCULS."
1030  GET A$: IF A$ = " " THEN  END
1040  GOTO 1030
*/
import stdio;

string A;

float YP = 0;
float XP = 0;
float XX = 0;
float YY = 0;
float XD = 0;
float YD = 0;
float S = 0;
float NX = 0;
float NY = 0;
float Y = 0;
float X = 0;
float PI = 3.1415925;
float XB = 0;                                       // 340 XB = 0:YB = 0:YS = 0:XA = 0:YA = 0:XS = 0:Y0 = 0:NL = 0:Z = 0:Z0 = 0:Z1 = 0
float YB = 0;
float YS = 0;
float XA = 0;
float YA = 0;
float XS = 0;
float Y0 = 0;
float NL = 0;
float Z = 0;
float Z0 = 0;
float Z1 = 0;
uint HH = 191;                                      // 350 HH = 191
uint BR = 279;                                      // 360 BR = 279
int[BR] O;                                        // 370  DIM O%(BR - 1),U%(BR - 1)
int[BR] U;
int[][] PX, PY;                                     // 500  DIM PX%(NL,NL),PY%(NL,NL)
float[] X, Y;                                       // 500  DIM X((NL + 1) ^ 2 - 1),Y((NL + 1) ^ 2 - 1)


/* Plot dot */
void GOSUB20()
{
  if(O(YB) < 0 || XB <= O(YB)) {                    // 20  IF O%(YB) >  = 0 THEN  IF XB > O%(YB) THEN 50
    if(XA < XB) {                                   // 30  IF XA < XB THEN X = XA:XA = XB:XB = X:Y = YA:YA = YB:YB = Y
      X = XA;      XA = XB;      XB = X;
      Y = YA;      YA = YB;      YB = Y;
    }                                               // 40  GOTO 60
  }
  else {                                            // 50  IF XA > XB THEN X = XA:XA = XB:XB = X:Y = YA:YA = YB:YB = Y
    if(XA > XB) {
      X = XA;      XA = XB;      XB = X;
      Y = YA;      YA = YB;      YB = Y;
    }
  }
  XD = XB - XA;                                     // 60 XD = XB - XA:YD = YB - YA:S =  ABS (XD): IF  ABS (YD) > S THEN S =  ABS (YD)
  YD = YB - YA;
  S = fabs(XD);
  if(fabs(YD) > S)
    S = fabs(YD);
  if(S) {                                           // 70  IF S = 0 THEN  RETURN
    XD = XD / S;                                    // 80 XD = XD / S:YD = YD / S:XX = XA - XD:YY = YA - YD
    YD = YD / S;
    XX = XA - XD;
    YY = YA - YD;
    for(I=0; I<=S; I++) {                           // 90  FOR I = 0 TO S:XX = XX + XD:YY = YY + YD:XP =  INT (XX + .5):YP =  INT (YY + .5)
      XX = XX + XD;
      YY = YY + YD;
      XP = floor(XX + .5);
      YP = floor(YY + .5);
      if(O[YP]<0) {                                 // 100  IF O%(YP) < 0 THEN O%(YP) = XP:U%(YP) = XP: GOTO 140
        O[YP] = XP;
        U[YP] = XP;
      }
      else {
        if(XP > O[YP])                              // 110  IF XP > O%(YP) THEN O%(YP) = XP: GOTO 140
          O[YP] = XP;
        else                                        // 120  IF XP < U%(YP) THEN U%(YP) = XP: GOTO 140
          if(XP < U[YP])
            U[YP] = XP;
        continue;                                   // 130  GOTO 150
      }
      HPLOT(YP,XP);                                 // 140  HPLOT YP,XP
    }                                               // 150  NEXT : RETURN
  }
}

/* Compute projected values */
void GOSUB200()
{
  Z=0;                                              // 200 Z = 0:R = X * X + Y * Y: IF R < 4 THEN Z =  -  SQR (4 - R)
  R = X * X + Y * Y;
  if(R < 4)
    Z = -sqrt(4 - R);
  XX = X*P4 + Y*P5 - Z*P3;                          // 300 XX = X * P4 + Y * P5 - Z * P3
  YY = Y*P1 - X*P2;                                 // 310 YY = Y * P1 - X * P2
}                                                   // 320  RETURN



void GOTO470()
{
    foreach(i; O) O[i] = -1;                        // 470  FOR I = 0 TO BR - 1:O%(I) =  - 1: NEXT
    writeln("\n");                                  // 480  PRINT : PRINT
    INPUT("NOMBRE DE MERIDIENS:", NL);              // 490  INPUT "NOMBRE DE MERIDIENS:";NL
    PX = new int[][](NL, NL);                       // 500  DIM PX%(NL,NL),PY%(NL,NL),X((NL + 1) ^ 2 - 1),Y((NL + 1) ^ 2 - 1)
    PY = new int[][](NL, NL);
    X = new float[](NL+1);
    Y = new float[](NL+1);
    do {
        INPUT("\nDEBUT D'INTERVALLE SUR X:", X0);   // 510  PRINT : INPUT "DEBUT D'INTERVALLE SUR X:";X0
        INPUT("FIN D'INTERVALLE SUR X:", X1);       // 520  INPUT "FIN D'INTERVALLE SUR X:";X1
        writeln;                                    // 530  PRINT
    } while(X1 <= X0);                              // 540  IF X1 <  = X0 THEN 510
    do {
        INPUT("DEBUT D'INTERVALLE SUR Y:", Y0);     // 550  INPUT "DEBUT D'INTERVALLE SUR Y:";Y0
        INPUT("FIN D'INTERVALLE SUR Y:", Y1);       // 560  INPUT "FIN D'INTERVALLE SUR Y:";Y1
        writeln;                                    // 570  PRINT
    } while(Y1 <= Y0);                              // 580  IF Y1 <  = Y0 THEN 550
    do {
        writeln("ANGLE DE VISION DU COTE");         // 590  PRINT "ANGLE DE VISION DU COTE"
        INPUT("(AZIMUTE 0-80)", AZ);                // 600  INPUT "(AZIMUTE 0-80)";AZ
        writeln;                                    // 610  PRINT
    } while(AZ < 0 && AZ > 80);                     // 620  IF AZ < 0 OR AZ > 80 THEN 590
    do {
        INPUT("INCLINAISON, HAUTEUR (0-90)", PH);   // 630  INPUT "INCLINAISON, HAUTEUR (0-90)";PH
        writeln;                                    // 640  PRINT
    } while(PH < 0 && PH > 90);                     // 650  IF PH < 0 OR PH > 90 THEN 630
        writeln;                                    // 660  PRINT
}

void GOTO670()
{
  P1 = cos(AZ * PI / 180.0);
  P2 = sin(AZ * PI / 180.0);                     // 670 P1 =  COS (AZ * PI / 180):P2 =  SIN (AZ * PI / 180)
  P3 = cos(PH * PI / 180.0);                     // 680 P3 =  COS (PH * PI / 180)
  P4 = P1 * sin(PH * PI / 180.0);                // 690 P4 = P1 *  SIN (PH * PI / 180)
  P5 = P2 * sin(PH * PI / 180.0);                // 700 P5 = P2 *  SIN (PH * PI / 180)
  writeln("JE CHERCHE MAXIMUM ET MINIMUM.\n\n"); // 710  PRINT "JE CHERCHE MAXIMUM ET MINIMUM."
                                                 // 720  PRINT
  XS = (X1 - X0) / NL;                           // 730 XS = (X1 - X0) / NL:YS = (Y1 - Y0) / NL
  YS = (Y1 - Y0) / NL;
  X = X0;
  Y = Y0;
  GOSUB200;
  Z0 = Z;                                        // 740 X = X0:Y = Y0: GOSUB 200:Z0 = Z:Z1 = Z:XA = XX:XB = XX:YA = YY:YB = YY:PT = 0
  Z1 = Z;
  XA = XX;
  XB = XX;
  YA = YY;
  YB = YY;
  PT = 0;                                         // 750 X = X0 - XS: FOR NX = 0 TO NL:X = X + XS:Y = Y0 - YS: FOR NY = 0 TO NL:Y = Y + YS: GOSUB 200:X(PT) = XX:Y(PT) = YY: POKE 1024,NX: POKE 1025,NY
  X = X0 - XS;
  for(NX=0; NX<=NL; NX++) {
    X = X + XS;
    Y = Y0 - YS;
    for(NY=0; NY<=NL; NY++) {
      Y = Y + YS;
      GOSUB200;
      X[PT] = XX;
      Y[PT] = YY;
      POKE(1024, NX);
      POKE(1025, NY);
      if(Z > Z1)                                  // 760  IF Z > Z1 THEN Z1 = Z: GOTO 780
        Z1 = Z;
      else
        if(Z < Z0)                                // 770  IF Z < Z0 THEN Z0 = Z
          Z0 = Z;
      if(XA > XX)                                 // 780  IF XA > XX THEN XA = XX: GOTO 800
        XA = XX;
      else
        if(XX > XB)                               // 790  IF XX > XB THEN XB = XX
          XB = XX;
      if(YA > YY)                                 // 800  IF YA > YY THEN YA = YY: GOTO 820
        YA = YY;
      else
        if(YY > YB)                               // 810  IF YY > YB THEN YB = YY
          YB = YY;
      PT = PT + 1;                                // 820 PT = PT + 1: NEXT : NEXT
    }
  }
  writeln("MINIMUM Z ", Z0);                     // 830  PRINT "MINIMUM Z ";Z0
  writeln("MAXIMUM Z ", Z1);                     // 840  PRINT "MAXIMUM Z ";Z1
}

void GOTO850()
{
  writeln("\nJE CALCULE UN CHAMP DE DONNEES");          // 850  PRINT
                                                        // 860  PRINT "JE CALCULE UN CHAMP DE DONNEES"
  writeln("NORMEES.\n\n");                              // 870  PRINT "NORMEES."
                                                        // 880  PRINT : PRINT
  XD = (XB - XA) / (HH-1);                              // 890 XD = (XB - XA) / (HH - 1):YD = (YB - YA) / (BR - 1):PT = 0
  YD = (YB - YA) / (BR-1);
  PT = 0;
  for(NX=0; NX<=NL; NX++)                               // 900  FOR NX = 0 TO NL: FOR NY = 0 TO NL
    for(NY=0; NY<=NL; NY++) {
      PX[NX][NY] = (X[PT] - XA) / XD + .5;              // 910 PX%(NX,NY) = (X(PT) - XA) / XD + .5:PY%(NX,NY) = (Y(PT) - YA) / YD + .5: POKE 1024,NX: POKE 1025,NY:PT = PT + 1: NEXT : NEXT
      PY[NX][NY] = (Y[PT] - YA) / YD + .5
      POKE(1024, NX);
      POKE(1025, NY);
      PT = PT + 1
    }
  }
}

void GOTO920()
{
  HGR2;                                                 // 920  HGR2
  for(NY = NL - 1; NY >= 0; NY--) {                     // 930  FOR NY = NL - 1 TO 0 STEP  - 1:XA = PX%(NL,NY + 1):YA = PY%(NL,NY + 1)
    XA = PX[NL][NY + 1];
    YA = PY[NL][NY + 1];
    XB = PX[NL][NY];                                    // 940 XB = PX%(NL,NY):YB = PY%(NL,NY): GOSUB 20: NEXT
    YB = PY[NL][NY];
    GOSUB20;
  }
  for(NX = NL - 1; NX >= 0; NX--) {                     // 950  FOR NX = NL - 1 TO 0 STEP  - 1:XA = PX%(NX + 1,NL):YA = PY%(NX + 1,NL)
    XA = PX[NX + 1][NL];
    YA = PY[NX + 1][NL];
    XB = PX[NX][NL];                                    // 960 XB = PX%(NX,NL):YB = PY%(NX,NL): GOSUB 20: FOR NY = NL - 1 TO 0 STEP  - 1
    YB = PY[NX][NL];
    GOSUB20;
    for(NY = NL - 1; NY >= 0; NY--) {
      XA = PX[NX + 1][NY];                              // 970 XA = PX%(NX + 1,NY):YA = PY%(NX + 1,NY):XB = PX%(NX,NY):YB = PY%(NX,NY)
      YA = PY[NX + 1][NY];
      XB = PX[NX][NY];
      YB = PY[NX][NY];
      XD = XB - XA;                                     // 980 XD = XB - XA:YD = YB - YA:S =  SQR ((XD * XD + YD * YD) / 2): IF S = 0 THEN 1000
      YD = YB - YA;
      S = sqrt((XD * XD + YD * YD) / 2.0);
      if(S==0) {
        XA = PX[NX][NY + 1];                            // 1000 XA = PX%(NX,NY + 1):YA = PY%(NX,NY + 1):XB = PX%(NX,NY):YB = PY%(NX,NY): GOSUB 20
        YA = PY[NX][NY + 1];
        XB = PX[NX][NY];
        YB = PY[NX][NY];
        GOSUB20;
      }
      else {
                                                        // 990 XB =  INT (XB - XD / S + .5):YB =  INT (YB - YD / S + .5): GOSUB 20
        GOSUB20;
      }
    }                                                   // 1010  NEXT : NEXT
  }
}


/* Read a response from the keyboard */
void GOSUB2000()                    // 2000 REM
{
    do {                            // 2010  GET A$: IF A$ <  > "O" AND A$ <  > "N" THEN 2010
        A = stdin.read();
    } while(A != 'O' && A != 'N');
    if(A == 'O') {                  // 2020  IF A$ = "O" THEN  PRINT "OUI": RETURN
        writeln("OUI");
        return;
    }
    writeln("NON");                 // 2030  PRINT "NON": RETURN
}

/******************************************************************************/
/**
 *  Application entry point.
 *
 * @param args command line arguments.
 * @return program exit code
 */
/******************************************************************************/
int main(string[] args)
{
    HCOLOR= 3;                                          // 330  HCOLOR= 3: TEXT : CLEAR :YP = 0:XP = 0:XX = 0:YY = 0:XD = 0:YD = 0:S = 0:NX = 0:NY = 0:Y = 0:X = 0:PI = 3.1415925
    TEXT;
    CLEAR;
    HOME;
    writeln("FONCTIONS DE L'ESPACE\n\n");               // 380  HOME : PRINT  TAB( 12);"FONCTIONS DE L'ESPACE"
    writeln("LE PROGRAMME NECESSITE UNE FONCTION");     // 390  PRINT : PRINT : PRINT "LE PROGRAMME NECESSITE UNE FONCTION"
    writeln("DE LA FORME Z=F(X,Y).");                   // 400  PRINT "DE LA FORME";: INVERSE : PRINT " 200 Z=F(X,Y) ";: NORMAL : PRINT "."
    writeln("UNE REPRESENTATION TRIDIMENSIONNELLE");    // 410  PRINT "UNE REPRESENTATION TRIDIMENSIONNELLE"
    writeln("EN SERA ETABLIE A L'ECRAN.\n\n");          // 420  PRINT "EN SERA ETABLIE A L'ECRAN."
    writeln("LA FONCTION EST-ELLE DEJA DEFINIE ";       // 440  PRINT : PRINT "LA FONCTION EST-ELLE DEJA DEFINIE ";: GOSUB 2000
    GOSUB2000();
    if(A == 'O') {                                       // 150  IF A$ = "O" THEN 470
      GOTO470;
      GOTO670;
      GOTO850;
    }
    return 0;                                           // 460  END
}
