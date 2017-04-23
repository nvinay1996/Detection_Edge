/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Apr 22 01:43:19 2017
/////////////////////////////////////////////////////////////


module grayscale_DW01_add_1 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n5, n6, n7, n8, n9, n10, n11, n13, n15, n16, n17, n18,
         n19, n20, n22, n55;

  FAX1 U2 ( .A(B[7]), .B(A[7]), .C(n5), .YC(SUM[8]), .YS(SUM[7]) );
  FAX1 U3 ( .A(B[6]), .B(A[6]), .C(n6), .YC(n5), .YS(SUM[6]) );
  FAX1 U4 ( .A(B[5]), .B(A[5]), .C(n7), .YC(n6), .YS(SUM[5]) );
  FAX1 U5 ( .A(B[4]), .B(A[4]), .C(n8), .YC(n7), .YS(SUM[4]) );
  XOR2X1 U6 ( .A(n11), .B(n1), .Y(SUM[3]) );
  OAI21X1 U7 ( .A(n11), .B(n9), .C(n10), .Y(n8) );
  NAND2X1 U8 ( .A(n10), .B(n20), .Y(n1) );
  NOR2X1 U10 ( .A(B[3]), .B(A[3]), .Y(n9) );
  NAND2X1 U11 ( .A(B[3]), .B(A[3]), .Y(n10) );
  XNOR2X1 U12 ( .A(n16), .B(n2), .Y(SUM[2]) );
  AOI21X1 U13 ( .A(n55), .B(n16), .C(n13), .Y(n11) );
  NAND2X1 U16 ( .A(n15), .B(n55), .Y(n2) );
  NAND2X1 U19 ( .A(B[2]), .B(A[2]), .Y(n15) );
  XOR2X1 U20 ( .A(n3), .B(n19), .Y(SUM[1]) );
  OAI21X1 U21 ( .A(n17), .B(n19), .C(n18), .Y(n16) );
  NAND2X1 U22 ( .A(n18), .B(n22), .Y(n3) );
  NOR2X1 U24 ( .A(B[1]), .B(A[1]), .Y(n17) );
  NAND2X1 U25 ( .A(B[1]), .B(A[1]), .Y(n18) );
  NAND2X1 U26 ( .A(A[0]), .B(B[0]), .Y(n19) );
  OR2X1 U30 ( .A(B[2]), .B(A[2]), .Y(n55) );
  INVX2 U31 ( .A(n17), .Y(n22) );
  INVX2 U32 ( .A(n9), .Y(n20) );
  INVX2 U33 ( .A(n15), .Y(n13) );
endmodule


