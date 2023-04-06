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
DVL, EAR, EAT, EAU, ECP, EGE, EKO, ELM, ERI, ESC, EVV, EWN, EYW,
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
  JFK = new Airport(712, 186, 5, "JFK", "NY"); LAX = new Airport(72, 309, 5, "LAX", "CA");
  DCA = new Airport(673, 235, 5, "DCA", "VA"); FLL = new Airport(667, 482, 5, "FLL", "FL");
  SEA = new Airport(86, 47, 5, "SEA", "WA"); HNL = new Airport(261, 466, 5, "HNL", "HI");
  ORD = new Airport(520, 192, 5, "ORD", "IL"); DAL = new Airport(406, 378, 5, "DAL", "TX");
  MCI = new Airport(428, 248, 5, "MCI", "MO"); HOU = new Airport(395, 449, 5, "HOU", "TX");
  
  ABQ = new Airport(251, 312, 5, "ABQ", "NM"); ADQ = new Airport(116, 495, 5, "ADQ", "AK");
  ALB = new Airport(705, 151, 5, "ALB", "NM"); ANC = new Airport(128, 476, 5, "ANC", "AK");
  ATL = new Airport(582, 345, 5, "ATL", "GA"); ATW = new Airport(509, 145, 5, "ATW", "KS");
  AUS = new Airport(395, 413, 5, "AUS", "TX"); AZA = new Airport(173, 351, 5, "AZA", "AZ");
  BDL = new Airport(724, 168, 5, "BDL", "CT"); BET = new Airport(96, 477, 5, "BET", "MO");
  BHM = new Airport(547, 354, 5, "BHM", "AL"); BIL = new Airport(241, 108, 5, "BIL", "MT");
  BIS = new Airport(129, 275, 5, "BIS", "ND"); BLI = new Airport(91, 28, 5, "BLI", "WA");
  BLV = new Airport(496, 262, 5, "BLV", "IL"); BNA = new Airport(551, 312, 5, "BNA", "TN");
  BOI = new Airport(143, 139, 5, "BOI", "ID"); BOS = new Airport(741, 151, 5, "BOS", "MA");
  BRW = new Airport(113, 415, 5, "BRW", "KY"); BUF = new Airport(639, 162, 5, "BUF", "NY");
  BUR = new Airport(72, 299, 5, "BUR", "CA"); BWI = new Airport(679, 227, 5, "BWI", "MD");
  BZN = new Airport(216, 111, 5, "BZN", "MT"); CDV = new Airport(143, 476, 5, "CDV", "AK");
  CHS = new Airport(647, 355, 5, "CHS", "SC"); CID = new Airport(466, 196, 5, "CID", "IA");
  CLE = new Airport(601, 192, 5, "CLE", "OH"); CLT = new Airport(641, 310, 5, "CLT", "NC");
  CMH = new Airport(592, 228, 5, "CMH", "OH"); CRP = new Airport(381, 469, 5, "CRP", "TX");
  CVG = new Airport(574, 244, 5, "CVG", "KY"); DEN = new Airport(286, 232, 5, "DEN", "CO");
  DFW = new Airport(399, 378, 5, "DFW", "TX"); DTW = new Airport(580, 181, 5, "DTW", "MI");
  ELP = new Airport(247, 381, 5, "ELP", "TX"); EUG = new Airport(64, 110, 5, "EUG", "OR");
  EWR = new Airport(707, 187, 5, "EWR", "NJ"); FAI = new Airport(126, 449, 5, "FAI", "AK");
  FAR = new Airport(399, 102, 5, "FAR", "ND"); FAT = new Airport(72, 263, 5, "FAT", "CA");
  GEG = new Airport(139, 68, 5, "GEG", "WA"); GJT = new Airport(236, 242, 5, "GJT", "CO");
  GSP = new Airport(625, 324, 5, "GSP", "SC"); GTF = new Airport(223, 88, 5, "GTF", "MT");
  IAH = new Airport(394, 446, 5, "IAH", "TX"); IDA = new Airport(200, 153, 5, "IDA", "ID");
  IND = new Airport(544, 239, 5, "IND", "IN"); ITO = new Airport(319, 506, 5, "ITO", "HI");
  JAN = new Airport(499, 375, 5, "JAN", "MS"); JAX = new Airport(635, 412, 5, "JAX", "FL");
  JNU = new Airport(179, 498, 5, "JNU", "AK"); KOA = new Airport(301, 508, 5, "KOA", "HI");
  KTN = new Airport(184, 497, 5, "KTN", "AK"); LAS = new Airport(129, 269, 5, "LAS", "NV");
  LGA = new Airport(715, 187, 5, "LGA", "NY"); LGB = new Airport(75, 315, 5, "LBG", "NY");
  LIH = new Airport(234, 452, 5, "LIH", "HI"); MAF = new Airport(312, 387, 5, "MAF", "TX");
  MCO = new Airport(649, 460, 5, "MCO", "FL"); MDW = new Airport(517, 191, 5, "MDW", "IL");
  MEM = new Airport(497, 322, 5, "MEM", "TN"); MFE = new Airport(371, 496, 5, "MFE", "TX");
  MFR = new Airport(57, 139, 5, "MFR", "OR"); MIA = new Airport(662, 497, 5, "MIA", "FL");
  MKE = new Airport(515, 169, 5, "MKE", "WI"); MOT = new Airport(340, 77, 5, "MOT", "ND");
  MSO = new Airport(203, 85, 5, "MSO", "MT"); MSP = new Airport(445, 146, 5, "MSP", "MN");
  MSY = new Airport(488, 436, 5, "MSY", "LA"); MYR = new Airport(660, 340, 5, "MYR", "SC");
  OAK = new Airport(48, 224, 5, "OAK", "CA"); OGG = new Airport(294, 480, 5, "OGG", "HI");
  ONT = new Airport(91, 302, 5, "ONT", "CA"); PBI = new Airport(661, 464, 5, "PBI", "FL");
  PDX = new Airport(73, 83, 5, "PDX", "OR"); PHL = new Airport(695, 205, 5, "PHL", "PA");
  PHX = new Airport(174, 349, 5, "PHX", "AZ"); PIA = new Airport(501, 217, 5, "PIA", "IL");
  PIT = new Airport(625, 211, 5, "PIT", "PA"); PSG = new Airport(179, 487, 5, "PSG", "AK");
  PSP = new Airport(103, 313, 5, "PSP", "CA"); RAP = new Airport(313, 154, 5, "RAP", "SD");
  RDU = new Airport(666, 298, 5, "RDU", "NC"); RFD = new Airport(506, 188, 5, "RFD", "IL");
  RNO = new Airport(80, 202, 5, "RNO", "NV" ); RSW = new Airport(639, 479, 5, "RSW", "FL");
  SAN = new Airport(86, 334, 5, "SAN", "CA"); SAT = new Airport(366, 464, 5, "SAT", "TX");
  SAV = new Airport(631, 369, 5, "SAV", "GA"); SCC = new Airport(128, 417, 5, "SCC", "AK");
  SCK = new Airport(61, 271, 5, "SCK", "CA"); SDF = new Airport(559, 259, 5, "SDF", "KY");
  SFO = new Airport(34, 222, 5, "SFO", "CA"); SGF = new Airport(439, 282, 5, "SGF", "MO");
  SIT = new Airport(166, 485, 5, "SIT", "AK"); SJC = new Airport(35, 237, 5, "SJC", "CA");
  SLC = new Airport(196, 206, 5, "SLC", "UT"); SMF = new Airport(52, 216, 5, "SMF", "CA");
  SMX = new Airport(60, 296, 5, "SMX", "CA"); SNA = new Airport(82, 310, 5, "SNA", "CA");
  SRQ = new Airport(628, 469, 5, "SRQ", "FL"); STL = new Airport(488, 258, 5, "STL", "MO");
  TPA = new Airport(626, 463, 5, "TPA", "FL"); TUL = new Airport(420, 304, 5, "TUL", "OK");
  VPS = new Airport(557, 408, 5, "VPS", "FL"); WRG = new Airport(166, 480, 5, "WRG", "AK");
  XNA = new Airport(441, 308, 5, "XNA", "AR"); YAK = new Airport(163, 482, 5, "YAK", "AK");
  ABE = new Airport(688, 195, 5, "ABE", "PA"); ABI = new Airport(358, 394, 5, "ABI", "TX");
  ABR = new Airport(385, 129, 5, "ABR", "SD"); ABY = new Airport(588, 382, 5, "ABY", "GA");
  ACT = new Airport(365, 392, 5, "ACT", "TX"); ACV = new Airport(29, 162, 5, "ACV", "CA");
  ACY = new Airport(207, 211, 5, "ACY", "NJ"); ADK = new Airport(80, 505, 5, "ADK", "AK");
  AEX = new Airport(427, 412, 5, "AEX", "LA"); AGS = new Airport(617, 347, 5, "AGS", "GA");
  AKN = new Airport(102, 486, 5, "AKN", "AK"); ALO = new Airport(464, 185, 5, "ALO", "IA");
  ALS = new Airport(271, 265, 5, "ALS", "CO"); ALW = new Airport(119, 76, 5, "ALW", "WA");
  AMA = new Airport(325, 332, 5, "AMA", "TX"); APN = new Airport(572, 134, 5, "APN", "MI");
  ART = new Airport(672, 130, 5, "ART", "NY"); ASE = new Airport(258, 233, 5, "ASE", "CO");
  AVL = new Airport(620, 299, 5, "AVL", "NC"); AVP = new Airport(682, 183, 5, "AVP", "PA");
  AZO = new Airport(556, 182, 5, "AZP", "MI"); BFF = new Airport(308, 192, 5, "BFF", "NE");
  BFL = new Airport(107, 307, 5, "BFL", "CA"); BGM = new Airport(683, 163, 5, "BGM", "NY");
  BGR = new Airport(757, 95, 5, "BGR", "ME"); BIH = new Airport(108, 271, 5, "BIH", "CA");
  BJI = new Airport(427, 104, 5, "BJI", "MN"); BMI = new Airport(509, 230, 5, "BMI", "IL");
  BPT = new Airport(432, 424, 5, "BPT", "TX"); BQK = new Airport(631, 385, 5, "BQK", "GA");
  BRD = new Airport(434, 130, 5, "BRD", "MN"); BRO = new Airport(379, 500, 5, "BRO", "TX");
  BTM = new Airport(209, 104, 5, "BTM", "MT"); BTR = new Airport(485, 418, 5, "BTR", "LA");
  BTV = new Airport(706, 119, 5, "BTV", "VT"); CAE = new Airport(631, 333, 5, "CAE", "SC");
  CAK = new Airport(609, 201, 5, "CAK", "OH"); CDC = new Airport(166, 252, 5, "CDC", "UT");
  CGI = new Airport(499, 282, 5, "CGI", "MO"); CHA = new Airport(533, 322, 5, "CHA", "TN");
  CHO = new Airport(666, 255, 5, "CHO", "VA"); CIU = new Airport(556, 119, 5, "CIU", "MI");
  CKB = new Airport(628, 238, 5, "CKB", "WV"); CLL = new Airport(408, 406, 5, "CLL", "TX");
  CMI = new Airport(518, 241, 5, "CMI", "IL"); CMX = new Airport(502, 95, 5, "CMX", "MI");
  CNY = new Airport(212, 258, 5, "CNY", "UT"); COD = new Airport(236, 139, 5, "COD", "WY");
  COS = new Airport(286, 261, 5, "COS", "CO"); COU = new Airport(455, 252, 5, "COU", "MO");
  CPR = new Airport(278, 186, 5, "CPR", "WY"); CRW = new Airport(614, 254, 5, "CRW", "WV");
  CSG = new Airport(578, 375, 5, "CSG", "GA"); CWA = new Airport(497, 150, 5, "CWA", "WI");
  CYS = new Airport(291, 198, 5, "CYS", "WY"); DAB = new Airport(647, 430, 5, "DAB", "FL");
  DAY = new Airport(574, 231, 5, "DAY", "OH"); DBQ = new Airport(478, 184, 5, "DBQ", "IA");
  DDC = new Airport(342, 272, 5, "DDC", "KS"); DEC = new Airport(508, 242, 5, "DEC", "IL");
  DHN = new Airport(571, 391, 5, "DHN", "AL"); DIK = new Airport(326, 101, 5, "DIK", "ND");
  DLG = new Airport(102, 486, 5, "DLG", "AK"); DLH = new Airport(455, 105, 5, "DLH", "MN");
  DRO = new Airport(243, 270, 5, "DRO", "CO"); DRT = new Airport(337, 450, 5, "DRT", "TX");
  DSM = new Airport(441, 207, 5, "DSM", "IA"); DVL = new Airport(377, 83, 5, "DVL", "ND");
  EAR = new Airport(382, 217, 5, "EAR", "NE"); EAT = new Airport(98, 55, 5, "EAT", "WA");
  EAU = new Airport(476, 143, 5, "EAU", "WI"); ECP = new Airport(574, 418, 5, "ECP", "FL");
  EGE = new Airport(255, 231, 5, "EGE", "CO"); EKO = new Airport(146, 188, 5, "EKO", "NV");
  ELM = new Airport(660, 169, 5, "ELM", "NY"); ERI = new Airport(621, 179, 5, "ERI", "PA");
  ESC = new Airport(523, 120, 5, "ESC", "MI"); EVV = new Airport(531, 264, 5, "EVV", "IN");
  EWN = new Airport(688, 299, 5, "EWN", "NC"); EYW = new Airport(651, 505, 5, "EYW", "FL");
  
