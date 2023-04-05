// A.Khan Added main 16/03
// CK Added Flights Framework 16/03
// A.Khan Merged Main and Flight Framework 19/03
// CK updated multiple screens for graph implementation 20/03
// CK improved Framework to planned architecture 22/03
// J.Nash added Map 30/03
// A.Khan Linked Queries to the Barchart and moved loadData and printData to Flight class 31/03

PFont ttlFont;
PFont stdFont;
PFont inpFont;
PImage logo;
PImage map;
PImage lineG, barC, usMap, pieC, tableL;

Airport LAX, JFK, DCA, FLL, SEA, HNL, ORD, DAL, MCI, HOU,
ABQ, ADQ, ALB, ANC, ATL, ATW, AUS, AZA, BDL, BET, BHM,
BIL, BIS, BLI, BLV, BNA, BOI, BOS, BRW, BUF, BUR, BWI, BZN,
CDV, CHS, CID, CLE, CLT, CMH, CRP, CVG, DEN, DFW, DTW, ELP, EUG,
EWR, FAI, FAR, FAT, GEG, GTF, GJT, GSP, HPN, IAH, IDA, IND, ITO, JAN,
JAX, JNU, KOA, KTN, LAS, LGA, LGB, LIH, MAF, MCO, MDW, MEM, MFE, MFR,
MIA, MKE, MOT, MSO, MSP, MSY, MYR, OAK, OGG, OKC, ONT, PBI, PDX, PHL,
PHX, PIA, PIT, PSG, PSP, RAP, RDU, RFD, RNO, RSW, SAN, SAT, SAV, SCC, SCK,
SDF, SFO, SGF, SIT, SJC, SJU, SLC, SMF, SMX, SNA, SRQ, STL, TPA, TUL, VPS,
WRG, XNA, YAK;

Airport ABE, ABI, ABR, ABY, ACT, ACV, ACY, ADK, AEX, AGS, AKN, ALO, 
ALS, ALW, AMA, APN, ART, ASE, AVL, AVP, AZO, BFF, BFL, BGM, BGR, BIH,
BJI, BMI, BPT, BQK, BQN, BRD, BRO, BTM, BTR, BTV, CAE, CAK, CDC, CGI,
CHA, CHO, CIU, CKB, CLL, CMI, CMX, CNY, COD, COS, COU, CPR, CRW, CSG,
CWA, CYS, DAB, DAY, DBQ, DDC, DEC, DHN, DIK, DLG, DLH, DRO, DRT, DSM,
DVL, EAR, EAT, EAU, ECP, EGE, EKO, ELM, ERI, ESC, EUC, EVV, EWN, EYW,
FAY, FCA, FLG, FLO, FNT, FOD, FSD, FSM, FWA, GCC, GCK, GFK, GGG, GNV,
GPT, GRB, GRI, GRK, GRR, GSO, GTR, GUC, GUM, HDN, HGR, HHH, HIB, HLN,
HOB, HRL, HSV, HTS, HYS, IAD, IAG, ICT, ILG, ILM, IMT, INL, ISP, ITH,
JAC, JLN, JMS, JST, LAN, LAR, LAW, LBB,
LBE, LBF, LBL, LCH, LCK, LEX, LFT,
LIT, LNK, LRD, LSE, LWB, LWS, LYH, MBS, MCW, MDT, MEI,
MGM, MHK, MHT, MKG, MLB, MLI, MLU, MOB, MQT, MRY, MSN,
MTJ, OAJ, OGD, OGS, OMA, OME, ORF, ORH, OTH, OTZ, OWB, PAE, PAH,
PGB, PGD, PGV, PHF, PIB, PIE, PIH, PIR, PLN, PNS, PPG, PQI,
PRC, PSC, PSE, PSM, PUB, PUW, PVD, PVU, PWM, RDD, RDM, RHI, RIC,
RIW, RKS, ROA, ROC, ROW, RST, SAF, SBA, SBN, SBP, SBY, SCE,
SFB, SGU, SHD, SHR, SHV, SJT, SLN,
SPI, SPS, STC, STS, STT, STX, SUN, SUX, SWF, SWO, SYR, TBN, TLH, TOL, TRI, TTN,
TUS, TVC, TWF, TXK, TYR, TYS, USA, VCT, VEL, VLD, XWA, YKM, YUM;

