// A.Khan Added main 16/03
// CK Added Flights Framework 16/03
// A.Khan Merged Main and Flight Framework 19/03
// CK updated multiple screens for graph implementation 20/03
// CK improved Framework to planned architecture 22/03
// J.Nash added Map 30/03
// A.Khan Linked Queries to the Barchart and moved loadData and printData to Flight class 31/03
// CK added visualisation box images 05/04
// CK added piechart + sorted for busiest and quietest airports 10/04

PFont ttlFont;
PFont stdFont;
PFont inpFont;
PImage logo;
PImage map;
PImage lineG, barC, usMap, pieC, tableL;
FlightTable flightTable;

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
PBG, PGD, PGV, PHF, PIB, PIE, PIH, PIR, PLN, PNS, PQI,
PRC, PSC, PSM, PUB, PUW, PVD, PVU, PWM, RDD, RDM, RHI, RIC,
RIW, RKS, ROA, ROC, ROW, RST, SAF, SBA, SBN, SBP, SBY, SCE,
SFB, SGU, SHD, SHR, SHV, SJT, SLN,
SPI, SPS, STC, STS, SUN, SUX, SWF, SWO, SYR, TBN, TLH, TOL, TRI, TTN,
TUS, TVC, TWF, TXK, TYR, TYS, USA, VCT, VEL, VLD, XWA, YKM, YUM;

ArrayList<Airport> airports;

Widget widget0, widget1, widget2, widget3, widget4, widget5, widget6, widget7, widget8;
Screen screen1, screen2, screen3, screen4, screen5, screen6, screen7, screen8, screen9;
int currentScreen;

Table table;
ArrayList<Flight> flights;


PieChart pie;
String busiestAirport = "";
float busiestAirportNumber;
String quietestAirport = "";
float quietestAirportNumber;
import java.util.*;
Barchart barChart;
Linegraph lineGraph;
float[] data;

String inputText = "", startDate = "", endDate = "", depAP = "", arrAP = "", maxDis = "", minDis = "";
Boolean cancellations = false, diversions = false;
int boxXpos = 350, boxYpos = 660;
color screenColour = color(51, 102, 153); // Dark blue
color boxColour = color(65, 105, 225); // Light blue
color altColour = color(255); // White

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
  screen6 = new Screen(altColour);
  //screen6 = new Screen(color(235, 219, 5));
  screen7 = new Screen(color(0, 153, 0));
  //screen8 = new Screen(color(19, 63, 240));
  screen8 = new Screen(altColour);
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
  FAY = new Airport(647, 340, 5, "FAY", "NC"); FCA = new Airport(203, 68, 5, "FCA", "MT");
  FLG = new Airport(175, 309, 5, "FLG", "AZ"); FLO = new Airport(649, 332, 5, "FLO", "SC");
  FNT = new Airport(572, 171, 5, "FNT", "MI"); FOD = new Airport(439, 184, 5, "FOD", "IA");
  FSD = new Airport(398, 165, 5, "FSD", "SD"); FSM = new Airport(433, 324, 5, "FSM", "AR");
  FWA = new Airport(554, 206, 5, "FWA", "IN"); GCC = new Airport(289, 145, 5, "GCC", "WY");
  GCK = new Airport(338, 270, 5, "GCK", "KS"); GFK = new Airport(395, 80, 5, "GFK", "ND");
  GGG = new Airport(420, 414, 5, "GGG", "TX"); GNV = new Airport(622, 416, 5, "GNV", "FL");
  GPT = new Airport(514, 411, 5, "GPT", "MS"); GRB = new Airport(510, 140, 5, "GRB", "WI");
  GRI = new Airport(382, 214, 5, "GRI", "NE"); GRK = new Airport(382, 415, 5, "GRK", "TX");
  GRR = new Airport(548, 172, 5, "GRR", "MI"); GSO = new Airport(643, 296, 5, "GSO", "NC");
  GTR = new Airport(520, 359, 5, "GTR", "MS"); GUC = new Airport(241, 261, 5, "GUC", "CO");
  HDN = new Airport(252, 215, 5, "HDN", "CO"); HGR = new Airport(662, 222, 5, "HGR", "MD");
  HHH = new Airport(624, 365, 5, "HHH", "SC"); HIB = new Airport(443, 112, 5, "HIB", "MN");
  HLN = new Airport(195, 108, 5, "HLN", "MT"); HOB = new Airport(293, 370, 5, "HOB", "NM");
  HRL = new Airport(366, 487, 5, "HRL", "TX"); HSV = new Airport(552, 331, 5, "HSV", "AL");
  HTS = new Airport(603, 250, 5, "HTS", "WV"); HYS = new Airport(350, 252, 5, "HYS", "KS");
  IAD = new Airport(681, 225, 5, "IAD", "DC"); IAG = new Airport(636, 153, 5, "IAG", "NY");
  ICT = new Airport(401, 275, 5, "ICT", "KS"); ILG = new Airport(693, 214, 5, "ILG", "DE");
  ILM = new Airport(677, 321, 5, "ILM", "NC"); IMT = new Airport(514, 118, 5, "IMT", "MI");
  INL = new Airport(444, 71, 5, "INL", "MN"); ISP = new Airport(716, 187, 5, "ISP", "NY");
  ITH = new Airport(673, 163, 5, "ITH", "NY"); JAC = new Airport(217, 157, 5, "JAC", "WY");
 