//FAY, FCA, FLG, FLO, FNT, FOD, FSD, FSM, FWA, GCC, GCK, GFK, GGG, GNV,
//GPT, GRB, GRI, GRK, GRR, GSO, GTR, GUC, GUM, HDN, HGR, HHH, HIB, HLN,
//HOB, HRL, HSV, HTS, HYS, IAD, IAG, ICT, ILG, ILM, IMT, INL, ISP, ITH,
//JAC, JLN, JMS, JST, LAN, LAR, LAW, LBB,
//LBE, LBF, LBL, LCH, LCK, LEX, LFT, LIT, LNK, LRD, LSE, LWB, LWS, LYH, MBS, MCW, MDT, MEI,
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

  airports.add(RDU); airports.add(RFD); airports.add(RNO); airports.add(RSW); airports.add(SAN); airports.add(SAT);
  airports.add(SAV); airports.add(SCC); airports.add(SCK); airports.add(SDF); airports.add(SFO); airports.add(SIT);
  airports.add(SJC); airports.add(SLC); airports.add(SMF); airports.add(SMX); airports.add(SNA); airports.add(SRQ);
  airports.add(STL); airports.add(TPA); airports.add(TUL); airports.add(VPS); airports.add(WRG); airports.add(XNA);

  airports.add(YAK); airports.add(ABE); airports.add(ABI); airports.add(ABR); airports.add(ABY); airports.add(ACT);
  airports.add(ACV); airports.add(ACY); airports.add(ADK); airports.add(AEX); airports.add(AGS); airports.add(AKN);
  airports.add(ALO); airports.add(ALS); airports.add(ALW); airports.add(AMA); airports.add(APN); airports.add(ART);
  airports.add(ASE); airports.add(AVL); airports.add(AVP); airports.add(AZO); airports.add(BFF); airports.add(BFL);
  airports.add(BGM); airports.add(BGR); airports.add(BIH); airports.add(BJI); airports.add(BMI); airports.add(BPT);
  airports.add(BQK); airports.add(BRD); airports.add(BRO); airports.add(BTM); airports.add(BTR); airports.add(BTV);
  airports.add(CAE); airports.add(CAK); airports.add(CDC); airports.add(CGI); airports.add(CHA); airports.add(CHO);
  airports.add(CKB); airports.add(CLL); airports.add(CMI); airports.add(CMX); airports.add(CNY); airports.add(COD);
  airports.add(COS); airports.add(COU); airports.add(CPR); airports.add(CRW); airports.add(CSG); airports.add(CWA);
  airports.add(CYS); airports.add(DAB); airports.add(DAY); airports.add(DBQ); airports.add(DDC); airports.add(DEC);
  airports.add(DHN); airports.add(DIK); airports.add(DLG); airports.add(DLH); airports.add(DRO); airports.add(DRT);
  airports.add(DSM); airports.add(DVL); airports.add(EAR); airports.add(EAT); airports.add(EAU); airports.add(ECP);
  airports.add(EGE); airports.add(EKO); airports.add(ELM); airports.add(ERI); airports.add(ESC); airports.add(EVV);
  airports.add(EWN); airports.add(EYW);
  
  airports.add(YAK);

  
  
  //Pie Chart
  
   int[] angles = { 30, 10, 45, 35, 60, 38, 75, 67 }; //Temp
   pie = new PieChart(300,angles);
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
    
    int queryNum = 0;
    

    if (startDate != "" || endDate != "")
    {
      if (startDate != "" && endDate != "")
      {
        newFlights = dateRange(newFlights, startDate, endDate);
      }
      
      if (startDate == "")
      {
        startDate = getStartDate(newFlights);
        newFlights = dateRange(newFlights, startDate, endDate);
      }
      
      if (endDate == "")
      {
        endDate = getEndDate(newFlights);
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
    }
    else if (depAP != "")
    {
      queryNum = 1;
      newFlights = departure(newFlights, depAP);
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
    
    String[] d = getAirports(newFlights);
    
    data = countFlightDates(newFlights, startDate, endDate); //<>//
    String[] dateList = getDates(startDate, endDate);
    
    println(d[0]);
    
    for (int i = 0; i < dateList.length; i++)
    {
      if (dateList[i] != null)
      {
        String[] date = dateList[i].split("/");
        dateList[i] = date[0] + "/" + date[1];
      }
    }
    
    barChart = new Barchart(data, 100, 675, 600, 600);
    barChart.setTitle("Number of Flights in a day");
    barChart.barLabels(dateList);
    
    lineGraph = new Linegraph(data, 100, 675, 600, 600);
    lineGraph.setTitle("Number of Flights in a day");
    lineGraph.lineLabels(dateList);
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

    //image(map, 0, 0);

    int flightCount = 0;
    int stateCount = 0;
    String stateAbr = "";
    
    ArrayList<Flight> newFlights = flights;
    if (startDate != "" && endDate != "")
    {
      newFlights = dateRange(newFlights, startDate, endDate);
    }

    image(map, 0, 100);
     for (Airport airport : airports) {
       if (depAP.equals("")){
         text("Flight Information", SCREENX/2, 75);
         airport.draw();
         for (Flight flight : newFlights) {
           flightCount++;
         }
       }
       else if (airport.name.equals(depAP)){
         text(depAP+" Flight Information", SCREENX/2, 75);
         airport.draw();
         for (Flight flight : newFlights) {
         if (flight.origin.equals(depAP)) {
           flightCount++;
         }
         if (flight.originCityAbr.equals(airport.state))
           stateAbr = airport.state;
           stateCount++;
       }

     }

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

    textAlign(LEFT);
    textFont(stdFont);
   text("Number of flights: " + flightCount, 30, 670);
   if (!stateAbr.equals("")) {
   text("Number of flights in " + stateAbr + ": " + stateCount, 30, 710);
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