ArrayList<Airport> airports;

Widget widget0, widget1, widget2, widget3, widget4, widget5, widget6, widget7, widget8;
Screen screen1, screen2, screen3, screen4, screen5, screen6, screen7, screen8, screen9;
int currentScreen;

Table table;
ArrayList<Flight> flights;


PieChart pie;
Barchart barChart;
Linegraph lineGraph;
float[] data;

String inputText = "", startDate = "", endDate = "", depAP = "", arrAP = "", maxDis = "", minDis = "";
Boolean cancellations = false, diversions = false;
int boxXpos = 350, boxYpos = 660;
color screenColour = color(51, 102, 153); // Dark blue
color boxColour = color(65, 105, 225); // Light blue

void settings()
{
  size(SCREENX, SCREENY);
}

void setup()
{
  // Load Font
  ttlFont = loadFont("MicrosoftYaHeiUI-Bold-48.vlw");
  stdFont = loadFont("ComicSansMS-30.vlw");
  inpFont = loadFont("Arial-BoldMT-24.vlw");
  logo = loadImage("BTS.png");
  lineG = loadImage("lineGraph.png");
  barC = loadImage("barChart.png");
  usMap = loadImage("gunsandfreedom.png");
  pieC = loadImage("pi.png");
  tableL = loadImage("table.png");
  
  airports = new ArrayList<Airport>();
  map = loadImage("usa_map.jpg");
  map.resize(800, 0);
  
  // Create Widgets
  widget0 = new Widget(WIDGET1Y/2, WIDGET1Y+75, 180, 40, "Start", color(242, 17, 17), stdFont, EVENT_BUTTON0);
  widget1 = new Widget(187, 100, 200, 200, "Bar Chart", color(242, 17, 17), stdFont, EVENT_BUTTON1);
  widget2 = new Widget(413, 100, 200, 200, "Line Graph", color(240, 155, 19), stdFont, EVENT_BUTTON2); 
  widget3 = new Widget(187, 326, 200, 200, "Map", color(235, 219, 5), stdFont, EVENT_BUTTON3); 
  widget4 = new Widget(413, 326, 200, 200, "Pie Chart", color(0, 153, 0), stdFont, EVENT_BUTTON4);
  widget5 = new Widget(WIDGET1Y/2, 552, 200, 200, "Table", color(19, 63, 240), stdFont, EVENT_BUTTON5);
  //widget6 = new Widget(WIDGET1Y/2, 700, 180, 40, "Placeholder", color(174, 33, 209), stdFont, EVENT_BUTTON6);
  widget7 = new Widget(10, 750, 180, 40, "Back", color(255, 0, 0), stdFont, EVENT_BUTTON7);
  widget8 = new Widget(600, 750, 180, 40, "Next", color(0, 255, 0), stdFont, EVENT_BUTTON8);
  
  // Create Screens
  screen1 = new Screen(screenColour);
  screen2 = new Screen(screenColour);
  screen3 = new Screen(screenColour);
  screen4 = new Screen(color(242, 17, 17));
  screen5 = new Screen(color(240, 155, 19));
  screen6 = new Screen(255);
  //screen6 = new Screen(color(235, 219, 5));
  screen7 = new Screen(color(0, 153, 0));
  screen8 = new Screen(color(19, 63, 240));
  screen9 = new Screen(color(174, 33, 209));
  
  // Add Widgets
  screen1.addWidget(widget0);
  screen2.addWidget(widget8);
  screen3.addWidget(widget1);
  screen3.addWidget(widget2);
  screen3.addWidget(widget3);
  screen3.addWidget(widget4);
  screen3.addWidget(widget5);
  //screen3.addWidget(widget6);
  screen3.addWidget(widget7);
  
  screen4.addWidget(widget7);
  screen5.addWidget(widget7);
  screen6.addWidget(widget7);
  screen7.addWidget(widget7);
  screen8.addWidget(widget7);
  screen9.addWidget(widget7);
  
  // Current Screen
  currentScreen = 1;
  
  // Load Data from file
  table = loadTable("flights2k.csv", "header");
  flights = new ArrayList();
  loadData();
  printData(flights);
  
  // Airports
  JFK = new Airport(712, 186, 5, "JFK", "NY"); LAX = new Airport(72, 309, 10, "LAX", "CA");
  DCA = new Airport(673, 235, 5, "DCA", "VA"); FLL = new Airport(667, 482, 5, "FLL", "FL");
  SEA = new Airport(86, 47, 5, "SEA", "WA"); HNL = new Airport(261, 466, 5, "HNL", "HI");
  ORD = new Airport(520, 192, 5, "ORD", "IL"); DAL = new Airport(406, 378, 10, "DAL", "TX");
  MCI = new Airport(428, 248, 5, "MCI", "MO"); HOU = new Airport(395, 449, 5, "HOU", "TX");
  
  ABQ = new Airport(251, 312, 5, "ABQ", "NM"); ADQ = new Airport(116, 495, 5, "ADQ", "AK");
  ALB = new Airport(705, 151, 5, "ALB", "NM"); ANC = new Airport(128, 476, 5, "ANC", "AK");
  ATL = new Airport(582, 345, 5, "ATL", "GA"); ATW = new Airport(509, 145, 5, "ATW", "KS");
  AUS = new Airport(395, 413, 5, "AUS", "TX"); AZA = new Airport(173, 351, 5, "AZA", "AZ");
  BDL = new Airport(724, 168, 5, "BDL", "CT"); BET = new Airport(96, 477, 5, "BET", "MO");
  BHM = new Airport(547, 354, 5, "BHM", "AL"); BIL = new Airport(241, 108, 5, "BIL", "MT");
  BIS = new Airport(129, 275, 5, "BIS", "ND"); BLI = new Airport(91, 28, 5, "BLI", "WA");
  BLV = new Airport(496, 262, 5, "BLV", 10); BNA = new Airport(551, 312, 5, "BNA", "TN");
  BOI = new Airport(143, 139, 5, "BOI", "ID"); BOS = new Airport(741, 151, 5, "BOS", "MA");
  BRW = new Airport(113, 415, 5, "BRW", "KY"); BUF = new Airport(639, 162, 5, "BUF", "NY");
  BUR = new Airport(72, 299, 5, "BUR", 10); BWI = new Airport(679, 227, 5, "BWI", 10);
  BZN = new Airport(216, 111, 5, "BZN", 10); CDV = new Airport(143, 476, 5, "CDV", 10);
  CHS = new Airport(647, 355, 5, "CHS", 10); CID = new Airport(466, 196, 5, "CID", 10);
  CLE = new Airport(601, 192, 5, "CLE", 10); CLT = new Airport(641, 310, 5, "CLT", 10);
  CMH = new Airport(592, 228, 5, "CMH", 10); CRP = new Airport(381, 469, 5, "CRP", 10);
  CVG = new Airport(574, 244, 5, "CVG", 10); DEN = new Airport(286, 232, 5, "DEN", 10);
  DFW = new Airport(399, 378, 5, "DFW", 10); DTW = new Airport(580, 181, 5, "DTW", 10);
  ELP = new Airport(247, 381, 5, "ELP", 10); EUG = new Airport(64, 110, 5, "EUG", "OR");
  EWR = new Airport(707, 187, 5, "EWR", 10); FAI = new Airport(126, 449, 5, "FAI", 10);
  FAR = new Airport(399, 102, 5, "FAR", 10); FAT = new Airport(72, 263, 5, "FAT", 10);
  GEG = new Airport(139, 68, 5, "GEG", 10); GJT = new Airport(236, 242, 5, "GJT", 10);
  GSP = new Airport(625, 324, 5, "GSP", 10); GTF = new Airport(223, 88, 5, "GTF", 10);
  IAH = new Airport(394, 446, 5, "IAH", 10); IDA = new Airport(200, 153, 5, "IDA", 10);
  IND = new Airport(544, 239, 5, "IND", 10); ITO = new Airport(319, 506, 5, "ITO", 10);
  JAN = new Airport(499, 375, 5, "JAN", 10); JAX = new Airport(635, 412, 5, "JAX", 10);
  JNU = new Airport(179, 498, 5, "JNU", 10); KOA = new Airport(301, 508, 5, "KOA", 10);
  KTN = new Airport(184, 497, 5, "KTN", 10); LAS = new Airport(129, 269, 5, "LAS", 10);
  LGA = new Airport(715, 187, 5, "LGA", 10); LGB = new Airport(75, 315, 5, "LBG", 10);
  LIH = new Airport(234, 452, 5, "LIH", 10); MAF = new Airport(312, 387, 5, "MAF", 10);
  MCO = new Airport(649, 460, 5, "MCO", 10); MDW = new Airport(517, 191, 5, "MDW", 10);
  MEM = new Airport(497, 322, 5, "MEM", 10); MFE = new Airport(371, 496, 5, "MFE", 10);
  MFR = new Airport(57, 139, 5, "MFR", 10); MIA = new Airport(662, 497, 5, "MIA", 10);
  MKE = new Airport(515, 169, 5, "MKE", 10); MOT = new Airport(340, 77, 5, "MOT", 10);
  MSO = new Airport(203, 85, 5, "MSO", 10); MSP = new Airport(445, 146, 5, "MSP", 10);
  MSY = new Airport(488, 436, 5, "MSY", 10); MYR = new Airport(660, 340, 5, "MYR", 10);
  OAK = new Airport(48, 224, 5, "OAK", 10); OGG = new Airport(294, 480, 5, "OGG", 10);
  ONT = new Airport(91, 302, 5, "ONT", 10); PBI = new Airport(661, 464, 5, "PBI", 10);
  PDX = new Airport(73, 83, 5, "PDX", 10); PHL = new Airport(695, 205, 5, "PHL", 10);
  PHX = new Airport(174, 349, 5, "PHX", 10); PIA = new Airport(501, 217, 5, "PIA", 10);
  PIT = new Airport(625, 211, 5, "PIT", 10); PSG = new Airport(179, 487, 5, "PSG", 10);
  PSP = new Airport(103, 313, 5, "PSP", 10); RAP = new Airport(313, 154, 5, "RAP", 10);
  RDU = new Airport(666, 298, 5, "RDU", 10); RFD = new Airport(506, 188, 5, "RFD", 10);
  RNO = new Airport(80, 202, 5, "RNO", 10); RSW = new Airport(639, 479, 5, "RSW", 10);
  SAN = new Airport(86, 334, 5, "SAN", 10); SAT = new Airport(366, 464, 5, "SAT", 10);
  SAV = new Airport(631, 369, 5, "SAV", 10); SCC = new Airport(128, 417, 5, "SCC", 10);
  SCK = new Airport(61, 271, 5, "SCK", 10); SDF = new Airport(559, 259, 5, "SDF", 10);
  SFO = new Airport(34, 222, 5, "SFO", 10); SGF = new Airport(439, 282, 5, "SGF", 10);
  SIT = new Airport(166, 485, 5, "SIT", 10); SJC = new Airport(35, 237, 5, "SJC", 10);
  SLC = new Airport(196, 206, 5, "SLC", 10); SMF = new Airport(52, 216, 5, "SMF", 10);
  SMX = new Airport(60, 296, 5, "SMX", 10); SNA = new Airport(82, 310, 5, "SNA", 10);
  SRQ = new Airport(628, 469, 5, "SRQ", 10); STL = new Airport(488, 258, 5, "STL", 10);
  TPA = new Airport(626, 463, 5, "TPA", 10); TUL = new Airport(420, 304, 5, "TUL", 10);
  VPS = new Airport(557, 408, 5, "VPS", 10); WRG = new Airport(166, 480, 5, "WRG", 10);
  XNA = new Airport(441, 308, 5, "XNA", 10); YAK = new Airport(163, 482, 5, "YAK", 10);
  ABE = new Airport(688, 195, 5, "ABE", 10); ABI = new Airport(358, 394, 5, "ABI", 10);
  ABR = new Airport(385, 129, 5, "ABR", 10); ABY = new Airport(588, 382, 5, "ABY", 10);
  ACT = new Airport(365, 392, 5, "ACT", 10); ACV = new Airport(29, 162, 5, "ACV", "CA");
  ACY = new Airport(207, 211, 5 "ACY", "NJ"); ADK = new Airport(80, 505, 5, "ADK", "AK");
  AEX = new Airport(427, 412, 5, "AEX", "LA"); AGS = new Airport(617, 347, 5, "AGS", "GA");
  AKN = new Airport(
  
  
//  , , , AKN, ALO, 
//ALS, ALW, AMA, APN, ART, ASE, AVL, AVP, AZO, BFF, BFL, BGM, BGR, BIH,
//BJI, BMI, BPT, BQK, BQN, BRD, BRO, BTM, BTR, BTV, CAE, CAK, CDC, CGI,
//CHA, CHO, CIU, CKB, CLL, CMI, CMX, CNY, COD, COS, COU, CPR, CRW, CSG,
//CWA, CYS, DAB, DAY, DBQ, DDC, DEC, DHN, DIK, DLG, DLH, DRO, DRT, DSM,
//DVL, EAR, EAT, EAU, ECP, EGE, EKO, ELM, ERI, ESC, EUC, EVV, EWN, EYW,
//FAY, FCA, FLG, FLO, FNT, FOD, FSD, FSM, FWA, GCC, GCK, GFK, GGG, GNV,
//GPT, GRB, GRI, GRK, GRR, GSO, GTR, GUC, GUM, HDN, HGR, HHH, HIB, HLN,
//HOB, HRL, HSV, HTS, HYS, IAD, IAG, ICT, ILG, ILM, IMT, INL, ISP, ITH,
//JAC, JLN, JMS, JST, LAN, LAR, LAW, LBB,
//LBE, LBF, LBL, LCH, LCK, LEX, LFT,
//LIT, LNK, LRD, LSE, LWB, LWS, LYH, MBS, MCW, MDT, MEI,
//MGM, MHK, MHT, MKG, MLB, MLI, MLU, MOB, MQT, MRY, MSN,
//MTJ, OAJ, OGD, OGS, OMA, OME, ORF, ORH, OTH, OTZ, OWB, PAE, PAH,
//PGB, PGD, PGV, PHF, PIB, PIE, PIH, PIR, PLN, PNS, PPG, PQI,
//PRC, PSC, PSE, PSM, PUB, PUW, PVD, PVU, PWM, RDD, RDM, RHI, RIC,
//RIW, RKS, ROA, ROC, ROW, RST, SAF, SBA, SBN, SBP, SBY, SCE,
//SFB, SGU, SHD, SHR, SHV, SJT, SLN,
//SPI, SPS, STC, STS, STT, STX, SUN, SUX, SWF, SWO, SYR, TBN, TLH, TOL, TRI, TTN,
//TUS, TVC, TWF, TXK, TYR, TYS, USA, VCT, VEL, VLD, XWA, YKM, YUM;

  
  airports.add(JFK); airports.add(LAX); airports.add(DCA); airports.add(FLL); airports.add(SEA); airports.add(HNL);
  airports.add(ORD); airports.add(DAL); airports.add(MCI); airports.add(ABQ); airports.add(ADQ); airports.add(ALB);
  airports.add(ANC); airports.add(ATL); airports.add(ATW); airports.add(AUS); airports.add(AZA); airports.add(BDL);
  airports.add(BET); airports.add(BHM); airports.add(BIL); airports.add(BIS); airports.add(BLI); airports.add(BLV);
  airports.add(BNA); airports.add(BOI); airports.add(BOS); airports.add(BRW); airports.add(BUF); airports.add(BUR);
  airports.add(BWI); airports.add(BZN); airports.add(CDV); airports.add(CHS); airports.add(CID); airports.add(CLE);
  airports.add(CLT); airports.add(CMH); airports.add(CRP); airports.add(CVG); airports.add(DEN); airports.add(DFW);
  airports.add(DTW); airports.add(ELP); airports.add(EUG); airports.add(EWR); airports.add(FAI); airports.add(FAR);
  airports.add(FAT); airports.add(GEG); airports.add(GJT); airports.add(GTF); airports.add(HOU); airports.add(IAH);
  airports.add(IDA); airports.add(IND); airports.add(ITO); airports.add(JAN); airports.add(JAX); airports.add(JNU);
  airports.add(KOA); airports.add(KTN); airports.add(LAS); airports.add(LGA); airports.add(LGB); airports.add(LIH);
  airports.add(MAF); airports.add(MCO); airports.add(MDW); airports.add(MEM); airports.add(MFE); airports.add(MFR);
  airports.add(MIA); airports.add(MKE); airports.add(MSO); airports.add(MSP); airports.add(MSY); airports.add(MYR);
  airports.add(OAK); airports.add(OGG); airports.add(ONT); airports.add(PBI); airports.add(PDX); airports.add(PHL);
  airports.add(PHX); airports.add(PIA); airports.add(PIT); airports.add(PSG); airports.add(PSP); airports.add(RAP);
<<<<<<< HEAD

=======
>>>>>>> 1f13f4776f1adbd3f88f79dea2c9bdb67d8b644a
  airports.add(RDU); airports.add(RFD); airports.add(RNO); airports.add(RSW); airports.add(SAN); airports.add(SAT);
  airports.add(SAV); airports.add(SCC); airports.add(SCK); airports.add(SDF); airports.add(SFO); airports.add(SIT);
  airports.add(SJC); airports.add(SLC); airports.add(SMF); airports.add(SMX); airports.add(SNA); airports.add(SRQ);
  airports.add(STL); airports.add(TPA); airports.add(TUL); airports.add(VPS); airports.add(WRG); airports.add(XNA);
<<<<<<< HEAD
  airports.add(YAK); airports.add(ABE); airports.add(ABI); airports.add(ABR); airports.add(ABY); airports.add(ACT);
  airports.add(ACV); airports.add(AYC); airports.add(ADK); airports.add(AEX); airports.add(AGS);
=======
  airports.add(YAK);

>>>>>>> 1f13f4776f1adbd3f88f79dea2c9bdb67d8b644a
  
  
  //Pie Chart
  
   int[] angles = { 30, 10, 45, 35, 60, 38, 75, 67 }; //Temp
   pie = new PieChart(300,angles);
<<<<<<< HEAD

=======
>>>>>>> 1f13f4776f1adbd3f88f79dea2c9bdb67d8b644a
}

void draw(){
  //background(100, 100, 100);
  
  if (currentScreen == 1)
  {
    screen1.draw();
    textFont(ttlFont);
    text("Flight Data Visualiser", SCREENX/2, 100);
    textAlign(CENTER);
    image(logo, 60, 150);
    textFont(stdFont);
    text("Press Start to continue:", SCREENX/2, WIDGET1Y + 50);
  }
  else if (currentScreen == 2)
  {
    screen2.draw(); 
    textAlign(CENTER);
    textFont(ttlFont);
    text("Data Parameters", SCREENX/2, 75);
    textFont(stdFont);
    text("Date Range:", 100, 150);
    text("Departure:", 100, 300);
    text("Arrival:", 100, 400);
    text("Distance", 100, 500);
    text("Include?", 100, 650);
    textFont(inpFont);
    text("Start", 300, 200);
    text("End", 300, 250);
    text("Max", 300, 550);
    text("Min", 300, 600);
    text("Cancellations", 250, 700);
    text("Diversions",250, 750);
    
    //Text Boxes
    
    //Start Date
    fill(boxColour);
    rect(350, 170, 200, 40);
    fill(0);
    text(startDate, 450, 200);
    
    //End Date
    fill(boxColour);
    rect(350, 225, 200, 40);
    fill(0);
    text(endDate, 450, 255);
    
    //Departure Airport Code
    fill(boxColour);
    rect(350, 295, 200, 40);
    fill(0);
    text(depAP, 450, 325);
    
    //Arrival Airport Code
    fill(boxColour);
    rect(350, 395, 200, 40);
    fill(0);
    text(arrAP, 450, 425);
    
    //Max Distance
    fill(boxColour);
    rect(350, 520, 200, 40);
    fill(0);
    text(maxDis, 450, 550);
    
    //Min Distance
    fill(boxColour);
    rect(350, 575, 200, 40);
    fill(0);
    text(minDis, 450, 600);
      
     // Checkbox
     
    fill(boxColour);
    rect(boxXpos, boxYpos, 50, 50);
  
    if (cancellations) {
      fill(0);
      //textFont(inpFont);
      textSize(40);
      text("X", boxXpos+25, boxYpos+40);
    }
    
    fill(boxColour);
    rect(boxXpos, boxYpos+60, 50, 50);
  
    if (diversions) {
      fill(0);
      //textFont(inpFont);
      textSize(40);
      text("X", boxXpos+25, boxYpos+100);
    }
  }
  else if (currentScreen == 3)
  {
    screen3.draw();
    textAlign(CENTER);
    textFont(stdFont);
    text("Select how you wish to visualise your data:", SCREENX/2, 75);
    ArrayList<Flight> newFlights = flights;
        //Button Images
    image(barC, 210, 110, 150, 150);
    image(lineG, 437,110, 150, 150);
    image(usMap, 205, 355, 170,106);
    image(pieC, 443, 337, 140, 140);
    image(tableL, 320, 552, 166, 164);

    if (startDate != "" && endDate != "")
    {
      newFlights = dateRange(newFlights, startDate, endDate);
    }
    
    if (depAP != "")
    {
      newFlights = departure(newFlights, depAP);
    }
    
    if (arrAP != "")
    {
      newFlights = arrival(newFlights, arrAP);
    }
    
    if (minDis != "" && maxDis != "")
    {
      int min = Integer.parseInt(minDis);
      int max = Integer.parseInt(maxDis);
      newFlights = distanceRange(newFlights, min, max);
    }
    
    if (cancellations)
    {
      newFlights = filterCancelled(newFlights);
    }
    
    if (diversions)
    {
      newFlights = filterDiverted(newFlights);
    }
    
    data = countFlightDates(newFlights, startDate, endDate);
    
    barChart = new Barchart(data, 100, 675, 600, 600);
    barChart.setTitle("Number of Flights in a day");
    barChart.barLabels(getDates(startDate, endDate));
    
    lineGraph = new Linegraph(data, 100, 675, 600, 600);
    lineGraph.setTitle("Number of Flights in a day");
    lineGraph.setXAxisLabel("Dates");
    lineGraph.setYAxisLabel("Flights");
  }
  else if (currentScreen == 4)
  {
    screen4.draw();
    barChart.draw();
  }
  else if (currentScreen == 5)
  {
    screen5.draw();
    lineGraph.draw();
  }
  else if (currentScreen == 6)
  {
    screen6.draw();
    textAlign(CENTER);
    textFont(ttlFont);
    //background(255);
<<<<<<< HEAD

    //image(map, 0, 0);
=======
>>>>>>> 1f13f4776f1adbd3f88f79dea2c9bdb67d8b644a
    int flightCount = 0;
    int stateCount = 0;
    String stateAbr = "";

    image(map, 0, 100);
     for (Airport airport : airports) {
       if (depAP.equals("")){
         text("Flight Information", SCREENX/2, 75);
         airport.draw();
         for (Flight flight : flights) {
           flightCount++;
         }
       }
       else if (airport.name.equals(depAP)){
         text(depAP+" Flight Information", SCREENX/2, 75);
         airport.draw();
         for (Flight flight : flights) {
       if (flight.origin.equals(depAP)) {
         flightCount++;
         stateAbr = flight.originCityAbr;
       }
       }
        for (Flight flight : flights) {
       if (flight.originCityAbr.equals(stateAbr))
         stateCount++;
     }
<<<<<<< HEAD
     }

=======
   }
    image(map, 0, 100);
     for (Airport airport : airports) {
       if (depAP.equals("")){
         text("Flight Information", SCREENX/2, 75);
         airport.draw();
       }
       else if (airport.name.equals(depAP)){
         text(depAP+" Flight Information", SCREENX/2, 75);
         airport.draw();
       }
     }
>>>>>>> 1f13f4776f1adbd3f88f79dea2c9bdb67d8b644a
  }
    textAlign(LEFT);
    textFont(stdFont);
   text("Number of flights: " + flightCount, 30, 670);
   if (!stateAbr.equals("")) {
   text("Number of flights in " + stateAbr + " : " + stateCount, 30, 710);
   }
 }
  
  else if (currentScreen == 7)
  {
    screen7.draw();
    textAlign(CENTER);
    textFont(ttlFont);
    text("Airport Flight Percentages", SCREENX/2, 100);
    pie.draw();
  }
  else if (currentScreen == 8)
  {
    screen8.draw(); 
  }
  else if (currentScreen == 9)
  {
    screen9.draw(); 
  }
}