module grayscale ( clk, n_rst, i_grayscale_start, i_RGB, 
        o_grayscale_data_ready, o_gray );
  input [31:0] i_RGB;
  output [7:0] o_gray;
  input clk, n_rst, i_grayscale_start;
  output o_grayscale_data_ready;
  wire   N129, N130, N131, N132, N133, N134, N135, N136, n181, n184, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n198, n201, n204,
         n207, n210, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377,
         n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388,
         n389, n390, n391, n392, n393, n394, n395, n396, n397, n398, n399,
         n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410,
         n411, n412, n413, n414, n415, n416, n417, n418, n419, n420, n421,
         n422, n423, n424, n425, n426, n427, n428, n429, n430, n431, n432,
         n433, n434, n435, n436, n437, n438, n439, n440, n441, n442, n443,
         n444, n445, n446, n447, n448, n449, n450, n451, n452, n453, n454,
         n455, n456, n457, n458, n459, n460, n461, n462, n463, n464, n465,
         n466, n467, n468, n469, n470, n471, n472, n473, n474, n475, n476,
         n477, n478, n479, n480, n481, n482, n483, n484, n485, n486, n487,
         n488, n489, n490, n491, n492, n493, n494, n495, n496, n497, n498,
         n499, n500, n501, n502, n503, n504, n505, n506, n507, n508, n509,
         n510, n511, n512, n513, n514, n515, n516, n517, n518, n519, n520,
         n521, n522, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608;
  wire   [7:0] min;
  wire   [7:0] max;
  wire   [8:1] total;
  wire   [7:0] average;
  wire   [7:0] n_average;
  wire   [3:0] curr;
  wire   [3:0] next;
  wire   SYNOPSYS_UNCONNECTED__0;

  DFFSR \o_gray_reg[7]  ( .D(n_average[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(o_gray[7]) );
  DFFSR \o_gray_reg[6]  ( .D(n_average[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(o_gray[6]) );
  DFFSR \o_gray_reg[5]  ( .D(n_average[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(o_gray[5]) );
  DFFSR \o_gray_reg[4]  ( .D(n_average[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(o_gray[4]) );
  DFFSR \o_gray_reg[3]  ( .D(n_average[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(o_gray[3]) );
  DFFSR \o_gray_reg[2]  ( .D(n_average[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(o_gray[2]) );
  DFFSR \o_gray_reg[1]  ( .D(n_average[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(o_gray[1]) );
  DFFSR \o_gray_reg[0]  ( .D(n_average[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(o_gray[0]) );
  DFFSR \average_reg[7]  ( .D(n_average[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(average[7]) );
  DFFSR \average_reg[6]  ( .D(n_average[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(average[6]) );
  DFFSR \average_reg[5]  ( .D(n_average[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(average[5]) );
  DFFSR \average_reg[4]  ( .D(n_average[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(average[4]) );
  DFFSR \average_reg[3]  ( .D(n_average[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(average[3]) );
  DFFSR \average_reg[2]  ( .D(n_average[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(average[2]) );
  DFFSR \average_reg[1]  ( .D(n_average[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(average[1]) );
  DFFSR \average_reg[0]  ( .D(n_average[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(average[0]) );
  DFFSR \curr_reg[0]  ( .D(next[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr[0]) );
  DFFSR \min_reg[4]  ( .D(n198), .CLK(clk), .R(n593), .S(n585), .Q(min[4]) );
  DFFSR \curr_reg[1]  ( .D(next[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr[1]) );
  DFFSR \curr_reg[3]  ( .D(next[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr[3]) );
  DFFSR \min_reg[3]  ( .D(n201), .CLK(clk), .R(n594), .S(n586), .Q(min[3]) );
  DFFSR \curr_reg[2]  ( .D(next[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr[2]) );
  DFFSR \min_reg[5]  ( .D(n195), .CLK(clk), .R(n592), .S(n584), .Q(min[5]) );
  DFFSR \min_reg[6]  ( .D(n194), .CLK(clk), .R(n599), .S(n591), .Q(min[6]) );
  DFFSR \min_reg[7]  ( .D(n193), .CLK(clk), .R(n598), .S(n590), .Q(min[7]) );
  DFFSR \min_reg[0]  ( .D(n210), .CLK(clk), .R(n597), .S(n589), .Q(min[0]) );
  DFFSR \min_reg[1]  ( .D(n207), .CLK(clk), .R(n596), .S(n588), .Q(min[1]) );
  DFFSR \min_reg[2]  ( .D(n204), .CLK(clk), .R(n595), .S(n587), .Q(min[2]) );
  DFFSR o_grayscale_data_ready_reg ( .D(n600), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(o_grayscale_data_ready) );
  DFFSR \max_reg[0]  ( .D(n192), .CLK(clk), .R(n597), .S(n589), .Q(max[0]) );
  DFFSR \max_reg[1]  ( .D(n191), .CLK(clk), .R(n596), .S(n588), .Q(max[1]) );
  DFFSR \max_reg[2]  ( .D(n190), .CLK(clk), .R(n595), .S(n587), .Q(max[2]) );
  DFFSR \max_reg[3]  ( .D(n189), .CLK(clk), .R(n594), .S(n586), .Q(max[3]) );
  DFFSR \max_reg[4]  ( .D(n188), .CLK(clk), .R(n593), .S(n585), .Q(max[4]) );
  DFFSR \max_reg[5]  ( .D(n187), .CLK(clk), .R(n592), .S(n584), .Q(max[5]) );
  DFFSR \max_reg[6]  ( .D(n184), .CLK(clk), .R(n599), .S(n591), .Q(max[6]) );
  DFFSR \max_reg[7]  ( .D(n181), .CLK(clk), .R(n598), .S(n590), .Q(max[7]) );
  DFFSR \total_reg[1]  ( .D(n601), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[1]) );
  DFFSR \total_reg[2]  ( .D(n602), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[2]) );
  DFFSR \total_reg[3]  ( .D(n603), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[3]) );
  DFFSR \total_reg[4]  ( .D(n604), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[4]) );
  DFFSR \total_reg[5]  ( .D(n605), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[5]) );
  DFFSR \total_reg[6]  ( .D(n606), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[6]) );
  DFFSR \total_reg[7]  ( .D(n607), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[7]) );
  DFFSR \total_reg[8]  ( .D(n608), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[8]) );
  grayscale_DW01_add_1 add_184 ( .A({1'b0, min}), .B({1'b0, max}), .CI(1'b0), 
        .SUM({N136, N135, N134, N133, N132, N131, N130, N129, 
        SYNOPSYS_UNCONNECTED__0}) );
  AND2X2 U322 ( .A(curr[1]), .B(n372), .Y(n325) );
  INVX2 U323 ( .A(n447), .Y(n404) );
  INVX2 U324 ( .A(n573), .Y(n326) );
  INVX2 U325 ( .A(n_rst), .Y(n327) );
  INVX2 U326 ( .A(curr[3]), .Y(n414) );
  INVX2 U327 ( .A(n423), .Y(n349) );
  OAI21X1 U328 ( .A(n573), .B(n487), .C(n572), .Y(n328) );
  AOI21X1 U329 ( .A(i_RGB[23]), .B(n349), .C(n328), .Y(n329) );
  INVX2 U330 ( .A(n329), .Y(n193) );
  INVX2 U331 ( .A(i_RGB[31]), .Y(n330) );
  NAND2X1 U332 ( .A(n330), .B(n327), .Y(n598) );
  NAND2X1 U333 ( .A(i_RGB[31]), .B(n327), .Y(n590) );
  INVX2 U334 ( .A(min[6]), .Y(n331) );
  OAI21X1 U335 ( .A(n573), .B(n331), .C(n571), .Y(n332) );
  AOI21X1 U336 ( .A(i_RGB[22]), .B(n349), .C(n332), .Y(n333) );
  INVX2 U337 ( .A(n333), .Y(n194) );
  INVX2 U338 ( .A(i_RGB[30]), .Y(n334) );
  NAND2X1 U339 ( .A(n334), .B(n327), .Y(n599) );
  NAND2X1 U340 ( .A(i_RGB[30]), .B(n327), .Y(n591) );
  OAI21X1 U341 ( .A(n573), .B(n507), .C(n570), .Y(n335) );
  AOI21X1 U342 ( .A(i_RGB[21]), .B(n349), .C(n335), .Y(n336) );
  INVX2 U343 ( .A(n336), .Y(n195) );
  INVX2 U344 ( .A(i_RGB[29]), .Y(n337) );
  NAND2X1 U345 ( .A(n337), .B(n327), .Y(n592) );
  NAND2X1 U346 ( .A(i_RGB[29]), .B(n327), .Y(n584) );
  OAI21X1 U347 ( .A(n573), .B(n496), .C(n569), .Y(n338) );
  AOI21X1 U348 ( .A(i_RGB[20]), .B(n349), .C(n338), .Y(n339) );
  INVX2 U349 ( .A(n339), .Y(n198) );
  INVX2 U350 ( .A(i_RGB[28]), .Y(n340) );
  NAND2X1 U351 ( .A(n340), .B(n327), .Y(n593) );
  NAND2X1 U352 ( .A(i_RGB[28]), .B(n327), .Y(n585) );
  OAI21X1 U353 ( .A(n573), .B(n499), .C(n568), .Y(n341) );
  AOI21X1 U354 ( .A(i_RGB[19]), .B(n349), .C(n341), .Y(n342) );
  INVX2 U355 ( .A(n342), .Y(n201) );
  INVX2 U356 ( .A(i_RGB[27]), .Y(n343) );
  NAND2X1 U357 ( .A(n343), .B(n327), .Y(n594) );
  NAND2X1 U358 ( .A(i_RGB[27]), .B(n327), .Y(n586) );
  INVX2 U359 ( .A(min[2]), .Y(n344) );
  OAI21X1 U360 ( .A(n573), .B(n344), .C(n567), .Y(n345) );
  AOI21X1 U361 ( .A(i_RGB[18]), .B(n349), .C(n345), .Y(n346) );
  INVX2 U362 ( .A(n346), .Y(n204) );
  INVX2 U363 ( .A(i_RGB[26]), .Y(n347) );
  NAND2X1 U364 ( .A(n347), .B(n327), .Y(n595) );
  NAND2X1 U365 ( .A(i_RGB[26]), .B(n327), .Y(n587) );
  INVX2 U366 ( .A(min[1]), .Y(n390) );
  OAI21X1 U367 ( .A(n573), .B(n390), .C(n566), .Y(n348) );
  AOI21X1 U368 ( .A(i_RGB[17]), .B(n349), .C(n348), .Y(n350) );
  INVX2 U369 ( .A(n350), .Y(n207) );
  INVX2 U370 ( .A(i_RGB[25]), .Y(n351) );
  NAND2X1 U371 ( .A(n351), .B(n327), .Y(n596) );
  NAND2X1 U372 ( .A(i_RGB[25]), .B(n327), .Y(n588) );
  NAND3X1 U373 ( .A(curr[3]), .B(curr[0]), .C(n519), .Y(n424) );
  INVX2 U374 ( .A(i_RGB[16]), .Y(n374) );
  NAND2X1 U375 ( .A(i_RGB[24]), .B(n404), .Y(n373) );
  OAI21X1 U376 ( .A(n423), .B(n374), .C(n373), .Y(n353) );
  INVX2 U377 ( .A(min[0]), .Y(n387) );
  INVX2 U378 ( .A(i_RGB[8]), .Y(n392) );
  OAI22X1 U379 ( .A(n573), .B(n387), .C(n424), .D(n392), .Y(n352) );
  OR2X1 U380 ( .A(n353), .B(n352), .Y(n210) );
  INVX2 U381 ( .A(i_RGB[24]), .Y(n354) );
  NAND2X1 U382 ( .A(n354), .B(n327), .Y(n597) );
  NAND2X1 U383 ( .A(i_RGB[24]), .B(n327), .Y(n589) );
  INVX2 U384 ( .A(n444), .Y(n370) );
  OAI21X1 U385 ( .A(n582), .B(n462), .C(n581), .Y(n355) );
  AOI21X1 U386 ( .A(i_RGB[15]), .B(n370), .C(n355), .Y(n356) );
  INVX2 U387 ( .A(n356), .Y(n181) );
  INVX2 U388 ( .A(max[6]), .Y(n357) );
  OAI21X1 U389 ( .A(n582), .B(n357), .C(n580), .Y(n358) );
  AOI21X1 U390 ( .A(i_RGB[14]), .B(n370), .C(n358), .Y(n359) );
  INVX2 U391 ( .A(n359), .Y(n184) );
  OAI21X1 U392 ( .A(n582), .B(n472), .C(n579), .Y(n360) );
  AOI21X1 U393 ( .A(i_RGB[13]), .B(n370), .C(n360), .Y(n361) );
  INVX2 U394 ( .A(n361), .Y(n187) );
  OAI21X1 U395 ( .A(n582), .B(n468), .C(n578), .Y(n362) );
  AOI21X1 U396 ( .A(i_RGB[12]), .B(n370), .C(n362), .Y(n363) );
  INVX2 U397 ( .A(n363), .Y(n188) );
  OAI21X1 U398 ( .A(n582), .B(n479), .C(n577), .Y(n364) );
  AOI21X1 U399 ( .A(i_RGB[11]), .B(n370), .C(n364), .Y(n365) );
  INVX2 U400 ( .A(n365), .Y(n189) );
  INVX2 U401 ( .A(max[2]), .Y(n394) );
  OAI21X1 U402 ( .A(n582), .B(n394), .C(n576), .Y(n366) );
  AOI21X1 U403 ( .A(i_RGB[10]), .B(n370), .C(n366), .Y(n367) );
  INVX2 U404 ( .A(n367), .Y(n190) );
  INVX2 U405 ( .A(max[1]), .Y(n368) );
  OAI21X1 U406 ( .A(n582), .B(n368), .C(n575), .Y(n369) );
  AOI21X1 U407 ( .A(i_RGB[9]), .B(n370), .C(n369), .Y(n371) );
  INVX2 U408 ( .A(n371), .Y(n191) );
  INVX2 U409 ( .A(curr[2]), .Y(n372) );
  NAND2X1 U410 ( .A(n574), .B(n325), .Y(n583) );
  OAI21X1 U411 ( .A(n444), .B(n392), .C(n373), .Y(n376) );
  INVX2 U412 ( .A(max[0]), .Y(n384) );
  OAI22X1 U413 ( .A(n582), .B(n384), .C(n583), .D(n374), .Y(n375) );
  OR2X1 U414 ( .A(n376), .B(n375), .Y(n192) );
  INVX2 U415 ( .A(curr[0]), .Y(n402) );
  NAND3X1 U416 ( .A(curr[3]), .B(n402), .C(n325), .Y(n426) );
  INVX2 U417 ( .A(n426), .Y(n396) );
  MUX2X1 U418 ( .B(total[1]), .A(N129), .S(n396), .Y(n377) );
  INVX2 U419 ( .A(n377), .Y(n601) );
  NAND3X1 U420 ( .A(curr[1]), .B(curr[0]), .C(n405), .Y(n412) );
  INVX2 U421 ( .A(n412), .Y(n399) );
  MUX2X1 U422 ( .B(total[2]), .A(N130), .S(n396), .Y(n378) );
  INVX2 U423 ( .A(n378), .Y(n602) );
  MUX2X1 U424 ( .B(total[3]), .A(N131), .S(n396), .Y(n379) );
  INVX2 U425 ( .A(n379), .Y(n603) );
  MUX2X1 U426 ( .B(total[4]), .A(N132), .S(n396), .Y(n380) );
  INVX2 U427 ( .A(n380), .Y(n604) );
  MUX2X1 U428 ( .B(total[5]), .A(N133), .S(n396), .Y(n381) );
  INVX2 U429 ( .A(n381), .Y(n605) );
  MUX2X1 U430 ( .B(total[6]), .A(N134), .S(n396), .Y(n382) );
  INVX2 U431 ( .A(n382), .Y(n606) );
  MUX2X1 U432 ( .B(total[8]), .A(N136), .S(n396), .Y(n383) );
  INVX2 U433 ( .A(n383), .Y(n608) );
  NAND2X1 U434 ( .A(i_RGB[16]), .B(n384), .Y(n386) );
  INVX2 U435 ( .A(n386), .Y(n385) );
  OAI22X1 U436 ( .A(n385), .B(i_RGB[17]), .C(n394), .D(i_RGB[18]), .Y(n476) );
  OAI21X1 U437 ( .A(n482), .B(n386), .C(max[1]), .Y(n483) );
  OAI22X1 U438 ( .A(n390), .B(i_RGB[17]), .C(i_RGB[16]), .D(n387), .Y(n388) );
  OAI21X1 U439 ( .A(min[1]), .B(n482), .C(n388), .Y(n491) );
  INVX2 U440 ( .A(n583), .Y(n400) );
  NAND2X1 U441 ( .A(min[0]), .B(n392), .Y(n391) );
  INVX2 U442 ( .A(n391), .Y(n389) );
  OAI22X1 U443 ( .A(n543), .B(n389), .C(n541), .D(min[2]), .Y(n537) );
  OAI21X1 U444 ( .A(i_RGB[9]), .B(n391), .C(n390), .Y(n544) );
  INVX2 U445 ( .A(curr[1]), .Y(n403) );
  OAI21X1 U446 ( .A(max[0]), .B(n392), .C(n543), .Y(n393) );
  OAI21X1 U447 ( .A(n394), .B(i_RGB[10]), .C(n393), .Y(n559) );
  NAND2X1 U448 ( .A(i_RGB[8]), .B(i_RGB[9]), .Y(n395) );
  OAI21X1 U449 ( .A(max[0]), .B(n395), .C(max[1]), .Y(n563) );
  INVX2 U450 ( .A(n424), .Y(n401) );
  MUX2X1 U451 ( .B(total[7]), .A(N135), .S(n396), .Y(n397) );
  INVX2 U452 ( .A(n397), .Y(n607) );
  MUX2X1 U453 ( .B(average[6]), .A(total[7]), .S(n399), .Y(n398) );
  INVX2 U454 ( .A(n398), .Y(n_average[6]) );
  NOR2X1 U455 ( .A(curr[2]), .B(n414), .Y(n405) );
  AOI22X1 U456 ( .A(total[1]), .B(n399), .C(average[0]), .D(n412), .Y(n406) );
  AOI22X1 U457 ( .A(total[2]), .B(n399), .C(average[1]), .D(n412), .Y(n407) );
  AOI22X1 U458 ( .A(total[3]), .B(n399), .C(average[2]), .D(n412), .Y(n408) );
  AOI22X1 U459 ( .A(total[4]), .B(n399), .C(average[3]), .D(n412), .Y(n409) );
  AOI22X1 U460 ( .A(total[5]), .B(n399), .C(average[4]), .D(n412), .Y(n410) );
  AOI22X1 U461 ( .A(total[6]), .B(n399), .C(average[5]), .D(n412), .Y(n411) );
  AOI22X1 U462 ( .A(total[8]), .B(n399), .C(average[7]), .D(n412), .Y(n413) );
  INVX2 U463 ( .A(n406), .Y(n_average[0]) );
  INVX2 U464 ( .A(n407), .Y(n_average[1]) );
  INVX2 U465 ( .A(n408), .Y(n_average[2]) );
  INVX2 U466 ( .A(n409), .Y(n_average[3]) );
  INVX2 U467 ( .A(n410), .Y(n_average[4]) );
  INVX2 U468 ( .A(n411), .Y(n_average[5]) );
  INVX2 U469 ( .A(n413), .Y(n_average[7]) );
  OR2X1 U470 ( .A(n415), .B(n416), .Y(next[3]) );
  OAI21X1 U471 ( .A(n417), .B(n418), .C(n419), .Y(n416) );
  NOR2X1 U472 ( .A(n420), .B(n421), .Y(n419) );
  INVX1 U473 ( .A(n422), .Y(n417) );
  NAND3X1 U474 ( .A(n423), .B(n424), .C(n425), .Y(n415) );
  AND2X1 U475 ( .A(n426), .B(n427), .Y(n425) );
  OR2X1 U476 ( .A(n428), .B(n429), .Y(next[2]) );
  OAI21X1 U477 ( .A(n422), .B(n418), .C(n430), .Y(n429) );
  OAI21X1 U478 ( .A(n431), .B(n432), .C(n433), .Y(n428) );
  NAND2X1 U479 ( .A(n434), .B(n435), .Y(n432) );
  INVX1 U480 ( .A(n436), .Y(n435) );
  NAND3X1 U481 ( .A(n437), .B(n438), .C(n439), .Y(next[1]) );
  NOR2X1 U482 ( .A(n440), .B(n441), .Y(n439) );
  OAI21X1 U483 ( .A(n442), .B(n443), .C(n444), .Y(n441) );
  OR2X1 U484 ( .A(n445), .B(n446), .Y(n443) );
  NAND2X1 U485 ( .A(n447), .B(n424), .Y(n440) );
  AOI22X1 U486 ( .A(n448), .B(n449), .C(n421), .D(curr[1]), .Y(n437) );
  INVX1 U487 ( .A(n450), .Y(n449) );
  NOR2X1 U488 ( .A(n451), .B(n427), .Y(n448) );
  OR2X1 U489 ( .A(n452), .B(n453), .Y(next[0]) );
  OAI21X1 U490 ( .A(n402), .B(n433), .C(n438), .Y(n453) );
  INVX1 U491 ( .A(n454), .Y(n438) );
  OAI21X1 U492 ( .A(n422), .B(n418), .C(n455), .Y(n454) );
  AND2X1 U493 ( .A(n456), .B(n426), .Y(n455) );
  OAI21X1 U494 ( .A(n436), .B(n431), .C(n434), .Y(n456) );
  AND2X1 U495 ( .A(n457), .B(n325), .Y(n434) );
  OAI21X1 U496 ( .A(n458), .B(n459), .C(n460), .Y(n431) );
  AOI22X1 U497 ( .A(n461), .B(i_RGB[22]), .C(i_RGB[23]), .D(n462), .Y(n460) );
  NOR2X1 U498 ( .A(max[6]), .B(n463), .Y(n461) );
  OAI21X1 U499 ( .A(i_RGB[21]), .B(n464), .C(n465), .Y(n459) );
  OAI21X1 U500 ( .A(n466), .B(n467), .C(max[5]), .Y(n465) );
  INVX1 U501 ( .A(n467), .Y(n464) );
  NAND2X1 U502 ( .A(i_RGB[20]), .B(n468), .Y(n467) );
  INVX1 U503 ( .A(n469), .Y(n458) );
  NOR2X1 U504 ( .A(n470), .B(n471), .Y(n436) );
  OAI21X1 U505 ( .A(i_RGB[21]), .B(n472), .C(n469), .Y(n471) );
  AOI21X1 U506 ( .A(n473), .B(max[6]), .C(n463), .Y(n469) );
  NOR2X1 U507 ( .A(n462), .B(i_RGB[23]), .Y(n463) );
  OAI21X1 U508 ( .A(i_RGB[20]), .B(n468), .C(n474), .Y(n470) );
  OAI21X1 U509 ( .A(n475), .B(n476), .C(n477), .Y(n474) );
  AOI22X1 U510 ( .A(n478), .B(i_RGB[18]), .C(i_RGB[19]), .D(n479), .Y(n477) );
  NOR2X1 U511 ( .A(max[2]), .B(n480), .Y(n478) );
  NAND2X1 U512 ( .A(n483), .B(n484), .Y(n475) );
  INVX1 U513 ( .A(n480), .Y(n484) );
  NOR2X1 U514 ( .A(n479), .B(i_RGB[19]), .Y(n480) );
  NAND3X1 U515 ( .A(curr[2]), .B(curr[1]), .C(n457), .Y(n418) );
  NOR2X1 U516 ( .A(n485), .B(n486), .Y(n422) );
  OAI22X1 U517 ( .A(i_RGB[23]), .B(n487), .C(n488), .D(n489), .Y(n486) );
  INVX1 U518 ( .A(n490), .Y(n489) );
  AOI21X1 U519 ( .A(n491), .B(n492), .C(n493), .Y(n490) );
  INVX1 U520 ( .A(i_RGB[17]), .Y(n482) );
  OAI21X1 U521 ( .A(min[5]), .B(n466), .C(n494), .Y(n488) );
  AOI22X1 U522 ( .A(n492), .B(n495), .C(i_RGB[20]), .D(n496), .Y(n494) );
  OAI21X1 U523 ( .A(min[2]), .B(n481), .C(n497), .Y(n495) );
  INVX1 U524 ( .A(n498), .Y(n492) );
  OAI21X1 U525 ( .A(i_RGB[19]), .B(n499), .C(n500), .Y(n498) );
  NAND3X1 U526 ( .A(n497), .B(n481), .C(min[2]), .Y(n500) );
  INVX1 U527 ( .A(i_RGB[18]), .Y(n481) );
  NAND2X1 U528 ( .A(i_RGB[19]), .B(n499), .Y(n497) );
  OAI21X1 U529 ( .A(n493), .B(n501), .C(n502), .Y(n485) );
  NAND3X1 U530 ( .A(n503), .B(n473), .C(min[6]), .Y(n502) );
  OAI21X1 U531 ( .A(n504), .B(n466), .C(n505), .Y(n501) );
  OAI21X1 U532 ( .A(i_RGB[21]), .B(n506), .C(n507), .Y(n505) );
  INVX1 U533 ( .A(n504), .Y(n506) );
  INVX1 U534 ( .A(i_RGB[21]), .Y(n466) );
  NOR2X1 U535 ( .A(n496), .B(i_RGB[20]), .Y(n504) );
  OAI21X1 U536 ( .A(min[6]), .B(n473), .C(n503), .Y(n493) );
  NAND2X1 U537 ( .A(i_RGB[23]), .B(n487), .Y(n503) );
  INVX1 U538 ( .A(i_RGB[22]), .Y(n473) );
  INVX1 U539 ( .A(n421), .Y(n433) );
  NOR2X1 U540 ( .A(n508), .B(n509), .Y(n421) );
  NAND3X1 U541 ( .A(n430), .B(n510), .C(n326), .Y(n509) );
  INVX1 U542 ( .A(n457), .Y(n510) );
  INVX1 U543 ( .A(n511), .Y(n430) );
  NAND3X1 U544 ( .A(n445), .B(n444), .C(n512), .Y(n511) );
  NOR2X1 U545 ( .A(n420), .B(n400), .Y(n512) );
  INVX1 U546 ( .A(n513), .Y(n420) );
  NAND3X1 U547 ( .A(curr[3]), .B(curr[0]), .C(n325), .Y(n513) );
  NAND3X1 U548 ( .A(n426), .B(n514), .C(n427), .Y(n508) );
  NAND3X1 U549 ( .A(n515), .B(n516), .C(n517), .Y(n452) );
  OAI21X1 U550 ( .A(n451), .B(n450), .C(n518), .Y(n517) );
  INVX1 U551 ( .A(n427), .Y(n518) );
  NAND3X1 U552 ( .A(n519), .B(n402), .C(curr[3]), .Y(n427) );
  OAI21X1 U553 ( .A(n520), .B(n521), .C(n522), .Y(n450) );
  AOI22X1 U554 ( .A(n523), .B(min[6]), .C(min[7]), .D(n524), .Y(n522) );
  INVX1 U555 ( .A(i_RGB[15]), .Y(n524) );
  AND2X1 U556 ( .A(n525), .B(n526), .Y(n523) );
  OAI21X1 U557 ( .A(n527), .B(n528), .C(n529), .Y(n521) );
  OAI21X1 U558 ( .A(i_RGB[13]), .B(n530), .C(n507), .Y(n529) );
  INVX1 U559 ( .A(min[5]), .Y(n507) );
  INVX1 U560 ( .A(n527), .Y(n530) );
  NOR2X1 U561 ( .A(n496), .B(i_RGB[12]), .Y(n527) );
  INVX1 U562 ( .A(min[4]), .Y(n496) );
  NOR2X1 U563 ( .A(n531), .B(n532), .Y(n451) );
  OAI21X1 U564 ( .A(min[5]), .B(n528), .C(n533), .Y(n532) );
  INVX1 U565 ( .A(n520), .Y(n533) );
  OAI21X1 U566 ( .A(min[6]), .B(n525), .C(n526), .Y(n520) );
  NAND2X1 U567 ( .A(i_RGB[15]), .B(n487), .Y(n526) );
  INVX1 U568 ( .A(min[7]), .Y(n487) );
  OAI21X1 U569 ( .A(min[4]), .B(n534), .C(n535), .Y(n531) );
  OAI21X1 U570 ( .A(n536), .B(n537), .C(n538), .Y(n535) );
  AOI22X1 U571 ( .A(n539), .B(min[2]), .C(min[3]), .D(n540), .Y(n538) );
  INVX1 U572 ( .A(i_RGB[11]), .Y(n540) );
  AND2X1 U573 ( .A(n541), .B(n542), .Y(n539) );
  NAND2X1 U574 ( .A(n544), .B(n542), .Y(n536) );
  NAND2X1 U575 ( .A(i_RGB[11]), .B(n499), .Y(n542) );
  INVX1 U576 ( .A(min[3]), .Y(n499) );
  NAND3X1 U577 ( .A(n457), .B(n519), .C(i_grayscale_start), .Y(n516) );
  OAI21X1 U578 ( .A(n446), .B(n442), .C(n545), .Y(n515) );
  INVX1 U579 ( .A(n445), .Y(n545) );
  NAND3X1 U580 ( .A(curr[2]), .B(n403), .C(n457), .Y(n445) );
  NOR2X1 U581 ( .A(curr[3]), .B(curr[0]), .Y(n457) );
  OAI21X1 U582 ( .A(n546), .B(n547), .C(n548), .Y(n442) );
  AOI22X1 U583 ( .A(n549), .B(i_RGB[14]), .C(i_RGB[15]), .D(n462), .Y(n548) );
  NOR2X1 U584 ( .A(max[6]), .B(n550), .Y(n549) );
  OAI21X1 U585 ( .A(i_RGB[13]), .B(n551), .C(n552), .Y(n547) );
  OAI21X1 U586 ( .A(n553), .B(n528), .C(max[5]), .Y(n552) );
  INVX1 U587 ( .A(i_RGB[13]), .Y(n528) );
  INVX1 U588 ( .A(n551), .Y(n553) );
  NOR2X1 U589 ( .A(n534), .B(max[4]), .Y(n551) );
  INVX1 U590 ( .A(i_RGB[12]), .Y(n534) );
  INVX1 U591 ( .A(n554), .Y(n546) );
  NOR2X1 U592 ( .A(n555), .B(n556), .Y(n446) );
  OAI21X1 U593 ( .A(i_RGB[13]), .B(n472), .C(n554), .Y(n556) );
  AOI21X1 U594 ( .A(n525), .B(max[6]), .C(n550), .Y(n554) );
  NOR2X1 U595 ( .A(n462), .B(i_RGB[15]), .Y(n550) );
  INVX1 U596 ( .A(max[7]), .Y(n462) );
  INVX1 U597 ( .A(i_RGB[14]), .Y(n525) );
  INVX1 U598 ( .A(max[5]), .Y(n472) );
  OAI21X1 U599 ( .A(i_RGB[12]), .B(n468), .C(n557), .Y(n555) );
  OAI21X1 U600 ( .A(n558), .B(n559), .C(n560), .Y(n557) );
  AOI22X1 U601 ( .A(n561), .B(i_RGB[10]), .C(i_RGB[11]), .D(n479), .Y(n560) );
  NOR2X1 U602 ( .A(max[2]), .B(n562), .Y(n561) );
  INVX1 U603 ( .A(i_RGB[10]), .Y(n541) );
  NAND2X1 U604 ( .A(n563), .B(n564), .Y(n558) );
  INVX1 U605 ( .A(n562), .Y(n564) );
  NOR2X1 U606 ( .A(n479), .B(i_RGB[11]), .Y(n562) );
  INVX1 U607 ( .A(max[3]), .Y(n479) );
  INVX1 U608 ( .A(i_RGB[9]), .Y(n543) );
  INVX1 U609 ( .A(max[4]), .Y(n468) );
  INVX1 U610 ( .A(n514), .Y(n600) );
  NAND3X1 U611 ( .A(curr[2]), .B(curr[3]), .C(n565), .Y(n514) );
  NOR2X1 U612 ( .A(curr[1]), .B(curr[0]), .Y(n565) );
  AOI22X1 U613 ( .A(n401), .B(i_RGB[9]), .C(n404), .D(i_RGB[25]), .Y(n566) );
  AOI22X1 U614 ( .A(n401), .B(i_RGB[10]), .C(n404), .D(i_RGB[26]), .Y(n567) );
  AOI22X1 U615 ( .A(n401), .B(i_RGB[11]), .C(n404), .D(i_RGB[27]), .Y(n568) );
  AOI22X1 U616 ( .A(n401), .B(i_RGB[12]), .C(n404), .D(i_RGB[28]), .Y(n569) );
  AOI22X1 U617 ( .A(n401), .B(i_RGB[13]), .C(n404), .D(i_RGB[29]), .Y(n570) );
  AOI22X1 U618 ( .A(n401), .B(i_RGB[14]), .C(n404), .D(i_RGB[30]), .Y(n571) );
  NAND3X1 U619 ( .A(n423), .B(n424), .C(n447), .Y(n573) );
  NAND3X1 U620 ( .A(curr[1]), .B(n574), .C(curr[2]), .Y(n423) );
  AOI22X1 U621 ( .A(n401), .B(i_RGB[15]), .C(n404), .D(i_RGB[31]), .Y(n572) );
  AOI22X1 U622 ( .A(n400), .B(i_RGB[17]), .C(n404), .D(i_RGB[25]), .Y(n575) );
  AOI22X1 U623 ( .A(n400), .B(i_RGB[18]), .C(n404), .D(i_RGB[26]), .Y(n576) );
  AOI22X1 U624 ( .A(n400), .B(i_RGB[19]), .C(n404), .D(i_RGB[27]), .Y(n577) );
  AOI22X1 U625 ( .A(n400), .B(i_RGB[20]), .C(n404), .D(i_RGB[28]), .Y(n578) );
  AOI22X1 U626 ( .A(n400), .B(i_RGB[21]), .C(n404), .D(i_RGB[29]), .Y(n579) );
  AOI22X1 U627 ( .A(n400), .B(i_RGB[22]), .C(n404), .D(i_RGB[30]), .Y(n580) );
  NAND3X1 U628 ( .A(n583), .B(n447), .C(n444), .Y(n582) );
  NAND3X1 U629 ( .A(n574), .B(n403), .C(curr[2]), .Y(n444) );
  AOI22X1 U630 ( .A(n400), .B(i_RGB[23]), .C(n404), .D(i_RGB[31]), .Y(n581) );
  NAND2X1 U631 ( .A(n574), .B(n519), .Y(n447) );
  NOR2X1 U632 ( .A(curr[2]), .B(curr[1]), .Y(n519) );
  NOR2X1 U633 ( .A(n402), .B(curr[3]), .Y(n574) );
endmodule

