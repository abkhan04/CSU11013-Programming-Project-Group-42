// J.Nash added 28/03

/*
main {
  Airport LAX;
  Airport JFK;
  Airport ORD;
  
  LAX = new Airport (30, 300, 20);
  
}
*/


class Airport {
  int x, y, radius, count;
  String name;
  color airportColor;
  
  Airport (int x, int y, int radius, String name, int count) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.count = count;
    this.name = name;
    airportColor = color(#C60E0E);
  }
  
  void draw() {
    fill(airportColor);
    ellipse(x, y, radius, radius);
   
  }
  
  String selectAirport(String name) {
    return name;
  }
  
  //void increaseSize (int count) {
  //  if (count >= 50) {
  //    radius += 5;
  //  }
  //}
  
 // ArrayList<String> listOfAirports (ArrayList<Flight> flights) {
 //   ArrayList<String> airportList = new ArrayList<String>();
 //   for (Flight flight : flights) {
 //     for (String name: airportList) {
 //     if (!flight.origin.equals(name)) {
 //       airportList.add(flight.origin);
 //     }  
 //   }
 // }
 //}
 
 // if user selects a state, have only airports in that state displayed
 // text info at bottom regarding number of flights and whatnot
  
}

/*
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
ArrayList<Airport> airports;


PImage map;
//int y;


void setup () {
  size(800, 800);
  airports = new ArrayList<Airport>();
  map = loadImage("usa_map.jpg");
  map.resize(800, 0);
  JFK = new Airport(712, 186, 5, "JFK", 10); LAX = new Airport(72, 309, 10, "LAX", 10);
  DCA = new Airport(673, 235, 5, "DCA", 10); FLL = new Airport(667, 482, 5, "FLL", 10);
  SEA = new Airport(86, 47, 5, "SEA", 10); HNL = new Airport(261, 466, 5, "HNL", 10);
  ORD = new Airport(520, 192, 5, "ORD", 10); DAL = new Airport(406, 378, 10, "DAL", 10);
  MCI = new Airport(428, 248, 5, "MCI", 10); HOU = new Airport(395, 449, 5, "HOU", 10);
  
  ABQ = new Airport(251, 312, 5, "ABQ", 10); ADQ = new Airport(116, 495, 5, "ADQ", 10);
  ALB = new Airport(705, 151, 5, "ALB", 10); ANC = new Airport(128, 476, 5, "ANC", 10);
  ATL = new Airport(582, 345, 5, "ATL", 10); ATW = new Airport(509, 145, 5, "ATW", 10);
  AUS = new Airport(395, 413, 5, "AUS", 10); AZA = new Airport(173, 351, 5, "AZA", 10);
  BDL = new Airport(724, 168, 5, "BDL", 10); BET = new Airport(96, 477, 5, "BET", 10);
  BHM = new Airport(547, 354, 5, "BHM", 10); BIL = new Airport(241, 108, 5, "BIL", 10);
  BIS = new Airport(129, 275, 5, "BIS", 10); BLI = new Airport(91, 28, 5, "BLI", 10);
  BLV = new Airport(496, 262, 5, "BLV", 10); BNA = new Airport(551, 312, 5, "BNA", 10);
  BOI = new Airport(143, 139, 5, "BOI", 10); BOS = new Airport(741, 151, 5, "BOS", 10);
  BRW = new Airport(113, 415, 5, "BRW", 10); BUF = new Airport(639, 162, 5, "BUF", 10);
  BUR = new Airport(72, 299, 5, "BUR", 10); BWI = new Airport(679, 227, 5, "BWI", 10);
  BZN = new Airport(216, 111, 5, "BZN", 10); CDV = new Airport(143, 476, 5, "CDV", 10);
  CHS = new Airport(647, 355, 5, "CHS", 10); CID = new Airport(466, 196, 5, "CID", 10);
  CLE = new Airport(601, 192, 5, "CLE", 10); CLT = new Airport(641, 310, 5, "CLT", 10);
  CMH = new Airport(592, 228, 5, "CMH", 10); CRP = new Airport(381, 469, 5, "CRP", 10);
  CVG = new Airport(574, 244, 5, "CVG", 10); DEN = new Airport(286, 232, 5, "DEN", 10);
  DFW = new Airport(399, 378, 5, "DFW", 10); DTW = new Airport(580, 181, 5, "DTW", 10);
  ELP = new Airport(247, 381, 5, "ELP", 10); EUG = new Airport(64, 110, 5, "EUG", 10);
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
  SAN = new Airport(86, 334, 5, "SAN", 10);
  
  
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
  airports.add(RDU); airports.add(RFD); airports.add(RNO); airports.add(RSW); airports.add(SAN); 
}

void draw() {
  background(255);
  image(img, 0, 0);
  //airport = listOfAirports(flights);
  String entered = "LAX";
  
 for (Airport airport : airports) {
   if (airport.name.equals(depAP))
     airport.draw();
 }
  
    
  
  //JFK.draw(); LAX.draw(); DCA.draw(); FLL.draw(); SEA.draw(); HNL.draw(); ORD.draw();
  //DAL.draw(); MCI.draw(); ABQ.draw(); ADQ.draw(); ALB.draw(); ANC.draw(); ATL.draw();
  //ATW.draw(); AUS.draw(); AZA.draw(); BDL.draw(); BET.draw(); BHM.draw(); BIL.draw();
  //BIS.draw(); BLI.draw(); BLV.draw(); BNA.draw(); BOI.draw(); BOS.draw(); BRW.draw();
  //BUF.draw(); BUR.draw(); BWI.draw(); BZN.draw(); CDV.draw(); CHS.draw(); CID.draw();
  //CLE.draw(); CLT.draw(); CMH.draw(); CRP.draw(); CVG.draw(); DEN.draw(); DFW.draw();
  //DTW.draw(); ELP.draw(); EUG.draw(); EWR.draw(); FAI.draw(); FAR.draw(); FAT.draw();
  //GEG.draw(); GJT.draw(); GTF.draw(); HOU.draw(); IAH.draw(); IDA.draw(); IND.draw();
  //ITO.draw(); JAN.draw(); JAX.draw(); JNU.draw(); KOA.draw(); KTN.draw(); LAS.draw();
  //LGA.draw(); LGB.draw(); LIH.draw(); MAF.draw(); MCO.draw();
}

void mousePressed() {
  println(mouseX + " " + mouseY);
}
*/