void mousePressed()
{
  int event;
  if (currentScreen == 1){
    event = screen1.getEvent(mouseX,mouseY);
     switch (event)
    {
      case EVENT_BUTTON0:
        currentScreen = 2;
        println("Start was pressed");
        break;
    }
   }
  else if (currentScreen == 2){
    event = screen2.getEvent(mouseX,mouseY);
     switch (event)
    {
      case EVENT_BUTTON8:
        currentScreen = 3;
        println("Next was pressed");
        break;
    }
    if (mouseX > boxXpos && mouseX < boxXpos+50 && mouseY > boxYpos && mouseY <boxYpos+50) {
      cancellations = !cancellations;
      if(cancellations){
         println("Cancellations included");
      }
      else{
        println("Cancellations excluded");
      }
    }
    else if (mouseX > boxXpos && mouseX < boxXpos+50 && mouseY > boxYpos+60 && mouseY <boxYpos+110) {
      diversions = !diversions;
      if(diversions){
         println("Diversions included");
      }
      else{
        println("Diversions excluded");
      }
    }
   }
   
   
  else if (currentScreen == 3)
  {
    event = screen3.getEvent(mouseX,mouseY);
    switch (event)
    {
      case EVENT_BUTTON1:
        currentScreen = 4;
        println("Bar Chart pressed");
        break;
      case EVENT_BUTTON2:
        currentScreen = 5;
        println("Line Graph was pressed");
        break;
      case EVENT_BUTTON3:
        currentScreen = 6;
        println("Map was pressed");
        break;
      case EVENT_BUTTON4:
        currentScreen = 7;
        println("PieChart was pressed");
        break;
      case EVENT_BUTTON5:
        currentScreen = 8;
        println("Table was pressed");
        break;
      case EVENT_BUTTON6:
        currentScreen = 9;
        println("Placeholder was pressed");
        break;
      case EVENT_BUTTON7:
        currentScreen = 2;
        println("Backward was pressed");
        break;
    }
  }
  else if (currentScreen == 4)
  {
    event = screen4.getEvent(mouseX, mouseY);
    switch (event)
    {
      case EVENT_BUTTON7:
        currentScreen = 3;
        println("Backward was pressed");
        break;
    }
  }
  else
  {
    event = screen5.getEvent(mouseX, mouseY);
    switch (event)
    {
      case EVENT_BUTTON7:
        currentScreen = 3;
        println("Backward was pressed");
        break;
    }
  }
}

