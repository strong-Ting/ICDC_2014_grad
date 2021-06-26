/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Thu Jun 17 14:04:12 2021
/////////////////////////////////////////////////////////////


module STI_DAC_DW01_inc_1_DW01_inc_2 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module STI_DAC ( clk, reset, load, pi_data, pi_length, pi_fill, pi_msb, pi_low, 
        pi_end, so_data, so_valid, oem_finish, oem_dataout, oem_addr, odd1_wr, 
        odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr );
  input [15:0] pi_data;
  input [1:0] pi_length;
  output [7:0] oem_dataout;
  output [4:0] oem_addr;
  input clk, reset, load, pi_fill, pi_msb, pi_low, pi_end;
  output so_data, so_valid, oem_finish, odd1_wr, odd2_wr, odd3_wr, odd4_wr,
         even1_wr, even2_wr, even3_wr, even4_wr;
  wire   N39, N40, N41, N42, N43, n414, n415, n416, n417, N124, N125, N126,
         N127, N144, N145, N146, N147, N149, N150, N151, N152, N164, N202,
         N203, N204, N205, N206, N207, N208, N209, N211, N212, N213, N214,
         N222, N229, N238, N247, N256, N265, N274, N283, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n167, n168, n169, n170,
         n171, n172, n173, n177, n178, n179, n180, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n465, n466, n467,
         n468, n469, n470, n474, n471, n475, n472, n476, n473, n477, n246,
         n464, n248, n463, n250, n462, n252, n461, n254, n460, n256, n459,
         n258, n458, n260, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n418, n420, n422, n424, n426, n428, n430, n432, n434, n436,
         n438, n440, n442, n444, n446, n448, n450, n452, n454, n456;
  wire   [4:0] serial_counter;
  wire   [31:0] data_buffer;
  wire   [7:0] mem_counter;
  wire   [4:0] delay_buffer;
  wire   [4:2] \add_239_S2/carry ;
  wire   [4:2] \add_175/carry ;

  DFFRX1 \mem_counter_reg[3]  ( .D(n190), .CK(clk), .RN(n413), .Q(
        mem_counter[3]), .QN(n157) );
  DFFRX1 \mem_counter_reg[4]  ( .D(n188), .CK(clk), .RN(n299), .Q(
        mem_counter[4]), .QN(n158) );
  DFFRX1 \mem_counter_reg[5]  ( .D(n187), .CK(clk), .RN(n299), .Q(
        mem_counter[5]), .QN(n156) );
  DFFRX1 \data_buffer_index_reg[4]  ( .D(n206), .CK(clk), .RN(n300), .Q(N43), 
        .QN(n177) );
  DFFRX1 \delay_buffer_reg[0]  ( .D(n173), .CK(clk), .RN(n299), .Q(
        delay_buffer[0]), .QN(n262) );
  DFFRX1 \mem_counter_reg[6]  ( .D(n186), .CK(clk), .RN(n299), .Q(
        mem_counter[6]), .QN(n154) );
  DFFRX1 \mem_counter_reg[1]  ( .D(n192), .CK(clk), .RN(n301), .Q(
        mem_counter[1]), .QN(n153) );
  DFFRX1 \mem_counter_reg[2]  ( .D(n191), .CK(clk), .RN(n301), .Q(
        mem_counter[2]), .QN(n152) );
  DFFRX1 \mem_counter_reg[0]  ( .D(n193), .CK(clk), .RN(n301), .Q(
        mem_counter[0]), .QN(n151) );
  DFFRX1 \mem_counter_reg[7]  ( .D(n185), .CK(clk), .RN(n299), .Q(
        mem_counter[7]), .QN(n155) );
  DFFRXL \current_state_reg[1]  ( .D(n184), .CK(clk), .RN(n300), .Q(n409), 
        .QN(n353) );
  DFFRX1 \data_buffer_index_reg[3]  ( .D(n207), .CK(clk), .RN(n300), .Q(N42), 
        .QN(n178) );
  DFFRX1 \data_buffer_index_reg[2]  ( .D(n208), .CK(clk), .RN(n300), .Q(N41), 
        .QN(n179) );
  DFFRX1 \data_buffer_index_reg[1]  ( .D(n209), .CK(clk), .RN(n300), .Q(N40), 
        .QN(n180) );
  DFFRX1 so_valid_reg ( .D(n216), .CK(clk), .RN(n300), .Q(n415), .QN(n260) );
  DFFRX1 oem_finish_reg ( .D(n168), .CK(clk), .RN(n302), .Q(n416), .QN(n167)
         );
  DFFRX1 \DAC_buffer_reg[7]  ( .D(n198), .CK(clk), .RN(n301), .Q(n417), .QN(
        n150) );
  DFFRX1 so_data_reg ( .D(N164), .CK(clk), .RN(n300), .Q(n414), .QN(n149) );
  DFFRX1 \delay_buffer_reg[4]  ( .D(n169), .CK(clk), .RN(n413), .Q(
        delay_buffer[4]) );
  DFFRX1 \delay_buffer_reg[3]  ( .D(n170), .CK(clk), .RN(n413), .Q(
        delay_buffer[3]) );
  DFFRX1 \delay_buffer_reg[2]  ( .D(n171), .CK(clk), .RN(n413), .Q(
        delay_buffer[2]) );
  DFFRX1 \delay_buffer_reg[1]  ( .D(n172), .CK(clk), .RN(n413), .Q(
        delay_buffer[1]) );
  DFFRX1 \current_state_reg[0]  ( .D(n183), .CK(clk), .RN(n413), .Q(n408), 
        .QN(n354) );
  DFFRX1 \counter_16bit_reg[0]  ( .D(n197), .CK(clk), .RN(n413), .Q(n412), 
        .QN(n374) );
  DFFRX1 \counter_16bit_reg[3]  ( .D(n194), .CK(clk), .RN(n413), .Q(n410), 
        .QN(n350) );
  DFFRX1 \counter_16bit_reg[2]  ( .D(n195), .CK(clk), .RN(n413), .Q(n411), 
        .QN(n375) );
  DFFSXL \serial_counter_reg[4]  ( .D(n214), .CK(clk), .SN(n413), .Q(
        serial_counter[4]), .QN(n315) );
  DFFSXL \serial_counter_reg[3]  ( .D(n213), .CK(clk), .SN(n413), .Q(
        serial_counter[3]), .QN(n322) );
  DFFSX1 \serial_counter_reg[1]  ( .D(n211), .CK(clk), .SN(n413), .Q(
        serial_counter[1]), .QN(n325) );
  DFFRX1 \data_buffer_index_reg[0]  ( .D(n210), .CK(clk), .RN(n413), .Q(N39), 
        .QN(n295) );
  DFFSX1 \serial_counter_reg[2]  ( .D(n212), .CK(clk), .SN(n413), .Q(
        serial_counter[2]), .QN(n306) );
  DFFSX1 \serial_counter_reg[0]  ( .D(n215), .CK(clk), .SN(n413), .Q(
        serial_counter[0]), .QN(n311) );
  NOR2X1 U192 ( .A(serial_counter[1]), .B(serial_counter[0]), .Y(n303) );
  AO21XL U193 ( .A0(serial_counter[0]), .A1(serial_counter[1]), .B0(n303), .Y(
        N124) );
  NOR4XL U194 ( .A(n365), .B(pi_end), .C(serial_counter[1]), .D(
        serial_counter[0]), .Y(n364) );
  NAND2X2 U209 ( .A(N40), .B(n295), .Y(n285) );
  NAND2X2 U210 ( .A(n295), .B(n180), .Y(n283) );
  NAND3X2 U211 ( .A(n398), .B(n399), .C(n321), .Y(n391) );
  NAND2X2 U212 ( .A(N40), .B(N39), .Y(n286) );
  OAI21X1 U213 ( .A0(n364), .A1(n327), .B0(n354), .Y(n184) );
  NAND2X2 U214 ( .A(N39), .B(n180), .Y(n284) );
  NAND2X2 U215 ( .A(n410), .B(n298), .Y(n370) );
  CLKBUFX2 U216 ( .A(n351), .Y(n298) );
  INVX3 U217 ( .A(n320), .Y(n312) );
  BUFX12 U218 ( .A(n414), .Y(so_data) );
  BUFX12 U219 ( .A(n417), .Y(oem_dataout[7]) );
  BUFX12 U220 ( .A(n416), .Y(oem_finish) );
  INVX12 U228 ( .A(n260), .Y(so_valid) );
  CLKBUFX3 U229 ( .A(n299), .Y(n302) );
  CLKBUFX3 U230 ( .A(n299), .Y(n301) );
  NOR2X1 U231 ( .A(n321), .B(n398), .Y(n319) );
  CLKBUFX3 U232 ( .A(n378), .Y(n297) );
  NAND2X1 U233 ( .A(n319), .B(n402), .Y(n378) );
  CLKBUFX3 U234 ( .A(n380), .Y(n296) );
  NAND2X1 U235 ( .A(n318), .B(n402), .Y(n380) );
  NAND2X2 U236 ( .A(n341), .B(n355), .Y(n342) );
  NOR3X1 U237 ( .A(n344), .B(n374), .C(n375), .Y(n351) );
  CLKBUFX3 U238 ( .A(n299), .Y(n300) );
  NAND2BX1 U239 ( .AN(N39), .B(n333), .Y(n329) );
  OA21X2 U240 ( .A0(pi_length[1]), .A1(n321), .B0(n401), .Y(n400) );
  NAND2BX1 U241 ( .AN(serial_counter[0]), .B(n314), .Y(n313) );
  CLKINVX2 U242 ( .A(n415), .Y(n341) );
  MXI2X1 U243 ( .A(delay_buffer[0]), .B(n262), .S0(n370), .Y(n173) );
  ADDHXL U244 ( .A(N40), .B(N39), .CO(\add_175/carry [2]), .S(N149) );
  ADDHXL U245 ( .A(N41), .B(\add_175/carry [2]), .CO(\add_175/carry [3]), .S(
        N150) );
  ADDHXL U246 ( .A(N42), .B(\add_175/carry [3]), .CO(\add_175/carry [4]), .S(
        N151) );
  ADDHXL U247 ( .A(delay_buffer[1]), .B(delay_buffer[0]), .CO(
        \add_239_S2/carry [2]), .S(N211) );
  ADDHXL U248 ( .A(delay_buffer[2]), .B(\add_239_S2/carry [2]), .CO(
        \add_239_S2/carry [3]), .S(N212) );
  ADDHXL U249 ( .A(delay_buffer[3]), .B(\add_239_S2/carry [3]), .CO(
        \add_239_S2/carry [4]), .S(N213) );
  CLKBUFX3 U250 ( .A(n413), .Y(n299) );
  OAI22XL U251 ( .A0(data_buffer[13]), .A1(n284), .B0(data_buffer[12]), .B1(
        n283), .Y(n264) );
  OAI22XL U252 ( .A0(data_buffer[15]), .A1(n286), .B0(data_buffer[14]), .B1(
        n285), .Y(n263) );
  OAI21XL U253 ( .A0(n264), .A1(n263), .B0(N41), .Y(n268) );
  OAI22XL U254 ( .A0(data_buffer[9]), .A1(n284), .B0(data_buffer[8]), .B1(n283), .Y(n266) );
  OAI22XL U255 ( .A0(data_buffer[11]), .A1(n286), .B0(data_buffer[10]), .B1(
        n285), .Y(n265) );
  OAI21XL U256 ( .A0(n266), .A1(n265), .B0(n179), .Y(n267) );
  AOI21X1 U257 ( .A0(n268), .A1(n267), .B0(n178), .Y(n294) );
  OAI22XL U258 ( .A0(data_buffer[5]), .A1(n284), .B0(data_buffer[4]), .B1(n283), .Y(n270) );
  OAI22XL U259 ( .A0(data_buffer[7]), .A1(n286), .B0(data_buffer[6]), .B1(n285), .Y(n269) );
  OAI21XL U260 ( .A0(n270), .A1(n269), .B0(N41), .Y(n274) );
  OAI22XL U261 ( .A0(data_buffer[1]), .A1(n284), .B0(data_buffer[0]), .B1(n283), .Y(n272) );
  OAI22XL U262 ( .A0(data_buffer[3]), .A1(n286), .B0(data_buffer[2]), .B1(n285), .Y(n271) );
  OAI21XL U263 ( .A0(n272), .A1(n271), .B0(n179), .Y(n273) );
  AOI21X1 U264 ( .A0(n274), .A1(n273), .B0(N42), .Y(n293) );
  OAI22XL U265 ( .A0(data_buffer[21]), .A1(n284), .B0(data_buffer[20]), .B1(
        n283), .Y(n276) );
  OAI22XL U266 ( .A0(data_buffer[23]), .A1(n286), .B0(data_buffer[22]), .B1(
        n285), .Y(n275) );
  OAI21XL U267 ( .A0(n276), .A1(n275), .B0(N41), .Y(n280) );
  OAI22XL U268 ( .A0(data_buffer[17]), .A1(n284), .B0(data_buffer[16]), .B1(
        n283), .Y(n278) );
  OAI22XL U269 ( .A0(data_buffer[19]), .A1(n286), .B0(data_buffer[18]), .B1(
        n285), .Y(n277) );
  OAI21XL U270 ( .A0(n278), .A1(n277), .B0(n179), .Y(n279) );
  AOI21X1 U271 ( .A0(n280), .A1(n279), .B0(N42), .Y(n292) );
  OAI22XL U272 ( .A0(data_buffer[29]), .A1(n284), .B0(data_buffer[28]), .B1(
        n283), .Y(n282) );
  OAI22XL U273 ( .A0(data_buffer[31]), .A1(n286), .B0(data_buffer[30]), .B1(
        n285), .Y(n281) );
  OAI21XL U274 ( .A0(n282), .A1(n281), .B0(N41), .Y(n290) );
  OAI22XL U275 ( .A0(data_buffer[25]), .A1(n284), .B0(data_buffer[24]), .B1(
        n283), .Y(n288) );
  OAI22XL U276 ( .A0(data_buffer[27]), .A1(n286), .B0(data_buffer[26]), .B1(
        n285), .Y(n287) );
  OAI21XL U277 ( .A0(n288), .A1(n287), .B0(n179), .Y(n289) );
  AOI21X1 U278 ( .A0(n290), .A1(n289), .B0(n178), .Y(n291) );
  OAI33X1 U279 ( .A0(n294), .A1(N43), .A2(n293), .B0(n177), .B1(n292), .B2(
        n291), .Y(N164) );
  OA21X2 U280 ( .A0(pi_length[1]), .A1(n399), .B0(n400), .Y(n389) );
  NAND2X1 U281 ( .A(n303), .B(n306), .Y(n304) );
  OAI21XL U282 ( .A0(n303), .A1(n306), .B0(n304), .Y(N125) );
  XNOR2X1 U283 ( .A(serial_counter[3]), .B(n304), .Y(N126) );
  NOR2X1 U284 ( .A(serial_counter[3]), .B(n304), .Y(n305) );
  XOR2X1 U285 ( .A(serial_counter[4]), .B(n305), .Y(N127) );
  NOR2X1 U286 ( .A(N40), .B(N39), .Y(n307) );
  AO21X1 U287 ( .A0(N39), .A1(N40), .B0(n307), .Y(N144) );
  NAND2X1 U288 ( .A(n307), .B(n179), .Y(n308) );
  OAI21XL U289 ( .A0(n307), .A1(n179), .B0(n308), .Y(N145) );
  XNOR2X1 U290 ( .A(N42), .B(n308), .Y(N146) );
  NOR2X1 U291 ( .A(N42), .B(n308), .Y(n309) );
  XOR2X1 U292 ( .A(N43), .B(n309), .Y(N147) );
  XOR2X1 U293 ( .A(\add_175/carry [4]), .B(N43), .Y(N152) );
  XOR2X1 U294 ( .A(\add_239_S2/carry [4]), .B(delay_buffer[4]), .Y(N214) );
  OAI211X1 U295 ( .A0(n310), .A1(n311), .B0(n312), .C0(n313), .Y(n215) );
  OAI211X1 U296 ( .A0(n310), .A1(n315), .B0(n316), .C0(n317), .Y(n214) );
  NAND2X1 U297 ( .A(N127), .B(n314), .Y(n317) );
  OAI21XL U298 ( .A0(n318), .A1(n319), .B0(n320), .Y(n316) );
  OAI221XL U299 ( .A0(n321), .A1(n312), .B0(n310), .B1(n322), .C0(n323), .Y(
        n213) );
  NAND2X1 U300 ( .A(N126), .B(n314), .Y(n323) );
  OAI211X1 U301 ( .A0(n310), .A1(n306), .B0(n312), .C0(n324), .Y(n212) );
  NAND2X1 U302 ( .A(N125), .B(n314), .Y(n324) );
  OAI211X1 U303 ( .A0(n310), .A1(n325), .B0(n312), .C0(n326), .Y(n211) );
  NAND2X1 U304 ( .A(N124), .B(n314), .Y(n326) );
  CLKINVX1 U305 ( .A(n327), .Y(n314) );
  NAND2X1 U306 ( .A(n327), .B(n312), .Y(n310) );
  OAI211X1 U307 ( .A0(n295), .A1(n328), .B0(n329), .C0(n330), .Y(n210) );
  AOI21X1 U308 ( .A0(n295), .A1(n331), .B0(n332), .Y(n330) );
  OAI211X1 U309 ( .A0(n180), .A1(n328), .B0(n334), .C0(n335), .Y(n209) );
  AOI21X1 U310 ( .A0(N149), .A1(n331), .B0(n332), .Y(n335) );
  NAND2X1 U311 ( .A(N144), .B(n333), .Y(n334) );
  OAI211X1 U312 ( .A0(n179), .A1(n328), .B0(n336), .C0(n337), .Y(n208) );
  AOI21X1 U313 ( .A0(N150), .A1(n331), .B0(n332), .Y(n337) );
  NAND2X1 U314 ( .A(N145), .B(n333), .Y(n336) );
  OAI221XL U315 ( .A0(n178), .A1(n328), .B0(pi_length[0]), .B1(n312), .C0(n338), .Y(n207) );
  AOI221XL U316 ( .A0(N146), .A1(n333), .B0(N151), .B1(n331), .C0(n332), .Y(
        n338) );
  OAI221XL U317 ( .A0(n177), .A1(n328), .B0(pi_length[1]), .B1(n312), .C0(n339), .Y(n206) );
  AOI221XL U318 ( .A0(N147), .A1(n333), .B0(N152), .B1(n331), .C0(n332), .Y(
        n339) );
  NOR2BX1 U319 ( .AN(pi_msb), .B(n312), .Y(n332) );
  NOR2BX1 U320 ( .AN(n216), .B(pi_msb), .Y(n331) );
  AND2X1 U321 ( .A(n216), .B(pi_msb), .Y(n333) );
  OR2X1 U322 ( .A(n216), .B(n320), .Y(n328) );
  NOR2X1 U323 ( .A(n340), .B(n184), .Y(n320) );
  AND2X1 U324 ( .A(n184), .B(n340), .Y(n216) );
  CLKINVX1 U325 ( .A(n183), .Y(n340) );
  OAI22XL U326 ( .A0(n149), .A1(n341), .B0(n342), .B1(n246), .Y(n205) );
  OAI22XL U327 ( .A0(n246), .A1(n341), .B0(n342), .B1(n248), .Y(n204) );
  OAI22XL U328 ( .A0(n341), .A1(n248), .B0(n342), .B1(n250), .Y(n203) );
  OAI22XL U329 ( .A0(n341), .A1(n250), .B0(n342), .B1(n252), .Y(n202) );
  OAI22XL U330 ( .A0(n341), .A1(n252), .B0(n342), .B1(n254), .Y(n201) );
  OAI22XL U331 ( .A0(n341), .A1(n254), .B0(n342), .B1(n256), .Y(n200) );
  OAI22XL U332 ( .A0(n341), .A1(n256), .B0(n342), .B1(n258), .Y(n199) );
  OAI22XL U333 ( .A0(n341), .A1(n258), .B0(n342), .B1(n150), .Y(n198) );
  XOR2X1 U334 ( .A(n412), .B(n343), .Y(n197) );
  XOR2X1 U335 ( .A(n344), .B(n345), .Y(n196) );
  XOR2X1 U336 ( .A(n411), .B(n346), .Y(n195) );
  NOR2X1 U337 ( .A(n344), .B(n345), .Y(n346) );
  NAND2X1 U338 ( .A(n343), .B(n412), .Y(n345) );
  CLKINVX1 U339 ( .A(n347), .Y(n343) );
  OAI22XL U340 ( .A0(n347), .A1(n348), .B0(n349), .B1(n350), .Y(n194) );
  NOR2BX1 U341 ( .AN(n298), .B(n347), .Y(n349) );
  NAND2X1 U342 ( .A(n342), .B(n352), .Y(n347) );
  OAI21XL U343 ( .A0(n353), .A1(n354), .B0(n341), .Y(n352) );
  MXI2X1 U344 ( .A(n151), .B(n356), .S0(n298), .Y(n193) );
  CLKINVX1 U345 ( .A(N202), .Y(n356) );
  MXI2X1 U346 ( .A(n153), .B(n357), .S0(n298), .Y(n192) );
  CLKINVX1 U347 ( .A(N203), .Y(n357) );
  MXI2X1 U348 ( .A(n152), .B(n358), .S0(n298), .Y(n191) );
  CLKINVX1 U349 ( .A(N204), .Y(n358) );
  MXI2X1 U350 ( .A(n157), .B(n359), .S0(n298), .Y(n190) );
  CLKINVX1 U351 ( .A(N205), .Y(n359) );
  MXI2X1 U352 ( .A(n157), .B(n360), .S0(n361), .Y(n189) );
  MXI2X1 U353 ( .A(n158), .B(n362), .S0(n298), .Y(n188) );
  CLKINVX1 U354 ( .A(N206), .Y(n362) );
  MXI2X1 U355 ( .A(n156), .B(n363), .S0(n298), .Y(n187) );
  CLKINVX1 U356 ( .A(N207), .Y(n363) );
  CLKMX2X2 U357 ( .A(mem_counter[6]), .B(N208), .S0(n298), .Y(n186) );
  CLKMX2X2 U358 ( .A(mem_counter[7]), .B(N209), .S0(n298), .Y(n185) );
  NAND3X1 U359 ( .A(n322), .B(n315), .C(n306), .Y(n365) );
  AO21X1 U360 ( .A0(n366), .A1(n367), .B0(n368), .Y(n183) );
  MXI2X1 U361 ( .A(n369), .B(n353), .S0(n408), .Y(n368) );
  NAND2X1 U362 ( .A(load), .B(n353), .Y(n369) );
  NOR4X1 U363 ( .A(serial_counter[4]), .B(serial_counter[3]), .C(
        serial_counter[2]), .D(serial_counter[1]), .Y(n367) );
  NOR3X1 U364 ( .A(n355), .B(serial_counter[0]), .C(n327), .Y(n366) );
  NAND2X1 U365 ( .A(n409), .B(n354), .Y(n327) );
  CLKINVX1 U366 ( .A(pi_end), .Y(n355) );
  CLKMX2X2 U367 ( .A(N211), .B(delay_buffer[1]), .S0(n370), .Y(n172) );
  CLKMX2X2 U368 ( .A(N212), .B(delay_buffer[2]), .S0(n370), .Y(n171) );
  CLKMX2X2 U369 ( .A(N213), .B(delay_buffer[3]), .S0(n370), .Y(n170) );
  CLKMX2X2 U370 ( .A(N214), .B(delay_buffer[4]), .S0(n370), .Y(n169) );
  OAI31XL U371 ( .A0(n371), .A1(n372), .A2(n373), .B0(n167), .Y(n168) );
  NAND2X1 U372 ( .A(pi_end), .B(n374), .Y(n373) );
  NAND3X1 U373 ( .A(n344), .B(n350), .C(n375), .Y(n372) );
  NAND4X1 U374 ( .A(n158), .B(n157), .C(n376), .D(n156), .Y(n371) );
  NOR2X1 U375 ( .A(n361), .B(n377), .Y(n376) );
  NAND3X1 U376 ( .A(n152), .B(n151), .C(n153), .Y(n361) );
  OAI22XL U377 ( .A0(n297), .A1(n379), .B0(n296), .B1(n381), .Y(data_buffer[9]) );
  OAI22XL U378 ( .A0(n297), .A1(n382), .B0(n296), .B1(n383), .Y(data_buffer[8]) );
  NOR2X1 U379 ( .A(n297), .B(n384), .Y(data_buffer[7]) );
  NOR2X1 U380 ( .A(n297), .B(n385), .Y(data_buffer[6]) );
  NOR2X1 U381 ( .A(n297), .B(n386), .Y(data_buffer[5]) );
  NOR2X1 U382 ( .A(n297), .B(n387), .Y(data_buffer[4]) );
  NOR2X1 U383 ( .A(n297), .B(n388), .Y(data_buffer[3]) );
  OAI22XL U384 ( .A0(n389), .A1(n390), .B0(n384), .B1(n391), .Y(
        data_buffer[31]) );
  OAI22XL U385 ( .A0(n389), .A1(n392), .B0(n385), .B1(n391), .Y(
        data_buffer[30]) );
  NOR2X1 U386 ( .A(n297), .B(n393), .Y(data_buffer[2]) );
  OAI22XL U387 ( .A0(n389), .A1(n394), .B0(n386), .B1(n391), .Y(
        data_buffer[29]) );
  OAI22XL U388 ( .A0(n389), .A1(n395), .B0(n387), .B1(n391), .Y(
        data_buffer[28]) );
  OAI22XL U389 ( .A0(n389), .A1(n396), .B0(n388), .B1(n391), .Y(
        data_buffer[27]) );
  OAI22XL U390 ( .A0(n389), .A1(n397), .B0(n391), .B1(n393), .Y(
        data_buffer[26]) );
  OAI22XL U391 ( .A0(n389), .A1(n379), .B0(n381), .B1(n391), .Y(
        data_buffer[25]) );
  OAI22XL U392 ( .A0(n389), .A1(n382), .B0(n383), .B1(n391), .Y(
        data_buffer[24]) );
  CLKINVX1 U393 ( .A(pi_low), .Y(n399) );
  OAI22XL U394 ( .A0(n296), .A1(n390), .B0(n400), .B1(n384), .Y(
        data_buffer[23]) );
  OAI22XL U395 ( .A0(n296), .A1(n392), .B0(n400), .B1(n385), .Y(
        data_buffer[22]) );
  OAI22XL U396 ( .A0(n296), .A1(n394), .B0(n400), .B1(n386), .Y(
        data_buffer[21]) );
  OAI22XL U397 ( .A0(n296), .A1(n395), .B0(n400), .B1(n387), .Y(
        data_buffer[20]) );
  NOR2X1 U398 ( .A(n381), .B(n297), .Y(data_buffer[1]) );
  OAI22XL U399 ( .A0(n296), .A1(n396), .B0(n400), .B1(n388), .Y(
        data_buffer[19]) );
  OAI22XL U400 ( .A0(n296), .A1(n397), .B0(n400), .B1(n393), .Y(
        data_buffer[18]) );
  OAI22XL U401 ( .A0(n296), .A1(n379), .B0(n400), .B1(n381), .Y(
        data_buffer[17]) );
  CLKINVX1 U402 ( .A(pi_data[1]), .Y(n381) );
  CLKINVX1 U403 ( .A(pi_data[9]), .Y(n379) );
  OAI22XL U404 ( .A0(n296), .A1(n382), .B0(n400), .B1(n383), .Y(
        data_buffer[16]) );
  OAI21XL U405 ( .A0(n319), .A1(n318), .B0(pi_fill), .Y(n401) );
  CLKINVX1 U406 ( .A(pi_data[8]), .Y(n382) );
  OAI22XL U407 ( .A0(n297), .A1(n390), .B0(n296), .B1(n384), .Y(
        data_buffer[15]) );
  CLKINVX1 U408 ( .A(pi_data[7]), .Y(n384) );
  CLKINVX1 U409 ( .A(pi_data[15]), .Y(n390) );
  OAI22XL U410 ( .A0(n297), .A1(n392), .B0(n296), .B1(n385), .Y(
        data_buffer[14]) );
  CLKINVX1 U411 ( .A(pi_data[6]), .Y(n385) );
  CLKINVX1 U412 ( .A(pi_data[14]), .Y(n392) );
  OAI22XL U413 ( .A0(n297), .A1(n394), .B0(n296), .B1(n386), .Y(
        data_buffer[13]) );
  CLKINVX1 U414 ( .A(pi_data[5]), .Y(n386) );
  CLKINVX1 U415 ( .A(pi_data[13]), .Y(n394) );
  OAI22XL U416 ( .A0(n297), .A1(n395), .B0(n296), .B1(n387), .Y(
        data_buffer[12]) );
  CLKINVX1 U417 ( .A(pi_data[4]), .Y(n387) );
  CLKINVX1 U418 ( .A(pi_data[12]), .Y(n395) );
  OAI22XL U419 ( .A0(n297), .A1(n396), .B0(n296), .B1(n388), .Y(
        data_buffer[11]) );
  CLKINVX1 U420 ( .A(pi_data[3]), .Y(n388) );
  CLKINVX1 U421 ( .A(pi_data[11]), .Y(n396) );
  OAI22XL U422 ( .A0(n297), .A1(n397), .B0(n296), .B1(n393), .Y(
        data_buffer[10]) );
  CLKINVX1 U423 ( .A(pi_data[2]), .Y(n393) );
  NOR2X1 U424 ( .A(n398), .B(pi_length[0]), .Y(n318) );
  CLKINVX1 U425 ( .A(pi_data[10]), .Y(n397) );
  NOR2X1 U426 ( .A(n297), .B(n383), .Y(data_buffer[0]) );
  CLKINVX1 U427 ( .A(pi_data[0]), .Y(n383) );
  CLKINVX1 U428 ( .A(pi_fill), .Y(n402) );
  CLKINVX1 U429 ( .A(pi_length[1]), .Y(n398) );
  CLKINVX1 U430 ( .A(pi_length[0]), .Y(n321) );
  NOR2X1 U431 ( .A(n403), .B(n404), .Y(N283) );
  NOR2X1 U432 ( .A(n404), .B(n405), .Y(N274) );
  NOR3X1 U433 ( .A(n403), .B(n155), .C(n406), .Y(N265) );
  NOR3X1 U434 ( .A(n405), .B(n155), .C(n406), .Y(N256) );
  CLKINVX1 U435 ( .A(n404), .Y(n406) );
  NAND2X1 U436 ( .A(mem_counter[7]), .B(mem_counter[6]), .Y(n404) );
  NOR3X1 U437 ( .A(n403), .B(n407), .C(mem_counter[7]), .Y(N247) );
  NOR3X1 U438 ( .A(n405), .B(n407), .C(mem_counter[7]), .Y(N238) );
  CLKINVX1 U439 ( .A(n377), .Y(n407) );
  NOR2X1 U440 ( .A(n377), .B(n403), .Y(N229) );
  CLKMX2X2 U441 ( .A(n348), .B(n370), .S0(n360), .Y(n403) );
  NOR2X1 U442 ( .A(n377), .B(n405), .Y(N222) );
  CLKMX2X2 U443 ( .A(n370), .B(n348), .S0(n360), .Y(n405) );
  NAND2X1 U444 ( .A(n298), .B(n350), .Y(n348) );
  NAND2X1 U445 ( .A(n155), .B(n154), .Y(n377) );
  STI_DAC_DW01_inc_1_DW01_inc_2 add_231_S2 ( .A(mem_counter), .SUM({N209, N208, 
        N207, N206, N205, N204, N203, N202}) );
  DFFRX1 \oem_addr_reg[3]  ( .D(delay_buffer[3]), .CK(clk), .RN(n413), .Q(n466) );
  DFFRX1 \oem_addr_reg[2]  ( .D(delay_buffer[2]), .CK(clk), .RN(n413), .Q(n467) );
  DFFRX1 \oem_addr_reg[1]  ( .D(delay_buffer[1]), .CK(clk), .RN(n413), .Q(n468) );
  DFFRX1 \oem_addr_reg[0]  ( .D(delay_buffer[0]), .CK(clk), .RN(n413), .Q(n469) );
  DFFRX1 \oem_addr_reg[4]  ( .D(delay_buffer[4]), .CK(clk), .RN(n413), .Q(n465) );
  DFFRX1 odd_even_reg ( .D(n189), .CK(clk), .RN(n413), .QN(n360) );
  DFFRX1 even4_wr_reg ( .D(N283), .CK(clk), .RN(n413), .Q(n477) );
  DFFRX1 odd4_wr_reg ( .D(N274), .CK(clk), .RN(n413), .Q(n473) );
  DFFRX1 odd1_wr_reg ( .D(N222), .CK(clk), .RN(n413), .Q(n470) );
  DFFRX1 even1_wr_reg ( .D(N229), .CK(clk), .RN(n413), .Q(n474) );
  DFFRX1 odd3_wr_reg ( .D(N256), .CK(clk), .RN(n413), .Q(n472) );
  DFFRX1 even3_wr_reg ( .D(N265), .CK(clk), .RN(n413), .Q(n476) );
  DFFRX1 odd2_wr_reg ( .D(N238), .CK(clk), .RN(n413), .Q(n471) );
  DFFRX1 even2_wr_reg ( .D(N247), .CK(clk), .RN(n413), .Q(n475) );
  DFFRX1 \DAC_buffer_reg[6]  ( .D(n199), .CK(clk), .RN(n413), .Q(n458), .QN(
        n258) );
  DFFRX1 \DAC_buffer_reg[5]  ( .D(n200), .CK(clk), .RN(n413), .Q(n459), .QN(
        n256) );
  DFFRX1 \DAC_buffer_reg[4]  ( .D(n201), .CK(clk), .RN(n413), .Q(n460), .QN(
        n254) );
  DFFRX1 \DAC_buffer_reg[3]  ( .D(n202), .CK(clk), .RN(n413), .Q(n461), .QN(
        n252) );
  DFFRX1 \DAC_buffer_reg[2]  ( .D(n203), .CK(clk), .RN(n413), .Q(n462), .QN(
        n250) );
  DFFRX1 \DAC_buffer_reg[1]  ( .D(n204), .CK(clk), .RN(n413), .Q(n463), .QN(
        n248) );
  DFFRX1 \DAC_buffer_reg[0]  ( .D(n205), .CK(clk), .RN(n413), .Q(n464), .QN(
        n246) );
  DFFRX1 \counter_16bit_reg[1]  ( .D(n196), .CK(clk), .RN(n413), .QN(n344) );
  INVXL U195 ( .A(n464), .Y(n418) );
  INVX12 U196 ( .A(n418), .Y(oem_dataout[0]) );
  INVXL U197 ( .A(n463), .Y(n420) );
  INVX12 U198 ( .A(n420), .Y(oem_dataout[1]) );
  INVXL U199 ( .A(n462), .Y(n422) );
  INVX12 U200 ( .A(n422), .Y(oem_dataout[2]) );
  INVXL U201 ( .A(n461), .Y(n424) );
  INVX12 U202 ( .A(n424), .Y(oem_dataout[3]) );
  INVXL U203 ( .A(n460), .Y(n426) );
  INVX12 U204 ( .A(n426), .Y(oem_dataout[4]) );
  INVXL U205 ( .A(n459), .Y(n428) );
  INVX12 U206 ( .A(n428), .Y(oem_dataout[5]) );
  INVXL U207 ( .A(n458), .Y(n430) );
  INVX12 U208 ( .A(n430), .Y(oem_dataout[6]) );
  INVXL U221 ( .A(n475), .Y(n432) );
  INVX12 U222 ( .A(n432), .Y(even2_wr) );
  INVXL U223 ( .A(n471), .Y(n434) );
  INVX12 U224 ( .A(n434), .Y(odd2_wr) );
  INVXL U225 ( .A(n476), .Y(n436) );
  INVX12 U226 ( .A(n436), .Y(even3_wr) );
  INVXL U227 ( .A(n472), .Y(n438) );
  INVX12 U446 ( .A(n438), .Y(odd3_wr) );
  INVXL U447 ( .A(n474), .Y(n440) );
  INVX12 U448 ( .A(n440), .Y(even1_wr) );
  INVXL U449 ( .A(n470), .Y(n442) );
  INVX12 U450 ( .A(n442), .Y(odd1_wr) );
  INVXL U451 ( .A(n473), .Y(n444) );
  INVX12 U452 ( .A(n444), .Y(odd4_wr) );
  INVXL U453 ( .A(n477), .Y(n446) );
  INVX12 U454 ( .A(n446), .Y(even4_wr) );
  INVXL U455 ( .A(n465), .Y(n448) );
  INVX12 U456 ( .A(n448), .Y(oem_addr[4]) );
  INVXL U457 ( .A(n469), .Y(n450) );
  INVX12 U458 ( .A(n450), .Y(oem_addr[0]) );
  INVXL U459 ( .A(n468), .Y(n452) );
  INVX12 U460 ( .A(n452), .Y(oem_addr[1]) );
  INVXL U461 ( .A(n467), .Y(n454) );
  INVX12 U462 ( .A(n454), .Y(oem_addr[2]) );
  INVXL U463 ( .A(n466), .Y(n456) );
  INVX12 U464 ( .A(n456), .Y(oem_addr[3]) );
  INVX8 U465 ( .A(reset), .Y(n413) );
endmodule