//, , JMS, JST, LAN, LAR, LAW, LBB,


  
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
  JLN = new Airport(432, 288, 5, "JLN", "MO"); JMS = new Airport(371, 103, 5, "JMS", "ND");
  JST = new Airport(639, 211, 5, "JST", "PA"); LAN = new Airport(559, 172, 5, "LAN", "MI");
  LAR = new Airport(283, 194, 5, "LAR", "WY"); LAW = new Airport(379, 335, 5, "LAW", "OK");
  LBB = new Airport(319, 348, 5, "LBB", "TX"); LBE = new Airport(641, 208, 5, "LBW", "PA");
  LBF = new Airport(348, 211, 5, "LBF", "NE"); LBL = new Airport(344, 285, 5, "LBL", "KS");
  LCH = new Airport(453, 423, 5, "LCH", "LA"); LCK = new Airport(587, 235, 5, "LCK", "OH");
  LEX = new Airport(571, 258, 5, "LEX", "KT"); LFT = new Airport(475, 422, 5, "LFT", "LA");
  LIT = new Airport(457, 327, 5, "LIT", "AR"); LNK = new Airport(399, 216, 5, "LNK", "NE");
  LRD = new Airport(342, 462, 5, "LRD", "TX"); LSE = new Airport(473, 159, 5, "LSE", "WI");
  LWB = new Airport(626, 259, 5, "LWB", "WV"); LWS = new Airport(144, 83, 5, "LWS", "ID");
  LYH = new Airport(645, 261, 5, "LYH", "VA"); MBS = new Airport(571, 161, 5, "MBS", "MI");
  MCW = new Airport(458, 175, 5, "MCW", "IA"); MDT = new Airport(668, 210, 5, "MDT", "PA");
  MEI = new Airport(518, 375, 5, "MEI", "MS"); MGM = new Airport(554, 381, 5, "MGM", "AL");
  MHK = new Airport(406, 244, 5, "MHK", "KS"); MHT = new Airport(735, 138, 5, "MHT", "NH");
  MKG = new Airport(541, 172, 5, "MKG", "MI"); MLB = new Airport(645, 453, 5, "MLB", "FL");
  MLI = new Airport(493, 201, 5, "MLI", "IL"); MLU = new Airport(469, 381, 5, "MLU", "LA");
  MOB = new Airport(530, 404, 5, "MOB", "AL"); MQT = new Airport(519, 105, 5, "MQT", "MI");
  MRY = new Airport(36, 250, 5, "MRY", "CA"); MSN = new Airport(499, 174, 5, "MSN", "WI");
  MTJ = new Airport(237, 254, 5, "MTJ", "CO"); OAJ = new Airport(684, 310, 5, "OAJ", "NC");
  OGD = new Airport(189, 191, 5, "OGD", "UT"); OGS = new Airport(671, 128, 5, "OGS", "NY");
  OMA = new Airport(409, 206, 5, "OMA", "NE"); OME = new Airport(88, 447, 5, "OME", "AK");
  ORF = new Airport(686, 269, 5, "ORF", "VA"); ORH = new Airport(730, 157, 5, "ORH", "MA");
  OTH = new Airport(89, 117, 5, "OTH", "OR"); OTZ = new Airport(99, 437, 5, "OTZ", "AK");
  OWB = new Airport(537, 271, 5, "OWB", "KT"); PAE = new Airport(88, 38, 5, "PAE", "WA");
  PAH = new Airport(518, 285, 5, "PAH", "KT"); PBG = new Airport(704, 131, 5, "PBG", "NY");
  PGD = new Airport(634, 468, 5, "PGD", "FL"); PGV = new Airport(682, 294, 5, "PGV", "NC");
  PHF = new Airport(686, 265, 5, "PHF", "VA"); PIB = new Airport(513, 400, 5, "PIB", "MS");
  PIE = new Airport(620, 450, 5, "PIE", "FL"); PIH = new Airport(193, 161, 5, "PIH", "ID");
  PIR = new Airport(356, 147, 5, "PIR", "SD"); PLN = new Airport(553, 125, 5, "PLN", "MI");
  PNS = new Airport(564, 411, 5, "PNS", "FL"); PQI = new Airport(761, 60, 5, "PQI", "ME");
  PRC = new Airport(152, 318, 5, "PRC", "AZ"); PSC = new Airport(116, 83, 5, "PSC", "WA");
  PSM = new Airport(741, 137, 5, "PSM", "NH"); PUB = new Airport(291, 262, 5, "PUB", "CO");
  PUW = new Airport(143, 76, 5, "PUW", "WA"); PVD = new Airport(740, 162, 5, "PVD", "RI");
  PVU = new Airport(194, 215, 5, "PVU", "UT"); PWM = new Airport(744, 124, 5, "PWM", "ME");
  RDD = new Airport(54, 176, 5, "RDD", "CA"); RDM = new Airport(93, 113, 5, "RDM", "OR");
  RHI = new Airport(498, 127, 5, "RHI", "WI"); RIC = new Airport(676, 261, 5, "RIC", "VA");
  RIW = new Airport(242, 156, 5, "RIW", "WY"); RKS = new Airport(229, 187, 5, "RKS", "WY");
  ROA = new Airport(639, 259, 5, "ROA", "VA"); ROC = new Airport(648, 150, 5, "ROC", "NY");
  ROW = new Airport(277, 352, 5, "ROW", "NM"); RST = new Airport(458, 156, 5, "RST", "MN");
  SAF = new Airport(261, 300, 5, "SAF", "NM"); SBA = new Airport(66, 305, 5, "SBA", "CA");
  SBN = new Airport(541, 197, 5, "SBN", "IN"); SBP = new Airport(52, 276, 5, "SBP", "CA");
  SBY = new Airport(697, 238, 5, "SBY", "MD"); SCE = new Airport(656, 198, 5, "SCE", "PA");
  SFB = new Airport(636, 434, 5, "SFB", "FL"); SGU = new Airport(161, 257, 5, "SGU", "UT");
  SHD = new Airport(651, 247, 5, "SHD", "VA"); SHR = new Airport(267, 132, 5, "SHR", "WY");
  SHV = new Airport(446, 383, 5, "SHV", "LA"); SJT = new Airport(346, 406, 5, "SJT", "TX");
  SLN = new Airport(390, 255, 5, "SLN", "KS"); SPI = new Airport(498, 243, 5, "SPI", "IL");
  SPS = new Airport(379, 357, 5, "SPS", "TX"); STC = new Airport(427, 137, 5, "STC", "MN");
  STS = new Airport(36, 205, 5, "STS", "CA"); SUN = new Airport(167, 153, 5, "SUN", "ID");
  SUX = new Airport(402, 184, 5, "SUX", "IA"); SWF = new Airport(712, 186, 5, "SWF", "NY");
  SWO = new Airport(404, 310, 5, "SWO", "OK"); SYR = new Airport(673, 156, 5, "SYR", "NY");
  TBN = new Airport(462, 282, 5, "TBN", "MO"); TLH = new Airport(583, 409, 5, "TLH", "FL");
  TOL = new Airport(580, 196, 5, "TOL", "OH"); TRI = new Airport(589, 296, 5, "TRI", "TN");
  TTN = new Airport(701, 199, 5, "TTN", "NJ"); TUS = new Airport(179, 365, 5, "TUS", "AZ");
  TVC = new Airport(547, 140, 5, "TVC", "MI"); TWF = new Airport(161, 158, 5, "TWF", "ID");
  TXK = new Airport(438, 359, 5, "TXK", "AR"); TYR = new Airport(420, 392, 5, "TYR", "TX");
  TYS = new Airport(572, 303, 5, "TYS", "TN"); USA = new Airport(644, 302, 5, "USA", "NC");
  VCT = new Airport(386, 439, 5, "VCT", "TX"); VEL = new Airport(214, 212, 5, "VEL", "UT");
  VLD = new Airport(601, 390, 5, "VLD", "GA"); XWA = new Airport(322, 82, 5, "XWA", "ND");
  YKM = new Airport(102, 66, 5, "YKM", "WA"); YUM = new Airport(128, 345, 5, "YUM", "AZ");

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

  airports.add(RDU); airports.add(RFD); airports.add(RNO); airports.add(RSW); airports.add(SAN); airports.add(SAT); //<>//
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
  airports.add(EWN); airports.add(EYW); airports.add(FAY); airports.add(FCA); airports.add(FLG); airports.add(FLO);
  airports.add(FNT); airports.add(FOD); airports.add(FSD); airports.add(FSM); airports.add(FWA); airports.add(GCC);
  airports.add(GCK); airports.add(GFK); airports.add(GGG); airports.add(GNV); airports.add(GPT); airports.add(GRB);
  airports.add(GRI); airports.add(GRK); airports.add(GRR); airports.add(GSO); airports.add(GTR); airports.add(GUC);
  airports.add(HDN); airports.add(HGR); airports.add(HHH); airports.add(HIB); airports.add(HLN); airports.add(HOB);
  airports.add(HRL); airports.add(HSV); airports.add(HTS); airports.add(HYS); airports.add(IAD); airports.add(IAG);
  airports.add(ICT); airports.add(ILG); airports.add(ILM); airports.add(IMT); airports.add(INL); airports.add(ISP);
  airports.add(ITH); airports.add(JAC); airports.add(JLN); airports.add(JMS); airports.add(JST); airports.add(LAN);
  airports.add(LAR); airports.add(LAW); airports.add(LBB); airports.add(LBE); airports.add(LBF); airports.add(LBL);
  airports.add(LCH); airports.add(LCK); airports.add(LEX); airports.add(LFT); airports.add(LIT); airports.add(LNK);
  airports.add(LRD); airports.add(LSE); airports.add(LWB); airports.add(LWS); airports.add(LYH); airports.add(MBS);
  airports.add(MCW); airports.add(MDT); airports.add(MEI); airports.add(MGM); airports.add(MHK); airports.add(MHT);
  airports.add(MKG); airports.add(MLB); airports.add(MLI); airports.add(MLU); airports.add(MOB); airports.add(MQT);
  airports.add(MRY); airports.add(MSN); airports.add(MTJ); airports.add(OAJ); airports.add(OGD); airports.add(OGS);
  airports.add(OMA); airports.add(OME); airports.add(ORF); airports.add(ORH); airports.add(OTH); airports.add(OTZ);
  airports.add(OWB); airports.add(PAE); airports.add(PAH); airports.add(PBG); airports.add(PGD); airports.add(PGV);
  airports.add(PHF); airports.add(PIB); airports.add(PIE); airports.add(PIH); airports.add(PIR); airports.add(PLN);
  airports.add(PNS); airports.add(PQI); airports.add(PRC); airports.add(PSC); airports.add(PSM); airports.add(PUB);
  airports.add(PUW); airports.add(PVD); airports.add(PVU); airports.add(PWM); airports.add(RDD); airports.add(RDM);
  airports.add(RHI); airports.add(RIC); airports.add(RIW); airports.add(RKS); airports.add(ROA); airports.add(ROC);
  airports.add(ROW); airports.add(RST); airports.add(SAF); airports.add(SBA); airports.add(SBN); airports.add(SBP);
  airports.add(SBY); airports.add(SCE); airports.add(SFB); airports.add(SGU); airports.add(SHD); airports.add(SHR);
  airports.add(SHV); airports.add(SJT); airports.add(SLN); airports.add(SPI); airports.add(SPS); airports.add(STC);
  airports.add(STS); airports.add(SUN); airports.add(SUX); airports.add(SWF); airports.add(SWO); airports.add(SYR);
  airports.add(TBN); airports.add(TLH); airports.add(TOL); airports.add(TRI); airports.add(TTN); airports.add(TUS);
  airports.add(TVC); airports.add(TWF); airports.add(TXK); airports.add(TYR); airports.add(TYS); airports.add(USA);
  airports.add(VCT); airports.add(VEL); airports.add(VLD); airports.add(XWA); airports.add(YKM); airports.add(YUM);
  airports.add(YAK);

  
  
  //Pie Chart
   String[] airportNamesArray = new String[airports.size()];
   for (int i = 0; i < airports.size(); i++) {
    airportNamesArray[i] = airports.get(i).getAirportName();
   }
   float[] airportCounts = countAirportNames(flights,airportNamesArray);
   pie = new PieChart(300,airportCounts); //<>//
   // Highest and Lowest Traffic Aiports (Empty Airports not included)
   busiestAirport = airportNamesArray[0];
   busiestAirportNumber = airportCounts[0];
   quietestAirport = busiestAirport;
   quietestAirportNumber = busiestAirportNumber;
   
   for (int i = 0; i< airportCounts.length; i++){
     if(airportCounts[i]>busiestAirportNumber){
       busiestAirportNumber = airportCounts[i];
       busiestAirport = airportNamesArray[i];
     }
     else if(airportCounts[i]<quietestAirportNumber && airportCounts[i]>0){
       quietestAirportNumber = airportCounts[i];
       quietestAirport = airportNamesArray[i];
     }
   }
   //println("Airport:"+busiestAirport+" Amount:"+busiestAirportNumber);
   //println("Airport:"+quietestAirport+" Amount:"+quietestAirportNumber);

  // flight table
  flightTable = new FlightTable();
  flightTable.visibleRows = 5;
  flightTable.table = table;
  flightTable.font = loadFont("Arial-BoldMT-16.vlw");
  surface.setResizable(true);
  flightTable.table.removeColumn("MKT_CARRIER");
  flightTable.table.removeColumn("MKT_CARRIER_FL_NUM");
  flightTable.table.removeColumn("ORIGIN_STATE_ABR");
  flightTable.table.removeColumn("ORIGIN_WAC");
  flightTable.table.removeColumn("DEST_STATE_ABR");
  flightTable.table.removeColumn("DEST_WAC");
  flightTable.table.removeColumn("DEP_TIME");
  flightTable.table.removeColumn("ARR_TIME");
  flightTable.filteredTable = table;

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
    text("Press Start to Continue:", SCREENX/2, WIDGET1Y + 50);
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
    text("(MM/DD/YYYY)", 650, 225);
    text("Max", 300, 550);
    text("Min", 300, 600);
    text("Cancellations", 250, 700);
    text("Diversions",250, 750);
    
    //Text Boxes
    
    //Start Date
    fill(boxColour);
    rect(350, 170, 200, 40,10);
    fill(0);
    text(startDate, 450, 200);
    
    //End Date
    fill(boxColour);
    rect(350, 225, 200, 40,10);
    fill(0);
    text(endDate, 450, 255);
    
    //Departure Airport Code
    fill(boxColour);
    rect(350, 295, 200, 40,10);
    fill(0);
    text(depAP, 450, 325);
    
    //Arrival Airport Code
    fill(boxColour);
    rect(350, 395, 200, 40,10);
    fill(0);
    text(arrAP, 450, 425);
    
    //Max Distance
    fill(boxColour);
    rect(350, 520, 200, 40,10);
    fill(0);
    text(maxDis, 450, 550);
    
    //Min Distance
    fill(boxColour);
    rect(350, 575, 200, 40,10);
    fill(0);
    text(minDis, 450, 600);
      
     // Checkbox
     
    fill(boxColour);
    rect(boxXpos, boxYpos, 50, 50,10);
  
    if (cancellations) {
      fill(0);
      //textFont(inpFont);
      textSize(40);
      text("X", boxXpos+25, boxYpos+40);
    }
    
    fill(boxColour);
    rect(boxXpos, boxYpos+60, 50, 50,10);
  
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
    String[] dateList = getDates(startDate, endDate);
    
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
         if (airport != null)
         airport.draw();
         flightCount = flights.size();
       }
       else if (airport.name.equals(depAP)){
         text(depAP+" Flight Information", SCREENX/2, 75);
         if (airport != null)
         airport.draw();
         for (Flight flight : newFlights) {
         if (flight.origin.equals(depAP)) {
           flightCount++;
         }
         if (flight.originCityAbr.equals(airport.state)) {
           stateAbr = airport.state;
           stateCount++;
         }
       }

     }

   }

    textAlign(LEFT);
    textFont(stdFont);
   text("Number of flights: " + flightCount, 30, 670);
   if (!stateAbr.equals("")) {
   text("Number of flights in " + stateAbr + ": " + stateCount, 30, 710);
   }

   textAlign(CENTER);
 }

  
  else if (currentScreen == 7)
  {
    screen7.draw();
    textAlign(CENTER);
    textFont(ttlFont);
    text("Airport Flight Percentages", SCREENX/2, 100);
    pie.draw();
    fill(0,255,0);
    rect(415,205,350,450,20);
    fill(255);
    rect(440, 230,300,400,20);
    fill(0);
    textFont(stdFont);
    text("Busiest Airport:\n"+busiestAirport+"\nNumber of flights:\n"+(int)busiestAirportNumber,590, 280);
    text("Quietest Airport:\n"+quietestAirport+"\nNumber of flights:\n"+(int)quietestAirportNumber,590, 480);
 
  }
  else if (currentScreen == 8)
  {
    screen8.draw(); 
    flightTable.draw(); 
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
  if (currentScreen == 8) {
    flightTable.mousePressed();
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
      if ((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z')) {
        if (key >= 'a' && key <= 'z') {
            key -= 32;
        }
          depAP += key;
      }
      else if (keyCode == BACKSPACE) {
          if (depAP.length() > 0) {
              depAP = depAP.substring(0, depAP.length() - 1);
          }
      }  
  }
    else if(mouseY >= 395 && mouseY <= 395+40){
      if ((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z')) {
        if (key >= 'a' && key <= 'z') {
            key -= 32;
        }
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

/*
float[] countAirportNames(ArrayList<Flight> airportList) {
  String[] airportNames = {"ATL", "ORD", "DFW", "DEN", "CLT", "LAX", "LGA", "PHX", "SEA", "LAS", "DCA", "IAH", "EWR", "MCO", "JFK", "DTW", "MIA", "BOS", "SFO", "Other"}; //List of airports we're checking for
  //String[] airportNames = {"ATL", "ORD", "DFW", "DEN", "CLT", "LAX", "LGA", "PHX", "SEA", "LAS", "DCA", "IAH", "EWR", "MCO", "JFK", "DTW", "MIA", "BOS", "SFO", "SBA"}; //List of airports we're checking for
  //String[] airportNames = {"SEA","FLL"};
  float[] airportCounts = new float[airportNames.length];
  
  for (int i = 0; i < airportList.size(); i++) {
    String airportName = airportList.get(i).getName();
    int index = Arrays.asList(airportNames).indexOf(airportName);
    if (index >= 0) {
      airportCounts[index]++;
    }
    else{
      airportCounts[airportNames.length-1]++;
    }
  }
  
  return airportCounts;
}*/

float[] countAirportNames(ArrayList<Flight> airportList, String[] airportNamesArray) {
  airportNamesArray = Arrays.copyOf(airportNamesArray, airportNamesArray.length + 1);
  airportNamesArray[airportNamesArray.length - 1] = "Other";
  float[] airportCounts = new float[airportNamesArray.length];

  for (int i = 0; i < airportList.size(); i++) {
    String airportName = airportList.get(i).getName();
    int index = Arrays.asList(airportNamesArray).indexOf(airportName);
    if (index >= 0) {
      airportCounts[index]++;
    }
    else{
      airportCounts[airportNamesArray.length-1]++;
    }
  }

  return airportCounts;
}