void keyPressed() {
  // Input box text
  if(mouseY >= 170 && mouseY <= 170+40){
      if (key >= '/' && key <= '9') {
        startDate += key;
      }
      else if (keyCode == BACKSPACE) {
          if (startDate.length() > 0) {
              startDate = startDate.substring(0, startDate.length() - 1);
          }
      }  
  }
  else if(mouseY >= 225 && mouseY <= 225+40){
      if (key >= '/' && key <= '9') {
        endDate += key;
      }
      else if (keyCode == BACKSPACE) {
          if (endDate.length() > 0) {
              endDate = endDate.substring(0, endDate.length() - 1);
          }
      }  
  }
  else if(mouseY >= 295 && mouseY <= 295+40){
      if (key >= 'a' && key <= 'z' || key >= 'A' && key <= 'Z') {
        depAP += key;
      }
      else if (keyCode == BACKSPACE) {
          if (depAP.length() > 0) {
              depAP = depAP.substring(0, depAP.length() - 1);
          }
      }  
  }
    else if(mouseY >= 395 && mouseY <= 395+40){
      if (key >= 'a' && key <= 'z' || key >= 'A' && key <= 'Z') {
        arrAP += key;
      }
      else if (keyCode == BACKSPACE) {
          if (arrAP.length() > 0) {
              arrAP = arrAP.substring(0, arrAP.length() - 1);
          }
      }  
  }
  else if(mouseY >= 520 && mouseY <= 520+40){
      if (key >= '0' && key <= '9') {
        maxDis += key;
      }
      else if (keyCode == BACKSPACE) {
          if (maxDis.length() > 0) {
              maxDis = maxDis.substring(0, maxDis.length() - 1);
          }
      }  
  }
  else if(mouseY >= 575 && mouseY <= 575+40){
      if (key >= '0' && key <= '9') {
        minDis += key;
      }
      else if (keyCode == BACKSPACE) {
          if (minDis.length() > 0) {
              minDis = minDis.substring(0, minDis.length() - 1);
          }
      }  
  }

}
