/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Apr 22 04:09:31 2017
/////////////////////////////////////////////////////////////


module AHB ( clk, n_rst, hready, re, we, stop, raddr_ready, waddr_ready, waddr, 
        raddr, buffer2_data, hrdata, greyscale_data, haddr, hwdata, hwrite, 
        read_complete, write_complete, inc_raddr, inc_waddr );
  input [31:0] waddr;
  input [31:0] raddr;
  input [31:0] buffer2_data;
  input [31:0] hrdata;
  output [31:0] greyscale_data;
  output [31:0] haddr;
  output [31:0] hwdata;
  input clk, n_rst, hready, re, we, stop, raddr_ready, waddr_ready;
  output hwrite, read_complete, write_complete, inc_raddr, inc_waddr;
  wire   re_ff, we_ff, prev_hwrite, hready_ff, init, init2, raddr_ready_ff,
         waddr_ready_ff, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n75, n80, n81, n82, n83, n86, n87, n88, n91, n92, n93, n96, n97, n98,
         n101, n102, n103, n106, n107, n108, n111, n112, n113, n116, n117,
         n118, n121, n122, n123, n126, n127, n128, n131, n132, n133, n136,
         n137, n138, n141, n142, n143, n146, n147, n148, n151, n152, n153,
         n156, n157, n158, n161, n162, n163, n166, n167, n168, n171, n172,
         n173, n176, n177, n178, n181, n182, n183, n186, n187, n188, n191,
         n192, n193, n196, n197, n198, n201, n202, n203, n206, n207, n208,
         n211, n212, n213, n216, n217, n218, n221, n222, n223, n226, n227,
         n228, n231, n232, n233, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n272, n274, n275, n276, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n315, n318, n319, n323, n325, n327, n328, n331, n333, n334, n337,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n523, n590,
         n591, n592, n593, n594, n595, n596, n597, n598, n599, n600, n601,
         n602, n603, n604, n605, n606, n607, n608, n609, n610, n611, n612,
         n613, n614, n615, n616, n617, n618, n619, n620, n621, n654, n687,
         n688, n689, n690, n691, n692, n693, n694, n2, n3, n4, n39, n74, n76,
         n77, n78, n79, n84, n85, n89, n90, n94, n95, n99, n100, n104, n105,
         n109, n110, n114, n115, n119, n120, n124, n125, n129, n130, n134,
         n135, n139, n140, n144, n145, n149, n150, n154, n155, n159, n160,
         n164, n165, n169, n170, n174, n175, n179, n180, n184, n185, n189,
         n190, n194, n195, n199, n200, n204, n205, n209, n210, n214, n215,
         n219, n220, n224, n225, n229, n230, n234, n235, n236, n237, n271,
         n273, n277, n314, n316, n317, n320, n321, n322, n324, n326, n329,
         n330, n332, n335, n336, n338, n348, n524, n525, n526, n527, n528,
         n529, n530, n531, n532, n533, n534, n535, n536, n537, n538, n539,
         n540, n541, n542, n543, n544, n545, n546, n547, n548, n549, n550,
         n551, n552, n553, n554, n555, n556, n557, n558, n559, n560, n561,
         n562, n563, n564, n565, n566, n567, n568, n569, n570, n571, n572,
         n573, n574, n575, n576, n577, n578, n579, n580, n581, n582, n583,
         n584, n585, n586, n587, n588, n589, n622, n623, n624, n625, n626,
         n627, n628, n629, n630, n631, n632, n633, n634, n635, n636, n637,
         n638, n639, n640, n641, n642, n643, n644, n645, n646, n647, n648,
         n649, n650, n651, n652, n653, n655, n656, n657, n658, n659, n660,
         n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, n671,
         n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682,
         n683, n684, n685, n686, n695, n696, n697, n698, n699, n700, n701,
         n702, n703, n704, n705, n706, n707, n708, n709, n710, n711, n712,
         n713, n714, n715, n716, n717, n718, n719, n720, n721, n722, n723,
         n724, n725, n726, n727, n728, n729, n730, n731, n732, n733, n734,
         n735, n736, n737, n738, n739, n740, n741, n742, n743, n744, n745,
         n746, n747, n748, n749, n750, n751, n752, n753, n754, n755, n756;
  wire   [2:0] Q;
  wire   [31:0] prev_raddr;
  wire   [31:0] prev_waddr;

  DFFSR init_reg ( .D(1'b1), .CLK(clk), .R(n230), .S(1'b1), .Q(init) );
  DFFSR waddr_ready_ff_reg ( .D(n523), .CLK(clk), .R(n230), .S(1'b1), .Q(
        waddr_ready_ff) );
  DFFSR \Q_reg[0]  ( .D(n692), .CLK(clk), .R(n230), .S(1'b1), .Q(Q[0]) );
  DFFSR hwrite_reg ( .D(n39), .CLK(clk), .R(n230), .S(1'b1), .Q(hwrite) );
  DFFSR init2_reg ( .D(n687), .CLK(clk), .R(n230), .S(1'b1), .Q(init2) );
  DFFSR raddr_ready_ff_reg ( .D(n654), .CLK(clk), .R(n230), .S(1'b1), .Q(
        raddr_ready_ff) );
  DFFSR \Q_reg[2]  ( .D(n694), .CLK(clk), .R(n229), .S(1'b1), .Q(Q[2]) );
  DFFSR hready_ff_reg ( .D(n690), .CLK(clk), .R(n229), .S(1'b1), .Q(hready_ff)
         );
  DFFSR re_ff_reg ( .D(n693), .CLK(clk), .R(n229), .S(1'b1), .Q(re_ff) );
  DFFSR \Q_reg[1]  ( .D(n691), .CLK(clk), .R(n229), .S(1'b1), .Q(Q[1]) );
  DFFSR prev_hwrite_reg ( .D(n688), .CLK(clk), .R(n229), .S(1'b1), .Q(
        prev_hwrite) );
  DFFSR read_complete_reg ( .D(n671), .CLK(clk), .R(n229), .S(1'b1), .Q(
        read_complete) );
  DFFSR \greyscale_data_reg[31]  ( .D(n572), .CLK(clk), .R(n229), .S(1'b1), 
        .Q(greyscale_data[31]) );
  DFFSR \greyscale_data_reg[30]  ( .D(n573), .CLK(clk), .R(n229), .S(1'b1), 
        .Q(greyscale_data[30]) );
  DFFSR \greyscale_data_reg[29]  ( .D(n574), .CLK(clk), .R(n229), .S(1'b1), 
        .Q(greyscale_data[29]) );
  DFFSR \greyscale_data_reg[28]  ( .D(n575), .CLK(clk), .R(n229), .S(1'b1), 
        .Q(greyscale_data[28]) );
  DFFSR \greyscale_data_reg[27]  ( .D(n576), .CLK(clk), .R(n229), .S(1'b1), 
        .Q(greyscale_data[27]) );
  DFFSR \greyscale_data_reg[26]  ( .D(n577), .CLK(clk), .R(n229), .S(1'b1), 
        .Q(greyscale_data[26]) );
  DFFSR \greyscale_data_reg[25]  ( .D(n578), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[25]) );
  DFFSR \greyscale_data_reg[24]  ( .D(n579), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[24]) );
  DFFSR \greyscale_data_reg[23]  ( .D(n580), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[23]) );
  DFFSR \greyscale_data_reg[22]  ( .D(n581), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[22]) );
  DFFSR \greyscale_data_reg[21]  ( .D(n582), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[21]) );
  DFFSR \greyscale_data_reg[20]  ( .D(n583), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[20]) );
  DFFSR \greyscale_data_reg[19]  ( .D(n584), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[19]) );
  DFFSR \greyscale_data_reg[18]  ( .D(n585), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[18]) );
  DFFSR \greyscale_data_reg[17]  ( .D(n586), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[17]) );
  DFFSR \greyscale_data_reg[16]  ( .D(n587), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[16]) );
  DFFSR \greyscale_data_reg[15]  ( .D(n588), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[15]) );
  DFFSR \greyscale_data_reg[14]  ( .D(n589), .CLK(clk), .R(n225), .S(1'b1), 
        .Q(greyscale_data[14]) );
  DFFSR \greyscale_data_reg[13]  ( .D(n622), .CLK(clk), .R(n224), .S(1'b1), 
        .Q(greyscale_data[13]) );
  DFFSR \greyscale_data_reg[12]  ( .D(n623), .CLK(clk), .R(n224), .S(1'b1), 
        .Q(greyscale_data[12]) );
  DFFSR \greyscale_data_reg[11]  ( .D(n624), .CLK(clk), .R(n224), .S(1'b1), 
        .Q(greyscale_data[11]) );
  DFFSR \greyscale_data_reg[10]  ( .D(n625), .CLK(clk), .R(n224), .S(1'b1), 
        .Q(greyscale_data[10]) );
  DFFSR \greyscale_data_reg[9]  ( .D(n626), .CLK(clk), .R(n224), .S(1'b1), .Q(
        greyscale_data[9]) );
  DFFSR \greyscale_data_reg[8]  ( .D(n627), .CLK(clk), .R(n224), .S(1'b1), .Q(
        greyscale_data[8]) );
  DFFSR \greyscale_data_reg[7]  ( .D(n628), .CLK(clk), .R(n224), .S(1'b1), .Q(
        greyscale_data[7]) );
  DFFSR \greyscale_data_reg[6]  ( .D(n629), .CLK(clk), .R(n224), .S(1'b1), .Q(
        greyscale_data[6]) );
  DFFSR \greyscale_data_reg[5]  ( .D(n630), .CLK(clk), .R(n224), .S(1'b1), .Q(
        greyscale_data[5]) );
  DFFSR \greyscale_data_reg[4]  ( .D(n631), .CLK(clk), .R(n224), .S(1'b1), .Q(
        greyscale_data[4]) );
  DFFSR \greyscale_data_reg[3]  ( .D(n632), .CLK(clk), .R(n224), .S(1'b1), .Q(
        greyscale_data[3]) );
  DFFSR \greyscale_data_reg[2]  ( .D(n633), .CLK(clk), .R(n224), .S(1'b1), .Q(
        greyscale_data[2]) );
  DFFSR \greyscale_data_reg[1]  ( .D(n634), .CLK(clk), .R(n220), .S(1'b1), .Q(
        greyscale_data[1]) );
  DFFSR \greyscale_data_reg[0]  ( .D(n635), .CLK(clk), .R(n220), .S(1'b1), .Q(
        greyscale_data[0]) );
  DFFSR we_ff_reg ( .D(n689), .CLK(clk), .R(n220), .S(1'b1), .Q(we_ff) );
  DFFSR \hwdata_reg[31]  ( .D(n638), .CLK(clk), .R(n220), .S(1'b1), .Q(
        hwdata[31]) );
  DFFSR \hwdata_reg[30]  ( .D(n639), .CLK(clk), .R(n220), .S(1'b1), .Q(
        hwdata[30]) );
  DFFSR \hwdata_reg[29]  ( .D(n640), .CLK(clk), .R(n220), .S(1'b1), .Q(
        hwdata[29]) );
  DFFSR \hwdata_reg[28]  ( .D(n641), .CLK(clk), .R(n220), .S(1'b1), .Q(
        hwdata[28]) );
  DFFSR \hwdata_reg[27]  ( .D(n642), .CLK(clk), .R(n220), .S(1'b1), .Q(
        hwdata[27]) );
  DFFSR \hwdata_reg[26]  ( .D(n643), .CLK(clk), .R(n220), .S(1'b1), .Q(
        hwdata[26]) );
  DFFSR \hwdata_reg[25]  ( .D(n644), .CLK(clk), .R(n220), .S(1'b1), .Q(
        hwdata[25]) );
  DFFSR \hwdata_reg[24]  ( .D(n645), .CLK(clk), .R(n220), .S(1'b1), .Q(
        hwdata[24]) );
  DFFSR \hwdata_reg[23]  ( .D(n646), .CLK(clk), .R(n220), .S(1'b1), .Q(
        hwdata[23]) );
  DFFSR \hwdata_reg[22]  ( .D(n647), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[22]) );
  DFFSR \hwdata_reg[21]  ( .D(n648), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[21]) );
  DFFSR \hwdata_reg[20]  ( .D(n649), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[20]) );
  DFFSR \hwdata_reg[19]  ( .D(n650), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[19]) );
  DFFSR \hwdata_reg[18]  ( .D(n651), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[18]) );
  DFFSR \hwdata_reg[17]  ( .D(n652), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[17]) );
  DFFSR \hwdata_reg[16]  ( .D(n653), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[16]) );
  DFFSR \hwdata_reg[15]  ( .D(n655), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[15]) );
  DFFSR \hwdata_reg[14]  ( .D(n656), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[14]) );
  DFFSR \hwdata_reg[13]  ( .D(n657), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[13]) );
  DFFSR \hwdata_reg[12]  ( .D(n658), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[12]) );
  DFFSR \hwdata_reg[11]  ( .D(n659), .CLK(clk), .R(n219), .S(1'b1), .Q(
        hwdata[11]) );
  DFFSR \hwdata_reg[10]  ( .D(n660), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[10]) );
  DFFSR \hwdata_reg[9]  ( .D(n661), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[9]) );
  DFFSR \hwdata_reg[8]  ( .D(n662), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[8]) );
  DFFSR \hwdata_reg[7]  ( .D(n663), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[7]) );
  DFFSR \hwdata_reg[6]  ( .D(n664), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[6]) );
  DFFSR \hwdata_reg[5]  ( .D(n665), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[5]) );
  DFFSR \hwdata_reg[4]  ( .D(n666), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[4]) );
  DFFSR \hwdata_reg[3]  ( .D(n667), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[3]) );
  DFFSR \hwdata_reg[2]  ( .D(n668), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[2]) );
  DFFSR \hwdata_reg[1]  ( .D(n669), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[1]) );
  DFFSR \hwdata_reg[0]  ( .D(n670), .CLK(clk), .R(n215), .S(1'b1), .Q(
        hwdata[0]) );
  DFFSR \prev_waddr_reg[31]  ( .D(n536), .CLK(clk), .R(n215), .S(1'b1), .Q(
        prev_waddr[31]) );
  DFFSR \prev_waddr_reg[0]  ( .D(n539), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[0]) );
  DFFSR \prev_waddr_reg[1]  ( .D(n540), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[1]) );
  DFFSR \prev_waddr_reg[2]  ( .D(n541), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[2]) );
  DFFSR \prev_waddr_reg[3]  ( .D(n542), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[3]) );
  DFFSR \prev_waddr_reg[4]  ( .D(n543), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[4]) );
  DFFSR \prev_waddr_reg[5]  ( .D(n544), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[5]) );
  DFFSR \prev_waddr_reg[6]  ( .D(n545), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[6]) );
  DFFSR \prev_waddr_reg[7]  ( .D(n546), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[7]) );
  DFFSR \prev_waddr_reg[8]  ( .D(n547), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[8]) );
  DFFSR \prev_waddr_reg[9]  ( .D(n548), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[9]) );
  DFFSR \prev_waddr_reg[10]  ( .D(n549), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[10]) );
  DFFSR \prev_waddr_reg[11]  ( .D(n550), .CLK(clk), .R(n214), .S(1'b1), .Q(
        prev_waddr[11]) );
  DFFSR \prev_waddr_reg[12]  ( .D(n551), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[12]) );
  DFFSR \prev_waddr_reg[13]  ( .D(n552), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[13]) );
  DFFSR \prev_waddr_reg[14]  ( .D(n553), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[14]) );
  DFFSR \prev_waddr_reg[15]  ( .D(n554), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[15]) );
  DFFSR \prev_waddr_reg[16]  ( .D(n555), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[16]) );
  DFFSR \prev_waddr_reg[17]  ( .D(n556), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[17]) );
  DFFSR \prev_waddr_reg[18]  ( .D(n557), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[18]) );
  DFFSR \prev_waddr_reg[19]  ( .D(n558), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[19]) );
  DFFSR \prev_waddr_reg[20]  ( .D(n559), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[20]) );
  DFFSR \prev_waddr_reg[21]  ( .D(n560), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[21]) );
  DFFSR \prev_waddr_reg[22]  ( .D(n561), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[22]) );
  DFFSR \prev_waddr_reg[23]  ( .D(n562), .CLK(clk), .R(n210), .S(1'b1), .Q(
        prev_waddr[23]) );
  DFFSR \prev_waddr_reg[24]  ( .D(n563), .CLK(clk), .R(n209), .S(1'b1), .Q(
        prev_waddr[24]) );
  DFFSR \prev_waddr_reg[25]  ( .D(n564), .CLK(clk), .R(n209), .S(1'b1), .Q(
        prev_waddr[25]) );
  DFFSR \prev_waddr_reg[26]  ( .D(n565), .CLK(clk), .R(n209), .S(1'b1), .Q(
        prev_waddr[26]) );
  DFFSR \prev_waddr_reg[27]  ( .D(n566), .CLK(clk), .R(n209), .S(1'b1), .Q(
        prev_waddr[27]) );
  DFFSR \prev_waddr_reg[28]  ( .D(n567), .CLK(clk), .R(n209), .S(1'b1), .Q(
        prev_waddr[28]) );
  DFFSR \prev_waddr_reg[29]  ( .D(n538), .CLK(clk), .R(n209), .S(1'b1), .Q(
        prev_waddr[29]) );
  DFFSR \prev_waddr_reg[30]  ( .D(n537), .CLK(clk), .R(n209), .S(1'b1), .Q(
        prev_waddr[30]) );
  DFFSR write_complete_reg ( .D(n4), .CLK(clk), .R(n209), .S(1'b1), .Q(
        write_complete) );
  DFFSR \prev_raddr_reg[31]  ( .D(n235), .CLK(clk), .R(n209), .S(1'b1), .Q(
        prev_raddr[31]) );
  DFFSR \haddr_reg[31]  ( .D(n590), .CLK(clk), .R(n209), .S(1'b1), .Q(
        haddr[31]) );
  DFFSR \prev_raddr_reg[30]  ( .D(n236), .CLK(clk), .R(n209), .S(1'b1), .Q(
        prev_raddr[30]) );
  DFFSR \haddr_reg[30]  ( .D(n591), .CLK(clk), .R(n209), .S(1'b1), .Q(
        haddr[30]) );
  DFFSR \prev_raddr_reg[29]  ( .D(n237), .CLK(clk), .R(n205), .S(1'b1), .Q(
        prev_raddr[29]) );
  DFFSR \haddr_reg[29]  ( .D(n592), .CLK(clk), .R(n205), .S(1'b1), .Q(
        haddr[29]) );
  DFFSR \prev_raddr_reg[28]  ( .D(n534), .CLK(clk), .R(n205), .S(1'b1), .Q(
        prev_raddr[28]) );
  DFFSR \haddr_reg[28]  ( .D(n593), .CLK(clk), .R(n205), .S(1'b1), .Q(
        haddr[28]) );
  DFFSR \prev_raddr_reg[27]  ( .D(n533), .CLK(clk), .R(n205), .S(1'b1), .Q(
        prev_raddr[27]) );
  DFFSR \haddr_reg[27]  ( .D(n594), .CLK(clk), .R(n205), .S(1'b1), .Q(
        haddr[27]) );
  DFFSR \prev_raddr_reg[26]  ( .D(n532), .CLK(clk), .R(n205), .S(1'b1), .Q(
        prev_raddr[26]) );
  DFFSR \haddr_reg[26]  ( .D(n595), .CLK(clk), .R(n205), .S(1'b1), .Q(
        haddr[26]) );
  DFFSR \prev_raddr_reg[25]  ( .D(n531), .CLK(clk), .R(n205), .S(1'b1), .Q(
        prev_raddr[25]) );
  DFFSR \haddr_reg[25]  ( .D(n596), .CLK(clk), .R(n205), .S(1'b1), .Q(
        haddr[25]) );
  DFFSR \prev_raddr_reg[24]  ( .D(n530), .CLK(clk), .R(n205), .S(1'b1), .Q(
        prev_raddr[24]) );
  DFFSR \haddr_reg[24]  ( .D(n597), .CLK(clk), .R(n205), .S(1'b1), .Q(
        haddr[24]) );
  DFFSR \prev_raddr_reg[23]  ( .D(n529), .CLK(clk), .R(n204), .S(1'b1), .Q(
        prev_raddr[23]) );
  DFFSR \haddr_reg[23]  ( .D(n598), .CLK(clk), .R(n204), .S(1'b1), .Q(
        haddr[23]) );
  DFFSR \prev_raddr_reg[22]  ( .D(n528), .CLK(clk), .R(n204), .S(1'b1), .Q(
        prev_raddr[22]) );
  DFFSR \haddr_reg[22]  ( .D(n599), .CLK(clk), .R(n204), .S(1'b1), .Q(
        haddr[22]) );
  DFFSR \prev_raddr_reg[21]  ( .D(n527), .CLK(clk), .R(n204), .S(1'b1), .Q(
        prev_raddr[21]) );
  DFFSR \haddr_reg[21]  ( .D(n600), .CLK(clk), .R(n204), .S(1'b1), .Q(
        haddr[21]) );
  DFFSR \prev_raddr_reg[20]  ( .D(n526), .CLK(clk), .R(n204), .S(1'b1), .Q(
        prev_raddr[20]) );
  DFFSR \haddr_reg[20]  ( .D(n601), .CLK(clk), .R(n204), .S(1'b1), .Q(
        haddr[20]) );
  DFFSR \prev_raddr_reg[19]  ( .D(n525), .CLK(clk), .R(n204), .S(1'b1), .Q(
        prev_raddr[19]) );
  DFFSR \haddr_reg[19]  ( .D(n602), .CLK(clk), .R(n204), .S(1'b1), .Q(
        haddr[19]) );
  DFFSR \prev_raddr_reg[18]  ( .D(n524), .CLK(clk), .R(n204), .S(1'b1), .Q(
        prev_raddr[18]) );
  DFFSR \haddr_reg[18]  ( .D(n603), .CLK(clk), .R(n204), .S(1'b1), .Q(
        haddr[18]) );
  DFFSR \prev_raddr_reg[17]  ( .D(n348), .CLK(clk), .R(n200), .S(1'b1), .Q(
        prev_raddr[17]) );
  DFFSR \haddr_reg[17]  ( .D(n604), .CLK(clk), .R(n200), .S(1'b1), .Q(
        haddr[17]) );
  DFFSR \prev_raddr_reg[16]  ( .D(n338), .CLK(clk), .R(n200), .S(1'b1), .Q(
        prev_raddr[16]) );
  DFFSR \haddr_reg[16]  ( .D(n605), .CLK(clk), .R(n200), .S(1'b1), .Q(
        haddr[16]) );
  DFFSR \prev_raddr_reg[15]  ( .D(n336), .CLK(clk), .R(n200), .S(1'b1), .Q(
        prev_raddr[15]) );
  DFFSR \haddr_reg[15]  ( .D(n606), .CLK(clk), .R(n200), .S(1'b1), .Q(
        haddr[15]) );
  DFFSR \prev_raddr_reg[14]  ( .D(n335), .CLK(clk), .R(n200), .S(1'b1), .Q(
        prev_raddr[14]) );
  DFFSR \haddr_reg[14]  ( .D(n607), .CLK(clk), .R(n200), .S(1'b1), .Q(
        haddr[14]) );
  DFFSR \prev_raddr_reg[13]  ( .D(n332), .CLK(clk), .R(n200), .S(1'b1), .Q(
        prev_raddr[13]) );
  DFFSR \haddr_reg[13]  ( .D(n608), .CLK(clk), .R(n200), .S(1'b1), .Q(
        haddr[13]) );
  DFFSR \prev_raddr_reg[12]  ( .D(n330), .CLK(clk), .R(n200), .S(1'b1), .Q(
        prev_raddr[12]) );
  DFFSR \haddr_reg[12]  ( .D(n609), .CLK(clk), .R(n200), .S(1'b1), .Q(
        haddr[12]) );
  DFFSR \prev_raddr_reg[11]  ( .D(n329), .CLK(clk), .R(n199), .S(1'b1), .Q(
        prev_raddr[11]) );
  DFFSR \haddr_reg[11]  ( .D(n610), .CLK(clk), .R(n199), .S(1'b1), .Q(
        haddr[11]) );
  DFFSR \prev_raddr_reg[10]  ( .D(n326), .CLK(clk), .R(n199), .S(1'b1), .Q(
        prev_raddr[10]) );
  DFFSR \haddr_reg[10]  ( .D(n611), .CLK(clk), .R(n199), .S(1'b1), .Q(
        haddr[10]) );
  DFFSR \prev_raddr_reg[9]  ( .D(n324), .CLK(clk), .R(n199), .S(1'b1), .Q(
        prev_raddr[9]) );
  DFFSR \haddr_reg[9]  ( .D(n612), .CLK(clk), .R(n199), .S(1'b1), .Q(haddr[9])
         );
  DFFSR \prev_raddr_reg[8]  ( .D(n322), .CLK(clk), .R(n199), .S(1'b1), .Q(
        prev_raddr[8]) );
  DFFSR \haddr_reg[8]  ( .D(n613), .CLK(clk), .R(n199), .S(1'b1), .Q(haddr[8])
         );
  DFFSR \prev_raddr_reg[7]  ( .D(n321), .CLK(clk), .R(n199), .S(1'b1), .Q(
        prev_raddr[7]) );
  DFFSR \haddr_reg[7]  ( .D(n614), .CLK(clk), .R(n199), .S(1'b1), .Q(haddr[7])
         );
  DFFSR \prev_raddr_reg[6]  ( .D(n320), .CLK(clk), .R(n199), .S(1'b1), .Q(
        prev_raddr[6]) );
  DFFSR \haddr_reg[6]  ( .D(n615), .CLK(clk), .R(n199), .S(1'b1), .Q(haddr[6])
         );
  DFFSR \prev_raddr_reg[5]  ( .D(n317), .CLK(clk), .R(n195), .S(1'b1), .Q(
        prev_raddr[5]) );
  DFFSR \haddr_reg[5]  ( .D(n616), .CLK(clk), .R(n195), .S(1'b1), .Q(haddr[5])
         );
  DFFSR \prev_raddr_reg[4]  ( .D(n316), .CLK(clk), .R(n195), .S(1'b1), .Q(
        prev_raddr[4]) );
  DFFSR \haddr_reg[4]  ( .D(n617), .CLK(clk), .R(n195), .S(1'b1), .Q(haddr[4])
         );
  DFFSR \prev_raddr_reg[3]  ( .D(n314), .CLK(clk), .R(n195), .S(1'b1), .Q(
        prev_raddr[3]) );
  DFFSR \haddr_reg[3]  ( .D(n618), .CLK(clk), .R(n195), .S(1'b1), .Q(haddr[3])
         );
  DFFSR \prev_raddr_reg[2]  ( .D(n277), .CLK(clk), .R(n195), .S(1'b1), .Q(
        prev_raddr[2]) );
  DFFSR \haddr_reg[2]  ( .D(n619), .CLK(clk), .R(n195), .S(1'b1), .Q(haddr[2])
         );
  DFFSR \prev_raddr_reg[1]  ( .D(n273), .CLK(clk), .R(n195), .S(1'b1), .Q(
        prev_raddr[1]) );
  DFFSR \haddr_reg[1]  ( .D(n620), .CLK(clk), .R(n195), .S(1'b1), .Q(haddr[1])
         );
  DFFSR \prev_raddr_reg[0]  ( .D(n271), .CLK(clk), .R(n195), .S(1'b1), .Q(
        prev_raddr[0]) );
  DFFSR \haddr_reg[0]  ( .D(n621), .CLK(clk), .R(n195), .S(1'b1), .Q(haddr[0])
         );
  OAI21X1 U4 ( .A(n164), .B(n571), .C(n535), .Y(n523) );
  AOI22X1 U7 ( .A(hwdata[31]), .B(n175), .C(buffer2_data[31]), .D(n164), .Y(n5) );
  AOI22X1 U9 ( .A(hwdata[30]), .B(n165), .C(buffer2_data[30]), .D(n160), .Y(n7) );
  AOI22X1 U11 ( .A(hwdata[29]), .B(n165), .C(buffer2_data[29]), .D(n160), .Y(
        n8) );
  AOI22X1 U13 ( .A(hwdata[28]), .B(n165), .C(buffer2_data[28]), .D(n164), .Y(
        n9) );
  AOI22X1 U15 ( .A(hwdata[27]), .B(n169), .C(buffer2_data[27]), .D(n160), .Y(
        n10) );
  AOI22X1 U17 ( .A(hwdata[26]), .B(n169), .C(buffer2_data[26]), .D(n160), .Y(
        n11) );
  AOI22X1 U19 ( .A(hwdata[25]), .B(n169), .C(buffer2_data[25]), .D(n160), .Y(
        n12) );
  AOI22X1 U21 ( .A(hwdata[24]), .B(n170), .C(buffer2_data[24]), .D(n160), .Y(
        n13) );
  AOI22X1 U23 ( .A(hwdata[23]), .B(n170), .C(buffer2_data[23]), .D(n160), .Y(
        n14) );
  AOI22X1 U25 ( .A(hwdata[22]), .B(n170), .C(buffer2_data[22]), .D(n160), .Y(
        n15) );
  AOI22X1 U27 ( .A(hwdata[21]), .B(n174), .C(buffer2_data[21]), .D(n160), .Y(
        n16) );
  AOI22X1 U29 ( .A(hwdata[20]), .B(n174), .C(buffer2_data[20]), .D(n160), .Y(
        n17) );
  AOI22X1 U31 ( .A(hwdata[19]), .B(n174), .C(buffer2_data[19]), .D(n160), .Y(
        n18) );
  AOI22X1 U33 ( .A(hwdata[18]), .B(n174), .C(buffer2_data[18]), .D(n160), .Y(
        n19) );
  AOI22X1 U35 ( .A(hwdata[17]), .B(n174), .C(buffer2_data[17]), .D(n160), .Y(
        n20) );
  AOI22X1 U37 ( .A(hwdata[16]), .B(n174), .C(buffer2_data[16]), .D(n160), .Y(
        n21) );
  AOI22X1 U39 ( .A(hwdata[15]), .B(n174), .C(buffer2_data[15]), .D(n160), .Y(
        n22) );
  AOI22X1 U41 ( .A(hwdata[14]), .B(n175), .C(buffer2_data[14]), .D(n160), .Y(
        n23) );
  AOI22X1 U43 ( .A(hwdata[13]), .B(n175), .C(buffer2_data[13]), .D(n160), .Y(
        n24) );
  AOI22X1 U45 ( .A(hwdata[12]), .B(n175), .C(buffer2_data[12]), .D(n160), .Y(
        n25) );
  AOI22X1 U47 ( .A(hwdata[11]), .B(n175), .C(buffer2_data[11]), .D(n160), .Y(
        n26) );
  AOI22X1 U49 ( .A(hwdata[10]), .B(n175), .C(buffer2_data[10]), .D(n160), .Y(
        n27) );
  AOI22X1 U51 ( .A(hwdata[9]), .B(n175), .C(buffer2_data[9]), .D(n160), .Y(n28) );
  AOI22X1 U53 ( .A(hwdata[8]), .B(n179), .C(buffer2_data[8]), .D(n160), .Y(n29) );
  AOI22X1 U55 ( .A(hwdata[7]), .B(n179), .C(buffer2_data[7]), .D(n160), .Y(n30) );
  AOI22X1 U57 ( .A(hwdata[6]), .B(n179), .C(buffer2_data[6]), .D(n160), .Y(n31) );
  AOI22X1 U59 ( .A(hwdata[5]), .B(n179), .C(buffer2_data[5]), .D(n164), .Y(n32) );
  AOI22X1 U61 ( .A(hwdata[4]), .B(n179), .C(buffer2_data[4]), .D(n164), .Y(n33) );
  AOI22X1 U63 ( .A(hwdata[3]), .B(n179), .C(buffer2_data[3]), .D(n164), .Y(n34) );
  AOI22X1 U65 ( .A(hwdata[2]), .B(n179), .C(buffer2_data[2]), .D(n164), .Y(n35) );
  AOI22X1 U67 ( .A(hwdata[1]), .B(n180), .C(buffer2_data[1]), .D(n164), .Y(n36) );
  AOI22X1 U69 ( .A(hwdata[0]), .B(n180), .C(buffer2_data[0]), .D(n164), .Y(n37) );
  AOI22X1 U71 ( .A(greyscale_data[31]), .B(n145), .C(hrdata[31]), .D(n115), 
        .Y(n38) );
  AOI22X1 U73 ( .A(greyscale_data[30]), .B(n155), .C(hrdata[30]), .D(n115), 
        .Y(n41) );
  AOI22X1 U75 ( .A(greyscale_data[29]), .B(n155), .C(hrdata[29]), .D(n115), 
        .Y(n42) );
  AOI22X1 U77 ( .A(greyscale_data[28]), .B(n155), .C(hrdata[28]), .D(n115), 
        .Y(n43) );
  AOI22X1 U79 ( .A(greyscale_data[27]), .B(n155), .C(hrdata[27]), .D(n115), 
        .Y(n44) );
  AOI22X1 U81 ( .A(greyscale_data[26]), .B(n155), .C(hrdata[26]), .D(n115), 
        .Y(n45) );
  AOI22X1 U83 ( .A(greyscale_data[25]), .B(n155), .C(hrdata[25]), .D(n115), 
        .Y(n46) );
  AOI22X1 U85 ( .A(greyscale_data[24]), .B(n155), .C(hrdata[24]), .D(n115), 
        .Y(n47) );
  AOI22X1 U87 ( .A(greyscale_data[23]), .B(n154), .C(hrdata[23]), .D(n115), 
        .Y(n48) );
  AOI22X1 U89 ( .A(greyscale_data[22]), .B(n154), .C(hrdata[22]), .D(n115), 
        .Y(n49) );
  AOI22X1 U91 ( .A(greyscale_data[21]), .B(n154), .C(hrdata[21]), .D(n115), 
        .Y(n50) );
  AOI22X1 U93 ( .A(greyscale_data[20]), .B(n154), .C(hrdata[20]), .D(n115), 
        .Y(n51) );
  AOI22X1 U95 ( .A(greyscale_data[19]), .B(n154), .C(hrdata[19]), .D(n115), 
        .Y(n52) );
  AOI22X1 U97 ( .A(greyscale_data[18]), .B(n154), .C(hrdata[18]), .D(n119), 
        .Y(n53) );
  AOI22X1 U99 ( .A(greyscale_data[17]), .B(n154), .C(hrdata[17]), .D(n119), 
        .Y(n54) );
  AOI22X1 U101 ( .A(greyscale_data[16]), .B(n150), .C(hrdata[16]), .D(n119), 
        .Y(n55) );
  AOI22X1 U103 ( .A(greyscale_data[15]), .B(n150), .C(hrdata[15]), .D(n119), 
        .Y(n56) );
  AOI22X1 U105 ( .A(greyscale_data[14]), .B(n150), .C(hrdata[14]), .D(n119), 
        .Y(n57) );
  AOI22X1 U107 ( .A(greyscale_data[13]), .B(n150), .C(hrdata[13]), .D(n119), 
        .Y(n58) );
  AOI22X1 U109 ( .A(greyscale_data[12]), .B(n150), .C(hrdata[12]), .D(n119), 
        .Y(n59) );
  AOI22X1 U111 ( .A(greyscale_data[11]), .B(n150), .C(hrdata[11]), .D(n119), 
        .Y(n60) );
  AOI22X1 U113 ( .A(greyscale_data[10]), .B(n150), .C(hrdata[10]), .D(n119), 
        .Y(n61) );
  AOI22X1 U115 ( .A(greyscale_data[9]), .B(n149), .C(hrdata[9]), .D(n119), .Y(
        n62) );
  AOI22X1 U117 ( .A(greyscale_data[8]), .B(n149), .C(hrdata[8]), .D(n119), .Y(
        n63) );
  AOI22X1 U119 ( .A(greyscale_data[7]), .B(n149), .C(hrdata[7]), .D(n119), .Y(
        n64) );
  AOI22X1 U121 ( .A(greyscale_data[6]), .B(n149), .C(hrdata[6]), .D(n119), .Y(
        n65) );
  AOI22X1 U123 ( .A(greyscale_data[5]), .B(n149), .C(hrdata[5]), .D(n120), .Y(
        n66) );
  AOI22X1 U125 ( .A(greyscale_data[4]), .B(n149), .C(hrdata[4]), .D(n120), .Y(
        n67) );
  AOI22X1 U127 ( .A(greyscale_data[3]), .B(n149), .C(hrdata[3]), .D(n120), .Y(
        n68) );
  AOI22X1 U129 ( .A(greyscale_data[2]), .B(n145), .C(hrdata[2]), .D(n120), .Y(
        n69) );
  AOI22X1 U131 ( .A(greyscale_data[1]), .B(n145), .C(hrdata[1]), .D(n120), .Y(
        n70) );
  AOI22X1 U133 ( .A(greyscale_data[0]), .B(n145), .C(hrdata[0]), .D(n120), .Y(
        n71) );
  NAND2X1 U134 ( .A(n72), .B(n73), .Y(n590) );
  AOI21X1 U135 ( .A(haddr[31]), .B(n74), .C(n75), .Y(n73) );
  OAI22X1 U136 ( .A(n110), .B(n682), .C(n109), .D(n722), .Y(n75) );
  AOI22X1 U139 ( .A(waddr[31]), .B(n4), .C(raddr[31]), .D(n80), .Y(n72) );
  NAND2X1 U140 ( .A(n81), .B(n82), .Y(n591) );
  AOI21X1 U141 ( .A(haddr[30]), .B(n637), .C(n83), .Y(n82) );
  OAI22X1 U142 ( .A(n110), .B(n721), .C(n109), .D(n723), .Y(n83) );
  AOI22X1 U145 ( .A(waddr[30]), .B(n4), .C(raddr[30]), .D(n100), .Y(n81) );
  NAND2X1 U146 ( .A(n86), .B(n87), .Y(n592) );
  AOI21X1 U147 ( .A(haddr[29]), .B(n637), .C(n88), .Y(n87) );
  OAI22X1 U148 ( .A(n110), .B(n720), .C(n105), .D(n724), .Y(n88) );
  AOI22X1 U151 ( .A(waddr[29]), .B(n4), .C(raddr[29]), .D(n80), .Y(n86) );
  NAND2X1 U152 ( .A(n91), .B(n92), .Y(n593) );
  AOI21X1 U153 ( .A(haddr[28]), .B(n637), .C(n93), .Y(n92) );
  OAI22X1 U154 ( .A(n110), .B(n719), .C(n109), .D(n725), .Y(n93) );
  AOI22X1 U157 ( .A(waddr[28]), .B(n4), .C(raddr[28]), .D(n80), .Y(n91) );
  NAND2X1 U158 ( .A(n96), .B(n97), .Y(n594) );
  AOI21X1 U159 ( .A(haddr[27]), .B(n74), .C(n98), .Y(n97) );
  OAI22X1 U160 ( .A(n110), .B(n718), .C(n105), .D(n726), .Y(n98) );
  AOI22X1 U163 ( .A(waddr[27]), .B(n4), .C(raddr[27]), .D(n100), .Y(n96) );
  NAND2X1 U164 ( .A(n101), .B(n102), .Y(n595) );
  AOI21X1 U165 ( .A(haddr[26]), .B(n74), .C(n103), .Y(n102) );
  OAI22X1 U166 ( .A(n110), .B(n717), .C(n105), .D(n727), .Y(n103) );
  AOI22X1 U169 ( .A(waddr[26]), .B(n4), .C(raddr[26]), .D(n100), .Y(n101) );
  NAND2X1 U170 ( .A(n106), .B(n107), .Y(n596) );
  AOI21X1 U171 ( .A(haddr[25]), .B(n74), .C(n108), .Y(n107) );
  OAI22X1 U172 ( .A(n110), .B(n716), .C(n109), .D(n728), .Y(n108) );
  AOI22X1 U175 ( .A(waddr[25]), .B(n4), .C(raddr[25]), .D(n80), .Y(n106) );
  NAND2X1 U176 ( .A(n111), .B(n112), .Y(n597) );
  AOI21X1 U177 ( .A(haddr[24]), .B(n74), .C(n113), .Y(n112) );
  OAI22X1 U178 ( .A(n110), .B(n715), .C(n105), .D(n729), .Y(n113) );
  AOI22X1 U181 ( .A(waddr[24]), .B(n4), .C(raddr[24]), .D(n100), .Y(n111) );
  NAND2X1 U182 ( .A(n116), .B(n117), .Y(n598) );
  AOI21X1 U183 ( .A(haddr[23]), .B(n74), .C(n118), .Y(n117) );
  OAI22X1 U184 ( .A(n110), .B(n714), .C(n109), .D(n730), .Y(n118) );
  AOI22X1 U187 ( .A(waddr[23]), .B(n4), .C(raddr[23]), .D(n100), .Y(n116) );
  NAND2X1 U188 ( .A(n121), .B(n122), .Y(n599) );
  AOI21X1 U189 ( .A(haddr[22]), .B(n74), .C(n123), .Y(n122) );
  OAI22X1 U190 ( .A(n110), .B(n713), .C(n109), .D(n731), .Y(n123) );
  AOI22X1 U193 ( .A(waddr[22]), .B(n4), .C(raddr[22]), .D(n80), .Y(n121) );
  NAND2X1 U194 ( .A(n126), .B(n127), .Y(n600) );
  AOI21X1 U195 ( .A(haddr[21]), .B(n74), .C(n128), .Y(n127) );
  OAI22X1 U196 ( .A(n110), .B(n712), .C(n109), .D(n732), .Y(n128) );
  AOI22X1 U199 ( .A(waddr[21]), .B(n4), .C(raddr[21]), .D(n80), .Y(n126) );
  NAND2X1 U200 ( .A(n131), .B(n132), .Y(n601) );
  AOI21X1 U201 ( .A(haddr[20]), .B(n74), .C(n133), .Y(n132) );
  OAI22X1 U202 ( .A(n110), .B(n711), .C(n109), .D(n733), .Y(n133) );
  AOI22X1 U205 ( .A(waddr[20]), .B(n4), .C(raddr[20]), .D(n80), .Y(n131) );
  NAND2X1 U206 ( .A(n136), .B(n137), .Y(n602) );
  AOI21X1 U207 ( .A(haddr[19]), .B(n74), .C(n138), .Y(n137) );
  OAI22X1 U208 ( .A(n110), .B(n710), .C(n109), .D(n734), .Y(n138) );
  AOI22X1 U211 ( .A(waddr[19]), .B(n4), .C(raddr[19]), .D(n80), .Y(n136) );
  NAND2X1 U212 ( .A(n141), .B(n142), .Y(n603) );
  AOI21X1 U213 ( .A(haddr[18]), .B(n74), .C(n143), .Y(n142) );
  OAI22X1 U214 ( .A(n110), .B(n709), .C(n109), .D(n735), .Y(n143) );
  AOI22X1 U217 ( .A(waddr[18]), .B(n39), .C(raddr[18]), .D(n100), .Y(n141) );
  NAND2X1 U218 ( .A(n146), .B(n147), .Y(n604) );
  AOI21X1 U219 ( .A(haddr[17]), .B(n74), .C(n148), .Y(n147) );
  OAI22X1 U220 ( .A(n110), .B(n708), .C(n109), .D(n736), .Y(n148) );
  AOI22X1 U223 ( .A(waddr[17]), .B(n39), .C(raddr[17]), .D(n80), .Y(n146) );
  NAND2X1 U224 ( .A(n151), .B(n152), .Y(n605) );
  AOI21X1 U225 ( .A(haddr[16]), .B(n74), .C(n153), .Y(n152) );
  OAI22X1 U226 ( .A(n110), .B(n707), .C(n109), .D(n737), .Y(n153) );
  AOI22X1 U229 ( .A(waddr[16]), .B(n39), .C(raddr[16]), .D(n100), .Y(n151) );
  NAND2X1 U230 ( .A(n156), .B(n157), .Y(n606) );
  AOI21X1 U231 ( .A(haddr[15]), .B(n74), .C(n158), .Y(n157) );
  OAI22X1 U232 ( .A(n110), .B(n706), .C(n109), .D(n738), .Y(n158) );
  AOI22X1 U235 ( .A(waddr[15]), .B(n39), .C(raddr[15]), .D(n80), .Y(n156) );
  NAND2X1 U236 ( .A(n161), .B(n162), .Y(n607) );
  AOI21X1 U237 ( .A(haddr[14]), .B(n74), .C(n163), .Y(n162) );
  OAI22X1 U238 ( .A(n110), .B(n705), .C(n109), .D(n739), .Y(n163) );
  AOI22X1 U241 ( .A(waddr[14]), .B(n39), .C(raddr[14]), .D(n80), .Y(n161) );
  NAND2X1 U242 ( .A(n166), .B(n167), .Y(n608) );
  AOI21X1 U243 ( .A(haddr[13]), .B(n74), .C(n168), .Y(n167) );
  OAI22X1 U244 ( .A(n110), .B(n704), .C(n109), .D(n740), .Y(n168) );
  AOI22X1 U247 ( .A(waddr[13]), .B(n39), .C(raddr[13]), .D(n80), .Y(n166) );
  NAND2X1 U248 ( .A(n171), .B(n172), .Y(n609) );
  AOI21X1 U249 ( .A(haddr[12]), .B(n74), .C(n173), .Y(n172) );
  OAI22X1 U250 ( .A(n110), .B(n703), .C(n109), .D(n741), .Y(n173) );
  AOI22X1 U253 ( .A(waddr[12]), .B(n39), .C(raddr[12]), .D(n100), .Y(n171) );
  NAND2X1 U254 ( .A(n176), .B(n177), .Y(n610) );
  AOI21X1 U255 ( .A(haddr[11]), .B(n74), .C(n178), .Y(n177) );
  OAI22X1 U256 ( .A(n110), .B(n702), .C(n105), .D(n742), .Y(n178) );
  AOI22X1 U259 ( .A(waddr[11]), .B(n39), .C(raddr[11]), .D(n100), .Y(n176) );
  NAND2X1 U260 ( .A(n181), .B(n182), .Y(n611) );
  AOI21X1 U261 ( .A(haddr[10]), .B(n74), .C(n183), .Y(n182) );
  OAI22X1 U262 ( .A(n110), .B(n701), .C(n105), .D(n743), .Y(n183) );
  AOI22X1 U265 ( .A(waddr[10]), .B(n39), .C(raddr[10]), .D(n100), .Y(n181) );
  NAND2X1 U266 ( .A(n186), .B(n187), .Y(n612) );
  AOI21X1 U267 ( .A(haddr[9]), .B(n74), .C(n188), .Y(n187) );
  OAI22X1 U268 ( .A(n110), .B(n700), .C(n105), .D(n744), .Y(n188) );
  AOI22X1 U271 ( .A(waddr[9]), .B(n39), .C(raddr[9]), .D(n100), .Y(n186) );
  NAND2X1 U272 ( .A(n191), .B(n192), .Y(n613) );
  AOI21X1 U273 ( .A(haddr[8]), .B(n74), .C(n193), .Y(n192) );
  OAI22X1 U274 ( .A(n110), .B(n699), .C(n105), .D(n745), .Y(n193) );
  AOI22X1 U277 ( .A(waddr[8]), .B(n39), .C(raddr[8]), .D(n100), .Y(n191) );
  NAND2X1 U278 ( .A(n196), .B(n197), .Y(n614) );
  AOI21X1 U279 ( .A(haddr[7]), .B(n74), .C(n198), .Y(n197) );
  OAI22X1 U280 ( .A(n114), .B(n698), .C(n105), .D(n746), .Y(n198) );
  AOI22X1 U283 ( .A(waddr[7]), .B(n39), .C(raddr[7]), .D(n100), .Y(n196) );
  NAND2X1 U284 ( .A(n201), .B(n202), .Y(n615) );
  AOI21X1 U285 ( .A(haddr[6]), .B(n74), .C(n203), .Y(n202) );
  OAI22X1 U286 ( .A(n114), .B(n697), .C(n105), .D(n747), .Y(n203) );
  AOI22X1 U289 ( .A(waddr[6]), .B(n39), .C(raddr[6]), .D(n100), .Y(n201) );
  NAND2X1 U290 ( .A(n206), .B(n207), .Y(n616) );
  AOI21X1 U291 ( .A(haddr[5]), .B(n637), .C(n208), .Y(n207) );
  OAI22X1 U292 ( .A(n114), .B(n696), .C(n105), .D(n748), .Y(n208) );
  AOI22X1 U295 ( .A(waddr[5]), .B(n39), .C(raddr[5]), .D(n100), .Y(n206) );
  NAND2X1 U296 ( .A(n211), .B(n212), .Y(n617) );
  AOI21X1 U297 ( .A(haddr[4]), .B(n637), .C(n213), .Y(n212) );
  OAI22X1 U298 ( .A(n114), .B(n695), .C(n105), .D(n749), .Y(n213) );
  AOI22X1 U301 ( .A(waddr[4]), .B(n4), .C(raddr[4]), .D(n100), .Y(n211) );
  NAND2X1 U302 ( .A(n216), .B(n217), .Y(n618) );
  AOI21X1 U303 ( .A(haddr[3]), .B(n637), .C(n218), .Y(n217) );
  OAI22X1 U304 ( .A(n114), .B(n686), .C(n105), .D(n750), .Y(n218) );
  AOI22X1 U307 ( .A(waddr[3]), .B(n4), .C(raddr[3]), .D(n100), .Y(n216) );
  NAND2X1 U308 ( .A(n221), .B(n222), .Y(n619) );
  AOI21X1 U309 ( .A(haddr[2]), .B(n74), .C(n223), .Y(n222) );
  OAI22X1 U310 ( .A(n114), .B(n685), .C(n105), .D(n751), .Y(n223) );
  AOI22X1 U313 ( .A(waddr[2]), .B(n4), .C(raddr[2]), .D(n100), .Y(n221) );
  NAND2X1 U314 ( .A(n226), .B(n227), .Y(n620) );
  AOI21X1 U315 ( .A(haddr[1]), .B(n637), .C(n228), .Y(n227) );
  OAI22X1 U316 ( .A(n114), .B(n684), .C(n105), .D(n752), .Y(n228) );
  AOI22X1 U319 ( .A(waddr[1]), .B(n39), .C(raddr[1]), .D(n100), .Y(n226) );
  NAND2X1 U320 ( .A(n231), .B(n232), .Y(n621) );
  AOI21X1 U321 ( .A(haddr[0]), .B(n637), .C(n233), .Y(n232) );
  OAI22X1 U322 ( .A(n114), .B(n683), .C(n105), .D(n753), .Y(n233) );
  AOI22X1 U326 ( .A(waddr[0]), .B(n39), .C(raddr[0]), .D(n100), .Y(n231) );
  AOI22X1 U329 ( .A(n120), .B(raddr[0]), .C(n129), .D(prev_raddr[0]), .Y(n239)
         );
  AOI22X1 U331 ( .A(n120), .B(raddr[1]), .C(n129), .D(prev_raddr[1]), .Y(n240)
         );
  AOI22X1 U333 ( .A(n120), .B(raddr[2]), .C(n129), .D(prev_raddr[2]), .Y(n241)
         );
  AOI22X1 U335 ( .A(n120), .B(raddr[3]), .C(n130), .D(prev_raddr[3]), .Y(n242)
         );
  AOI22X1 U337 ( .A(n120), .B(raddr[4]), .C(n130), .D(prev_raddr[4]), .Y(n243)
         );
  AOI22X1 U339 ( .A(n120), .B(raddr[5]), .C(n130), .D(prev_raddr[5]), .Y(n244)
         );
  AOI22X1 U341 ( .A(n120), .B(raddr[6]), .C(n134), .D(prev_raddr[6]), .Y(n245)
         );
  AOI22X1 U343 ( .A(n124), .B(raddr[7]), .C(n134), .D(prev_raddr[7]), .Y(n246)
         );
  AOI22X1 U345 ( .A(n124), .B(raddr[8]), .C(n134), .D(prev_raddr[8]), .Y(n247)
         );
  AOI22X1 U347 ( .A(n124), .B(raddr[9]), .C(n135), .D(prev_raddr[9]), .Y(n248)
         );
  AOI22X1 U349 ( .A(n124), .B(raddr[10]), .C(n135), .D(prev_raddr[10]), .Y(
        n249) );
  AOI22X1 U351 ( .A(n124), .B(raddr[11]), .C(n135), .D(prev_raddr[11]), .Y(
        n250) );
  AOI22X1 U353 ( .A(n124), .B(raddr[12]), .C(n139), .D(prev_raddr[12]), .Y(
        n251) );
  AOI22X1 U355 ( .A(n124), .B(raddr[13]), .C(n139), .D(prev_raddr[13]), .Y(
        n252) );
  AOI22X1 U357 ( .A(n124), .B(raddr[14]), .C(n139), .D(prev_raddr[14]), .Y(
        n253) );
  AOI22X1 U359 ( .A(n124), .B(raddr[15]), .C(n140), .D(prev_raddr[15]), .Y(
        n254) );
  AOI22X1 U361 ( .A(n124), .B(raddr[16]), .C(n140), .D(prev_raddr[16]), .Y(
        n255) );
  AOI22X1 U363 ( .A(n124), .B(raddr[17]), .C(n140), .D(prev_raddr[17]), .Y(
        n256) );
  AOI22X1 U365 ( .A(n124), .B(raddr[18]), .C(n140), .D(prev_raddr[18]), .Y(
        n257) );
  AOI22X1 U367 ( .A(n124), .B(raddr[19]), .C(n140), .D(prev_raddr[19]), .Y(
        n258) );
  AOI22X1 U369 ( .A(n125), .B(raddr[20]), .C(n140), .D(prev_raddr[20]), .Y(
        n259) );
  AOI22X1 U371 ( .A(n125), .B(raddr[21]), .C(n140), .D(prev_raddr[21]), .Y(
        n260) );
  AOI22X1 U373 ( .A(n125), .B(raddr[22]), .C(n144), .D(prev_raddr[22]), .Y(
        n261) );
  AOI22X1 U375 ( .A(n125), .B(raddr[23]), .C(n144), .D(prev_raddr[23]), .Y(
        n262) );
  AOI22X1 U377 ( .A(n125), .B(raddr[24]), .C(n144), .D(prev_raddr[24]), .Y(
        n263) );
  AOI22X1 U379 ( .A(n125), .B(raddr[25]), .C(n144), .D(prev_raddr[25]), .Y(
        n264) );
  AOI22X1 U381 ( .A(n125), .B(raddr[26]), .C(n144), .D(prev_raddr[26]), .Y(
        n265) );
  AOI22X1 U383 ( .A(n125), .B(raddr[27]), .C(n144), .D(prev_raddr[27]), .Y(
        n266) );
  AOI22X1 U385 ( .A(n125), .B(raddr[28]), .C(n144), .D(prev_raddr[28]), .Y(
        n267) );
  AOI22X1 U387 ( .A(n125), .B(raddr[29]), .C(n145), .D(prev_raddr[29]), .Y(
        n268) );
  AOI22X1 U389 ( .A(n125), .B(raddr[30]), .C(n145), .D(prev_raddr[30]), .Y(
        n269) );
  AOI22X1 U391 ( .A(n125), .B(raddr[31]), .C(n145), .D(prev_raddr[31]), .Y(
        n270) );
  OAI21X1 U392 ( .A(n674), .B(n272), .C(n234), .Y(n654) );
  OAI21X1 U394 ( .A(n274), .B(n673), .C(n140), .Y(n272) );
  AOI22X1 U398 ( .A(n99), .B(waddr[30]), .C(prev_waddr[30]), .D(n79), .Y(n275)
         );
  AOI22X1 U400 ( .A(n99), .B(waddr[29]), .C(prev_waddr[29]), .D(n79), .Y(n278)
         );
  AOI22X1 U402 ( .A(n95), .B(waddr[28]), .C(prev_waddr[28]), .D(n79), .Y(n279)
         );
  AOI22X1 U404 ( .A(n95), .B(waddr[27]), .C(prev_waddr[27]), .D(n79), .Y(n280)
         );
  AOI22X1 U406 ( .A(n95), .B(waddr[26]), .C(prev_waddr[26]), .D(n79), .Y(n281)
         );
  AOI22X1 U408 ( .A(n95), .B(waddr[25]), .C(prev_waddr[25]), .D(n79), .Y(n282)
         );
  AOI22X1 U410 ( .A(n95), .B(waddr[24]), .C(prev_waddr[24]), .D(n78), .Y(n283)
         );
  AOI22X1 U412 ( .A(n95), .B(waddr[23]), .C(prev_waddr[23]), .D(n78), .Y(n284)
         );
  AOI22X1 U414 ( .A(n95), .B(waddr[22]), .C(prev_waddr[22]), .D(n78), .Y(n285)
         );
  AOI22X1 U416 ( .A(n94), .B(waddr[21]), .C(prev_waddr[21]), .D(n78), .Y(n286)
         );
  AOI22X1 U418 ( .A(n94), .B(waddr[20]), .C(prev_waddr[20]), .D(n78), .Y(n287)
         );
  AOI22X1 U420 ( .A(n94), .B(waddr[19]), .C(prev_waddr[19]), .D(n78), .Y(n288)
         );
  AOI22X1 U422 ( .A(n94), .B(waddr[18]), .C(prev_waddr[18]), .D(n78), .Y(n289)
         );
  AOI22X1 U424 ( .A(n94), .B(waddr[17]), .C(prev_waddr[17]), .D(n78), .Y(n290)
         );
  AOI22X1 U426 ( .A(n94), .B(waddr[16]), .C(prev_waddr[16]), .D(n78), .Y(n291)
         );
  AOI22X1 U428 ( .A(n94), .B(waddr[15]), .C(prev_waddr[15]), .D(n78), .Y(n292)
         );
  AOI22X1 U430 ( .A(n90), .B(waddr[14]), .C(prev_waddr[14]), .D(n78), .Y(n293)
         );
  AOI22X1 U432 ( .A(n90), .B(waddr[13]), .C(prev_waddr[13]), .D(n78), .Y(n294)
         );
  AOI22X1 U434 ( .A(n90), .B(waddr[12]), .C(prev_waddr[12]), .D(n78), .Y(n295)
         );
  AOI22X1 U436 ( .A(n90), .B(waddr[11]), .C(prev_waddr[11]), .D(n77), .Y(n296)
         );
  AOI22X1 U438 ( .A(n90), .B(waddr[10]), .C(prev_waddr[10]), .D(n77), .Y(n297)
         );
  AOI22X1 U440 ( .A(n90), .B(waddr[9]), .C(prev_waddr[9]), .D(n77), .Y(n298)
         );
  AOI22X1 U442 ( .A(n90), .B(waddr[8]), .C(prev_waddr[8]), .D(n77), .Y(n299)
         );
  AOI22X1 U444 ( .A(n89), .B(waddr[7]), .C(prev_waddr[7]), .D(n77), .Y(n300)
         );
  AOI22X1 U446 ( .A(n89), .B(waddr[6]), .C(prev_waddr[6]), .D(n77), .Y(n301)
         );
  AOI22X1 U448 ( .A(n89), .B(waddr[5]), .C(prev_waddr[5]), .D(n77), .Y(n302)
         );
  AOI22X1 U450 ( .A(n85), .B(waddr[4]), .C(prev_waddr[4]), .D(n77), .Y(n303)
         );
  AOI22X1 U452 ( .A(n85), .B(waddr[3]), .C(prev_waddr[3]), .D(n77), .Y(n304)
         );
  AOI22X1 U454 ( .A(n85), .B(waddr[2]), .C(prev_waddr[2]), .D(n77), .Y(n305)
         );
  AOI22X1 U456 ( .A(n84), .B(waddr[1]), .C(prev_waddr[1]), .D(n77), .Y(n306)
         );
  AOI22X1 U458 ( .A(n84), .B(waddr[0]), .C(prev_waddr[0]), .D(n77), .Y(n307)
         );
  AOI22X1 U460 ( .A(n84), .B(waddr[31]), .C(prev_waddr[31]), .D(n77), .Y(n308)
         );
  OAI21X1 U462 ( .A(n309), .B(n310), .C(n165), .Y(n276) );
  NAND2X1 U463 ( .A(init2), .B(n311), .Y(n310) );
  NAND2X1 U464 ( .A(n114), .B(n312), .Y(n309) );
  NAND2X1 U465 ( .A(init), .B(n313), .Y(n687) );
  OAI21X1 U466 ( .A(n671), .B(n274), .C(init2), .Y(n313) );
  OAI21X1 U467 ( .A(n311), .B(n680), .C(n315), .Y(n688) );
  NOR2X1 U468 ( .A(n672), .B(n671), .Y(n315) );
  OAI21X1 U470 ( .A(n164), .B(n681), .C(n755), .Y(n689) );
  NAND3X1 U473 ( .A(n312), .B(n318), .C(n319), .Y(n6) );
  OAI21X1 U475 ( .A(n311), .B(n677), .C(n756), .Y(n690) );
  OAI22X1 U477 ( .A(n679), .B(n323), .C(n568), .D(n325), .Y(n691) );
  OAI21X1 U478 ( .A(n636), .B(n323), .C(n327), .Y(n692) );
  OAI21X1 U479 ( .A(n328), .B(n675), .C(n569), .Y(n327) );
  NOR2X1 U481 ( .A(n570), .B(n333), .Y(n328) );
  OAI21X1 U483 ( .A(n125), .B(n678), .C(n754), .Y(n693) );
  NOR2X1 U485 ( .A(n274), .B(n672), .Y(n40) );
  NAND3X1 U487 ( .A(n238), .B(n114), .C(n311), .Y(n274) );
  OAI21X1 U489 ( .A(n676), .B(n323), .C(n339), .Y(n694) );
  NAND3X1 U490 ( .A(n568), .B(n331), .C(n569), .Y(n339) );
  NAND2X1 U492 ( .A(n340), .B(n323), .Y(n325) );
  OAI21X1 U494 ( .A(n342), .B(n343), .C(n637), .Y(n323) );
  NOR2X1 U496 ( .A(n340), .B(n342), .Y(n311) );
  NOR2X1 U498 ( .A(n341), .B(n344), .Y(n343) );
  OAI21X1 U499 ( .A(n680), .B(n681), .C(n331), .Y(n344) );
  NAND3X1 U500 ( .A(prev_hwrite), .B(raddr_ready_ff), .C(n345), .Y(n331) );
  NOR2X1 U501 ( .A(n677), .B(n678), .Y(n345) );
  NAND2X1 U506 ( .A(n333), .B(n334), .Y(n341) );
  NAND3X1 U507 ( .A(hready_ff), .B(we_ff), .C(n346), .Y(n334) );
  NOR2X1 U508 ( .A(prev_hwrite), .B(n571), .Y(n346) );
  NAND2X1 U510 ( .A(n347), .B(re_ff), .Y(n333) );
  NOR2X1 U511 ( .A(stop), .B(prev_hwrite), .Y(n347) );
  NOR2X1 U512 ( .A(n676), .B(n337), .Y(n342) );
  NOR2X1 U513 ( .A(Q[1]), .B(Q[0]), .Y(n337) );
  NAND2X1 U514 ( .A(init), .B(n238), .Y(inc_waddr) );
  NAND3X1 U515 ( .A(n636), .B(n676), .C(Q[1]), .Y(n238) );
  NAND2X1 U517 ( .A(n104), .B(init), .Y(inc_raddr) );
  OAI21X1 U519 ( .A(n318), .B(n673), .C(n312), .Y(n80) );
  NAND3X1 U520 ( .A(n679), .B(n676), .C(Q[0]), .Y(n312) );
  NAND3X1 U523 ( .A(Q[0]), .B(n676), .C(Q[1]), .Y(n318) );
  AND2X2 U474 ( .A(n114), .B(n311), .Y(n319) );
  AND2X2 U497 ( .A(n337), .B(n676), .Y(n340) );
  INVX1 U5 ( .A(n311), .Y(n637) );
  INVX1 U6 ( .A(n165), .Y(n164) );
  AND2X1 U8 ( .A(n337), .B(Q[2]), .Y(n3) );
  INVX2 U10 ( .A(n135), .Y(n119) );
  INVX2 U12 ( .A(n139), .Y(n115) );
  INVX2 U14 ( .A(n134), .Y(n120) );
  INVX2 U16 ( .A(n130), .Y(n124) );
  INVX2 U18 ( .A(n129), .Y(n125) );
  BUFX2 U20 ( .A(n159), .Y(n140) );
  BUFX2 U22 ( .A(n159), .Y(n129) );
  BUFX2 U24 ( .A(n159), .Y(n130) );
  BUFX2 U26 ( .A(n159), .Y(n134) );
  BUFX2 U28 ( .A(n159), .Y(n135) );
  BUFX2 U30 ( .A(n159), .Y(n139) );
  BUFX2 U32 ( .A(n159), .Y(n144) );
  BUFX2 U34 ( .A(n159), .Y(n145) );
  BUFX2 U36 ( .A(n159), .Y(n149) );
  BUFX2 U38 ( .A(n159), .Y(n150) );
  BUFX2 U40 ( .A(n159), .Y(n154) );
  BUFX2 U42 ( .A(n159), .Y(n155) );
  INVX2 U44 ( .A(n76), .Y(n74) );
  INVX2 U46 ( .A(n637), .Y(n76) );
  INVX2 U48 ( .A(n169), .Y(n160) );
  INVX2 U50 ( .A(n40), .Y(n159) );
  BUFX2 U52 ( .A(n6), .Y(n165) );
  BUFX2 U54 ( .A(n6), .Y(n170) );
  BUFX2 U56 ( .A(n6), .Y(n169) );
  BUFX2 U58 ( .A(n6), .Y(n179) );
  BUFX2 U60 ( .A(n6), .Y(n174) );
  BUFX2 U62 ( .A(n6), .Y(n175) );
  INVX2 U64 ( .A(n85), .Y(n78) );
  INVX2 U66 ( .A(n89), .Y(n77) );
  INVX2 U68 ( .A(n84), .Y(n79) );
  BUFX2 U70 ( .A(n6), .Y(n180) );
  INVX2 U72 ( .A(n104), .Y(n100) );
  INVX2 U74 ( .A(n238), .Y(n39) );
  INVX2 U76 ( .A(n238), .Y(n4) );
  INVX2 U78 ( .A(n2), .Y(n105) );
  INVX2 U80 ( .A(n2), .Y(n109) );
  BUFX2 U82 ( .A(n184), .Y(n195) );
  BUFX2 U84 ( .A(n184), .Y(n199) );
  BUFX2 U86 ( .A(n184), .Y(n200) );
  BUFX2 U88 ( .A(n185), .Y(n204) );
  BUFX2 U90 ( .A(n185), .Y(n205) );
  BUFX2 U92 ( .A(n185), .Y(n209) );
  BUFX2 U94 ( .A(n189), .Y(n210) );
  BUFX2 U96 ( .A(n189), .Y(n214) );
  BUFX2 U98 ( .A(n189), .Y(n215) );
  BUFX2 U100 ( .A(n190), .Y(n219) );
  BUFX2 U102 ( .A(n190), .Y(n220) );
  BUFX2 U104 ( .A(n190), .Y(n224) );
  BUFX2 U106 ( .A(n194), .Y(n225) );
  BUFX2 U108 ( .A(n194), .Y(n229) );
  BUFX2 U110 ( .A(n194), .Y(n230) );
  BUFX2 U112 ( .A(n276), .Y(n89) );
  BUFX2 U114 ( .A(n276), .Y(n85) );
  BUFX2 U116 ( .A(n276), .Y(n84) );
  BUFX2 U118 ( .A(n276), .Y(n95) );
  BUFX2 U120 ( .A(n276), .Y(n94) );
  BUFX2 U122 ( .A(n276), .Y(n90) );
  INVX2 U124 ( .A(n3), .Y(n114) );
  BUFX2 U126 ( .A(n276), .Y(n99) );
  AND2X2 U128 ( .A(n672), .B(n673), .Y(n2) );
  INVX2 U130 ( .A(n80), .Y(n104) );
  INVX2 U132 ( .A(n3), .Y(n110) );
  BUFX2 U137 ( .A(n_rst), .Y(n184) );
  BUFX2 U138 ( .A(n_rst), .Y(n185) );
  BUFX2 U143 ( .A(n_rst), .Y(n189) );
  BUFX2 U144 ( .A(n_rst), .Y(n190) );
  BUFX2 U149 ( .A(n_rst), .Y(n194) );
  INVX2 U150 ( .A(raddr_ready), .Y(n234) );
  INVX2 U155 ( .A(n270), .Y(n235) );
  INVX2 U156 ( .A(n269), .Y(n236) );
  INVX2 U161 ( .A(n268), .Y(n237) );
  INVX2 U162 ( .A(n239), .Y(n271) );
  INVX2 U167 ( .A(n240), .Y(n273) );
  INVX2 U168 ( .A(n241), .Y(n277) );
  INVX2 U173 ( .A(n242), .Y(n314) );
  INVX2 U174 ( .A(n243), .Y(n316) );
  INVX2 U179 ( .A(n244), .Y(n317) );
  INVX2 U180 ( .A(n245), .Y(n320) );
  INVX2 U185 ( .A(n246), .Y(n321) );
  INVX2 U186 ( .A(n247), .Y(n322) );
  INVX2 U191 ( .A(n248), .Y(n324) );
  INVX2 U192 ( .A(n249), .Y(n326) );
  INVX2 U197 ( .A(n250), .Y(n329) );
  INVX2 U198 ( .A(n251), .Y(n330) );
  INVX2 U203 ( .A(n252), .Y(n332) );
  INVX2 U204 ( .A(n253), .Y(n335) );
  INVX2 U209 ( .A(n254), .Y(n336) );
  INVX2 U210 ( .A(n255), .Y(n338) );
  INVX2 U215 ( .A(n256), .Y(n348) );
  INVX2 U216 ( .A(n257), .Y(n524) );
  INVX2 U221 ( .A(n258), .Y(n525) );
  INVX2 U222 ( .A(n259), .Y(n526) );
  INVX2 U227 ( .A(n260), .Y(n527) );
  INVX2 U228 ( .A(n261), .Y(n528) );
  INVX2 U233 ( .A(n262), .Y(n529) );
  INVX2 U234 ( .A(n263), .Y(n530) );
  INVX2 U239 ( .A(n264), .Y(n531) );
  INVX2 U240 ( .A(n265), .Y(n532) );
  INVX2 U245 ( .A(n266), .Y(n533) );
  INVX2 U246 ( .A(n267), .Y(n534) );
  INVX2 U251 ( .A(waddr_ready), .Y(n535) );
  INVX2 U252 ( .A(n308), .Y(n536) );
  INVX2 U257 ( .A(n275), .Y(n537) );
  INVX2 U258 ( .A(n278), .Y(n538) );
  INVX2 U263 ( .A(n307), .Y(n539) );
  INVX2 U264 ( .A(n306), .Y(n540) );
  INVX2 U269 ( .A(n305), .Y(n541) );
  INVX2 U270 ( .A(n304), .Y(n542) );
  INVX2 U275 ( .A(n303), .Y(n543) );
  INVX2 U276 ( .A(n302), .Y(n544) );
  INVX2 U281 ( .A(n301), .Y(n545) );
  INVX2 U282 ( .A(n300), .Y(n546) );
  INVX2 U287 ( .A(n299), .Y(n547) );
  INVX2 U288 ( .A(n298), .Y(n548) );
  INVX2 U293 ( .A(n297), .Y(n549) );
  INVX2 U294 ( .A(n296), .Y(n550) );
  INVX2 U299 ( .A(n295), .Y(n551) );
  INVX2 U300 ( .A(n294), .Y(n552) );
  INVX2 U305 ( .A(n293), .Y(n553) );
  INVX2 U306 ( .A(n292), .Y(n554) );
  INVX2 U311 ( .A(n291), .Y(n555) );
  INVX2 U312 ( .A(n290), .Y(n556) );
  INVX2 U317 ( .A(n289), .Y(n557) );
  INVX2 U318 ( .A(n288), .Y(n558) );
  INVX2 U323 ( .A(n287), .Y(n559) );
  INVX2 U324 ( .A(n286), .Y(n560) );
  INVX2 U325 ( .A(n285), .Y(n561) );
  INVX2 U327 ( .A(n284), .Y(n562) );
  INVX2 U328 ( .A(n283), .Y(n563) );
  INVX2 U330 ( .A(n282), .Y(n564) );
  INVX2 U332 ( .A(n281), .Y(n565) );
  INVX2 U334 ( .A(n280), .Y(n566) );
  INVX2 U336 ( .A(n279), .Y(n567) );
  INVX2 U338 ( .A(n341), .Y(n568) );
  INVX2 U340 ( .A(n325), .Y(n569) );
  INVX2 U342 ( .A(n334), .Y(n570) );
  INVX2 U344 ( .A(waddr_ready_ff), .Y(n571) );
  INVX2 U346 ( .A(n38), .Y(n572) );
  INVX2 U348 ( .A(n41), .Y(n573) );
  INVX2 U350 ( .A(n42), .Y(n574) );
  INVX2 U352 ( .A(n43), .Y(n575) );
  INVX2 U354 ( .A(n44), .Y(n576) );
  INVX2 U356 ( .A(n45), .Y(n577) );
  INVX2 U358 ( .A(n46), .Y(n578) );
  INVX2 U360 ( .A(n47), .Y(n579) );
  INVX2 U362 ( .A(n48), .Y(n580) );
  INVX2 U364 ( .A(n49), .Y(n581) );
  INVX2 U366 ( .A(n50), .Y(n582) );
  INVX2 U368 ( .A(n51), .Y(n583) );
  INVX2 U370 ( .A(n52), .Y(n584) );
  INVX2 U372 ( .A(n53), .Y(n585) );
  INVX2 U374 ( .A(n54), .Y(n586) );
  INVX2 U376 ( .A(n55), .Y(n587) );
  INVX2 U378 ( .A(n56), .Y(n588) );
  INVX2 U380 ( .A(n57), .Y(n589) );
  INVX2 U382 ( .A(n58), .Y(n622) );
  INVX2 U384 ( .A(n59), .Y(n623) );
  INVX2 U386 ( .A(n60), .Y(n624) );
  INVX2 U388 ( .A(n61), .Y(n625) );
  INVX2 U390 ( .A(n62), .Y(n626) );
  INVX2 U393 ( .A(n63), .Y(n627) );
  INVX2 U395 ( .A(n64), .Y(n628) );
  INVX2 U396 ( .A(n65), .Y(n629) );
  INVX2 U397 ( .A(n66), .Y(n630) );
  INVX2 U399 ( .A(n67), .Y(n631) );
  INVX2 U401 ( .A(n68), .Y(n632) );
  INVX2 U403 ( .A(n69), .Y(n633) );
  INVX2 U405 ( .A(n70), .Y(n634) );
  INVX2 U407 ( .A(n71), .Y(n635) );
  INVX2 U409 ( .A(Q[0]), .Y(n636) );
  INVX2 U411 ( .A(n5), .Y(n638) );
  INVX2 U413 ( .A(n7), .Y(n639) );
  INVX2 U415 ( .A(n8), .Y(n640) );
  INVX2 U417 ( .A(n9), .Y(n641) );
  INVX2 U419 ( .A(n10), .Y(n642) );
  INVX2 U421 ( .A(n11), .Y(n643) );
  INVX2 U423 ( .A(n12), .Y(n644) );
  INVX2 U425 ( .A(n13), .Y(n645) );
  INVX2 U427 ( .A(n14), .Y(n646) );
  INVX2 U429 ( .A(n15), .Y(n647) );
  INVX2 U431 ( .A(n16), .Y(n648) );
  INVX2 U433 ( .A(n17), .Y(n649) );
  INVX2 U435 ( .A(n18), .Y(n650) );
  INVX2 U437 ( .A(n19), .Y(n651) );
  INVX2 U439 ( .A(n20), .Y(n652) );
  INVX2 U441 ( .A(n21), .Y(n653) );
  INVX2 U443 ( .A(n22), .Y(n655) );
  INVX2 U445 ( .A(n23), .Y(n656) );
  INVX2 U447 ( .A(n24), .Y(n657) );
  INVX2 U449 ( .A(n25), .Y(n658) );
  INVX2 U451 ( .A(n26), .Y(n659) );
  INVX2 U453 ( .A(n27), .Y(n660) );
  INVX2 U455 ( .A(n28), .Y(n661) );
  INVX2 U457 ( .A(n29), .Y(n662) );
  INVX2 U459 ( .A(n30), .Y(n663) );
  INVX2 U461 ( .A(n31), .Y(n664) );
  INVX2 U469 ( .A(n32), .Y(n665) );
  INVX2 U471 ( .A(n33), .Y(n666) );
  INVX2 U472 ( .A(n34), .Y(n667) );
  INVX2 U476 ( .A(n35), .Y(n668) );
  INVX2 U480 ( .A(n36), .Y(n669) );
  INVX2 U482 ( .A(n37), .Y(n670) );
  INVX2 U484 ( .A(n312), .Y(n671) );
  INVX2 U486 ( .A(n318), .Y(n672) );
  INVX2 U488 ( .A(init2), .Y(n673) );
  INVX2 U491 ( .A(raddr_ready_ff), .Y(n674) );
  INVX2 U493 ( .A(n331), .Y(n675) );
  INVX2 U495 ( .A(Q[2]), .Y(n676) );
  INVX2 U502 ( .A(hready_ff), .Y(n677) );
  INVX2 U503 ( .A(re_ff), .Y(n678) );
  INVX2 U504 ( .A(Q[1]), .Y(n679) );
  INVX2 U505 ( .A(prev_hwrite), .Y(n680) );
  INVX2 U509 ( .A(we_ff), .Y(n681) );
  INVX2 U516 ( .A(prev_waddr[31]), .Y(n682) );
  INVX2 U518 ( .A(prev_waddr[0]), .Y(n683) );
  INVX2 U521 ( .A(prev_waddr[1]), .Y(n684) );
  INVX2 U522 ( .A(prev_waddr[2]), .Y(n685) );
  INVX2 U524 ( .A(prev_waddr[3]), .Y(n686) );
  INVX2 U699 ( .A(prev_waddr[4]), .Y(n695) );
  INVX2 U700 ( .A(prev_waddr[5]), .Y(n696) );
  INVX2 U701 ( .A(prev_waddr[6]), .Y(n697) );
  INVX2 U702 ( .A(prev_waddr[7]), .Y(n698) );
  INVX2 U703 ( .A(prev_waddr[8]), .Y(n699) );
  INVX2 U704 ( .A(prev_waddr[9]), .Y(n700) );
  INVX2 U705 ( .A(prev_waddr[10]), .Y(n701) );
  INVX2 U706 ( .A(prev_waddr[11]), .Y(n702) );
  INVX2 U707 ( .A(prev_waddr[12]), .Y(n703) );
  INVX2 U708 ( .A(prev_waddr[13]), .Y(n704) );
  INVX2 U709 ( .A(prev_waddr[14]), .Y(n705) );
  INVX2 U710 ( .A(prev_waddr[15]), .Y(n706) );
  INVX2 U711 ( .A(prev_waddr[16]), .Y(n707) );
  INVX2 U712 ( .A(prev_waddr[17]), .Y(n708) );
  INVX2 U713 ( .A(prev_waddr[18]), .Y(n709) );
  INVX2 U714 ( .A(prev_waddr[19]), .Y(n710) );
  INVX2 U715 ( .A(prev_waddr[20]), .Y(n711) );
  INVX2 U716 ( .A(prev_waddr[21]), .Y(n712) );
  INVX2 U717 ( .A(prev_waddr[22]), .Y(n713) );
  INVX2 U718 ( .A(prev_waddr[23]), .Y(n714) );
  INVX2 U719 ( .A(prev_waddr[24]), .Y(n715) );
  INVX2 U720 ( .A(prev_waddr[25]), .Y(n716) );
  INVX2 U721 ( .A(prev_waddr[26]), .Y(n717) );
  INVX2 U722 ( .A(prev_waddr[27]), .Y(n718) );
  INVX2 U723 ( .A(prev_waddr[28]), .Y(n719) );
  INVX2 U724 ( .A(prev_waddr[29]), .Y(n720) );
  INVX2 U725 ( .A(prev_waddr[30]), .Y(n721) );
  INVX2 U726 ( .A(prev_raddr[31]), .Y(n722) );
  INVX2 U727 ( .A(prev_raddr[30]), .Y(n723) );
  INVX2 U728 ( .A(prev_raddr[29]), .Y(n724) );
  INVX2 U729 ( .A(prev_raddr[28]), .Y(n725) );
  INVX2 U730 ( .A(prev_raddr[27]), .Y(n726) );
  INVX2 U731 ( .A(prev_raddr[26]), .Y(n727) );
  INVX2 U732 ( .A(prev_raddr[25]), .Y(n728) );
  INVX2 U733 ( .A(prev_raddr[24]), .Y(n729) );
  INVX2 U734 ( .A(prev_raddr[23]), .Y(n730) );
  INVX2 U735 ( .A(prev_raddr[22]), .Y(n731) );
  INVX2 U736 ( .A(prev_raddr[21]), .Y(n732) );
  INVX2 U737 ( .A(prev_raddr[20]), .Y(n733) );
  INVX2 U738 ( .A(prev_raddr[19]), .Y(n734) );
  INVX2 U739 ( .A(prev_raddr[18]), .Y(n735) );
  INVX2 U740 ( .A(prev_raddr[17]), .Y(n736) );
  INVX2 U741 ( .A(prev_raddr[16]), .Y(n737) );
  INVX2 U742 ( .A(prev_raddr[15]), .Y(n738) );
  INVX2 U743 ( .A(prev_raddr[14]), .Y(n739) );
  INVX2 U744 ( .A(prev_raddr[13]), .Y(n740) );
  INVX2 U745 ( .A(prev_raddr[12]), .Y(n741) );
  INVX2 U746 ( .A(prev_raddr[11]), .Y(n742) );
  INVX2 U747 ( .A(prev_raddr[10]), .Y(n743) );
  INVX2 U748 ( .A(prev_raddr[9]), .Y(n744) );
  INVX2 U749 ( .A(prev_raddr[8]), .Y(n745) );
  INVX2 U750 ( .A(prev_raddr[7]), .Y(n746) );
  INVX2 U751 ( .A(prev_raddr[6]), .Y(n747) );
  INVX2 U752 ( .A(prev_raddr[5]), .Y(n748) );
  INVX2 U753 ( .A(prev_raddr[4]), .Y(n749) );
  INVX2 U754 ( .A(prev_raddr[3]), .Y(n750) );
  INVX2 U755 ( .A(prev_raddr[2]), .Y(n751) );
  INVX2 U756 ( .A(prev_raddr[1]), .Y(n752) );
  INVX2 U757 ( .A(prev_raddr[0]), .Y(n753) );
  INVX2 U758 ( .A(re), .Y(n754) );
  INVX2 U759 ( .A(we), .Y(n755) );
  INVX2 U760 ( .A(hready), .Y(n756) );
endmodule


module AHB_slave ( clk, n_rst, done, haddr, hwrite, hwdata, hrdata, hready, 
        start_waddr, start_raddr, img_width, img_height );
  input [31:0] haddr;
  input [31:0] hwdata;
  output [31:0] hrdata;
  output [31:0] start_waddr;
  output [31:0] start_raddr;
  output [15:0] img_width;
  output [15:0] img_height;
  input clk, n_rst, done, hwrite;
  output hready;
  wire   n475, \n_hready[0] , n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n133, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n447, n448, n449,
         n450, n451, n452, n453, n454, n455, n456, n457, n458, n459, n460,
         n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471,
         n472, n473, n474;
  wire   [2:0] Q;
  wire   [2:0] nQ;

  DFFSR \Q_reg[0]  ( .D(nQ[0]), .CLK(clk), .R(n162), .S(1'b1), .Q(Q[0]) );
  DFFSR \Q_reg[2]  ( .D(nQ[2]), .CLK(clk), .R(n162), .S(1'b1), .Q(Q[2]) );
  DFFSR \Q_reg[1]  ( .D(nQ[1]), .CLK(clk), .R(n162), .S(1'b1), .Q(Q[1]) );
  DFFSR \hrdata_reg[31]  ( .D(n446), .CLK(clk), .R(n162), .S(1'b1), .Q(
        hrdata[31]) );
  DFFSR \hrdata_reg[30]  ( .D(n445), .CLK(clk), .R(n162), .S(1'b1), .Q(
        hrdata[30]) );
  DFFSR \hrdata_reg[29]  ( .D(n444), .CLK(clk), .R(n162), .S(1'b1), .Q(
        hrdata[29]) );
  DFFSR \hrdata_reg[28]  ( .D(n443), .CLK(clk), .R(n162), .S(1'b1), .Q(
        hrdata[28]) );
  DFFSR \hrdata_reg[27]  ( .D(n442), .CLK(clk), .R(n162), .S(1'b1), .Q(
        hrdata[27]) );
  DFFSR \hrdata_reg[26]  ( .D(n441), .CLK(clk), .R(n162), .S(1'b1), .Q(
        hrdata[26]) );
  DFFSR \hrdata_reg[25]  ( .D(n440), .CLK(clk), .R(n162), .S(1'b1), .Q(
        hrdata[25]) );
  DFFSR \hrdata_reg[24]  ( .D(n439), .CLK(clk), .R(n162), .S(1'b1), .Q(
        hrdata[24]) );
  DFFSR \hrdata_reg[23]  ( .D(n438), .CLK(clk), .R(n162), .S(1'b1), .Q(
        hrdata[23]) );
  DFFSR \hrdata_reg[22]  ( .D(n437), .CLK(clk), .R(n161), .S(1'b1), .Q(
        hrdata[22]) );
  DFFSR \hrdata_reg[21]  ( .D(n436), .CLK(clk), .R(n161), .S(1'b1), .Q(
        hrdata[21]) );
  DFFSR \hrdata_reg[20]  ( .D(n435), .CLK(clk), .R(n161), .S(1'b1), .Q(
        hrdata[20]) );
  DFFSR \hrdata_reg[19]  ( .D(n434), .CLK(clk), .R(n161), .S(1'b1), .Q(
        hrdata[19]) );
  DFFSR \hrdata_reg[18]  ( .D(n433), .CLK(clk), .R(n161), .S(1'b1), .Q(
        hrdata[18]) );
  DFFSR \hrdata_reg[17]  ( .D(n432), .CLK(clk), .R(n161), .S(1'b1), .Q(
        hrdata[17]) );
  DFFSR \hrdata_reg[16]  ( .D(n431), .CLK(clk), .R(n161), .S(1'b1), .Q(
        hrdata[16]) );
  DFFSR \hrdata_reg[15]  ( .D(n430), .CLK(clk), .R(n161), .S(1'b1), .Q(
        hrdata[15]) );
  DFFSR \hrdata_reg[14]  ( .D(n429), .CLK(clk), .R(n161), .S(1'b1), .Q(
        hrdata[14]) );
  DFFSR \hrdata_reg[13]  ( .D(n428), .CLK(clk), .R(n161), .S(1'b1), .Q(
        hrdata[13]) );
  DFFSR \hrdata_reg[12]  ( .D(n427), .CLK(clk), .R(n161), .S(1'b1), .Q(
        hrdata[12]) );
  DFFSR \hrdata_reg[11]  ( .D(n426), .CLK(clk), .R(n161), .S(1'b1), .Q(
        hrdata[11]) );
  DFFSR \hrdata_reg[10]  ( .D(n425), .CLK(clk), .R(n160), .S(1'b1), .Q(
        hrdata[10]) );
  DFFSR \hrdata_reg[9]  ( .D(n424), .CLK(clk), .R(n160), .S(1'b1), .Q(
        hrdata[9]) );
  DFFSR \hrdata_reg[8]  ( .D(n423), .CLK(clk), .R(n160), .S(1'b1), .Q(
        hrdata[8]) );
  DFFSR \hrdata_reg[7]  ( .D(n422), .CLK(clk), .R(n160), .S(1'b1), .Q(
        hrdata[7]) );
  DFFSR \hrdata_reg[6]  ( .D(n421), .CLK(clk), .R(n160), .S(1'b1), .Q(
        hrdata[6]) );
  DFFSR \hrdata_reg[5]  ( .D(n420), .CLK(clk), .R(n160), .S(1'b1), .Q(
        hrdata[5]) );
  DFFSR \hrdata_reg[4]  ( .D(n419), .CLK(clk), .R(n160), .S(1'b1), .Q(
        hrdata[4]) );
  DFFSR \hrdata_reg[3]  ( .D(n418), .CLK(clk), .R(n160), .S(1'b1), .Q(
        hrdata[3]) );
  DFFSR \hrdata_reg[2]  ( .D(n417), .CLK(clk), .R(n160), .S(1'b1), .Q(
        hrdata[2]) );
  DFFSR \hrdata_reg[1]  ( .D(n416), .CLK(clk), .R(n160), .S(1'b1), .Q(
        hrdata[1]) );
  DFFSR \hrdata_reg[0]  ( .D(n415), .CLK(clk), .R(n160), .S(1'b1), .Q(
        hrdata[0]) );
  DFFSR hready_reg ( .D(\n_hready[0] ), .CLK(clk), .R(n160), .S(1'b1), .Q(
        hready) );
  DFFSR \start_waddr_reg[31]  ( .D(n414), .CLK(clk), .R(n159), .S(1'b1), .Q(
        start_waddr[31]) );
  DFFSR \start_waddr_reg[30]  ( .D(n413), .CLK(clk), .R(n159), .S(1'b1), .Q(
        start_waddr[30]) );
  DFFSR \start_waddr_reg[29]  ( .D(n412), .CLK(clk), .R(n159), .S(1'b1), .Q(
        start_waddr[29]) );
  DFFSR \start_waddr_reg[28]  ( .D(n411), .CLK(clk), .R(n159), .S(1'b1), .Q(
        start_waddr[28]) );
  DFFSR \start_waddr_reg[27]  ( .D(n410), .CLK(clk), .R(n159), .S(1'b1), .Q(
        start_waddr[27]) );
  DFFSR \start_waddr_reg[26]  ( .D(n409), .CLK(clk), .R(n159), .S(1'b1), .Q(
        start_waddr[26]) );
  DFFSR \start_waddr_reg[25]  ( .D(n408), .CLK(clk), .R(n159), .S(1'b1), .Q(
        start_waddr[25]) );
  DFFSR \start_waddr_reg[24]  ( .D(n407), .CLK(clk), .R(n159), .S(1'b1), .Q(
        start_waddr[24]) );
  DFFSR \start_waddr_reg[23]  ( .D(n406), .CLK(clk), .R(n159), .S(1'b1), .Q(
        start_waddr[23]) );
  DFFSR \start_waddr_reg[22]  ( .D(n405), .CLK(clk), .R(n159), .S(1'b1), .Q(
        start_waddr[22]) );
  DFFSR \start_waddr_reg[21]  ( .D(n404), .CLK(clk), .R(n159), .S(1'b1), .Q(
        start_waddr[21]) );
  DFFSR \start_waddr_reg[20]  ( .D(n403), .CLK(clk), .R(n159), .S(1'b1), .Q(
        start_waddr[20]) );
  DFFSR \start_waddr_reg[19]  ( .D(n402), .CLK(clk), .R(n158), .S(1'b1), .Q(
        start_waddr[19]) );
  DFFSR \start_waddr_reg[18]  ( .D(n401), .CLK(clk), .R(n158), .S(1'b1), .Q(
        start_waddr[18]) );
  DFFSR \start_waddr_reg[17]  ( .D(n400), .CLK(clk), .R(n158), .S(1'b1), .Q(
        start_waddr[17]) );
  DFFSR \start_waddr_reg[16]  ( .D(n399), .CLK(clk), .R(n158), .S(1'b1), .Q(
        start_waddr[16]) );
  DFFSR \start_waddr_reg[15]  ( .D(n398), .CLK(clk), .R(n158), .S(1'b1), .Q(
        start_waddr[15]) );
  DFFSR \start_waddr_reg[14]  ( .D(n397), .CLK(clk), .R(n158), .S(1'b1), .Q(
        start_waddr[14]) );
  DFFSR \start_waddr_reg[13]  ( .D(n396), .CLK(clk), .R(n158), .S(1'b1), .Q(
        start_waddr[13]) );
  DFFSR \start_waddr_reg[12]  ( .D(n395), .CLK(clk), .R(n158), .S(1'b1), .Q(
        start_waddr[12]) );
  DFFSR \start_waddr_reg[11]  ( .D(n394), .CLK(clk), .R(n158), .S(1'b1), .Q(
        start_waddr[11]) );
  DFFSR \start_waddr_reg[10]  ( .D(n393), .CLK(clk), .R(n158), .S(1'b1), .Q(
        start_waddr[10]) );
  DFFSR \start_waddr_reg[9]  ( .D(n392), .CLK(clk), .R(n158), .S(1'b1), .Q(
        start_waddr[9]) );
  DFFSR \start_waddr_reg[8]  ( .D(n391), .CLK(clk), .R(n158), .S(1'b1), .Q(
        start_waddr[8]) );
  DFFSR \start_waddr_reg[7]  ( .D(n390), .CLK(clk), .R(n157), .S(1'b1), .Q(
        start_waddr[7]) );
  DFFSR \start_waddr_reg[6]  ( .D(n389), .CLK(clk), .R(n157), .S(1'b1), .Q(
        start_waddr[6]) );
  DFFSR \start_waddr_reg[5]  ( .D(n388), .CLK(clk), .R(n157), .S(1'b1), .Q(
        start_waddr[5]) );
  DFFSR \start_waddr_reg[4]  ( .D(n387), .CLK(clk), .R(n157), .S(1'b1), .Q(
        start_waddr[4]) );
  DFFSR \start_waddr_reg[3]  ( .D(n386), .CLK(clk), .R(n157), .S(1'b1), .Q(
        start_waddr[3]) );
  DFFSR \start_waddr_reg[2]  ( .D(n385), .CLK(clk), .R(n157), .S(1'b1), .Q(
        start_waddr[2]) );
  DFFSR \start_waddr_reg[1]  ( .D(n384), .CLK(clk), .R(n157), .S(1'b1), .Q(
        start_waddr[1]) );
  DFFSR \start_waddr_reg[0]  ( .D(n383), .CLK(clk), .R(n157), .S(1'b1), .Q(
        start_waddr[0]) );
  DFFSR \start_raddr_reg[31]  ( .D(n382), .CLK(clk), .R(n157), .S(1'b1), .Q(
        start_raddr[31]) );
  DFFSR \start_raddr_reg[30]  ( .D(n381), .CLK(clk), .R(n157), .S(1'b1), .Q(
        start_raddr[30]) );
  DFFSR \start_raddr_reg[29]  ( .D(n380), .CLK(clk), .R(n157), .S(1'b1), .Q(
        start_raddr[29]) );
  DFFSR \start_raddr_reg[28]  ( .D(n379), .CLK(clk), .R(n157), .S(1'b1), .Q(
        start_raddr[28]) );
  DFFSR \start_raddr_reg[27]  ( .D(n378), .CLK(clk), .R(n156), .S(1'b1), .Q(
        start_raddr[27]) );
  DFFSR \start_raddr_reg[26]  ( .D(n377), .CLK(clk), .R(n156), .S(1'b1), .Q(
        start_raddr[26]) );
  DFFSR \start_raddr_reg[25]  ( .D(n376), .CLK(clk), .R(n156), .S(1'b1), .Q(
        start_raddr[25]) );
  DFFSR \start_raddr_reg[24]  ( .D(n375), .CLK(clk), .R(n156), .S(1'b1), .Q(
        start_raddr[24]) );
  DFFSR \start_raddr_reg[23]  ( .D(n374), .CLK(clk), .R(n156), .S(1'b1), .Q(
        start_raddr[23]) );
  DFFSR \start_raddr_reg[22]  ( .D(n373), .CLK(clk), .R(n156), .S(1'b1), .Q(
        start_raddr[22]) );
  DFFSR \start_raddr_reg[21]  ( .D(n372), .CLK(clk), .R(n156), .S(1'b1), .Q(
        start_raddr[21]) );
  DFFSR \start_raddr_reg[20]  ( .D(n371), .CLK(clk), .R(n156), .S(1'b1), .Q(
        start_raddr[20]) );
  DFFSR \start_raddr_reg[19]  ( .D(n370), .CLK(clk), .R(n156), .S(1'b1), .Q(
        start_raddr[19]) );
  DFFSR \start_raddr_reg[18]  ( .D(n369), .CLK(clk), .R(n156), .S(1'b1), .Q(
        start_raddr[18]) );
  DFFSR \start_raddr_reg[17]  ( .D(n368), .CLK(clk), .R(n156), .S(1'b1), .Q(
        start_raddr[17]) );
  DFFSR \start_raddr_reg[16]  ( .D(n367), .CLK(clk), .R(n156), .S(1'b1), .Q(
        start_raddr[16]) );
  DFFSR \start_raddr_reg[15]  ( .D(n366), .CLK(clk), .R(n155), .S(1'b1), .Q(
        start_raddr[15]) );
  DFFSR \start_raddr_reg[14]  ( .D(n365), .CLK(clk), .R(n155), .S(1'b1), .Q(
        start_raddr[14]) );
  DFFSR \start_raddr_reg[13]  ( .D(n364), .CLK(clk), .R(n155), .S(1'b1), .Q(
        start_raddr[13]) );
  DFFSR \start_raddr_reg[12]  ( .D(n363), .CLK(clk), .R(n155), .S(1'b1), .Q(
        start_raddr[12]) );
  DFFSR \start_raddr_reg[11]  ( .D(n362), .CLK(clk), .R(n155), .S(1'b1), .Q(
        start_raddr[11]) );
  DFFSR \start_raddr_reg[10]  ( .D(n361), .CLK(clk), .R(n155), .S(1'b1), .Q(
        start_raddr[10]) );
  DFFSR \start_raddr_reg[9]  ( .D(n360), .CLK(clk), .R(n155), .S(1'b1), .Q(
        start_raddr[9]) );
  DFFSR \start_raddr_reg[8]  ( .D(n359), .CLK(clk), .R(n155), .S(1'b1), .Q(
        start_raddr[8]) );
  DFFSR \start_raddr_reg[7]  ( .D(n358), .CLK(clk), .R(n155), .S(1'b1), .Q(
        start_raddr[7]) );
  DFFSR \start_raddr_reg[6]  ( .D(n357), .CLK(clk), .R(n155), .S(1'b1), .Q(
        start_raddr[6]) );
  DFFSR \start_raddr_reg[5]  ( .D(n356), .CLK(clk), .R(n155), .S(1'b1), .Q(
        start_raddr[5]) );
  DFFSR \start_raddr_reg[4]  ( .D(n355), .CLK(clk), .R(n155), .S(1'b1), .Q(
        start_raddr[4]) );
  DFFSR \start_raddr_reg[3]  ( .D(n354), .CLK(clk), .R(n154), .S(1'b1), .Q(
        start_raddr[3]) );
  DFFSR \start_raddr_reg[2]  ( .D(n353), .CLK(clk), .R(n154), .S(1'b1), .Q(
        start_raddr[2]) );
  DFFSR \start_raddr_reg[1]  ( .D(n352), .CLK(clk), .R(n154), .S(1'b1), .Q(
        start_raddr[1]) );
  DFFSR \start_raddr_reg[0]  ( .D(n351), .CLK(clk), .R(n154), .S(1'b1), .Q(
        start_raddr[0]) );
  DFFSR \img_height_reg[15]  ( .D(n350), .CLK(clk), .R(n154), .S(1'b1), .Q(
        img_height[15]) );
  DFFSR \img_height_reg[14]  ( .D(n349), .CLK(clk), .R(n154), .S(1'b1), .Q(
        img_height[14]) );
  DFFSR \img_height_reg[13]  ( .D(n348), .CLK(clk), .R(n154), .S(1'b1), .Q(
        img_height[13]) );
  DFFSR \img_height_reg[12]  ( .D(n347), .CLK(clk), .R(n154), .S(1'b1), .Q(
        img_height[12]) );
  DFFSR \img_height_reg[11]  ( .D(n346), .CLK(clk), .R(n154), .S(1'b1), .Q(
        img_height[11]) );
  DFFSR \img_height_reg[10]  ( .D(n345), .CLK(clk), .R(n154), .S(1'b1), .Q(
        img_height[10]) );
  DFFSR \img_height_reg[9]  ( .D(n344), .CLK(clk), .R(n154), .S(1'b1), .Q(
        img_height[9]) );
  DFFSR \img_height_reg[8]  ( .D(n343), .CLK(clk), .R(n154), .S(1'b1), .Q(
        img_height[8]) );
  DFFSR \img_height_reg[7]  ( .D(n342), .CLK(clk), .R(n153), .S(1'b1), .Q(
        img_height[7]) );
  DFFSR \img_height_reg[6]  ( .D(n341), .CLK(clk), .R(n153), .S(1'b1), .Q(
        img_height[6]) );
  DFFSR \img_height_reg[5]  ( .D(n340), .CLK(clk), .R(n153), .S(1'b1), .Q(
        img_height[5]) );
  DFFSR \img_height_reg[4]  ( .D(n339), .CLK(clk), .R(n153), .S(1'b1), .Q(
        img_height[4]) );
  DFFSR \img_height_reg[3]  ( .D(n338), .CLK(clk), .R(n153), .S(1'b1), .Q(
        img_height[3]) );
  DFFSR \img_height_reg[2]  ( .D(n337), .CLK(clk), .R(n153), .S(1'b1), .Q(
        img_height[2]) );
  DFFSR \img_height_reg[1]  ( .D(n336), .CLK(clk), .R(n153), .S(1'b1), .Q(
        img_height[1]) );
  DFFSR \img_height_reg[0]  ( .D(n335), .CLK(clk), .R(n153), .S(1'b1), .Q(
        img_height[0]) );
  DFFSR \img_width_reg[15]  ( .D(n334), .CLK(clk), .R(n153), .S(1'b1), .Q(
        img_width[15]) );
  DFFSR \img_width_reg[14]  ( .D(n333), .CLK(clk), .R(n153), .S(1'b1), .Q(
        img_width[14]) );
  DFFSR \img_width_reg[13]  ( .D(n332), .CLK(clk), .R(n153), .S(1'b1), .Q(
        img_width[13]) );
  DFFSR \img_width_reg[12]  ( .D(n331), .CLK(clk), .R(n153), .S(1'b1), .Q(
        img_width[12]) );
  DFFSR \img_width_reg[11]  ( .D(n330), .CLK(clk), .R(n152), .S(1'b1), .Q(
        img_width[11]) );
  DFFSR \img_width_reg[10]  ( .D(n329), .CLK(clk), .R(n152), .S(1'b1), .Q(
        img_width[10]) );
  DFFSR \img_width_reg[9]  ( .D(n328), .CLK(clk), .R(n152), .S(1'b1), .Q(
        img_width[9]) );
  DFFSR \img_width_reg[8]  ( .D(n327), .CLK(clk), .R(n152), .S(1'b1), .Q(
        img_width[8]) );
  DFFSR \img_width_reg[7]  ( .D(n326), .CLK(clk), .R(n152), .S(1'b1), .Q(
        img_width[7]) );
  DFFSR \img_width_reg[6]  ( .D(n325), .CLK(clk), .R(n152), .S(1'b1), .Q(
        img_width[6]) );
  DFFSR \img_width_reg[5]  ( .D(n324), .CLK(clk), .R(n152), .S(1'b1), .Q(
        img_width[5]) );
  DFFSR \img_width_reg[4]  ( .D(n323), .CLK(clk), .R(n152), .S(1'b1), .Q(
        img_width[4]) );
  DFFSR \img_width_reg[3]  ( .D(n322), .CLK(clk), .R(n152), .S(1'b1), .Q(
        img_width[3]) );
  DFFSR \img_width_reg[2]  ( .D(n321), .CLK(clk), .R(n152), .S(1'b1), .Q(
        img_width[2]) );
  DFFSR \img_width_reg[1]  ( .D(n320), .CLK(clk), .R(n152), .S(1'b1), .Q(
        img_width[1]) );
  DFFSR \img_width_reg[0]  ( .D(n319), .CLK(clk), .R(n152), .S(1'b1), .Q(n475)
         );
  OAI21X1 U273 ( .A(n227), .B(n147), .C(n241), .Y(n351) );
  NAND2X1 U274 ( .A(start_raddr[0]), .B(n150), .Y(n241) );
  OAI21X1 U275 ( .A(n226), .B(n146), .C(n242), .Y(n352) );
  NAND2X1 U276 ( .A(start_raddr[1]), .B(n150), .Y(n242) );
  OAI21X1 U277 ( .A(n225), .B(n146), .C(n243), .Y(n353) );
  NAND2X1 U278 ( .A(start_raddr[2]), .B(n150), .Y(n243) );
  OAI21X1 U279 ( .A(n224), .B(n146), .C(n244), .Y(n354) );
  NAND2X1 U280 ( .A(start_raddr[3]), .B(n149), .Y(n244) );
  OAI21X1 U281 ( .A(n223), .B(n146), .C(n245), .Y(n355) );
  NAND2X1 U282 ( .A(start_raddr[4]), .B(n150), .Y(n245) );
  OAI21X1 U283 ( .A(n222), .B(n146), .C(n246), .Y(n356) );
  NAND2X1 U284 ( .A(start_raddr[5]), .B(n149), .Y(n246) );
  OAI21X1 U285 ( .A(n221), .B(n146), .C(n247), .Y(n357) );
  NAND2X1 U286 ( .A(start_raddr[6]), .B(n149), .Y(n247) );
  OAI21X1 U287 ( .A(n220), .B(n146), .C(n248), .Y(n358) );
  NAND2X1 U288 ( .A(start_raddr[7]), .B(n149), .Y(n248) );
  OAI21X1 U289 ( .A(n219), .B(n146), .C(n249), .Y(n359) );
  NAND2X1 U290 ( .A(start_raddr[8]), .B(n149), .Y(n249) );
  OAI21X1 U291 ( .A(n218), .B(n146), .C(n250), .Y(n360) );
  NAND2X1 U292 ( .A(start_raddr[9]), .B(n149), .Y(n250) );
  OAI21X1 U293 ( .A(n217), .B(n146), .C(n251), .Y(n361) );
  NAND2X1 U294 ( .A(start_raddr[10]), .B(n149), .Y(n251) );
  OAI21X1 U295 ( .A(n216), .B(n146), .C(n252), .Y(n362) );
  NAND2X1 U296 ( .A(start_raddr[11]), .B(n149), .Y(n252) );
  OAI21X1 U297 ( .A(n215), .B(n146), .C(n253), .Y(n363) );
  NAND2X1 U298 ( .A(start_raddr[12]), .B(n149), .Y(n253) );
  OAI21X1 U299 ( .A(n214), .B(n147), .C(n254), .Y(n364) );
  NAND2X1 U300 ( .A(start_raddr[13]), .B(n149), .Y(n254) );
  OAI21X1 U301 ( .A(n213), .B(n147), .C(n255), .Y(n365) );
  NAND2X1 U302 ( .A(start_raddr[14]), .B(n149), .Y(n255) );
  OAI21X1 U303 ( .A(n212), .B(n147), .C(n256), .Y(n366) );
  NAND2X1 U304 ( .A(start_raddr[15]), .B(n148), .Y(n256) );
  OAI21X1 U305 ( .A(n211), .B(n147), .C(n257), .Y(n367) );
  NAND2X1 U306 ( .A(start_raddr[16]), .B(n149), .Y(n257) );
  OAI21X1 U307 ( .A(n210), .B(n147), .C(n258), .Y(n368) );
  NAND2X1 U308 ( .A(start_raddr[17]), .B(n148), .Y(n258) );
  OAI21X1 U309 ( .A(n209), .B(n147), .C(n259), .Y(n369) );
  NAND2X1 U310 ( .A(start_raddr[18]), .B(n148), .Y(n259) );
  OAI21X1 U311 ( .A(n208), .B(n147), .C(n260), .Y(n370) );
  NAND2X1 U312 ( .A(start_raddr[19]), .B(n148), .Y(n260) );
  OAI21X1 U313 ( .A(n207), .B(n147), .C(n261), .Y(n371) );
  NAND2X1 U314 ( .A(start_raddr[20]), .B(n148), .Y(n261) );
  OAI21X1 U315 ( .A(n206), .B(n147), .C(n262), .Y(n372) );
  NAND2X1 U316 ( .A(start_raddr[21]), .B(n148), .Y(n262) );
  OAI21X1 U317 ( .A(n205), .B(n147), .C(n263), .Y(n373) );
  NAND2X1 U318 ( .A(start_raddr[22]), .B(n149), .Y(n263) );
  OAI21X1 U319 ( .A(n204), .B(n148), .C(n264), .Y(n374) );
  NAND2X1 U320 ( .A(start_raddr[23]), .B(n148), .Y(n264) );
  OAI21X1 U321 ( .A(n203), .B(n147), .C(n265), .Y(n375) );
  NAND2X1 U322 ( .A(start_raddr[24]), .B(n149), .Y(n265) );
  OAI21X1 U323 ( .A(n202), .B(n148), .C(n266), .Y(n376) );
  NAND2X1 U324 ( .A(start_raddr[25]), .B(n149), .Y(n266) );
  OAI21X1 U325 ( .A(n201), .B(n148), .C(n267), .Y(n377) );
  NAND2X1 U326 ( .A(start_raddr[26]), .B(n149), .Y(n267) );
  OAI21X1 U327 ( .A(n200), .B(n148), .C(n268), .Y(n378) );
  NAND2X1 U328 ( .A(start_raddr[27]), .B(n149), .Y(n268) );
  OAI21X1 U329 ( .A(n199), .B(n148), .C(n269), .Y(n379) );
  NAND2X1 U330 ( .A(start_raddr[28]), .B(n149), .Y(n269) );
  OAI21X1 U331 ( .A(n198), .B(n148), .C(n270), .Y(n380) );
  NAND2X1 U332 ( .A(start_raddr[29]), .B(n149), .Y(n270) );
  OAI21X1 U333 ( .A(n197), .B(n148), .C(n271), .Y(n381) );
  NAND2X1 U334 ( .A(start_raddr[30]), .B(n150), .Y(n271) );
  OAI21X1 U335 ( .A(n196), .B(n148), .C(n272), .Y(n382) );
  NAND2X1 U336 ( .A(start_raddr[31]), .B(n150), .Y(n272) );
  NAND2X1 U337 ( .A(n195), .B(n273), .Y(n240) );
  NAND3X1 U338 ( .A(n275), .B(n144), .C(n277), .Y(n274) );
  OAI21X1 U339 ( .A(n227), .B(n140), .C(n279), .Y(n383) );
  NAND2X1 U340 ( .A(start_waddr[0]), .B(n143), .Y(n279) );
  OAI21X1 U341 ( .A(n226), .B(n139), .C(n280), .Y(n384) );
  NAND2X1 U342 ( .A(start_waddr[1]), .B(n143), .Y(n280) );
  OAI21X1 U343 ( .A(n225), .B(n139), .C(n281), .Y(n385) );
  NAND2X1 U344 ( .A(start_waddr[2]), .B(n143), .Y(n281) );
  OAI21X1 U345 ( .A(n224), .B(n139), .C(n282), .Y(n386) );
  NAND2X1 U346 ( .A(start_waddr[3]), .B(n142), .Y(n282) );
  OAI21X1 U347 ( .A(n223), .B(n139), .C(n283), .Y(n387) );
  NAND2X1 U348 ( .A(start_waddr[4]), .B(n143), .Y(n283) );
  OAI21X1 U349 ( .A(n222), .B(n139), .C(n284), .Y(n388) );
  NAND2X1 U350 ( .A(start_waddr[5]), .B(n142), .Y(n284) );
  OAI21X1 U351 ( .A(n221), .B(n139), .C(n285), .Y(n389) );
  NAND2X1 U352 ( .A(start_waddr[6]), .B(n142), .Y(n285) );
  OAI21X1 U353 ( .A(n220), .B(n139), .C(n286), .Y(n390) );
  NAND2X1 U354 ( .A(start_waddr[7]), .B(n142), .Y(n286) );
  OAI21X1 U355 ( .A(n219), .B(n139), .C(n287), .Y(n391) );
  NAND2X1 U356 ( .A(start_waddr[8]), .B(n142), .Y(n287) );
  OAI21X1 U357 ( .A(n218), .B(n139), .C(n288), .Y(n392) );
  NAND2X1 U358 ( .A(start_waddr[9]), .B(n142), .Y(n288) );
  OAI21X1 U359 ( .A(n217), .B(n139), .C(n289), .Y(n393) );
  NAND2X1 U360 ( .A(start_waddr[10]), .B(n142), .Y(n289) );
  OAI21X1 U361 ( .A(n216), .B(n139), .C(n290), .Y(n394) );
  NAND2X1 U362 ( .A(start_waddr[11]), .B(n142), .Y(n290) );
  OAI21X1 U363 ( .A(n215), .B(n139), .C(n291), .Y(n395) );
  NAND2X1 U364 ( .A(start_waddr[12]), .B(n142), .Y(n291) );
  OAI21X1 U365 ( .A(n214), .B(n140), .C(n292), .Y(n396) );
  NAND2X1 U366 ( .A(start_waddr[13]), .B(n142), .Y(n292) );
  OAI21X1 U367 ( .A(n213), .B(n140), .C(n293), .Y(n397) );
  NAND2X1 U368 ( .A(start_waddr[14]), .B(n142), .Y(n293) );
  OAI21X1 U369 ( .A(n212), .B(n140), .C(n294), .Y(n398) );
  NAND2X1 U370 ( .A(start_waddr[15]), .B(n141), .Y(n294) );
  OAI21X1 U371 ( .A(n211), .B(n140), .C(n295), .Y(n399) );
  NAND2X1 U372 ( .A(start_waddr[16]), .B(n142), .Y(n295) );
  OAI21X1 U373 ( .A(n210), .B(n140), .C(n296), .Y(n400) );
  NAND2X1 U374 ( .A(start_waddr[17]), .B(n141), .Y(n296) );
  OAI21X1 U375 ( .A(n209), .B(n140), .C(n297), .Y(n401) );
  NAND2X1 U376 ( .A(start_waddr[18]), .B(n141), .Y(n297) );
  OAI21X1 U377 ( .A(n208), .B(n140), .C(n298), .Y(n402) );
  NAND2X1 U378 ( .A(start_waddr[19]), .B(n141), .Y(n298) );
  OAI21X1 U379 ( .A(n207), .B(n140), .C(n299), .Y(n403) );
  NAND2X1 U380 ( .A(start_waddr[20]), .B(n141), .Y(n299) );
  OAI21X1 U381 ( .A(n206), .B(n140), .C(n300), .Y(n404) );
  NAND2X1 U382 ( .A(start_waddr[21]), .B(n141), .Y(n300) );
  OAI21X1 U383 ( .A(n205), .B(n140), .C(n301), .Y(n405) );
  NAND2X1 U384 ( .A(start_waddr[22]), .B(n142), .Y(n301) );
  OAI21X1 U385 ( .A(n204), .B(n141), .C(n302), .Y(n406) );
  NAND2X1 U386 ( .A(start_waddr[23]), .B(n141), .Y(n302) );
  OAI21X1 U387 ( .A(n203), .B(n140), .C(n303), .Y(n407) );
  NAND2X1 U388 ( .A(start_waddr[24]), .B(n142), .Y(n303) );
  OAI21X1 U389 ( .A(n202), .B(n141), .C(n304), .Y(n408) );
  NAND2X1 U390 ( .A(start_waddr[25]), .B(n142), .Y(n304) );
  OAI21X1 U391 ( .A(n201), .B(n141), .C(n305), .Y(n409) );
  NAND2X1 U392 ( .A(start_waddr[26]), .B(n142), .Y(n305) );
  OAI21X1 U393 ( .A(n200), .B(n141), .C(n306), .Y(n410) );
  NAND2X1 U394 ( .A(start_waddr[27]), .B(n142), .Y(n306) );
  OAI21X1 U395 ( .A(n199), .B(n141), .C(n307), .Y(n411) );
  NAND2X1 U396 ( .A(start_waddr[28]), .B(n142), .Y(n307) );
  OAI21X1 U397 ( .A(n198), .B(n141), .C(n308), .Y(n412) );
  NAND2X1 U398 ( .A(start_waddr[29]), .B(n142), .Y(n308) );
  OAI21X1 U399 ( .A(n197), .B(n141), .C(n309), .Y(n413) );
  NAND2X1 U400 ( .A(start_waddr[30]), .B(n143), .Y(n309) );
  OAI21X1 U401 ( .A(n196), .B(n141), .C(n310), .Y(n414) );
  NAND2X1 U402 ( .A(start_waddr[31]), .B(n143), .Y(n310) );
  NAND2X1 U403 ( .A(n138), .B(n275), .Y(n278) );
  OAI21X1 U404 ( .A(n138), .B(n471), .C(n144), .Y(n415) );
  OAI21X1 U405 ( .A(n138), .B(n470), .C(n144), .Y(n416) );
  OAI21X1 U406 ( .A(n138), .B(n469), .C(n144), .Y(n417) );
  OAI21X1 U407 ( .A(n138), .B(n468), .C(n144), .Y(n418) );
  OAI21X1 U408 ( .A(n138), .B(n467), .C(n144), .Y(n419) );
  OAI21X1 U409 ( .A(n138), .B(n466), .C(n144), .Y(n420) );
  OAI21X1 U410 ( .A(n137), .B(n465), .C(n144), .Y(n421) );
  OAI21X1 U411 ( .A(n137), .B(n464), .C(n276), .Y(n422) );
  OAI21X1 U412 ( .A(n137), .B(n463), .C(n144), .Y(n423) );
  OAI21X1 U413 ( .A(n137), .B(n462), .C(n144), .Y(n424) );
  OAI21X1 U414 ( .A(n137), .B(n461), .C(n144), .Y(n425) );
  OAI21X1 U415 ( .A(n137), .B(n460), .C(n144), .Y(n426) );
  OAI21X1 U416 ( .A(n137), .B(n459), .C(n144), .Y(n427) );
  OAI21X1 U417 ( .A(n137), .B(n458), .C(n144), .Y(n428) );
  OAI21X1 U418 ( .A(n137), .B(n457), .C(n276), .Y(n429) );
  OAI21X1 U419 ( .A(n137), .B(n456), .C(n276), .Y(n430) );
  OAI21X1 U420 ( .A(n137), .B(n455), .C(n276), .Y(n431) );
  OAI21X1 U421 ( .A(n137), .B(n454), .C(n276), .Y(n432) );
  OAI21X1 U422 ( .A(n137), .B(n453), .C(n276), .Y(n433) );
  OAI21X1 U423 ( .A(n137), .B(n452), .C(n276), .Y(n434) );
  OAI21X1 U424 ( .A(n137), .B(n451), .C(n276), .Y(n435) );
  OAI21X1 U425 ( .A(n137), .B(n450), .C(n276), .Y(n436) );
  OAI21X1 U426 ( .A(n137), .B(n449), .C(n276), .Y(n437) );
  OAI21X1 U427 ( .A(n137), .B(n448), .C(n276), .Y(n438) );
  OAI21X1 U428 ( .A(n137), .B(n447), .C(n276), .Y(n439) );
  OAI21X1 U429 ( .A(n137), .B(n238), .C(n276), .Y(n440) );
  OAI21X1 U430 ( .A(n137), .B(n237), .C(n276), .Y(n441) );
  OAI21X1 U431 ( .A(n137), .B(n236), .C(n276), .Y(n442) );
  OAI21X1 U432 ( .A(n137), .B(n235), .C(n276), .Y(n443) );
  OAI21X1 U433 ( .A(n137), .B(n234), .C(n276), .Y(n444) );
  OAI21X1 U434 ( .A(n137), .B(n233), .C(n144), .Y(n445) );
  OAI21X1 U435 ( .A(n137), .B(n232), .C(n144), .Y(n446) );
  NAND3X1 U436 ( .A(n273), .B(n239), .C(n277), .Y(n311) );
  AOI21X1 U437 ( .A(n275), .B(Q[2]), .C(n312), .Y(n277) );
  NAND3X1 U438 ( .A(n144), .B(n239), .C(n273), .Y(\n_hready[0] ) );
  NAND3X1 U439 ( .A(n231), .B(n230), .C(Q[0]), .Y(n273) );
  NAND3X1 U440 ( .A(n229), .B(n230), .C(Q[1]), .Y(n239) );
  NAND3X1 U441 ( .A(Q[0]), .B(n230), .C(Q[1]), .Y(n276) );
  NOR2X1 U442 ( .A(n313), .B(n314), .Y(nQ[2]) );
  NAND2X1 U443 ( .A(done), .B(n312), .Y(n314) );
  NAND2X1 U444 ( .A(n472), .B(n315), .Y(n313) );
  NOR2X1 U445 ( .A(n472), .B(n228), .Y(nQ[1]) );
  OAI21X1 U446 ( .A(n474), .B(n317), .C(n318), .Y(n316) );
  NAND3X1 U447 ( .A(hwrite), .B(n474), .C(haddr[1]), .Y(n318) );
  NAND2X1 U448 ( .A(hwrite), .B(n473), .Y(n317) );
  NOR2X1 U449 ( .A(n228), .B(n315), .Y(nQ[0]) );
  NAND2X1 U450 ( .A(hwrite), .B(n474), .Y(n315) );
  NOR2X1 U451 ( .A(n275), .B(Q[2]), .Y(n312) );
  NAND2X1 U452 ( .A(n231), .B(n229), .Y(n275) );
  INVX1 U135 ( .A(img_width[11]), .Y(n190) );
  INVX1 U136 ( .A(img_height[0]), .Y(n151) );
  INVX1 U137 ( .A(img_width[5]), .Y(n184) );
  INVX2 U138 ( .A(n475), .Y(n133) );
  INVX8 U139 ( .A(n133), .Y(img_width[0]) );
  INVX1 U140 ( .A(img_width[3]), .Y(n182) );
  INVX1 U141 ( .A(img_height[4]), .Y(n167) );
  INVX1 U142 ( .A(img_height[5]), .Y(n168) );
  INVX1 U143 ( .A(img_height[3]), .Y(n166) );
  INVX1 U144 ( .A(img_width[4]), .Y(n183) );
  INVX1 U145 ( .A(img_width[7]), .Y(n186) );
  INVX1 U146 ( .A(img_width[9]), .Y(n188) );
  INVX1 U147 ( .A(img_width[6]), .Y(n185) );
  BUFX2 U148 ( .A(n278), .Y(n141) );
  BUFX2 U149 ( .A(n278), .Y(n142) );
  BUFX2 U150 ( .A(n278), .Y(n139) );
  BUFX2 U151 ( .A(n278), .Y(n140) );
  BUFX2 U152 ( .A(n278), .Y(n143) );
  INVX2 U153 ( .A(n311), .Y(n138) );
  BUFX2 U154 ( .A(n240), .Y(n148) );
  BUFX2 U155 ( .A(n240), .Y(n149) );
  BUFX2 U156 ( .A(n240), .Y(n146) );
  BUFX2 U157 ( .A(n240), .Y(n147) );
  INVX2 U158 ( .A(n163), .Y(n135) );
  INVX2 U159 ( .A(n163), .Y(n136) );
  INVX2 U160 ( .A(n311), .Y(n137) );
  BUFX2 U161 ( .A(n240), .Y(n150) );
  INVX2 U162 ( .A(n145), .Y(n144) );
  BUFX2 U163 ( .A(n_rst), .Y(n152) );
  BUFX2 U164 ( .A(n_rst), .Y(n153) );
  BUFX2 U165 ( .A(n_rst), .Y(n154) );
  BUFX2 U166 ( .A(n_rst), .Y(n155) );
  BUFX2 U167 ( .A(n_rst), .Y(n156) );
  BUFX2 U168 ( .A(n_rst), .Y(n157) );
  BUFX2 U169 ( .A(n_rst), .Y(n158) );
  BUFX2 U170 ( .A(n_rst), .Y(n159) );
  BUFX2 U171 ( .A(n_rst), .Y(n160) );
  BUFX2 U172 ( .A(n_rst), .Y(n161) );
  BUFX2 U173 ( .A(n_rst), .Y(n162) );
  INVX2 U174 ( .A(n276), .Y(n145) );
  INVX1 U175 ( .A(img_width[8]), .Y(n187) );
  INVX1 U176 ( .A(img_width[12]), .Y(n191) );
  INVX1 U177 ( .A(img_width[2]), .Y(n181) );
  INVX1 U178 ( .A(img_width[1]), .Y(n180) );
  INVX1 U179 ( .A(img_height[2]), .Y(n165) );
  INVX1 U180 ( .A(img_height[1]), .Y(n164) );
  INVX2 U181 ( .A(hwdata[0]), .Y(n227) );
  INVX2 U182 ( .A(n274), .Y(n195) );
  NAND2X1 U183 ( .A(n239), .B(n195), .Y(n163) );
  MUX2X1 U184 ( .B(n151), .A(n227), .S(n135), .Y(n335) );
  INVX2 U185 ( .A(hwdata[1]), .Y(n226) );
  MUX2X1 U186 ( .B(n164), .A(n226), .S(n135), .Y(n336) );
  INVX2 U187 ( .A(hwdata[2]), .Y(n225) );
  MUX2X1 U188 ( .B(n165), .A(n225), .S(n135), .Y(n337) );
  INVX2 U189 ( .A(hwdata[3]), .Y(n224) );
  MUX2X1 U190 ( .B(n166), .A(n224), .S(n135), .Y(n338) );
  INVX2 U191 ( .A(hwdata[4]), .Y(n223) );
  MUX2X1 U192 ( .B(n167), .A(n223), .S(n135), .Y(n339) );
  INVX2 U193 ( .A(hwdata[5]), .Y(n222) );
  MUX2X1 U194 ( .B(n168), .A(n222), .S(n135), .Y(n340) );
  INVX2 U195 ( .A(img_height[6]), .Y(n169) );
  INVX2 U196 ( .A(hwdata[6]), .Y(n221) );
  MUX2X1 U197 ( .B(n169), .A(n221), .S(n135), .Y(n341) );
  INVX2 U198 ( .A(img_height[7]), .Y(n170) );
  INVX2 U199 ( .A(hwdata[7]), .Y(n220) );
  MUX2X1 U200 ( .B(n170), .A(n220), .S(n135), .Y(n342) );
  INVX2 U201 ( .A(img_height[8]), .Y(n171) );
  INVX2 U202 ( .A(hwdata[8]), .Y(n219) );
  MUX2X1 U203 ( .B(n171), .A(n219), .S(n135), .Y(n343) );
  INVX2 U204 ( .A(img_height[9]), .Y(n172) );
  INVX2 U205 ( .A(hwdata[9]), .Y(n218) );
  MUX2X1 U206 ( .B(n172), .A(n218), .S(n135), .Y(n344) );
  INVX2 U207 ( .A(img_height[10]), .Y(n173) );
  INVX2 U208 ( .A(hwdata[10]), .Y(n217) );
  MUX2X1 U209 ( .B(n173), .A(n217), .S(n135), .Y(n345) );
  INVX2 U210 ( .A(img_height[11]), .Y(n174) );
  INVX2 U211 ( .A(hwdata[11]), .Y(n216) );
  MUX2X1 U212 ( .B(n174), .A(n216), .S(n135), .Y(n346) );
  INVX2 U213 ( .A(img_height[12]), .Y(n175) );
  INVX2 U214 ( .A(hwdata[12]), .Y(n215) );
  MUX2X1 U215 ( .B(n175), .A(n215), .S(n135), .Y(n347) );
  INVX2 U216 ( .A(img_height[13]), .Y(n176) );
  INVX2 U217 ( .A(hwdata[13]), .Y(n214) );
  MUX2X1 U218 ( .B(n176), .A(n214), .S(n136), .Y(n348) );
  INVX2 U219 ( .A(img_height[14]), .Y(n177) );
  INVX2 U220 ( .A(hwdata[14]), .Y(n213) );
  MUX2X1 U221 ( .B(n177), .A(n213), .S(n136), .Y(n349) );
  INVX2 U222 ( .A(img_height[15]), .Y(n178) );
  INVX2 U223 ( .A(hwdata[15]), .Y(n212) );
  MUX2X1 U224 ( .B(n178), .A(n212), .S(n136), .Y(n350) );
  INVX2 U225 ( .A(img_width[0]), .Y(n179) );
  INVX2 U226 ( .A(hwdata[16]), .Y(n211) );
  MUX2X1 U227 ( .B(n179), .A(n211), .S(n136), .Y(n319) );
  INVX2 U228 ( .A(hwdata[17]), .Y(n210) );
  MUX2X1 U229 ( .B(n180), .A(n210), .S(n136), .Y(n320) );
  INVX2 U230 ( .A(hwdata[18]), .Y(n209) );
  MUX2X1 U231 ( .B(n181), .A(n209), .S(n136), .Y(n321) );
  INVX2 U232 ( .A(hwdata[19]), .Y(n208) );
  MUX2X1 U233 ( .B(n182), .A(n208), .S(n136), .Y(n322) );
  INVX2 U234 ( .A(hwdata[20]), .Y(n207) );
  MUX2X1 U235 ( .B(n183), .A(n207), .S(n136), .Y(n323) );
  INVX2 U236 ( .A(hwdata[21]), .Y(n206) );
  MUX2X1 U237 ( .B(n184), .A(n206), .S(n136), .Y(n324) );
  INVX2 U238 ( .A(hwdata[22]), .Y(n205) );
  MUX2X1 U239 ( .B(n185), .A(n205), .S(n136), .Y(n325) );
  INVX2 U240 ( .A(hwdata[23]), .Y(n204) );
  MUX2X1 U241 ( .B(n186), .A(n204), .S(n136), .Y(n326) );
  INVX2 U242 ( .A(hwdata[24]), .Y(n203) );
  MUX2X1 U243 ( .B(n187), .A(n203), .S(n136), .Y(n327) );
  INVX2 U244 ( .A(hwdata[25]), .Y(n202) );
  MUX2X1 U245 ( .B(n188), .A(n202), .S(n136), .Y(n328) );
  INVX2 U246 ( .A(img_width[10]), .Y(n189) );
  INVX2 U247 ( .A(hwdata[26]), .Y(n201) );
  MUX2X1 U248 ( .B(n189), .A(n201), .S(n135), .Y(n329) );
  INVX2 U249 ( .A(hwdata[27]), .Y(n200) );
  MUX2X1 U250 ( .B(n190), .A(n200), .S(n136), .Y(n330) );
  INVX2 U251 ( .A(hwdata[28]), .Y(n199) );
  MUX2X1 U252 ( .B(n191), .A(n199), .S(n136), .Y(n331) );
  INVX2 U253 ( .A(img_width[13]), .Y(n192) );
  INVX2 U254 ( .A(hwdata[29]), .Y(n198) );
  MUX2X1 U255 ( .B(n192), .A(n198), .S(n135), .Y(n332) );
  INVX2 U256 ( .A(img_width[14]), .Y(n193) );
  INVX2 U257 ( .A(hwdata[30]), .Y(n197) );
  MUX2X1 U258 ( .B(n193), .A(n197), .S(n135), .Y(n333) );
  INVX2 U259 ( .A(img_width[15]), .Y(n194) );
  INVX2 U260 ( .A(hwdata[31]), .Y(n196) );
  MUX2X1 U261 ( .B(n194), .A(n196), .S(n136), .Y(n334) );
  INVX2 U262 ( .A(n312), .Y(n228) );
  INVX2 U263 ( .A(Q[0]), .Y(n229) );
  INVX2 U264 ( .A(Q[2]), .Y(n230) );
  INVX2 U265 ( .A(Q[1]), .Y(n231) );
  INVX2 U266 ( .A(hrdata[31]), .Y(n232) );
  INVX2 U267 ( .A(hrdata[30]), .Y(n233) );
  INVX2 U268 ( .A(hrdata[29]), .Y(n234) );
  INVX2 U269 ( .A(hrdata[28]), .Y(n235) );
  INVX2 U270 ( .A(hrdata[27]), .Y(n236) );
  INVX2 U271 ( .A(hrdata[26]), .Y(n237) );
  INVX2 U272 ( .A(hrdata[25]), .Y(n238) );
  INVX2 U453 ( .A(hrdata[24]), .Y(n447) );
  INVX2 U454 ( .A(hrdata[23]), .Y(n448) );
  INVX2 U455 ( .A(hrdata[22]), .Y(n449) );
  INVX2 U456 ( .A(hrdata[21]), .Y(n450) );
  INVX2 U457 ( .A(hrdata[20]), .Y(n451) );
  INVX2 U458 ( .A(hrdata[19]), .Y(n452) );
  INVX2 U459 ( .A(hrdata[18]), .Y(n453) );
  INVX2 U460 ( .A(hrdata[17]), .Y(n454) );
  INVX2 U461 ( .A(hrdata[16]), .Y(n455) );
  INVX2 U462 ( .A(hrdata[15]), .Y(n456) );
  INVX2 U463 ( .A(hrdata[14]), .Y(n457) );
  INVX2 U464 ( .A(hrdata[13]), .Y(n458) );
  INVX2 U465 ( .A(hrdata[12]), .Y(n459) );
  INVX2 U466 ( .A(hrdata[11]), .Y(n460) );
  INVX2 U467 ( .A(hrdata[10]), .Y(n461) );
  INVX2 U468 ( .A(hrdata[9]), .Y(n462) );
  INVX2 U469 ( .A(hrdata[8]), .Y(n463) );
  INVX2 U470 ( .A(hrdata[7]), .Y(n464) );
  INVX2 U471 ( .A(hrdata[6]), .Y(n465) );
  INVX2 U472 ( .A(hrdata[5]), .Y(n466) );
  INVX2 U473 ( .A(hrdata[4]), .Y(n467) );
  INVX2 U474 ( .A(hrdata[3]), .Y(n468) );
  INVX2 U475 ( .A(hrdata[2]), .Y(n469) );
  INVX2 U476 ( .A(hrdata[1]), .Y(n470) );
  INVX2 U477 ( .A(hrdata[0]), .Y(n471) );
  INVX2 U478 ( .A(n316), .Y(n472) );
  INVX2 U479 ( .A(haddr[1]), .Y(n473) );
  INVX2 U480 ( .A(haddr[0]), .Y(n474) );
endmodule


module address_counter_DW01_dec_0 ( A, SUM );
  input [31:0] A;
  output [31:0] SUM;
  wire   n10, n13, n14, n15, n16, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75;

  INVX2 U1 ( .A(n74), .Y(SUM[11]) );
  INVX2 U2 ( .A(n71), .Y(SUM[13]) );
  INVX2 U3 ( .A(n68), .Y(SUM[15]) );
  INVX2 U4 ( .A(n65), .Y(SUM[17]) );
  INVX2 U5 ( .A(n62), .Y(SUM[19]) );
  INVX2 U6 ( .A(n57), .Y(SUM[22]) );
  INVX2 U7 ( .A(n54), .Y(SUM[24]) );
  INVX2 U8 ( .A(n51), .Y(SUM[26]) );
  INVX2 U9 ( .A(n48), .Y(SUM[28]) );
  INVX2 U10 ( .A(n59), .Y(n10) );
  INVX2 U11 ( .A(n32), .Y(SUM[9]) );
  INVX2 U12 ( .A(n36), .Y(SUM[7]) );
  INVX2 U13 ( .A(A[6]), .Y(n13) );
  INVX2 U14 ( .A(A[8]), .Y(n14) );
  INVX2 U15 ( .A(A[10]), .Y(n15) );
  INVX2 U16 ( .A(A[16]), .Y(n16) );
  INVX2 U17 ( .A(n61), .Y(SUM[1]) );
  INVX2 U18 ( .A(n39), .Y(SUM[5]) );
  INVX2 U19 ( .A(n42), .Y(SUM[3]) );
  INVX2 U20 ( .A(A[0]), .Y(SUM[0]) );
  INVX2 U21 ( .A(A[2]), .Y(n21) );
  INVX2 U22 ( .A(A[4]), .Y(n22) );
  INVX2 U23 ( .A(A[12]), .Y(n23) );
  INVX2 U24 ( .A(A[14]), .Y(n24) );
  INVX2 U25 ( .A(A[18]), .Y(n25) );
  INVX2 U26 ( .A(A[20]), .Y(n26) );
  INVX2 U27 ( .A(A[21]), .Y(n27) );
  INVX2 U28 ( .A(A[23]), .Y(n28) );
  INVX2 U29 ( .A(A[25]), .Y(n29) );
  INVX2 U30 ( .A(A[27]), .Y(n30) );
  INVX2 U31 ( .A(A[29]), .Y(n31) );
  AOI21X1 U32 ( .A(n33), .B(A[9]), .C(n34), .Y(n32) );
  OAI21X1 U33 ( .A(n35), .B(n14), .C(n33), .Y(SUM[8]) );
  AOI21X1 U34 ( .A(n37), .B(A[7]), .C(n35), .Y(n36) );
  OAI21X1 U35 ( .A(n38), .B(n13), .C(n37), .Y(SUM[6]) );
  AOI21X1 U36 ( .A(n40), .B(A[5]), .C(n38), .Y(n39) );
  OAI21X1 U37 ( .A(n41), .B(n22), .C(n40), .Y(SUM[4]) );
  AOI21X1 U38 ( .A(n43), .B(A[3]), .C(n41), .Y(n42) );
  XOR2X1 U39 ( .A(A[31]), .B(n44), .Y(SUM[31]) );
  NOR2X1 U40 ( .A(A[30]), .B(n45), .Y(n44) );
  XNOR2X1 U41 ( .A(A[30]), .B(n45), .Y(SUM[30]) );
  OAI21X1 U42 ( .A(n46), .B(n21), .C(n43), .Y(SUM[2]) );
  OAI21X1 U43 ( .A(n47), .B(n31), .C(n45), .Y(SUM[29]) );
  NAND2X1 U44 ( .A(n47), .B(n31), .Y(n45) );
  AOI21X1 U45 ( .A(n49), .B(A[28]), .C(n47), .Y(n48) );
  NOR2X1 U46 ( .A(n49), .B(A[28]), .Y(n47) );
  OAI21X1 U47 ( .A(n50), .B(n30), .C(n49), .Y(SUM[27]) );
  NAND2X1 U48 ( .A(n50), .B(n30), .Y(n49) );
  AOI21X1 U49 ( .A(n52), .B(A[26]), .C(n50), .Y(n51) );
  NOR2X1 U50 ( .A(n52), .B(A[26]), .Y(n50) );
  OAI21X1 U51 ( .A(n53), .B(n29), .C(n52), .Y(SUM[25]) );
  NAND2X1 U52 ( .A(n53), .B(n29), .Y(n52) );
  AOI21X1 U53 ( .A(n55), .B(A[24]), .C(n53), .Y(n54) );
  NOR2X1 U54 ( .A(n55), .B(A[24]), .Y(n53) );
  OAI21X1 U55 ( .A(n56), .B(n28), .C(n55), .Y(SUM[23]) );
  NAND2X1 U56 ( .A(n56), .B(n28), .Y(n55) );
  AOI21X1 U57 ( .A(n58), .B(A[22]), .C(n56), .Y(n57) );
  NOR2X1 U58 ( .A(n58), .B(A[22]), .Y(n56) );
  OAI21X1 U59 ( .A(n10), .B(n27), .C(n58), .Y(SUM[21]) );
  NAND2X1 U60 ( .A(n10), .B(n27), .Y(n58) );
  OAI21X1 U61 ( .A(n60), .B(n26), .C(n59), .Y(SUM[20]) );
  NAND2X1 U62 ( .A(n60), .B(n26), .Y(n59) );
  AOI21X1 U63 ( .A(A[0]), .B(A[1]), .C(n46), .Y(n61) );
  AOI21X1 U64 ( .A(n63), .B(A[19]), .C(n60), .Y(n62) );
  NOR2X1 U65 ( .A(n63), .B(A[19]), .Y(n60) );
  OAI21X1 U66 ( .A(n64), .B(n25), .C(n63), .Y(SUM[18]) );
  NAND2X1 U67 ( .A(n64), .B(n25), .Y(n63) );
  AOI21X1 U68 ( .A(n66), .B(A[17]), .C(n64), .Y(n65) );
  NOR2X1 U69 ( .A(n66), .B(A[17]), .Y(n64) );
  OAI21X1 U70 ( .A(n67), .B(n16), .C(n66), .Y(SUM[16]) );
  NAND2X1 U71 ( .A(n67), .B(n16), .Y(n66) );
  AOI21X1 U72 ( .A(n69), .B(A[15]), .C(n67), .Y(n68) );
  NOR2X1 U73 ( .A(n69), .B(A[15]), .Y(n67) );
  OAI21X1 U74 ( .A(n70), .B(n24), .C(n69), .Y(SUM[14]) );
  NAND2X1 U75 ( .A(n70), .B(n24), .Y(n69) );
  AOI21X1 U76 ( .A(n72), .B(A[13]), .C(n70), .Y(n71) );
  NOR2X1 U77 ( .A(n72), .B(A[13]), .Y(n70) );
  OAI21X1 U78 ( .A(n73), .B(n23), .C(n72), .Y(SUM[12]) );
  NAND2X1 U79 ( .A(n73), .B(n23), .Y(n72) );
  AOI21X1 U80 ( .A(n75), .B(A[11]), .C(n73), .Y(n74) );
  NOR2X1 U81 ( .A(n75), .B(A[11]), .Y(n73) );
  OAI21X1 U82 ( .A(n34), .B(n15), .C(n75), .Y(SUM[10]) );
  NAND2X1 U83 ( .A(n34), .B(n15), .Y(n75) );
  NOR2X1 U84 ( .A(n33), .B(A[9]), .Y(n34) );
  NAND2X1 U85 ( .A(n35), .B(n14), .Y(n33) );
  NOR2X1 U86 ( .A(n37), .B(A[7]), .Y(n35) );
  NAND2X1 U87 ( .A(n38), .B(n13), .Y(n37) );
  NOR2X1 U88 ( .A(n40), .B(A[5]), .Y(n38) );
  NAND2X1 U89 ( .A(n41), .B(n22), .Y(n40) );
  NOR2X1 U90 ( .A(n43), .B(A[3]), .Y(n41) );
  NAND2X1 U91 ( .A(n46), .B(n21), .Y(n43) );
  NOR2X1 U92 ( .A(A[1]), .B(A[0]), .Y(n46) );
endmodule


module address_counter_DW01_add_10 ( A, B, CI, SUM, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n5, n6, n7, n9, n10, n11, n12, n13, n15, n17, n18, n19, n20,
         n21, n22, n24, n26, n27, n28, n29, n30, n31, n32, n33, n35, n37, n38,
         n39, n40, n41, n42, n44, n46, n47, n48, n49, n50, n51, n52, n53, n55,
         n56, n58, n59, n60, n62, n64, n65, n66, n67, n68, n69, n70, n71, n73,
         n75, n76, n77, n78, n79, n80, n82, n84, n85, n86, n87, n88, n89, n90,
         n92, n94, n95, n96, n97, n98, n99, n101, n102, n104, n105, n106, n107,
         n108, n110, n111, n113, n114, n115, n117, n119, n120, n121, n122,
         n123, n124, n126, n127, n129, n130, n131, n133, n238;
  assign n7 = A[28];
  assign n13 = A[27];
  assign n17 = A[26];
  assign n22 = A[25];
  assign n26 = A[24];
  assign n33 = A[23];
  assign n37 = A[22];
  assign n42 = A[21];
  assign n46 = A[20];
  assign n53 = A[19];
  assign n56 = A[18];
  assign n60 = A[17];
  assign n64 = A[16];
  assign n71 = A[15];
  assign n75 = A[14];
  assign n80 = A[13];
  assign n84 = A[12];
  assign n90 = A[11];
  assign n94 = A[10];
  assign n99 = A[9];
  assign n102 = A[8];
  assign n108 = A[7];
  assign n111 = A[6];
  assign n115 = A[5];
  assign n119 = A[4];
  assign n124 = A[3];
  assign n127 = A[2];
  assign n131 = A[1];
  assign n133 = A[0];

  XOR2X1 U1 ( .A(n2), .B(A[31]), .Y(SUM[31]) );
  HAX1 U2 ( .A(A[30]), .B(n3), .YC(n2), .YS(SUM[30]) );
  HAX1 U3 ( .A(A[29]), .B(n238), .YC(n3), .YS(SUM[29]) );
  NOR2X1 U7 ( .A(n6), .B(n30), .Y(n5) );
  NAND2X1 U8 ( .A(n7), .B(n11), .Y(n6) );
  NOR2X1 U12 ( .A(n10), .B(n28), .Y(n9) );
  NOR2X1 U14 ( .A(n12), .B(n21), .Y(n11) );
  NAND2X1 U15 ( .A(n13), .B(n17), .Y(n12) );
  XOR2X1 U18 ( .A(n19), .B(n18), .Y(SUM[26]) );
  NOR2X1 U19 ( .A(n18), .B(n19), .Y(n15) );
  NAND2X1 U24 ( .A(n20), .B(n29), .Y(n19) );
  NAND2X1 U26 ( .A(n22), .B(n26), .Y(n21) );
  XOR2X1 U29 ( .A(n28), .B(n27), .Y(SUM[24]) );
  NOR2X1 U30 ( .A(n27), .B(n28), .Y(n24) );
  NOR2X1 U36 ( .A(n30), .B(n66), .Y(n29) );
  NAND2X1 U37 ( .A(n31), .B(n51), .Y(n30) );
  NOR2X1 U38 ( .A(n32), .B(n41), .Y(n31) );
  NAND2X1 U39 ( .A(n33), .B(n37), .Y(n32) );
  XOR2X1 U42 ( .A(n39), .B(n38), .Y(SUM[22]) );
  NOR2X1 U43 ( .A(n38), .B(n39), .Y(n35) );
  NAND2X1 U48 ( .A(n40), .B(n49), .Y(n39) );
  NAND2X1 U50 ( .A(n42), .B(n46), .Y(n41) );
  XOR2X1 U53 ( .A(n48), .B(n47), .Y(SUM[20]) );
  NOR2X1 U54 ( .A(n47), .B(n48), .Y(n44) );
  NOR2X1 U60 ( .A(n50), .B(n66), .Y(n49) );
  NOR2X1 U62 ( .A(n52), .B(n59), .Y(n51) );
  NAND2X1 U63 ( .A(n53), .B(n56), .Y(n52) );
  NAND2X1 U67 ( .A(n56), .B(n58), .Y(n55) );
  NOR2X1 U71 ( .A(n59), .B(n66), .Y(n58) );
  NAND2X1 U72 ( .A(n60), .B(n64), .Y(n59) );
  XOR2X1 U75 ( .A(n66), .B(n65), .Y(SUM[16]) );
  NOR2X1 U76 ( .A(n65), .B(n66), .Y(n62) );
  NOR2X1 U82 ( .A(n105), .B(n68), .Y(n67) );
  NAND2X1 U83 ( .A(n69), .B(n88), .Y(n68) );
  NOR2X1 U84 ( .A(n70), .B(n79), .Y(n69) );
  NAND2X1 U85 ( .A(n71), .B(n75), .Y(n70) );
  XOR2X1 U88 ( .A(n77), .B(n76), .Y(SUM[14]) );
  NOR2X1 U89 ( .A(n76), .B(n77), .Y(n73) );
  NAND2X1 U94 ( .A(n78), .B(n86), .Y(n77) );
  NAND2X1 U96 ( .A(n80), .B(n84), .Y(n79) );
  XNOR2X1 U99 ( .A(n86), .B(n85), .Y(SUM[12]) );
  NOR2X1 U100 ( .A(n85), .B(n87), .Y(n82) );
  NAND2X1 U106 ( .A(n88), .B(n104), .Y(n87) );
  NOR2X1 U107 ( .A(n89), .B(n98), .Y(n88) );
  NAND2X1 U108 ( .A(n90), .B(n94), .Y(n89) );
  XOR2X1 U111 ( .A(n96), .B(n95), .Y(SUM[10]) );
  NOR2X1 U112 ( .A(n95), .B(n96), .Y(n92) );
  NAND2X1 U117 ( .A(n97), .B(n104), .Y(n96) );
  NAND2X1 U119 ( .A(n99), .B(n102), .Y(n98) );
  NAND2X1 U123 ( .A(n102), .B(n104), .Y(n101) );
  NAND2X1 U128 ( .A(n122), .B(n106), .Y(n105) );
  NOR2X1 U129 ( .A(n107), .B(n114), .Y(n106) );
  NAND2X1 U130 ( .A(n108), .B(n111), .Y(n107) );
  NAND2X1 U134 ( .A(n111), .B(n113), .Y(n110) );
  NOR2X1 U138 ( .A(n114), .B(n121), .Y(n113) );
  NAND2X1 U139 ( .A(n115), .B(n119), .Y(n114) );
  XOR2X1 U142 ( .A(n121), .B(n120), .Y(SUM[4]) );
  NOR2X1 U143 ( .A(n120), .B(n121), .Y(n117) );
  NOR2X1 U149 ( .A(n130), .B(n123), .Y(n122) );
  NAND2X1 U150 ( .A(n124), .B(n127), .Y(n123) );
  NAND2X1 U154 ( .A(n127), .B(n129), .Y(n126) );
  XNOR2X1 U157 ( .A(n131), .B(n133), .Y(SUM[1]) );
  NOR2X1 U159 ( .A(n131), .B(n133), .Y(n130) );
  INVX1 U169 ( .A(n133), .Y(SUM[0]) );
  AND2X1 U170 ( .A(n67), .B(n5), .Y(n238) );
  XOR2X1 U171 ( .A(n9), .B(n7), .Y(SUM[28]) );
  XOR2X1 U172 ( .A(n24), .B(n22), .Y(SUM[25]) );
  XOR2X1 U173 ( .A(n44), .B(n42), .Y(SUM[21]) );
  XNOR2X1 U174 ( .A(n55), .B(n53), .Y(SUM[19]) );
  XOR2X1 U175 ( .A(n73), .B(n71), .Y(SUM[15]) );
  XOR2X1 U176 ( .A(n15), .B(n13), .Y(SUM[27]) );
  XOR2X1 U177 ( .A(n35), .B(n33), .Y(SUM[23]) );
  XOR2X1 U178 ( .A(n58), .B(n56), .Y(SUM[18]) );
  XOR2X1 U179 ( .A(n62), .B(n60), .Y(SUM[17]) );
  XOR2X1 U180 ( .A(n82), .B(n80), .Y(SUM[13]) );
  XOR2X1 U181 ( .A(n92), .B(n90), .Y(SUM[11]) );
  XNOR2X1 U182 ( .A(n101), .B(n99), .Y(SUM[9]) );
  XOR2X1 U183 ( .A(n104), .B(n102), .Y(SUM[8]) );
  XNOR2X1 U184 ( .A(n110), .B(n108), .Y(SUM[7]) );
  XOR2X1 U185 ( .A(n113), .B(n111), .Y(SUM[6]) );
  XOR2X1 U186 ( .A(n117), .B(n115), .Y(SUM[5]) );
  XNOR2X1 U187 ( .A(n126), .B(n124), .Y(SUM[3]) );
  XOR2X1 U188 ( .A(n129), .B(n127), .Y(SUM[2]) );
  INVX2 U189 ( .A(n98), .Y(n97) );
  INVX2 U190 ( .A(n94), .Y(n95) );
  INVX2 U191 ( .A(n87), .Y(n86) );
  INVX2 U192 ( .A(n84), .Y(n85) );
  INVX2 U193 ( .A(n79), .Y(n78) );
  INVX2 U194 ( .A(n75), .Y(n76) );
  INVX2 U195 ( .A(n67), .Y(n66) );
  INVX2 U196 ( .A(n64), .Y(n65) );
  INVX2 U197 ( .A(n51), .Y(n50) );
  INVX2 U198 ( .A(n49), .Y(n48) );
  INVX2 U199 ( .A(n46), .Y(n47) );
  INVX2 U200 ( .A(n41), .Y(n40) );
  INVX2 U201 ( .A(n37), .Y(n38) );
  INVX2 U202 ( .A(n29), .Y(n28) );
  INVX2 U203 ( .A(n26), .Y(n27) );
  INVX2 U204 ( .A(n21), .Y(n20) );
  INVX2 U205 ( .A(n17), .Y(n18) );
  INVX2 U206 ( .A(n130), .Y(n129) );
  INVX2 U207 ( .A(n122), .Y(n121) );
  INVX2 U208 ( .A(n119), .Y(n120) );
  INVX2 U209 ( .A(n105), .Y(n104) );
  INVX2 U210 ( .A(n11), .Y(n10) );
endmodule


module address_counter_DW01_add_11 ( A, B, CI, SUM, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n5, n6, n7, n9, n10, n11, n12, n13, n15, n17, n18, n19, n20,
         n21, n22, n24, n26, n27, n28, n29, n30, n31, n32, n33, n35, n37, n38,
         n39, n40, n41, n42, n44, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n75, n76, n77, n78, n79, n80, n81, n82, n84, n85,
         n86, n87, n88, n89, n90, n92, n94, n95, n96, n97, n98, n99, n101,
         n102, n104, n105, n106, n107, n108, n110, n111, n113, n114, n115,
         n117, n119, n120, n121, n122, n123, n124, n126, n127, n129, n130,
         n131, n133, n238;
  assign n7 = A[28];
  assign n13 = A[27];
  assign n17 = A[26];
  assign n22 = A[25];
  assign n26 = A[24];
  assign n33 = A[23];
  assign n37 = A[22];
  assign n42 = A[21];
  assign n46 = A[20];
  assign n53 = A[19];
  assign n56 = A[18];
  assign n60 = A[17];
  assign n64 = A[16];
  assign n71 = A[15];
  assign n75 = A[14];
  assign n80 = A[13];
  assign n84 = A[12];
  assign n90 = A[11];
  assign n94 = A[10];
  assign n99 = A[9];
  assign n102 = A[8];
  assign n108 = A[7];
  assign n111 = A[6];
  assign n115 = A[5];
  assign n119 = A[4];
  assign n124 = A[3];
  assign n127 = A[2];
  assign n131 = A[1];
  assign n133 = A[0];

  XOR2X1 U1 ( .A(n2), .B(A[31]), .Y(SUM[31]) );
  HAX1 U2 ( .A(A[30]), .B(n3), .YC(n2), .YS(SUM[30]) );
  HAX1 U3 ( .A(A[29]), .B(n238), .YC(n3), .YS(SUM[29]) );
  NOR2X1 U7 ( .A(n6), .B(n30), .Y(n5) );
  NAND2X1 U8 ( .A(n7), .B(n11), .Y(n6) );
  NOR2X1 U12 ( .A(n10), .B(n28), .Y(n9) );
  NOR2X1 U14 ( .A(n12), .B(n21), .Y(n11) );
  NAND2X1 U15 ( .A(n13), .B(n17), .Y(n12) );
  XOR2X1 U18 ( .A(n19), .B(n18), .Y(SUM[26]) );
  NOR2X1 U19 ( .A(n18), .B(n19), .Y(n15) );
  NAND2X1 U24 ( .A(n20), .B(n29), .Y(n19) );
  NAND2X1 U26 ( .A(n22), .B(n26), .Y(n21) );
  XOR2X1 U29 ( .A(n28), .B(n27), .Y(SUM[24]) );
  NOR2X1 U30 ( .A(n27), .B(n28), .Y(n24) );
  NOR2X1 U36 ( .A(n30), .B(n66), .Y(n29) );
  NAND2X1 U37 ( .A(n31), .B(n51), .Y(n30) );
  NOR2X1 U38 ( .A(n32), .B(n41), .Y(n31) );
  NAND2X1 U39 ( .A(n33), .B(n37), .Y(n32) );
  XOR2X1 U42 ( .A(n39), .B(n38), .Y(SUM[22]) );
  NOR2X1 U43 ( .A(n38), .B(n39), .Y(n35) );
  NAND2X1 U48 ( .A(n40), .B(n49), .Y(n39) );
  NAND2X1 U50 ( .A(n42), .B(n46), .Y(n41) );
  XOR2X1 U53 ( .A(n48), .B(n47), .Y(SUM[20]) );
  NOR2X1 U54 ( .A(n47), .B(n48), .Y(n44) );
  XOR2X1 U58 ( .A(n55), .B(n54), .Y(SUM[19]) );
  NOR2X1 U60 ( .A(n50), .B(n66), .Y(n49) );
  NOR2X1 U62 ( .A(n52), .B(n59), .Y(n51) );
  NAND2X1 U63 ( .A(n53), .B(n56), .Y(n52) );
  XNOR2X1 U66 ( .A(n58), .B(n57), .Y(SUM[18]) );
  NAND2X1 U67 ( .A(n56), .B(n58), .Y(n55) );
  XNOR2X1 U70 ( .A(n62), .B(n61), .Y(SUM[17]) );
  NOR2X1 U71 ( .A(n59), .B(n66), .Y(n58) );
  NAND2X1 U72 ( .A(n60), .B(n64), .Y(n59) );
  XOR2X1 U75 ( .A(n66), .B(n65), .Y(SUM[16]) );
  NOR2X1 U76 ( .A(n65), .B(n66), .Y(n62) );
  XNOR2X1 U80 ( .A(n73), .B(n72), .Y(SUM[15]) );
  NOR2X1 U82 ( .A(n105), .B(n68), .Y(n67) );
  NAND2X1 U83 ( .A(n69), .B(n88), .Y(n68) );
  NOR2X1 U84 ( .A(n70), .B(n79), .Y(n69) );
  NAND2X1 U85 ( .A(n71), .B(n75), .Y(n70) );
  XOR2X1 U88 ( .A(n77), .B(n76), .Y(SUM[14]) );
  NOR2X1 U89 ( .A(n76), .B(n77), .Y(n73) );
  XNOR2X1 U93 ( .A(n82), .B(n81), .Y(SUM[13]) );
  NAND2X1 U94 ( .A(n78), .B(n86), .Y(n77) );
  NAND2X1 U96 ( .A(n80), .B(n84), .Y(n79) );
  XNOR2X1 U99 ( .A(n86), .B(n85), .Y(SUM[12]) );
  NOR2X1 U100 ( .A(n85), .B(n87), .Y(n82) );
  NAND2X1 U106 ( .A(n88), .B(n104), .Y(n87) );
  NOR2X1 U107 ( .A(n89), .B(n98), .Y(n88) );
  NAND2X1 U108 ( .A(n90), .B(n94), .Y(n89) );
  XOR2X1 U111 ( .A(n96), .B(n95), .Y(SUM[10]) );
  NOR2X1 U112 ( .A(n95), .B(n96), .Y(n92) );
  NAND2X1 U117 ( .A(n97), .B(n104), .Y(n96) );
  NAND2X1 U119 ( .A(n99), .B(n102), .Y(n98) );
  NAND2X1 U123 ( .A(n102), .B(n104), .Y(n101) );
  NAND2X1 U128 ( .A(n122), .B(n106), .Y(n105) );
  NOR2X1 U129 ( .A(n107), .B(n114), .Y(n106) );
  NAND2X1 U130 ( .A(n108), .B(n111), .Y(n107) );
  NAND2X1 U134 ( .A(n111), .B(n113), .Y(n110) );
  NOR2X1 U138 ( .A(n114), .B(n121), .Y(n113) );
  NAND2X1 U139 ( .A(n115), .B(n119), .Y(n114) );
  XOR2X1 U142 ( .A(n121), .B(n120), .Y(SUM[4]) );
  NOR2X1 U143 ( .A(n120), .B(n121), .Y(n117) );
  NOR2X1 U149 ( .A(n130), .B(n123), .Y(n122) );
  NAND2X1 U150 ( .A(n124), .B(n127), .Y(n123) );
  NAND2X1 U154 ( .A(n127), .B(n129), .Y(n126) );
  XNOR2X1 U157 ( .A(n131), .B(n133), .Y(SUM[1]) );
  NOR2X1 U159 ( .A(n131), .B(n133), .Y(n130) );
  INVX1 U169 ( .A(n133), .Y(SUM[0]) );
  AND2X2 U170 ( .A(n67), .B(n5), .Y(n238) );
  XNOR2X1 U171 ( .A(n101), .B(n99), .Y(SUM[9]) );
  XNOR2X1 U172 ( .A(n110), .B(n108), .Y(SUM[7]) );
  XOR2X1 U173 ( .A(n113), .B(n111), .Y(SUM[6]) );
  XOR2X1 U174 ( .A(n9), .B(n7), .Y(SUM[28]) );
  XOR2X1 U175 ( .A(n15), .B(n13), .Y(SUM[27]) );
  XOR2X1 U176 ( .A(n24), .B(n22), .Y(SUM[25]) );
  XOR2X1 U177 ( .A(n35), .B(n33), .Y(SUM[23]) );
  XOR2X1 U178 ( .A(n44), .B(n42), .Y(SUM[21]) );
  XOR2X1 U179 ( .A(n92), .B(n90), .Y(SUM[11]) );
  XNOR2X1 U180 ( .A(n126), .B(n124), .Y(SUM[3]) );
  XOR2X1 U181 ( .A(n104), .B(n102), .Y(SUM[8]) );
  XOR2X1 U182 ( .A(n129), .B(n127), .Y(SUM[2]) );
  XOR2X1 U183 ( .A(n117), .B(n115), .Y(SUM[5]) );
  INVX2 U184 ( .A(n98), .Y(n97) );
  INVX2 U185 ( .A(n94), .Y(n95) );
  INVX2 U186 ( .A(n87), .Y(n86) );
  INVX2 U187 ( .A(n84), .Y(n85) );
  INVX2 U188 ( .A(n80), .Y(n81) );
  INVX2 U189 ( .A(n79), .Y(n78) );
  INVX2 U190 ( .A(n75), .Y(n76) );
  INVX2 U191 ( .A(n71), .Y(n72) );
  INVX2 U192 ( .A(n67), .Y(n66) );
  INVX2 U193 ( .A(n64), .Y(n65) );
  INVX2 U194 ( .A(n60), .Y(n61) );
  INVX2 U195 ( .A(n56), .Y(n57) );
  INVX2 U196 ( .A(n53), .Y(n54) );
  INVX2 U197 ( .A(n51), .Y(n50) );
  INVX2 U198 ( .A(n49), .Y(n48) );
  INVX2 U199 ( .A(n46), .Y(n47) );
  INVX2 U200 ( .A(n41), .Y(n40) );
  INVX2 U201 ( .A(n37), .Y(n38) );
  INVX2 U202 ( .A(n29), .Y(n28) );
  INVX2 U203 ( .A(n26), .Y(n27) );
  INVX2 U204 ( .A(n21), .Y(n20) );
  INVX2 U205 ( .A(n17), .Y(n18) );
  INVX2 U206 ( .A(n130), .Y(n129) );
  INVX2 U207 ( .A(n122), .Y(n121) );
  INVX2 U208 ( .A(n119), .Y(n120) );
  INVX2 U209 ( .A(n105), .Y(n104) );
  INVX2 U210 ( .A(n11), .Y(n10) );
endmodule


module address_counter_DW01_add_9 ( A, B, CI, SUM, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n35, n36, n38, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n62, n63,
         n64, n65, n66, n67, n68, n69, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n108, n109, n110, n111,
         n112, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n127, n128, n129, n130, n131, n132, n135, n136, n137, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n157, n159, n160, n161, n162, n164,
         n166, n167, n169, n171, n172, n173, n175, n177, n178, n179, n180,
         n182, n184, n185, n187, n189, n190, n191, n193, n195, n196, n197,
         n198, n199, n201, n203, n204, n205, n206, n207, n209, n211, n212,
         n213, n214, n215, n217, n219, n220, n222, n224, n225, n226, n227,
         n228, n230, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n248, n250, n252, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360;

  XNOR2X1 U1 ( .A(n36), .B(n2), .Y(SUM[31]) );
  NAND2X1 U2 ( .A(n35), .B(n350), .Y(n2) );
  NAND2X1 U5 ( .A(A[31]), .B(n359), .Y(n35) );
  XNOR2X1 U6 ( .A(n43), .B(n3), .Y(SUM[30]) );
  OAI21X1 U7 ( .A(n1), .B(n344), .C(n38), .Y(n36) );
  OAI21X1 U11 ( .A(n41), .B(n45), .C(n42), .Y(n40) );
  NAND2X1 U12 ( .A(n42), .B(n224), .Y(n3) );
  NOR2X1 U14 ( .A(A[30]), .B(n357), .Y(n41) );
  NAND2X1 U15 ( .A(A[30]), .B(n359), .Y(n42) );
  XOR2X1 U16 ( .A(n1), .B(n4), .Y(SUM[29]) );
  OAI21X1 U17 ( .A(n1), .B(n44), .C(n45), .Y(n43) );
  NAND2X1 U18 ( .A(n45), .B(n225), .Y(n4) );
  NOR2X1 U20 ( .A(A[29]), .B(n357), .Y(n44) );
  NAND2X1 U21 ( .A(A[29]), .B(n359), .Y(n45) );
  XNOR2X1 U22 ( .A(n54), .B(n5), .Y(SUM[28]) );
  AOI21X1 U23 ( .A(n46), .B(n114), .C(n47), .Y(n1) );
  NOR2X1 U24 ( .A(n48), .B(n82), .Y(n46) );
  OAI21X1 U25 ( .A(n48), .B(n83), .C(n49), .Y(n47) );
  NAND2X1 U26 ( .A(n50), .B(n66), .Y(n48) );
  AOI21X1 U27 ( .A(n67), .B(n50), .C(n51), .Y(n49) );
  NOR2X1 U28 ( .A(n52), .B(n59), .Y(n50) );
  OAI21X1 U29 ( .A(n52), .B(n62), .C(n53), .Y(n51) );
  NAND2X1 U30 ( .A(n53), .B(n226), .Y(n5) );
  NOR2X1 U32 ( .A(A[28]), .B(n357), .Y(n52) );
  NAND2X1 U33 ( .A(A[28]), .B(n358), .Y(n53) );
  XNOR2X1 U34 ( .A(n63), .B(n6), .Y(SUM[27]) );
  OAI21X1 U35 ( .A(n343), .B(n55), .C(n56), .Y(n54) );
  NAND2X1 U36 ( .A(n84), .B(n57), .Y(n55) );
  AOI21X1 U37 ( .A(n85), .B(n57), .C(n58), .Y(n56) );
  NOR2X1 U38 ( .A(n59), .B(n68), .Y(n57) );
  OAI21X1 U39 ( .A(n69), .B(n59), .C(n62), .Y(n58) );
  NAND2X1 U42 ( .A(n62), .B(n227), .Y(n6) );
  NOR2X1 U44 ( .A(A[27]), .B(n357), .Y(n59) );
  NAND2X1 U45 ( .A(A[27]), .B(n358), .Y(n62) );
  XNOR2X1 U46 ( .A(n74), .B(n7), .Y(SUM[26]) );
  OAI21X1 U47 ( .A(n343), .B(n64), .C(n65), .Y(n63) );
  NAND2X1 U48 ( .A(n66), .B(n84), .Y(n64) );
  AOI21X1 U49 ( .A(n66), .B(n85), .C(n67), .Y(n65) );
  NOR2X1 U54 ( .A(n72), .B(n79), .Y(n66) );
  OAI21X1 U55 ( .A(n342), .B(n80), .C(n73), .Y(n67) );
  NAND2X1 U56 ( .A(n73), .B(n228), .Y(n7) );
  NOR2X1 U58 ( .A(A[26]), .B(n357), .Y(n72) );
  NAND2X1 U59 ( .A(A[26]), .B(n358), .Y(n73) );
  XNOR2X1 U60 ( .A(n81), .B(n8), .Y(SUM[25]) );
  OAI21X1 U61 ( .A(n343), .B(n75), .C(n76), .Y(n74) );
  NAND2X1 U62 ( .A(n77), .B(n84), .Y(n75) );
  AOI21X1 U63 ( .A(n77), .B(n85), .C(n78), .Y(n76) );
  NAND2X1 U66 ( .A(n80), .B(n77), .Y(n8) );
  NOR2X1 U68 ( .A(A[25]), .B(n357), .Y(n79) );
  NAND2X1 U69 ( .A(A[25]), .B(n358), .Y(n80) );
  XNOR2X1 U70 ( .A(n92), .B(n9), .Y(SUM[24]) );
  OAI21X1 U71 ( .A(n343), .B(n82), .C(n83), .Y(n81) );
  NAND2X1 U76 ( .A(n88), .B(n102), .Y(n82) );
  AOI21X1 U77 ( .A(n103), .B(n88), .C(n89), .Y(n83) );
  NOR2X1 U78 ( .A(n90), .B(n97), .Y(n88) );
  OAI21X1 U79 ( .A(n90), .B(n98), .C(n91), .Y(n89) );
  NAND2X1 U80 ( .A(n91), .B(n230), .Y(n9) );
  NOR2X1 U82 ( .A(A[24]), .B(n357), .Y(n90) );
  NAND2X1 U83 ( .A(A[24]), .B(n358), .Y(n91) );
  XNOR2X1 U84 ( .A(n99), .B(n10), .Y(SUM[23]) );
  OAI21X1 U85 ( .A(n343), .B(n93), .C(n94), .Y(n92) );
  NAND2X1 U86 ( .A(n95), .B(n102), .Y(n93) );
  AOI21X1 U87 ( .A(n95), .B(n103), .C(n96), .Y(n94) );
  NAND2X1 U90 ( .A(n98), .B(n95), .Y(n10) );
  NOR2X1 U92 ( .A(A[23]), .B(n357), .Y(n97) );
  NAND2X1 U93 ( .A(A[23]), .B(n358), .Y(n98) );
  XNOR2X1 U94 ( .A(n110), .B(n11), .Y(SUM[22]) );
  OAI21X1 U95 ( .A(n343), .B(n100), .C(n101), .Y(n99) );
  NOR2X1 U102 ( .A(n108), .B(n111), .Y(n102) );
  OAI21X1 U103 ( .A(n108), .B(n112), .C(n109), .Y(n103) );
  NAND2X1 U104 ( .A(n109), .B(n232), .Y(n11) );
  NOR2X1 U106 ( .A(A[22]), .B(n357), .Y(n108) );
  NAND2X1 U107 ( .A(A[22]), .B(n358), .Y(n109) );
  XOR2X1 U108 ( .A(n343), .B(n12), .Y(SUM[21]) );
  OAI21X1 U109 ( .A(n343), .B(n111), .C(n112), .Y(n110) );
  NAND2X1 U110 ( .A(n112), .B(n233), .Y(n12) );
  NOR2X1 U112 ( .A(A[21]), .B(n357), .Y(n111) );
  NAND2X1 U113 ( .A(A[21]), .B(n358), .Y(n112) );
  XOR2X1 U114 ( .A(n121), .B(n13), .Y(SUM[20]) );
  OAI21X1 U116 ( .A(n143), .B(n115), .C(n116), .Y(n114) );
  NAND2X1 U117 ( .A(n117), .B(n129), .Y(n115) );
  AOI21X1 U118 ( .A(n130), .B(n117), .C(n118), .Y(n116) );
  NOR2X1 U119 ( .A(n119), .B(n124), .Y(n117) );
  OAI21X1 U120 ( .A(n119), .B(n127), .C(n120), .Y(n118) );
  NAND2X1 U121 ( .A(n120), .B(n234), .Y(n13) );
  NOR2X1 U123 ( .A(A[20]), .B(n357), .Y(n119) );
  NAND2X1 U124 ( .A(A[20]), .B(n358), .Y(n120) );
  XOR2X1 U125 ( .A(n128), .B(n14), .Y(SUM[19]) );
  AOI21X1 U126 ( .A(n122), .B(n142), .C(n123), .Y(n121) );
  NOR2X1 U127 ( .A(n124), .B(n131), .Y(n122) );
  OAI21X1 U128 ( .A(n132), .B(n124), .C(n127), .Y(n123) );
  NAND2X1 U131 ( .A(n127), .B(n235), .Y(n14) );
  NOR2X1 U133 ( .A(A[19]), .B(n358), .Y(n124) );
  NAND2X1 U134 ( .A(A[19]), .B(n358), .Y(n127) );
  XOR2X1 U135 ( .A(n137), .B(n15), .Y(SUM[18]) );
  AOI21X1 U136 ( .A(n129), .B(n142), .C(n130), .Y(n128) );
  NOR2X1 U141 ( .A(n135), .B(n140), .Y(n129) );
  OAI21X1 U142 ( .A(n135), .B(n141), .C(n136), .Y(n130) );
  NAND2X1 U143 ( .A(n136), .B(n236), .Y(n15) );
  NOR2X1 U145 ( .A(A[18]), .B(n358), .Y(n135) );
  NAND2X1 U146 ( .A(A[18]), .B(n358), .Y(n136) );
  XNOR2X1 U147 ( .A(n142), .B(n16), .Y(SUM[17]) );
  AOI21X1 U148 ( .A(n237), .B(n142), .C(n139), .Y(n137) );
  NAND2X1 U151 ( .A(n141), .B(n237), .Y(n16) );
  NOR2X1 U153 ( .A(A[17]), .B(n358), .Y(n140) );
  NAND2X1 U154 ( .A(A[17]), .B(n359), .Y(n141) );
  XNOR2X1 U155 ( .A(n148), .B(n17), .Y(SUM[16]) );
  AOI21X1 U157 ( .A(n152), .B(n144), .C(n145), .Y(n143) );
  NOR2X1 U158 ( .A(n146), .B(n149), .Y(n144) );
  OAI21X1 U159 ( .A(n150), .B(n146), .C(n147), .Y(n145) );
  NAND2X1 U160 ( .A(n147), .B(n238), .Y(n17) );
  NOR2X1 U162 ( .A(A[16]), .B(n358), .Y(n146) );
  NAND2X1 U163 ( .A(A[16]), .B(n359), .Y(n147) );
  XOR2X1 U164 ( .A(n18), .B(n151), .Y(SUM[15]) );
  OAI21X1 U165 ( .A(n151), .B(n149), .C(n150), .Y(n148) );
  NAND2X1 U166 ( .A(n150), .B(n239), .Y(n18) );
  NOR2X1 U168 ( .A(A[15]), .B(B[15]), .Y(n149) );
  NAND2X1 U169 ( .A(A[15]), .B(B[15]), .Y(n150) );
  XOR2X1 U170 ( .A(n155), .B(n19), .Y(SUM[14]) );
  OAI21X1 U172 ( .A(n155), .B(n153), .C(n154), .Y(n152) );
  NAND2X1 U173 ( .A(n154), .B(n240), .Y(n19) );
  NOR2X1 U175 ( .A(A[14]), .B(B[14]), .Y(n153) );
  NAND2X1 U176 ( .A(A[14]), .B(B[14]), .Y(n154) );
  XNOR2X1 U177 ( .A(n160), .B(n20), .Y(SUM[13]) );
  AOI21X1 U178 ( .A(n349), .B(n160), .C(n157), .Y(n155) );
  NAND2X1 U181 ( .A(n159), .B(n349), .Y(n20) );
  NAND2X1 U184 ( .A(A[13]), .B(B[13]), .Y(n159) );
  XOR2X1 U185 ( .A(n167), .B(n21), .Y(SUM[12]) );
  OAI21X1 U186 ( .A(n161), .B(n173), .C(n162), .Y(n160) );
  NAND2X1 U187 ( .A(n347), .B(n345), .Y(n161) );
  AOI21X1 U188 ( .A(n169), .B(n345), .C(n164), .Y(n162) );
  NAND2X1 U191 ( .A(n166), .B(n345), .Y(n21) );
  NAND2X1 U194 ( .A(A[12]), .B(B[12]), .Y(n166) );
  XNOR2X1 U195 ( .A(n172), .B(n22), .Y(SUM[11]) );
  AOI21X1 U196 ( .A(n347), .B(n172), .C(n169), .Y(n167) );
  NAND2X1 U199 ( .A(n171), .B(n347), .Y(n22) );
  NAND2X1 U202 ( .A(A[11]), .B(B[11]), .Y(n171) );
  XNOR2X1 U203 ( .A(n178), .B(n23), .Y(SUM[10]) );
  AOI21X1 U205 ( .A(n354), .B(n178), .C(n175), .Y(n173) );
  NAND2X1 U208 ( .A(n177), .B(n354), .Y(n23) );
  NAND2X1 U211 ( .A(A[10]), .B(B[10]), .Y(n177) );
  XOR2X1 U212 ( .A(n185), .B(n24), .Y(SUM[9]) );
  OAI21X1 U213 ( .A(n179), .B(n191), .C(n180), .Y(n178) );
  NAND2X1 U214 ( .A(n352), .B(n346), .Y(n179) );
  AOI21X1 U215 ( .A(n187), .B(n346), .C(n182), .Y(n180) );
  NAND2X1 U218 ( .A(n184), .B(n346), .Y(n24) );
  NAND2X1 U221 ( .A(A[9]), .B(B[9]), .Y(n184) );
  XNOR2X1 U222 ( .A(n190), .B(n25), .Y(SUM[8]) );
  AOI21X1 U223 ( .A(n352), .B(n190), .C(n187), .Y(n185) );
  NAND2X1 U226 ( .A(n189), .B(n352), .Y(n25) );
  NAND2X1 U229 ( .A(A[8]), .B(B[8]), .Y(n189) );
  XNOR2X1 U230 ( .A(n196), .B(n26), .Y(SUM[7]) );
  AOI21X1 U232 ( .A(n351), .B(n196), .C(n193), .Y(n191) );
  NAND2X1 U235 ( .A(n195), .B(n351), .Y(n26) );
  NAND2X1 U238 ( .A(A[7]), .B(B[7]), .Y(n195) );
  XOR2X1 U239 ( .A(n27), .B(n199), .Y(SUM[6]) );
  OAI21X1 U240 ( .A(n199), .B(n197), .C(n198), .Y(n196) );
  NAND2X1 U241 ( .A(n198), .B(n248), .Y(n27) );
  NOR2X1 U243 ( .A(A[6]), .B(B[6]), .Y(n197) );
  NAND2X1 U244 ( .A(A[6]), .B(B[6]), .Y(n198) );
  XNOR2X1 U245 ( .A(n28), .B(n204), .Y(SUM[5]) );
  AOI21X1 U246 ( .A(n355), .B(n204), .C(n201), .Y(n199) );
  NAND2X1 U249 ( .A(n203), .B(n355), .Y(n28) );
  NAND2X1 U252 ( .A(A[5]), .B(B[5]), .Y(n203) );
  XOR2X1 U253 ( .A(n29), .B(n207), .Y(SUM[4]) );
  OAI21X1 U254 ( .A(n207), .B(n205), .C(n206), .Y(n204) );
  NAND2X1 U255 ( .A(n206), .B(n250), .Y(n29) );
  NOR2X1 U257 ( .A(A[4]), .B(B[4]), .Y(n205) );
  NAND2X1 U258 ( .A(A[4]), .B(B[4]), .Y(n206) );
  XNOR2X1 U259 ( .A(n30), .B(n212), .Y(SUM[3]) );
  AOI21X1 U260 ( .A(n212), .B(n353), .C(n209), .Y(n207) );
  NAND2X1 U263 ( .A(n211), .B(n353), .Y(n30) );
  NAND2X1 U266 ( .A(A[3]), .B(B[3]), .Y(n211) );
  XOR2X1 U267 ( .A(n31), .B(n215), .Y(SUM[2]) );
  OAI21X1 U268 ( .A(n215), .B(n213), .C(n214), .Y(n212) );
  NAND2X1 U269 ( .A(n214), .B(n252), .Y(n31) );
  NOR2X1 U271 ( .A(A[2]), .B(B[2]), .Y(n213) );
  NAND2X1 U272 ( .A(A[2]), .B(B[2]), .Y(n214) );
  XNOR2X1 U273 ( .A(n32), .B(n220), .Y(SUM[1]) );
  AOI21X1 U274 ( .A(n220), .B(n348), .C(n217), .Y(n215) );
  NAND2X1 U277 ( .A(n219), .B(n348), .Y(n32) );
  NAND2X1 U280 ( .A(A[1]), .B(B[1]), .Y(n219) );
  NAND2X1 U283 ( .A(n222), .B(n356), .Y(n33) );
  NAND2X1 U286 ( .A(B[0]), .B(A[0]), .Y(n222) );
  INVX4 U290 ( .A(n114), .Y(n343) );
  INVX8 U291 ( .A(n360), .Y(n358) );
  INVX1 U292 ( .A(n108), .Y(n232) );
  OR2X2 U293 ( .A(A[9]), .B(B[9]), .Y(n346) );
  OR2X2 U294 ( .A(A[11]), .B(B[11]), .Y(n347) );
  OR2X2 U295 ( .A(A[12]), .B(B[12]), .Y(n345) );
  OR2X1 U296 ( .A(A[13]), .B(B[13]), .Y(n349) );
  OR2X1 U297 ( .A(A[8]), .B(B[8]), .Y(n352) );
  OR2X1 U298 ( .A(A[3]), .B(B[3]), .Y(n353) );
  OR2X1 U299 ( .A(A[7]), .B(B[7]), .Y(n351) );
  OR2X1 U300 ( .A(A[5]), .B(B[5]), .Y(n355) );
  OR2X1 U301 ( .A(A[10]), .B(B[10]), .Y(n354) );
  INVX1 U302 ( .A(n228), .Y(n342) );
  INVX1 U303 ( .A(n72), .Y(n228) );
  INVX1 U304 ( .A(n360), .Y(n359) );
  OR2X1 U305 ( .A(n41), .B(n44), .Y(n344) );
  OR2X1 U306 ( .A(A[1]), .B(B[1]), .Y(n348) );
  OR2X1 U307 ( .A(A[31]), .B(n357), .Y(n350) );
  OR2X1 U308 ( .A(B[0]), .B(A[0]), .Y(n356) );
  INVX8 U309 ( .A(n360), .Y(n357) );
  INVX8 U310 ( .A(B[16]), .Y(n360) );
  INVX2 U311 ( .A(n98), .Y(n96) );
  INVX2 U312 ( .A(n83), .Y(n85) );
  INVX2 U313 ( .A(n82), .Y(n84) );
  INVX2 U314 ( .A(n80), .Y(n78) );
  INVX2 U315 ( .A(n67), .Y(n69) );
  INVX2 U316 ( .A(n66), .Y(n68) );
  INVX2 U317 ( .A(n40), .Y(n38) );
  INVX2 U318 ( .A(n213), .Y(n252) );
  INVX2 U319 ( .A(n205), .Y(n250) );
  INVX2 U320 ( .A(n197), .Y(n248) );
  INVX2 U321 ( .A(n153), .Y(n240) );
  INVX2 U322 ( .A(n149), .Y(n239) );
  INVX2 U323 ( .A(n146), .Y(n238) );
  INVX2 U324 ( .A(n135), .Y(n236) );
  INVX2 U325 ( .A(n124), .Y(n235) );
  INVX2 U326 ( .A(n119), .Y(n234) );
  INVX2 U327 ( .A(n111), .Y(n233) );
  INVX2 U328 ( .A(n97), .Y(n95) );
  INVX2 U329 ( .A(n90), .Y(n230) );
  INVX2 U330 ( .A(n79), .Y(n77) );
  INVX2 U331 ( .A(n59), .Y(n227) );
  INVX2 U332 ( .A(n52), .Y(n226) );
  INVX2 U333 ( .A(n44), .Y(n225) );
  INVX2 U334 ( .A(n41), .Y(n224) );
  INVX2 U335 ( .A(n222), .Y(n220) );
  INVX2 U336 ( .A(n219), .Y(n217) );
  INVX2 U337 ( .A(n211), .Y(n209) );
  INVX2 U338 ( .A(n203), .Y(n201) );
  INVX2 U339 ( .A(n195), .Y(n193) );
  INVX2 U340 ( .A(n191), .Y(n190) );
  INVX2 U341 ( .A(n189), .Y(n187) );
  INVX2 U342 ( .A(n184), .Y(n182) );
  INVX2 U343 ( .A(n177), .Y(n175) );
  INVX2 U344 ( .A(n173), .Y(n172) );
  INVX2 U345 ( .A(n171), .Y(n169) );
  INVX2 U346 ( .A(n166), .Y(n164) );
  INVX2 U347 ( .A(n159), .Y(n157) );
  INVX2 U348 ( .A(n152), .Y(n151) );
  INVX2 U349 ( .A(n143), .Y(n142) );
  INVX2 U350 ( .A(n141), .Y(n139) );
  INVX2 U351 ( .A(n140), .Y(n237) );
  INVX2 U352 ( .A(n130), .Y(n132) );
  INVX2 U353 ( .A(n129), .Y(n131) );
  INVX2 U354 ( .A(n103), .Y(n101) );
  INVX2 U355 ( .A(n102), .Y(n100) );
  INVX2 U356 ( .A(n33), .Y(SUM[0]) );
endmodule


module address_counter_DW01_add_8 ( A, B, CI, SUM, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n35, n36, n38, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n62, n63, n64,
         n65, n66, n67, n68, n69, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n108, n109, n110, n111, n112,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n127, n128, n129, n130, n131, n132, n135, n136, n137, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n157, n159, n160, n161, n162, n164, n166,
         n167, n169, n171, n172, n173, n175, n177, n178, n179, n180, n182,
         n184, n185, n187, n189, n190, n191, n193, n195, n196, n197, n198,
         n199, n201, n203, n204, n205, n206, n207, n209, n211, n212, n213,
         n214, n215, n217, n219, n220, n221, n222, n224, n225, n226, n227,
         n228, n230, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n248, n250, n252, n254, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n358, n359, n360,
         n361;

  XNOR2X1 U1 ( .A(n36), .B(n2), .Y(SUM[31]) );
  NAND2X1 U2 ( .A(n35), .B(n349), .Y(n2) );
  NAND2X1 U5 ( .A(A[31]), .B(n360), .Y(n35) );
  XNOR2X1 U6 ( .A(n43), .B(n3), .Y(SUM[30]) );
  OAI21X1 U7 ( .A(n1), .B(n345), .C(n38), .Y(n36) );
  OAI21X1 U11 ( .A(n41), .B(n45), .C(n42), .Y(n40) );
  NAND2X1 U12 ( .A(n42), .B(n224), .Y(n3) );
  NOR2X1 U14 ( .A(A[30]), .B(n358), .Y(n41) );
  NAND2X1 U15 ( .A(A[30]), .B(n360), .Y(n42) );
  XOR2X1 U16 ( .A(n1), .B(n4), .Y(SUM[29]) );
  OAI21X1 U17 ( .A(n1), .B(n44), .C(n45), .Y(n43) );
  NAND2X1 U18 ( .A(n45), .B(n225), .Y(n4) );
  NOR2X1 U20 ( .A(A[29]), .B(n358), .Y(n44) );
  NAND2X1 U21 ( .A(A[29]), .B(n360), .Y(n45) );
  XNOR2X1 U22 ( .A(n54), .B(n5), .Y(SUM[28]) );
  AOI21X1 U23 ( .A(n46), .B(n114), .C(n47), .Y(n1) );
  NOR2X1 U24 ( .A(n48), .B(n82), .Y(n46) );
  OAI21X1 U25 ( .A(n48), .B(n83), .C(n49), .Y(n47) );
  NAND2X1 U26 ( .A(n50), .B(n66), .Y(n48) );
  AOI21X1 U27 ( .A(n67), .B(n50), .C(n51), .Y(n49) );
  NOR2X1 U28 ( .A(n52), .B(n59), .Y(n50) );
  OAI21X1 U29 ( .A(n52), .B(n62), .C(n53), .Y(n51) );
  NAND2X1 U30 ( .A(n53), .B(n226), .Y(n5) );
  NOR2X1 U32 ( .A(A[28]), .B(n358), .Y(n52) );
  NAND2X1 U33 ( .A(A[28]), .B(n359), .Y(n53) );
  XNOR2X1 U34 ( .A(n63), .B(n6), .Y(SUM[27]) );
  OAI21X1 U35 ( .A(n342), .B(n55), .C(n56), .Y(n54) );
  NAND2X1 U36 ( .A(n84), .B(n57), .Y(n55) );
  AOI21X1 U37 ( .A(n85), .B(n57), .C(n58), .Y(n56) );
  NOR2X1 U38 ( .A(n59), .B(n68), .Y(n57) );
  OAI21X1 U39 ( .A(n69), .B(n59), .C(n62), .Y(n58) );
  NAND2X1 U42 ( .A(n62), .B(n227), .Y(n6) );
  NOR2X1 U44 ( .A(A[27]), .B(n358), .Y(n59) );
  NAND2X1 U45 ( .A(A[27]), .B(n359), .Y(n62) );
  XNOR2X1 U46 ( .A(n74), .B(n7), .Y(SUM[26]) );
  OAI21X1 U47 ( .A(n342), .B(n64), .C(n65), .Y(n63) );
  NAND2X1 U48 ( .A(n66), .B(n84), .Y(n64) );
  AOI21X1 U49 ( .A(n66), .B(n85), .C(n67), .Y(n65) );
  NOR2X1 U54 ( .A(n72), .B(n79), .Y(n66) );
  OAI21X1 U55 ( .A(n344), .B(n80), .C(n73), .Y(n67) );
  NAND2X1 U56 ( .A(n73), .B(n228), .Y(n7) );
  NOR2X1 U58 ( .A(A[26]), .B(n358), .Y(n72) );
  NAND2X1 U59 ( .A(A[26]), .B(n359), .Y(n73) );
  XNOR2X1 U60 ( .A(n81), .B(n8), .Y(SUM[25]) );
  OAI21X1 U61 ( .A(n342), .B(n75), .C(n76), .Y(n74) );
  NAND2X1 U62 ( .A(n77), .B(n84), .Y(n75) );
  AOI21X1 U63 ( .A(n77), .B(n85), .C(n78), .Y(n76) );
  NAND2X1 U66 ( .A(n80), .B(n77), .Y(n8) );
  NOR2X1 U68 ( .A(A[25]), .B(n358), .Y(n79) );
  NAND2X1 U69 ( .A(A[25]), .B(n359), .Y(n80) );
  XNOR2X1 U70 ( .A(n92), .B(n9), .Y(SUM[24]) );
  OAI21X1 U71 ( .A(n342), .B(n82), .C(n83), .Y(n81) );
  NAND2X1 U76 ( .A(n88), .B(n102), .Y(n82) );
  AOI21X1 U77 ( .A(n103), .B(n88), .C(n89), .Y(n83) );
  NOR2X1 U78 ( .A(n90), .B(n97), .Y(n88) );
  OAI21X1 U79 ( .A(n90), .B(n98), .C(n91), .Y(n89) );
  NAND2X1 U80 ( .A(n91), .B(n230), .Y(n9) );
  NOR2X1 U82 ( .A(A[24]), .B(n358), .Y(n90) );
  NAND2X1 U83 ( .A(A[24]), .B(n359), .Y(n91) );
  XNOR2X1 U84 ( .A(n99), .B(n10), .Y(SUM[23]) );
  OAI21X1 U85 ( .A(n342), .B(n93), .C(n94), .Y(n92) );
  NAND2X1 U86 ( .A(n95), .B(n102), .Y(n93) );
  AOI21X1 U87 ( .A(n95), .B(n103), .C(n96), .Y(n94) );
  NAND2X1 U90 ( .A(n98), .B(n95), .Y(n10) );
  NOR2X1 U92 ( .A(A[23]), .B(n358), .Y(n97) );
  NAND2X1 U93 ( .A(A[23]), .B(n359), .Y(n98) );
  XNOR2X1 U94 ( .A(n110), .B(n11), .Y(SUM[22]) );
  OAI21X1 U95 ( .A(n342), .B(n100), .C(n101), .Y(n99) );
  NOR2X1 U102 ( .A(n108), .B(n111), .Y(n102) );
  OAI21X1 U103 ( .A(n108), .B(n112), .C(n109), .Y(n103) );
  NAND2X1 U104 ( .A(n109), .B(n232), .Y(n11) );
  NOR2X1 U106 ( .A(A[22]), .B(n358), .Y(n108) );
  NAND2X1 U107 ( .A(A[22]), .B(n359), .Y(n109) );
  XOR2X1 U108 ( .A(n342), .B(n12), .Y(SUM[21]) );
  OAI21X1 U109 ( .A(n342), .B(n111), .C(n112), .Y(n110) );
  NAND2X1 U110 ( .A(n112), .B(n233), .Y(n12) );
  NOR2X1 U112 ( .A(A[21]), .B(n358), .Y(n111) );
  NAND2X1 U113 ( .A(A[21]), .B(n359), .Y(n112) );
  XOR2X1 U114 ( .A(n121), .B(n13), .Y(SUM[20]) );
  OAI21X1 U116 ( .A(n143), .B(n115), .C(n116), .Y(n114) );
  NAND2X1 U117 ( .A(n117), .B(n129), .Y(n115) );
  AOI21X1 U118 ( .A(n130), .B(n117), .C(n118), .Y(n116) );
  NOR2X1 U119 ( .A(n119), .B(n124), .Y(n117) );
  OAI21X1 U120 ( .A(n119), .B(n127), .C(n120), .Y(n118) );
  NAND2X1 U121 ( .A(n120), .B(n234), .Y(n13) );
  NOR2X1 U123 ( .A(A[20]), .B(n358), .Y(n119) );
  NAND2X1 U124 ( .A(A[20]), .B(n359), .Y(n120) );
  XOR2X1 U125 ( .A(n128), .B(n14), .Y(SUM[19]) );
  AOI21X1 U126 ( .A(n122), .B(n142), .C(n123), .Y(n121) );
  NOR2X1 U127 ( .A(n124), .B(n131), .Y(n122) );
  OAI21X1 U128 ( .A(n132), .B(n124), .C(n127), .Y(n123) );
  NAND2X1 U131 ( .A(n127), .B(n235), .Y(n14) );
  NOR2X1 U133 ( .A(A[19]), .B(n359), .Y(n124) );
  NAND2X1 U134 ( .A(A[19]), .B(n359), .Y(n127) );
  XOR2X1 U135 ( .A(n137), .B(n15), .Y(SUM[18]) );
  AOI21X1 U136 ( .A(n129), .B(n142), .C(n130), .Y(n128) );
  NOR2X1 U141 ( .A(n135), .B(n140), .Y(n129) );
  OAI21X1 U142 ( .A(n343), .B(n141), .C(n136), .Y(n130) );
  NAND2X1 U143 ( .A(n136), .B(n236), .Y(n15) );
  NOR2X1 U145 ( .A(A[18]), .B(n359), .Y(n135) );
  NAND2X1 U146 ( .A(A[18]), .B(n359), .Y(n136) );
  XNOR2X1 U147 ( .A(n142), .B(n16), .Y(SUM[17]) );
  AOI21X1 U148 ( .A(n237), .B(n142), .C(n139), .Y(n137) );
  NAND2X1 U151 ( .A(n141), .B(n237), .Y(n16) );
  NOR2X1 U153 ( .A(A[17]), .B(n359), .Y(n140) );
  NAND2X1 U154 ( .A(A[17]), .B(n360), .Y(n141) );
  XNOR2X1 U155 ( .A(n148), .B(n17), .Y(SUM[16]) );
  AOI21X1 U157 ( .A(n152), .B(n144), .C(n145), .Y(n143) );
  NOR2X1 U158 ( .A(n146), .B(n149), .Y(n144) );
  OAI21X1 U159 ( .A(n150), .B(n146), .C(n147), .Y(n145) );
  NAND2X1 U160 ( .A(n147), .B(n238), .Y(n17) );
  NOR2X1 U162 ( .A(A[16]), .B(n359), .Y(n146) );
  NAND2X1 U163 ( .A(A[16]), .B(n360), .Y(n147) );
  XOR2X1 U164 ( .A(n18), .B(n151), .Y(SUM[15]) );
  OAI21X1 U165 ( .A(n151), .B(n149), .C(n150), .Y(n148) );
  NAND2X1 U166 ( .A(n150), .B(n239), .Y(n18) );
  NOR2X1 U168 ( .A(A[15]), .B(B[15]), .Y(n149) );
  NAND2X1 U169 ( .A(A[15]), .B(B[15]), .Y(n150) );
  XOR2X1 U170 ( .A(n155), .B(n19), .Y(SUM[14]) );
  OAI21X1 U172 ( .A(n155), .B(n153), .C(n154), .Y(n152) );
  NAND2X1 U173 ( .A(n154), .B(n240), .Y(n19) );
  NOR2X1 U175 ( .A(A[14]), .B(B[14]), .Y(n153) );
  NAND2X1 U176 ( .A(A[14]), .B(B[14]), .Y(n154) );
  XNOR2X1 U177 ( .A(n160), .B(n20), .Y(SUM[13]) );
  AOI21X1 U178 ( .A(n348), .B(n160), .C(n157), .Y(n155) );
  NAND2X1 U181 ( .A(n159), .B(n348), .Y(n20) );
  NAND2X1 U184 ( .A(A[13]), .B(B[13]), .Y(n159) );
  XOR2X1 U185 ( .A(n167), .B(n21), .Y(SUM[12]) );
  OAI21X1 U186 ( .A(n161), .B(n173), .C(n162), .Y(n160) );
  NAND2X1 U187 ( .A(n347), .B(n346), .Y(n161) );
  AOI21X1 U188 ( .A(n169), .B(n346), .C(n164), .Y(n162) );
  NAND2X1 U191 ( .A(n166), .B(n346), .Y(n21) );
  NAND2X1 U194 ( .A(A[12]), .B(B[12]), .Y(n166) );
  XNOR2X1 U195 ( .A(n172), .B(n22), .Y(SUM[11]) );
  AOI21X1 U196 ( .A(n347), .B(n172), .C(n169), .Y(n167) );
  NAND2X1 U199 ( .A(n171), .B(n347), .Y(n22) );
  NAND2X1 U202 ( .A(A[11]), .B(B[11]), .Y(n171) );
  XNOR2X1 U203 ( .A(n178), .B(n23), .Y(SUM[10]) );
  AOI21X1 U205 ( .A(n355), .B(n178), .C(n175), .Y(n173) );
  NAND2X1 U208 ( .A(n177), .B(n355), .Y(n23) );
  NAND2X1 U211 ( .A(A[10]), .B(B[10]), .Y(n177) );
  XOR2X1 U212 ( .A(n185), .B(n24), .Y(SUM[9]) );
  OAI21X1 U213 ( .A(n179), .B(n191), .C(n180), .Y(n178) );
  NAND2X1 U214 ( .A(n351), .B(n352), .Y(n179) );
  AOI21X1 U215 ( .A(n187), .B(n352), .C(n182), .Y(n180) );
  NAND2X1 U218 ( .A(n184), .B(n352), .Y(n24) );
  NAND2X1 U221 ( .A(A[9]), .B(B[9]), .Y(n184) );
  XNOR2X1 U222 ( .A(n190), .B(n25), .Y(SUM[8]) );
  AOI21X1 U223 ( .A(n351), .B(n190), .C(n187), .Y(n185) );
  NAND2X1 U226 ( .A(n189), .B(n351), .Y(n25) );
  NAND2X1 U229 ( .A(A[8]), .B(B[8]), .Y(n189) );
  XNOR2X1 U230 ( .A(n196), .B(n26), .Y(SUM[7]) );
  AOI21X1 U232 ( .A(n356), .B(n196), .C(n193), .Y(n191) );
  NAND2X1 U235 ( .A(n195), .B(n356), .Y(n26) );
  NAND2X1 U238 ( .A(A[7]), .B(B[7]), .Y(n195) );
  XOR2X1 U239 ( .A(n27), .B(n199), .Y(SUM[6]) );
  OAI21X1 U240 ( .A(n199), .B(n197), .C(n198), .Y(n196) );
  NAND2X1 U241 ( .A(n198), .B(n248), .Y(n27) );
  NOR2X1 U243 ( .A(A[6]), .B(B[6]), .Y(n197) );
  NAND2X1 U244 ( .A(A[6]), .B(B[6]), .Y(n198) );
  XNOR2X1 U245 ( .A(n28), .B(n204), .Y(SUM[5]) );
  AOI21X1 U246 ( .A(n350), .B(n204), .C(n201), .Y(n199) );
  NAND2X1 U249 ( .A(n203), .B(n350), .Y(n28) );
  NAND2X1 U252 ( .A(A[5]), .B(B[5]), .Y(n203) );
  XOR2X1 U253 ( .A(n29), .B(n207), .Y(SUM[4]) );
  OAI21X1 U254 ( .A(n207), .B(n205), .C(n206), .Y(n204) );
  NAND2X1 U255 ( .A(n206), .B(n250), .Y(n29) );
  NOR2X1 U257 ( .A(A[4]), .B(B[4]), .Y(n205) );
  NAND2X1 U258 ( .A(A[4]), .B(B[4]), .Y(n206) );
  XNOR2X1 U259 ( .A(n30), .B(n212), .Y(SUM[3]) );
  AOI21X1 U260 ( .A(n212), .B(n354), .C(n209), .Y(n207) );
  NAND2X1 U263 ( .A(n211), .B(n354), .Y(n30) );
  NAND2X1 U266 ( .A(A[3]), .B(B[3]), .Y(n211) );
  XOR2X1 U267 ( .A(n31), .B(n215), .Y(SUM[2]) );
  OAI21X1 U268 ( .A(n215), .B(n213), .C(n214), .Y(n212) );
  NAND2X1 U269 ( .A(n214), .B(n252), .Y(n31) );
  NOR2X1 U271 ( .A(A[2]), .B(B[2]), .Y(n213) );
  NAND2X1 U272 ( .A(A[2]), .B(B[2]), .Y(n214) );
  XNOR2X1 U273 ( .A(n32), .B(n220), .Y(SUM[1]) );
  AOI21X1 U274 ( .A(n220), .B(n353), .C(n217), .Y(n215) );
  NAND2X1 U277 ( .A(n219), .B(n353), .Y(n32) );
  NAND2X1 U280 ( .A(A[1]), .B(B[1]), .Y(n219) );
  NOR2X1 U285 ( .A(B[0]), .B(A[0]), .Y(n221) );
  NAND2X1 U286 ( .A(B[0]), .B(A[0]), .Y(n222) );
  INVX4 U290 ( .A(n114), .Y(n342) );
  INVX1 U291 ( .A(n108), .Y(n232) );
  NOR2X1 U292 ( .A(A[18]), .B(n359), .Y(n343) );
  INVX8 U293 ( .A(n361), .Y(n359) );
  INVX1 U294 ( .A(n228), .Y(n344) );
  INVX1 U295 ( .A(n72), .Y(n228) );
  OR2X2 U296 ( .A(A[9]), .B(B[9]), .Y(n352) );
  OR2X2 U297 ( .A(A[12]), .B(B[12]), .Y(n346) );
  OR2X2 U298 ( .A(A[11]), .B(B[11]), .Y(n347) );
  OR2X2 U299 ( .A(A[13]), .B(B[13]), .Y(n348) );
  OR2X2 U300 ( .A(A[8]), .B(B[8]), .Y(n351) );
  OR2X2 U301 ( .A(A[3]), .B(B[3]), .Y(n354) );
  OR2X2 U302 ( .A(A[5]), .B(B[5]), .Y(n350) );
  OR2X2 U303 ( .A(A[7]), .B(B[7]), .Y(n356) );
  OR2X2 U304 ( .A(A[10]), .B(B[10]), .Y(n355) );
  INVX1 U305 ( .A(n361), .Y(n360) );
  OR2X1 U306 ( .A(n41), .B(n44), .Y(n345) );
  OR2X1 U307 ( .A(A[31]), .B(n358), .Y(n349) );
  OR2X1 U308 ( .A(A[1]), .B(B[1]), .Y(n353) );
  AND2X2 U309 ( .A(n222), .B(n254), .Y(SUM[0]) );
  INVX8 U310 ( .A(n361), .Y(n358) );
  INVX8 U311 ( .A(B[16]), .Y(n361) );
  INVX2 U312 ( .A(n98), .Y(n96) );
  INVX2 U313 ( .A(n83), .Y(n85) );
  INVX2 U314 ( .A(n82), .Y(n84) );
  INVX2 U315 ( .A(n80), .Y(n78) );
  INVX2 U316 ( .A(n67), .Y(n69) );
  INVX2 U317 ( .A(n66), .Y(n68) );
  INVX2 U318 ( .A(n40), .Y(n38) );
  INVX2 U319 ( .A(n221), .Y(n254) );
  INVX2 U320 ( .A(n213), .Y(n252) );
  INVX2 U321 ( .A(n205), .Y(n250) );
  INVX2 U322 ( .A(n197), .Y(n248) );
  INVX2 U323 ( .A(n153), .Y(n240) );
  INVX2 U324 ( .A(n149), .Y(n239) );
  INVX2 U325 ( .A(n146), .Y(n238) );
  INVX2 U326 ( .A(n343), .Y(n236) );
  INVX2 U327 ( .A(n124), .Y(n235) );
  INVX2 U328 ( .A(n119), .Y(n234) );
  INVX2 U329 ( .A(n111), .Y(n233) );
  INVX2 U330 ( .A(n97), .Y(n95) );
  INVX2 U331 ( .A(n90), .Y(n230) );
  INVX2 U332 ( .A(n79), .Y(n77) );
  INVX2 U333 ( .A(n59), .Y(n227) );
  INVX2 U334 ( .A(n52), .Y(n226) );
  INVX2 U335 ( .A(n44), .Y(n225) );
  INVX2 U336 ( .A(n41), .Y(n224) );
  INVX2 U337 ( .A(n222), .Y(n220) );
  INVX2 U338 ( .A(n219), .Y(n217) );
  INVX2 U339 ( .A(n211), .Y(n209) );
  INVX2 U340 ( .A(n203), .Y(n201) );
  INVX2 U341 ( .A(n195), .Y(n193) );
  INVX2 U342 ( .A(n191), .Y(n190) );
  INVX2 U343 ( .A(n189), .Y(n187) );
  INVX2 U344 ( .A(n184), .Y(n182) );
  INVX2 U345 ( .A(n177), .Y(n175) );
  INVX2 U346 ( .A(n173), .Y(n172) );
  INVX2 U347 ( .A(n171), .Y(n169) );
  INVX2 U348 ( .A(n166), .Y(n164) );
  INVX2 U349 ( .A(n159), .Y(n157) );
  INVX2 U350 ( .A(n152), .Y(n151) );
  INVX2 U351 ( .A(n143), .Y(n142) );
  INVX2 U352 ( .A(n141), .Y(n139) );
  INVX2 U353 ( .A(n140), .Y(n237) );
  INVX2 U354 ( .A(n130), .Y(n132) );
  INVX2 U355 ( .A(n129), .Y(n131) );
  INVX2 U356 ( .A(n103), .Y(n101) );
  INVX2 U357 ( .A(n102), .Y(n100) );
endmodule


module address_counter_DW01_inc_2 ( A, SUM );
  input [31:0] A;
  output [31:0] SUM;
  wire   n1, n2, n4, n5, n6, n8, n9, n10, n11, n13, n14, n16, n17, n18, n20,
         n21, n23, n24, n25, n26, n27, n28, n29, n31, n32, n34, n35, n36, n38,
         n39, n41, n42, n43, n44, n45, n47, n48, n50, n51, n52, n54, n56, n57,
         n58, n59, n60, n61, n62, n63, n65, n66, n68, n69, n70, n72, n73, n75,
         n76, n77, n78, n79, n81, n83, n84, n85, n86, n87, n88, n90, n91, n93,
         n94, n95, n96, n97, n99, n100, n102, n103, n104, n106, n108, n109,
         n110, n111, n112, n113, n115, n116, n118, n119, n120, n122, n192;
  assign n6 = A[28];
  assign n11 = A[27];
  assign n14 = A[26];
  assign n18 = A[25];
  assign n21 = A[24];
  assign n29 = A[23];
  assign n32 = A[22];
  assign n36 = A[21];
  assign n39 = A[20];
  assign n45 = A[19];
  assign n48 = A[18];
  assign n52 = A[17];
  assign n56 = A[16];
  assign n63 = A[15];
  assign n66 = A[14];
  assign n70 = A[13];
  assign n73 = A[12];
  assign n79 = A[11];
  assign n83 = A[10];
  assign n88 = A[9];
  assign n91 = A[8];
  assign n97 = A[7];
  assign n100 = A[6];
  assign n104 = A[5];
  assign n108 = A[4];
  assign n113 = A[3];
  assign n116 = A[2];
  assign n120 = A[1];
  assign n122 = A[0];

  XOR2X1 U1 ( .A(n1), .B(A[31]), .Y(SUM[31]) );
  HAX1 U2 ( .A(A[30]), .B(n2), .YC(n1), .YS(SUM[30]) );
  HAX1 U3 ( .A(A[29]), .B(n192), .YC(n2), .YS(SUM[29]) );
  NOR2X1 U7 ( .A(n5), .B(n26), .Y(n4) );
  NAND2X1 U8 ( .A(n6), .B(n9), .Y(n5) );
  NAND2X1 U12 ( .A(n9), .B(n23), .Y(n8) );
  NOR2X1 U13 ( .A(n10), .B(n17), .Y(n9) );
  NAND2X1 U14 ( .A(n11), .B(n14), .Y(n10) );
  NAND2X1 U18 ( .A(n14), .B(n16), .Y(n13) );
  NOR2X1 U22 ( .A(n17), .B(n24), .Y(n16) );
  NAND2X1 U23 ( .A(n18), .B(n21), .Y(n17) );
  NAND2X1 U27 ( .A(n21), .B(n23), .Y(n20) );
  NAND2X1 U32 ( .A(n25), .B(n59), .Y(n24) );
  NAND2X1 U34 ( .A(n27), .B(n43), .Y(n26) );
  NOR2X1 U35 ( .A(n28), .B(n35), .Y(n27) );
  NAND2X1 U36 ( .A(n29), .B(n32), .Y(n28) );
  NAND2X1 U40 ( .A(n32), .B(n34), .Y(n31) );
  NOR2X1 U44 ( .A(n35), .B(n42), .Y(n34) );
  NAND2X1 U45 ( .A(n36), .B(n39), .Y(n35) );
  NAND2X1 U49 ( .A(n39), .B(n41), .Y(n38) );
  NAND2X1 U54 ( .A(n43), .B(n59), .Y(n42) );
  NOR2X1 U55 ( .A(n44), .B(n51), .Y(n43) );
  NAND2X1 U56 ( .A(n45), .B(n48), .Y(n44) );
  NAND2X1 U60 ( .A(n48), .B(n50), .Y(n47) );
  NOR2X1 U64 ( .A(n51), .B(n58), .Y(n50) );
  NAND2X1 U65 ( .A(n52), .B(n56), .Y(n51) );
  XOR2X1 U68 ( .A(n58), .B(n57), .Y(SUM[16]) );
  NOR2X1 U69 ( .A(n57), .B(n58), .Y(n54) );
  NOR2X1 U75 ( .A(n94), .B(n60), .Y(n59) );
  NAND2X1 U76 ( .A(n61), .B(n77), .Y(n60) );
  NOR2X1 U77 ( .A(n62), .B(n69), .Y(n61) );
  NAND2X1 U78 ( .A(n63), .B(n66), .Y(n62) );
  NAND2X1 U82 ( .A(n66), .B(n68), .Y(n65) );
  NOR2X1 U86 ( .A(n69), .B(n76), .Y(n68) );
  NAND2X1 U87 ( .A(n70), .B(n73), .Y(n69) );
  NAND2X1 U91 ( .A(n73), .B(n75), .Y(n72) );
  NAND2X1 U96 ( .A(n77), .B(n93), .Y(n76) );
  NOR2X1 U97 ( .A(n78), .B(n87), .Y(n77) );
  NAND2X1 U98 ( .A(n79), .B(n83), .Y(n78) );
  XOR2X1 U101 ( .A(n85), .B(n84), .Y(SUM[10]) );
  NOR2X1 U102 ( .A(n84), .B(n85), .Y(n81) );
  NAND2X1 U107 ( .A(n86), .B(n93), .Y(n85) );
  NAND2X1 U109 ( .A(n88), .B(n91), .Y(n87) );
  NAND2X1 U113 ( .A(n91), .B(n93), .Y(n90) );
  NAND2X1 U118 ( .A(n111), .B(n95), .Y(n94) );
  NOR2X1 U119 ( .A(n96), .B(n103), .Y(n95) );
  NAND2X1 U120 ( .A(n97), .B(n100), .Y(n96) );
  NAND2X1 U124 ( .A(n100), .B(n102), .Y(n99) );
  NOR2X1 U128 ( .A(n103), .B(n110), .Y(n102) );
  NAND2X1 U129 ( .A(n104), .B(n108), .Y(n103) );
  XOR2X1 U132 ( .A(n110), .B(n109), .Y(SUM[4]) );
  NOR2X1 U133 ( .A(n109), .B(n110), .Y(n106) );
  NOR2X1 U139 ( .A(n119), .B(n112), .Y(n111) );
  NAND2X1 U140 ( .A(n113), .B(n116), .Y(n112) );
  NAND2X1 U144 ( .A(n116), .B(n118), .Y(n115) );
  NAND2X1 U149 ( .A(n122), .B(n120), .Y(n119) );
  INVX1 U156 ( .A(n122), .Y(SUM[0]) );
  AND2X2 U157 ( .A(n59), .B(n4), .Y(n192) );
  XNOR2X1 U158 ( .A(n72), .B(n70), .Y(SUM[13]) );
  XNOR2X1 U159 ( .A(n13), .B(n11), .Y(SUM[27]) );
  XNOR2X1 U160 ( .A(n31), .B(n29), .Y(SUM[23]) );
  XNOR2X1 U161 ( .A(n47), .B(n45), .Y(SUM[19]) );
  XNOR2X1 U162 ( .A(n20), .B(n18), .Y(SUM[25]) );
  XNOR2X1 U163 ( .A(n8), .B(n6), .Y(SUM[28]) );
  XNOR2X1 U164 ( .A(n38), .B(n36), .Y(SUM[21]) );
  XNOR2X1 U165 ( .A(n65), .B(n63), .Y(SUM[15]) );
  XNOR2X1 U166 ( .A(n90), .B(n88), .Y(SUM[9]) );
  XNOR2X1 U167 ( .A(n99), .B(n97), .Y(SUM[7]) );
  XNOR2X1 U168 ( .A(n115), .B(n113), .Y(SUM[3]) );
  XOR2X1 U169 ( .A(n50), .B(n48), .Y(SUM[18]) );
  XOR2X1 U170 ( .A(n93), .B(n91), .Y(SUM[8]) );
  XOR2X1 U171 ( .A(n102), .B(n100), .Y(SUM[6]) );
  XOR2X1 U172 ( .A(n23), .B(n21), .Y(SUM[24]) );
  XOR2X1 U173 ( .A(n41), .B(n39), .Y(SUM[20]) );
  XOR2X1 U174 ( .A(n68), .B(n66), .Y(SUM[14]) );
  XOR2X1 U175 ( .A(n16), .B(n14), .Y(SUM[26]) );
  XOR2X1 U176 ( .A(n34), .B(n32), .Y(SUM[22]) );
  XOR2X1 U177 ( .A(n75), .B(n73), .Y(SUM[12]) );
  XOR2X1 U178 ( .A(n54), .B(n52), .Y(SUM[17]) );
  XOR2X1 U179 ( .A(n81), .B(n79), .Y(SUM[11]) );
  XOR2X1 U180 ( .A(n106), .B(n104), .Y(SUM[5]) );
  XOR2X1 U181 ( .A(n120), .B(n122), .Y(SUM[1]) );
  XOR2X1 U182 ( .A(n116), .B(n118), .Y(SUM[2]) );
  INVX2 U183 ( .A(n94), .Y(n93) );
  INVX2 U184 ( .A(n87), .Y(n86) );
  INVX2 U185 ( .A(n83), .Y(n84) );
  INVX2 U186 ( .A(n76), .Y(n75) );
  INVX2 U187 ( .A(n59), .Y(n58) );
  INVX2 U188 ( .A(n56), .Y(n57) );
  INVX2 U189 ( .A(n42), .Y(n41) );
  INVX2 U190 ( .A(n26), .Y(n25) );
  INVX2 U191 ( .A(n24), .Y(n23) );
  INVX2 U192 ( .A(n119), .Y(n118) );
  INVX2 U193 ( .A(n111), .Y(n110) );
  INVX2 U194 ( .A(n108), .Y(n109) );
endmodule


module address_counter_DW01_inc_3 ( A, SUM );
  input [31:0] A;
  output [31:0] SUM;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n60,
         n61, n62, n63, n64, n65, n66, n67, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n114, n115, n116,
         n118;
  assign n5 = A[28];
  assign n10 = A[26];
  assign n21 = A[23];
  assign n24 = A[22];
  assign n28 = A[21];
  assign n31 = A[20];
  assign n38 = A[19];
  assign n41 = A[18];
  assign n45 = A[17];
  assign n49 = A[16];
  assign n56 = A[15];
  assign n60 = A[14];
  assign n65 = A[13];
  assign n69 = A[12];
  assign n75 = A[11];
  assign n79 = A[10];
  assign n84 = A[9];
  assign n87 = A[8];
  assign n93 = A[7];
  assign n96 = A[6];
  assign n100 = A[5];
  assign n104 = A[4];
  assign n109 = A[3];
  assign n112 = A[2];
  assign n116 = A[1];
  assign n118 = A[0];

  XOR2X1 U1 ( .A(n1), .B(A[31]), .Y(SUM[31]) );
  HAX1 U2 ( .A(A[30]), .B(n2), .YC(n1), .YS(SUM[30]) );
  XOR2X1 U3 ( .A(n4), .B(n3), .Y(SUM[29]) );
  NOR2X1 U4 ( .A(n3), .B(n4), .Y(n2) );
  XNOR2X1 U6 ( .A(n7), .B(n6), .Y(SUM[28]) );
  NAND2X1 U7 ( .A(n5), .B(n7), .Y(n4) );
  XOR2X1 U10 ( .A(n9), .B(n8), .Y(SUM[27]) );
  NOR2X1 U11 ( .A(n8), .B(n9), .Y(n7) );
  XNOR2X1 U13 ( .A(n12), .B(n11), .Y(SUM[26]) );
  NAND2X1 U14 ( .A(n10), .B(n12), .Y(n9) );
  XOR2X1 U17 ( .A(n14), .B(n13), .Y(SUM[25]) );
  NOR2X1 U18 ( .A(n13), .B(n14), .Y(n12) );
  XNOR2X1 U20 ( .A(n17), .B(n16), .Y(SUM[24]) );
  NAND2X1 U21 ( .A(n52), .B(n15), .Y(n14) );
  NOR2X1 U22 ( .A(n16), .B(n18), .Y(n15) );
  XOR2X1 U24 ( .A(n23), .B(n22), .Y(SUM[23]) );
  NOR2X1 U25 ( .A(n18), .B(n51), .Y(n17) );
  NAND2X1 U26 ( .A(n19), .B(n36), .Y(n18) );
  NOR2X1 U27 ( .A(n20), .B(n27), .Y(n19) );
  NAND2X1 U28 ( .A(n21), .B(n24), .Y(n20) );
  XNOR2X1 U31 ( .A(n26), .B(n25), .Y(SUM[22]) );
  NAND2X1 U32 ( .A(n24), .B(n26), .Y(n23) );
  XOR2X1 U35 ( .A(n30), .B(n29), .Y(SUM[21]) );
  NOR2X1 U36 ( .A(n27), .B(n33), .Y(n26) );
  NAND2X1 U37 ( .A(n28), .B(n31), .Y(n27) );
  XOR2X1 U40 ( .A(n33), .B(n32), .Y(SUM[20]) );
  NAND2X1 U41 ( .A(n31), .B(n34), .Y(n30) );
  XOR2X1 U44 ( .A(n40), .B(n39), .Y(SUM[19]) );
  NOR2X1 U46 ( .A(n35), .B(n51), .Y(n34) );
  NOR2X1 U48 ( .A(n37), .B(n44), .Y(n36) );
  NAND2X1 U49 ( .A(n38), .B(n41), .Y(n37) );
  XNOR2X1 U52 ( .A(n43), .B(n42), .Y(SUM[18]) );
  NAND2X1 U53 ( .A(n41), .B(n43), .Y(n40) );
  XNOR2X1 U56 ( .A(n47), .B(n46), .Y(SUM[17]) );
  NOR2X1 U57 ( .A(n44), .B(n51), .Y(n43) );
  NAND2X1 U58 ( .A(n45), .B(n49), .Y(n44) );
  XOR2X1 U61 ( .A(n51), .B(n50), .Y(SUM[16]) );
  NOR2X1 U62 ( .A(n50), .B(n51), .Y(n47) );
  XNOR2X1 U66 ( .A(n58), .B(n57), .Y(SUM[15]) );
  NOR2X1 U68 ( .A(n90), .B(n53), .Y(n52) );
  NAND2X1 U69 ( .A(n54), .B(n73), .Y(n53) );
  NOR2X1 U70 ( .A(n55), .B(n64), .Y(n54) );
  NAND2X1 U71 ( .A(n56), .B(n60), .Y(n55) );
  XOR2X1 U74 ( .A(n62), .B(n61), .Y(SUM[14]) );
  NOR2X1 U75 ( .A(n61), .B(n62), .Y(n58) );
  XNOR2X1 U79 ( .A(n67), .B(n66), .Y(SUM[13]) );
  NAND2X1 U80 ( .A(n63), .B(n71), .Y(n62) );
  NAND2X1 U82 ( .A(n65), .B(n69), .Y(n64) );
  XNOR2X1 U85 ( .A(n71), .B(n70), .Y(SUM[12]) );
  NOR2X1 U86 ( .A(n70), .B(n72), .Y(n67) );
  XNOR2X1 U90 ( .A(n77), .B(n76), .Y(SUM[11]) );
  NAND2X1 U92 ( .A(n73), .B(n89), .Y(n72) );
  NOR2X1 U93 ( .A(n74), .B(n83), .Y(n73) );
  NAND2X1 U94 ( .A(n75), .B(n79), .Y(n74) );
  XOR2X1 U97 ( .A(n81), .B(n80), .Y(SUM[10]) );
  NOR2X1 U98 ( .A(n80), .B(n81), .Y(n77) );
  XOR2X1 U102 ( .A(n86), .B(n85), .Y(SUM[9]) );
  NAND2X1 U103 ( .A(n82), .B(n89), .Y(n81) );
  NAND2X1 U105 ( .A(n84), .B(n87), .Y(n83) );
  XNOR2X1 U108 ( .A(n89), .B(n88), .Y(SUM[8]) );
  NAND2X1 U109 ( .A(n87), .B(n89), .Y(n86) );
  XOR2X1 U112 ( .A(n95), .B(n94), .Y(SUM[7]) );
  NAND2X1 U114 ( .A(n107), .B(n91), .Y(n90) );
  NOR2X1 U115 ( .A(n92), .B(n99), .Y(n91) );
  NAND2X1 U116 ( .A(n93), .B(n96), .Y(n92) );
  XNOR2X1 U119 ( .A(n98), .B(n97), .Y(SUM[6]) );
  NAND2X1 U120 ( .A(n96), .B(n98), .Y(n95) );
  XNOR2X1 U123 ( .A(n102), .B(n101), .Y(SUM[5]) );
  NOR2X1 U124 ( .A(n99), .B(n106), .Y(n98) );
  NAND2X1 U125 ( .A(n100), .B(n104), .Y(n99) );
  XOR2X1 U128 ( .A(n106), .B(n105), .Y(SUM[4]) );
  NOR2X1 U129 ( .A(n105), .B(n106), .Y(n102) );
  XOR2X1 U133 ( .A(n111), .B(n110), .Y(SUM[3]) );
  NOR2X1 U135 ( .A(n115), .B(n108), .Y(n107) );
  NAND2X1 U136 ( .A(n109), .B(n112), .Y(n108) );
  NAND2X1 U140 ( .A(n112), .B(n114), .Y(n111) );
  NAND2X1 U145 ( .A(n118), .B(n116), .Y(n115) );
  INVX1 U152 ( .A(n118), .Y(SUM[0]) );
  XOR2X1 U153 ( .A(n116), .B(n118), .Y(SUM[1]) );
  XOR2X1 U154 ( .A(n112), .B(n114), .Y(SUM[2]) );
  INVX2 U155 ( .A(n96), .Y(n97) );
  INVX2 U156 ( .A(n93), .Y(n94) );
  INVX2 U157 ( .A(n90), .Y(n89) );
  INVX2 U158 ( .A(n87), .Y(n88) );
  INVX2 U159 ( .A(n84), .Y(n85) );
  INVX2 U160 ( .A(n83), .Y(n82) );
  INVX2 U161 ( .A(A[27]), .Y(n8) );
  INVX2 U162 ( .A(n79), .Y(n80) );
  INVX2 U163 ( .A(n75), .Y(n76) );
  INVX2 U164 ( .A(n72), .Y(n71) );
  INVX2 U165 ( .A(n69), .Y(n70) );
  INVX2 U166 ( .A(n65), .Y(n66) );
  INVX2 U167 ( .A(n64), .Y(n63) );
  INVX2 U168 ( .A(n5), .Y(n6) );
  INVX2 U169 ( .A(n60), .Y(n61) );
  INVX2 U170 ( .A(n56), .Y(n57) );
  INVX2 U171 ( .A(n52), .Y(n51) );
  INVX2 U172 ( .A(n49), .Y(n50) );
  INVX2 U173 ( .A(n45), .Y(n46) );
  INVX2 U174 ( .A(n41), .Y(n42) );
  INVX2 U175 ( .A(n38), .Y(n39) );
  INVX2 U176 ( .A(n36), .Y(n35) );
  INVX2 U177 ( .A(n34), .Y(n33) );
  INVX2 U178 ( .A(n31), .Y(n32) );
  INVX2 U179 ( .A(A[29]), .Y(n3) );
  INVX2 U180 ( .A(n28), .Y(n29) );
  INVX2 U181 ( .A(n24), .Y(n25) );
  INVX2 U182 ( .A(n21), .Y(n22) );
  INVX2 U183 ( .A(A[24]), .Y(n16) );
  INVX2 U184 ( .A(A[25]), .Y(n13) );
  INVX2 U185 ( .A(n115), .Y(n114) );
  INVX2 U186 ( .A(n109), .Y(n110) );
  INVX2 U187 ( .A(n10), .Y(n11) );
  INVX2 U188 ( .A(n107), .Y(n106) );
  INVX2 U189 ( .A(n104), .Y(n105) );
  INVX2 U190 ( .A(n100), .Y(n101) );
endmodule


module address_counter_DW01_add_12 ( A, B, CI, SUM, CO );
  input [31:0] A;
  input [31:0] B;
  output [31:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n6, n7, n8, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n35, n36, n38, n40, n42, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n67, n68, n69, n70, n71, n72, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n108, n110,
         n111, n113, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n130, n131, n132, n133, n135, n137,
         n138, n139, n141, n142, n143, n144, n145, n146, n147, n149, n151,
         n152, n153, n154, n155, n159, n160, n161, n162, n163, n165, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n177, n179, n180,
         n181, n183, n185, n186, n187, n189, n191, n192, n194, n197, n199,
         n200, n201, n203, n206, n207, n210, n211, n212, n214, n215, n217,
         n219, n221, n222, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383;

  XOR2X1 U1 ( .A(n36), .B(n2), .Y(SUM[31]) );
  NAND2X1 U2 ( .A(n35), .B(n377), .Y(n2) );
  NAND2X1 U5 ( .A(A[31]), .B(B[31]), .Y(n35) );
  XOR2X1 U6 ( .A(n45), .B(n3), .Y(SUM[30]) );
  AOI21X1 U7 ( .A(n371), .B(n381), .C(n38), .Y(n36) );
  AOI21X1 U11 ( .A(n376), .B(n47), .C(n42), .Y(n40) );
  NAND2X1 U14 ( .A(n44), .B(n376), .Y(n3) );
  NAND2X1 U17 ( .A(A[30]), .B(B[30]), .Y(n44) );
  XOR2X1 U18 ( .A(n50), .B(n4), .Y(SUM[29]) );
  AOI21X1 U19 ( .A(n334), .B(n381), .C(n47), .Y(n45) );
  NOR2X1 U20 ( .A(n48), .B(n53), .Y(n46) );
  OAI21X1 U21 ( .A(n333), .B(n54), .C(n49), .Y(n47) );
  NAND2X1 U22 ( .A(n49), .B(n197), .Y(n4) );
  NOR2X1 U24 ( .A(A[29]), .B(B[29]), .Y(n48) );
  NAND2X1 U25 ( .A(A[29]), .B(B[29]), .Y(n49) );
  AOI21X1 U27 ( .A(n51), .B(n381), .C(n52), .Y(n50) );
  NOR2X1 U32 ( .A(A[28]), .B(B[28]), .Y(n53) );
  NAND2X1 U33 ( .A(A[28]), .B(B[28]), .Y(n54) );
  XOR2X1 U34 ( .A(n61), .B(n6), .Y(SUM[27]) );
  OAI21X1 U35 ( .A(n83), .B(n55), .C(n56), .Y(n1) );
  NAND2X1 U36 ( .A(n57), .B(n69), .Y(n55) );
  AOI21X1 U37 ( .A(n70), .B(n351), .C(n58), .Y(n56) );
  NOR2X1 U38 ( .A(n59), .B(n64), .Y(n57) );
  OAI21X1 U39 ( .A(n354), .B(n67), .C(n60), .Y(n58) );
  NAND2X1 U40 ( .A(n60), .B(n199), .Y(n6) );
  NOR2X1 U42 ( .A(B[27]), .B(A[27]), .Y(n59) );
  NAND2X1 U43 ( .A(A[27]), .B(n366), .Y(n60) );
  XOR2X1 U44 ( .A(n68), .B(n7), .Y(SUM[26]) );
  AOI21X1 U45 ( .A(n82), .B(n62), .C(n63), .Y(n61) );
  NOR2X1 U46 ( .A(n355), .B(n71), .Y(n62) );
  OAI21X1 U47 ( .A(n72), .B(n355), .C(n67), .Y(n63) );
  NAND2X1 U50 ( .A(n67), .B(n200), .Y(n7) );
  NOR2X1 U52 ( .A(A[26]), .B(B[26]), .Y(n64) );
  NAND2X1 U53 ( .A(A[26]), .B(n338), .Y(n67) );
  XOR2X1 U54 ( .A(n77), .B(n8), .Y(SUM[25]) );
  AOI21X1 U55 ( .A(n82), .B(n356), .C(n70), .Y(n68) );
  NOR2X1 U60 ( .A(n75), .B(n80), .Y(n69) );
  OAI21X1 U61 ( .A(n350), .B(n81), .C(n76), .Y(n70) );
  NAND2X1 U62 ( .A(n76), .B(n201), .Y(n8) );
  NOR2X1 U64 ( .A(A[25]), .B(B[25]), .Y(n75) );
  NAND2X1 U65 ( .A(A[25]), .B(n383), .Y(n76) );
  AOI21X1 U67 ( .A(n82), .B(n78), .C(n79), .Y(n77) );
  NOR2X1 U72 ( .A(A[24]), .B(B[24]), .Y(n80) );
  NAND2X1 U73 ( .A(A[24]), .B(B[24]), .Y(n81) );
  XNOR2X1 U74 ( .A(n88), .B(n10), .Y(SUM[23]) );
  AOI21X1 U76 ( .A(n92), .B(n84), .C(n85), .Y(n83) );
  NOR2X1 U77 ( .A(n89), .B(n86), .Y(n84) );
  OAI21X1 U78 ( .A(n352), .B(n90), .C(n87), .Y(n85) );
  NAND2X1 U79 ( .A(n87), .B(n203), .Y(n10) );
  NOR2X1 U81 ( .A(A[23]), .B(B[23]), .Y(n86) );
  NAND2X1 U82 ( .A(A[23]), .B(n347), .Y(n87) );
  XOR2X1 U83 ( .A(n91), .B(n11), .Y(SUM[22]) );
  OAI21X1 U84 ( .A(n91), .B(n89), .C(n90), .Y(n88) );
  NAND2X1 U85 ( .A(n90), .B(n341), .Y(n11) );
  NOR2X1 U87 ( .A(A[22]), .B(B[22]), .Y(n89) );
  NAND2X1 U88 ( .A(A[22]), .B(n329), .Y(n90) );
  XOR2X1 U89 ( .A(n370), .B(n12), .Y(SUM[21]) );
  OAI21X1 U91 ( .A(n95), .B(n93), .C(n94), .Y(n92) );
  NAND2X1 U92 ( .A(n94), .B(n343), .Y(n12) );
  NOR2X1 U94 ( .A(A[21]), .B(B[21]), .Y(n93) );
  NAND2X1 U95 ( .A(A[21]), .B(B[21]), .Y(n94) );
  XNOR2X1 U96 ( .A(n100), .B(n13), .Y(SUM[20]) );
  AOI21X1 U97 ( .A(n104), .B(n96), .C(n97), .Y(n95) );
  NOR2X1 U98 ( .A(n367), .B(n101), .Y(n96) );
  OAI21X1 U99 ( .A(n98), .B(n102), .C(n99), .Y(n97) );
  NAND2X1 U100 ( .A(n99), .B(n206), .Y(n13) );
  NOR2X1 U102 ( .A(A[20]), .B(n362), .Y(n98) );
  NAND2X1 U103 ( .A(A[20]), .B(n362), .Y(n99) );
  XOR2X1 U104 ( .A(n103), .B(n14), .Y(SUM[19]) );
  OAI21X1 U105 ( .A(n103), .B(n353), .C(n102), .Y(n100) );
  NAND2X1 U106 ( .A(n102), .B(n207), .Y(n14) );
  NOR2X1 U108 ( .A(A[19]), .B(B[19]), .Y(n101) );
  NAND2X1 U109 ( .A(A[19]), .B(n339), .Y(n102) );
  XOR2X1 U110 ( .A(n111), .B(n15), .Y(SUM[18]) );
  OAI21X1 U112 ( .A(n117), .B(n105), .C(n106), .Y(n104) );
  NAND2X1 U113 ( .A(n340), .B(n378), .Y(n105) );
  AOI21X1 U114 ( .A(n113), .B(n340), .C(n108), .Y(n106) );
  NAND2X1 U117 ( .A(n340), .B(n110), .Y(n15) );
  NAND2X1 U120 ( .A(A[18]), .B(n360), .Y(n110) );
  XNOR2X1 U121 ( .A(n116), .B(n16), .Y(SUM[17]) );
  AOI21X1 U122 ( .A(n378), .B(n116), .C(n337), .Y(n111) );
  NAND2X1 U125 ( .A(n382), .B(n378), .Y(n16) );
  NAND2X1 U128 ( .A(A[17]), .B(B[17]), .Y(n115) );
  XNOR2X1 U129 ( .A(n122), .B(n17), .Y(SUM[16]) );
  AOI21X1 U131 ( .A(n126), .B(n118), .C(n119), .Y(n117) );
  NOR2X1 U132 ( .A(n123), .B(n120), .Y(n118) );
  OAI21X1 U133 ( .A(n120), .B(n124), .C(n121), .Y(n119) );
  NAND2X1 U134 ( .A(n121), .B(n210), .Y(n17) );
  NOR2X1 U136 ( .A(A[16]), .B(B[16]), .Y(n120) );
  NAND2X1 U137 ( .A(A[16]), .B(B[16]), .Y(n121) );
  XOR2X1 U138 ( .A(n125), .B(n18), .Y(SUM[15]) );
  OAI21X1 U139 ( .A(n125), .B(n123), .C(n124), .Y(n122) );
  NAND2X1 U140 ( .A(n124), .B(n211), .Y(n18) );
  NOR2X1 U142 ( .A(A[15]), .B(B[15]), .Y(n123) );
  NAND2X1 U143 ( .A(A[15]), .B(n332), .Y(n124) );
  XOR2X1 U144 ( .A(n133), .B(n19), .Y(SUM[14]) );
  OAI21X1 U146 ( .A(n139), .B(n127), .C(n128), .Y(n126) );
  NAND2X1 U147 ( .A(n335), .B(n212), .Y(n127) );
  AOI21X1 U148 ( .A(n135), .B(n212), .C(n130), .Y(n128) );
  NAND2X1 U151 ( .A(n132), .B(n212), .Y(n19) );
  NOR2X1 U153 ( .A(A[14]), .B(B[14]), .Y(n131) );
  NAND2X1 U154 ( .A(A[14]), .B(B[14]), .Y(n132) );
  XNOR2X1 U155 ( .A(n138), .B(n20), .Y(SUM[13]) );
  AOI21X1 U156 ( .A(n335), .B(n138), .C(n135), .Y(n133) );
  NAND2X1 U159 ( .A(n137), .B(n335), .Y(n20) );
  NAND2X1 U162 ( .A(A[13]), .B(B[13]), .Y(n137) );
  XNOR2X1 U163 ( .A(n363), .B(n21), .Y(SUM[12]) );
  AOI21X1 U165 ( .A(n144), .B(n214), .C(n141), .Y(n139) );
  NAND2X1 U168 ( .A(n143), .B(n214), .Y(n21) );
  NOR2X1 U170 ( .A(A[12]), .B(B[12]), .Y(n142) );
  NAND2X1 U171 ( .A(A[12]), .B(B[12]), .Y(n143) );
  XOR2X1 U172 ( .A(n345), .B(n22), .Y(SUM[11]) );
  OAI21X1 U173 ( .A(n147), .B(n145), .C(n146), .Y(n144) );
  NAND2X1 U174 ( .A(n146), .B(n215), .Y(n22) );
  NOR2X1 U176 ( .A(A[11]), .B(B[11]), .Y(n145) );
  NAND2X1 U177 ( .A(A[11]), .B(B[11]), .Y(n146) );
  XNOR2X1 U178 ( .A(n364), .B(n23), .Y(SUM[10]) );
  AOI21X1 U179 ( .A(n152), .B(n374), .C(n149), .Y(n147) );
  NAND2X1 U182 ( .A(n151), .B(n374), .Y(n23) );
  NAND2X1 U185 ( .A(A[10]), .B(B[10]), .Y(n151) );
  XOR2X1 U186 ( .A(n24), .B(n349), .Y(SUM[9]) );
  OAI21X1 U187 ( .A(n153), .B(n155), .C(n154), .Y(n152) );
  NAND2X1 U188 ( .A(n154), .B(n217), .Y(n24) );
  NOR2X1 U190 ( .A(A[9]), .B(B[9]), .Y(n153) );
  NAND2X1 U191 ( .A(A[9]), .B(B[9]), .Y(n154) );
  AOI21X1 U193 ( .A(n160), .B(n373), .C(n336), .Y(n155) );
  NAND2X1 U196 ( .A(n159), .B(n373), .Y(n25) );
  XOR2X1 U200 ( .A(n26), .B(n365), .Y(SUM[7]) );
  OAI21X1 U201 ( .A(n163), .B(n161), .C(n162), .Y(n160) );
  NAND2X1 U202 ( .A(n162), .B(n219), .Y(n26) );
  NOR2X1 U204 ( .A(A[7]), .B(B[7]), .Y(n161) );
  NAND2X1 U205 ( .A(A[7]), .B(B[7]), .Y(n162) );
  XNOR2X1 U206 ( .A(n27), .B(n331), .Y(SUM[6]) );
  AOI21X1 U207 ( .A(n168), .B(n372), .C(n165), .Y(n163) );
  NAND2X1 U210 ( .A(n167), .B(n372), .Y(n27) );
  NAND2X1 U213 ( .A(A[6]), .B(n330), .Y(n167) );
  XOR2X1 U214 ( .A(n28), .B(n171), .Y(SUM[5]) );
  OAI21X1 U215 ( .A(n169), .B(n171), .C(n170), .Y(n168) );
  NAND2X1 U216 ( .A(n170), .B(n221), .Y(n28) );
  NOR2X1 U218 ( .A(A[5]), .B(B[5]), .Y(n169) );
  NAND2X1 U219 ( .A(A[5]), .B(B[5]), .Y(n170) );
  XOR2X1 U220 ( .A(n29), .B(n175), .Y(SUM[4]) );
  OAI21X1 U222 ( .A(n175), .B(n173), .C(n174), .Y(n172) );
  NAND2X1 U223 ( .A(n174), .B(n222), .Y(n29) );
  NOR2X1 U225 ( .A(A[4]), .B(B[4]), .Y(n173) );
  NAND2X1 U226 ( .A(A[4]), .B(B[4]), .Y(n174) );
  XNOR2X1 U227 ( .A(n30), .B(n180), .Y(SUM[3]) );
  AOI21X1 U228 ( .A(n180), .B(n379), .C(n177), .Y(n175) );
  NAND2X1 U231 ( .A(n179), .B(n379), .Y(n30) );
  NAND2X1 U234 ( .A(A[3]), .B(B[3]), .Y(n179) );
  XNOR2X1 U235 ( .A(n31), .B(n186), .Y(SUM[2]) );
  AOI21X1 U237 ( .A(n186), .B(n375), .C(n183), .Y(n181) );
  NAND2X1 U240 ( .A(n185), .B(n375), .Y(n31) );
  NAND2X1 U243 ( .A(A[2]), .B(B[2]), .Y(n185) );
  XNOR2X1 U244 ( .A(n32), .B(n192), .Y(SUM[1]) );
  AOI21X1 U246 ( .A(n192), .B(n380), .C(n189), .Y(n187) );
  NAND2X1 U249 ( .A(n191), .B(n380), .Y(n32) );
  NAND2X1 U252 ( .A(A[1]), .B(B[1]), .Y(n191) );
  NAND2X1 U255 ( .A(n194), .B(n342), .Y(n33) );
  NAND2X1 U258 ( .A(A[0]), .B(B[0]), .Y(n194) );
  BUFX2 U262 ( .A(B[22]), .Y(n329) );
  BUFX2 U263 ( .A(B[6]), .Y(n330) );
  BUFX2 U264 ( .A(n168), .Y(n331) );
  BUFX2 U265 ( .A(B[15]), .Y(n332) );
  NOR2X1 U266 ( .A(A[29]), .B(B[29]), .Y(n333) );
  BUFX2 U267 ( .A(n46), .Y(n334) );
  OR2X2 U268 ( .A(A[13]), .B(B[13]), .Y(n335) );
  AND2X2 U269 ( .A(A[8]), .B(B[8]), .Y(n336) );
  INVX1 U270 ( .A(n336), .Y(n159) );
  INVX1 U271 ( .A(n382), .Y(n337) );
  BUFX2 U272 ( .A(B[26]), .Y(n338) );
  INVX1 U273 ( .A(n333), .Y(n197) );
  BUFX2 U274 ( .A(B[19]), .Y(n339) );
  INVX1 U275 ( .A(n126), .Y(n125) );
  BUFX2 U276 ( .A(n1), .Y(n381) );
  OR2X2 U277 ( .A(B[18]), .B(A[18]), .Y(n340) );
  OR2X1 U278 ( .A(A[22]), .B(B[22]), .Y(n341) );
  OR2X2 U279 ( .A(A[0]), .B(B[0]), .Y(n342) );
  INVX1 U280 ( .A(n123), .Y(n211) );
  INVX1 U281 ( .A(n80), .Y(n78) );
  OR2X1 U282 ( .A(A[21]), .B(B[21]), .Y(n343) );
  BUFX2 U283 ( .A(n160), .Y(n344) );
  AOI21X1 U284 ( .A(n152), .B(n374), .C(n149), .Y(n345) );
  OR2X2 U285 ( .A(A[10]), .B(B[10]), .Y(n374) );
  INVX1 U286 ( .A(B[23]), .Y(n346) );
  INVX2 U287 ( .A(n346), .Y(n347) );
  XOR2X1 U288 ( .A(n82), .B(n348), .Y(SUM[24]) );
  AND2X2 U289 ( .A(n81), .B(n78), .Y(n348) );
  BUFX2 U290 ( .A(n155), .Y(n349) );
  INVX1 U291 ( .A(n201), .Y(n350) );
  BUFX2 U292 ( .A(n57), .Y(n351) );
  INVX1 U293 ( .A(n203), .Y(n352) );
  INVX1 U294 ( .A(n207), .Y(n353) );
  INVX1 U295 ( .A(n117), .Y(n116) );
  INVX1 U296 ( .A(n199), .Y(n354) );
  INVX1 U297 ( .A(n200), .Y(n355) );
  INVX1 U298 ( .A(n71), .Y(n356) );
  INVX1 U299 ( .A(B[17]), .Y(n357) );
  INVX1 U300 ( .A(n357), .Y(n358) );
  INVX1 U301 ( .A(B[18]), .Y(n359) );
  INVX2 U302 ( .A(n359), .Y(n360) );
  INVX1 U303 ( .A(B[20]), .Y(n361) );
  INVX2 U304 ( .A(n361), .Y(n362) );
  BUFX2 U305 ( .A(n144), .Y(n363) );
  BUFX2 U306 ( .A(n152), .Y(n364) );
  BUFX2 U307 ( .A(n163), .Y(n365) );
  INVX1 U308 ( .A(n161), .Y(n219) );
  BUFX2 U309 ( .A(B[27]), .Y(n366) );
  NOR2X1 U310 ( .A(A[20]), .B(B[20]), .Y(n367) );
  INVX1 U311 ( .A(n86), .Y(n203) );
  INVX1 U312 ( .A(n64), .Y(n200) );
  INVX1 U313 ( .A(n75), .Y(n201) );
  INVX1 U314 ( .A(n139), .Y(n138) );
  INVX1 U315 ( .A(n104), .Y(n103) );
  XOR2X1 U316 ( .A(n1), .B(n368), .Y(SUM[28]) );
  AND2X2 U317 ( .A(n54), .B(n51), .Y(n368) );
  INVX1 U318 ( .A(n369), .Y(n370) );
  INVX1 U319 ( .A(n95), .Y(n369) );
  XNOR2X1 U320 ( .A(n344), .B(n25), .Y(SUM[8]) );
  OR2X2 U321 ( .A(B[6]), .B(A[6]), .Y(n372) );
  OR2X2 U322 ( .A(A[30]), .B(B[30]), .Y(n376) );
  AND2X2 U323 ( .A(n376), .B(n46), .Y(n371) );
  OR2X1 U324 ( .A(A[8]), .B(B[8]), .Y(n373) );
  OR2X1 U325 ( .A(A[2]), .B(B[2]), .Y(n375) );
  OR2X1 U326 ( .A(A[31]), .B(B[31]), .Y(n377) );
  OR2X1 U327 ( .A(A[17]), .B(n358), .Y(n378) );
  OR2X1 U328 ( .A(A[3]), .B(B[3]), .Y(n379) );
  OR2X1 U329 ( .A(A[1]), .B(B[1]), .Y(n380) );
  INVX1 U330 ( .A(n69), .Y(n71) );
  NAND2X1 U331 ( .A(A[17]), .B(n358), .Y(n382) );
  INVX1 U332 ( .A(n59), .Y(n199) );
  INVX1 U333 ( .A(n92), .Y(n91) );
  INVX1 U334 ( .A(n98), .Y(n206) );
  INVX1 U335 ( .A(n101), .Y(n207) );
  BUFX2 U336 ( .A(B[25]), .Y(n383) );
  INVX2 U337 ( .A(n83), .Y(n82) );
  INVX2 U338 ( .A(n81), .Y(n79) );
  INVX2 U339 ( .A(n70), .Y(n72) );
  INVX2 U340 ( .A(n54), .Y(n52) );
  INVX2 U341 ( .A(n44), .Y(n42) );
  INVX2 U342 ( .A(n40), .Y(n38) );
  INVX2 U343 ( .A(n173), .Y(n222) );
  INVX2 U344 ( .A(n169), .Y(n221) );
  INVX2 U345 ( .A(n153), .Y(n217) );
  INVX2 U346 ( .A(n145), .Y(n215) );
  INVX2 U347 ( .A(n120), .Y(n210) );
  INVX2 U348 ( .A(n53), .Y(n51) );
  INVX2 U349 ( .A(n194), .Y(n192) );
  INVX2 U350 ( .A(n191), .Y(n189) );
  INVX2 U351 ( .A(n187), .Y(n186) );
  INVX2 U352 ( .A(n185), .Y(n183) );
  INVX2 U353 ( .A(n181), .Y(n180) );
  INVX2 U354 ( .A(n179), .Y(n177) );
  INVX2 U355 ( .A(n172), .Y(n171) );
  INVX2 U356 ( .A(n167), .Y(n165) );
  INVX2 U357 ( .A(n151), .Y(n149) );
  INVX2 U358 ( .A(n143), .Y(n141) );
  INVX2 U359 ( .A(n142), .Y(n214) );
  INVX2 U360 ( .A(n137), .Y(n135) );
  INVX2 U361 ( .A(n132), .Y(n130) );
  INVX2 U362 ( .A(n131), .Y(n212) );
  INVX2 U363 ( .A(n115), .Y(n113) );
  INVX2 U364 ( .A(n110), .Y(n108) );
  INVX2 U365 ( .A(n33), .Y(SUM[0]) );
endmodule


module address_counter_DW_mult_uns_2 ( a, b, product );
  input [31:0] a;
  input [31:0] b;
  output [63:0] product;
  wire   n1, n7, n13, n19, n22, n25, n30, n31, n34, n36, n37, n40, n43, n50,
         n52, n55, n57, n58, n59, n60, n61, n62, n63, n65, n67, n68, n70, n71,
         n73, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n90, n91, n93, n95, n96, n97, n98, n99, n101, n103, n104, n105,
         n106, n107, n108, n110, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n127, n129, n130, n131, n132,
         n133, n134, n136, n139, n140, n141, n142, n143, n144, n145, n146,
         n149, n150, n151, n152, n155, n156, n158, n161, n162, n163, n164,
         n165, n168, n169, n171, n173, n174, n175, n176, n177, n178, n180,
         n183, n186, n187, n193, n194, n196, n197, n198, n199, n200, n201,
         n202, n205, n206, n207, n208, n209, n210, n213, n214, n215, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n234, n236, n237, n240, n241, n242, n243,
         n247, n248, n249, n250, n252, n253, n254, n255, n258, n259, n260,
         n261, n263, n265, n266, n267, n268, n269, n271, n273, n274, n275,
         n276, n277, n279, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n291, n293, n294, n295, n296, n298, n301, n303, n304, n305,
         n308, n309, n310, n311, n312, n313, n314, n316, n321, n323, n325,
         n326, n328, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n425, n426, n427,
         n428, n429, n430, n431, n432, n433, n434, n435, n436, n437, n438,
         n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449,
         n450, n451, n452, n453, n454, n455, n456, n457, n458, n459, n460,
         n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471,
         n472, n473, n474, n475, n476, n477, n478, n479, n480, n481, n482,
         n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, n493,
         n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515,
         n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526,
         n527, n528, n529, n530, n531, n532, n533, n534, n535, n536, n537,
         n538, n539, n540, n541, n542, n543, n544, n545, n546, n547, n548,
         n549, n550, n551, n552, n553, n554, n555, n556, n557, n558, n559,
         n560, n561, n562, n563, n564, n565, n566, n567, n568, n569, n570,
         n571, n572, n573, n574, n575, n576, n577, n578, n579, n580, n581,
         n582, n583, n586, n589, n590, n592, n595, n596, n598, n601, n604,
         n605, n607, n608, n610, n611, n612, n613, n614, n615, n616, n617,
         n618, n619, n620, n621, n622, n623, n624, n625, n626, n627, n628,
         n629, n630, n631, n633, n634, n635, n636, n637, n638, n639, n640,
         n641, n642, n643, n644, n645, n646, n647, n648, n649, n650, n651,
         n652, n653, n654, n655, n656, n657, n658, n659, n660, n661, n662,
         n663, n664, n665, n666, n667, n668, n669, n670, n671, n672, n673,
         n674, n675, n676, n677, n678, n679, n680, n681, n682, n683, n684,
         n685, n686, n687, n688, n689, n690, n691, n692, n693, n694, n695,
         n696, n697, n698, n699, n700, n701, n702, n703, n704, n705, n706,
         n707, n708, n709, n710, n711, n712, n713, n714, n715, n716, n717,
         n718, n719, n720, n721, n722, n723, n724, n725, n726, n727, n728,
         n729, n730, n731, n732, n733, n734, n735, n736, n737, n738, n739,
         n740, n741, n742, n743, n744, n745, n746, n747, n748, n749, n750,
         n751, n752, n753, n754, n755, n756, n757, n758, n759, n760, n761,
         n762, n763, n764, n765, n766, n767, n768, n769, n770, n771, n772,
         n773, n774, n775, n776, n777, n778, n779, n780, n781, n782, n784,
         n787, n788, n789, n790, n791, n792, n793, n794, n795, n796, n797,
         n798, n799, n800, n801, n802, n803, n804, n805, n806, n807, n808,
         n809, n810, n811, n812, n813, n814, n815, n816, n817, n818, n819,
         n820, n821, n822, n823, n824, n825, n826, n827, n828, n829, n830,
         n831, n832, n833, n834, n835, n836, n837, n838, n840, n841, n842,
         n843, n844, n845, n846, n847, n848, n849, n850, n851, n852, n853,
         n854, n855, n856, n857, n858, n859, n860, n861, n862, n863, n864,
         n865, n866, n867, n868, n869, n870, n871, n872, n873, n874, n875,
         n876, n877, n878, n879, n880, n882, n883, n884, n885, n886, n887,
         n888, n889, n890, n891, n892, n893, n894, n895, n896, n897, n898,
         n899, n900, n901, n902, n903, n904, n905, n906, n907, n908, n909,
         n910, n911, n912, n913, n914, n915, n916, n917, n918, n919, n920,
         n921, n922, n923, n924, n925, n926, n927, n928, n929, n930, n931,
         n932, n933, n934, n935, n936, n937, n938, n939, n940, n941, n942,
         n943, n944, n945, n946, n947, n950, n952, n954, n955, n956, n957,
         n975, n976, n977, n978, n979, n980, n981, n983, n984, n1055, n1056,
         n1057, n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066,
         n1067, n1068, n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076,
         n1077, n1078, n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086,
         n1087, n1088, n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096,
         n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106,
         n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116,
         n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126,
         n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136,
         n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146,
         n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156,
         n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166,
         n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176,
         n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184, n1185, n1186,
         n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194, n1195, n1196,
         n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204, n1205, n1206,
         n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214, n1215, n1216,
         n1217, n1218, n1219, n1220, n1221, n1222, n1223, n1224, n1225, n1226,
         n1227, n1228, n1229, n1230, n1231, n1232, n1233, n1234, n1235, n1236,
         n1237, n1238, n1239, n1240, n1241, n1242, n1243, n1244, n1245, n1246,
         n1247, n1248, n1249, n1250, n1251, n1252, n1253, n1254, n1255, n1256,
         n1257, n1258, n1259, n1260, n1261, n1262, n1263, n1264, n1265, n1266,
         n1267, n1268, n1269, n1270, n1271, n1272, n1273, n1274, n1275, n1276,
         n1277, n1278, n1279, n1280, n1281, n1282, n1283, n1284, n1285, n1286,
         n1287, n1288, n1289, n1290, n1291, n1292, n1293, n1294, n1295, n1296,
         n1297, n1298, n1299, n1300, n1301, n1302, n1303, n1304, n1305, n1306,
         n1307, n1308, n1309, n1310, n1311, n1312, n1313, n1314, n1315, n1316,
         n1317, n1318, n1319, n1320, n1321, n1322, n1323, n1324, n1325, n1326,
         n1327, n1328, n1329, n1330, n1331, n1332, n1333, n1334, n1335, n1336,
         n1337, n1338, n1339, n1340, n1341, n1342, n1343, n1344, n1345, n1346,
         n1347, n1348, n1349, n1350, n1351, n1352, n1353, n1354, n1355, n1356,
         n1357, n1358, n1359, n1360, n1361, n1362, n1363, n1364, n1365, n1366,
         n1367, n1368, n1369, n1370, n1371, n1372, n1373, n1374, n1375, n1376,
         n1377, n1378, n1379, n1380, n1381, n1382, n1383, n1384, n1385, n1386,
         n1387, n1388, n1389, n1390, n1391, n1392, n1393, n1394, n1395, n1396,
         n1397, n1398, n1399, n1400, n1401, n1402, n1403, n1404, n1405, n1406,
         n1407, n1408, n1409, n1410, n1411, n1412, n1413, n1414, n1415, n1416,
         n1417, n1418, n1419, n1420, n1421, n1422, n1423, n1424, n1425, n1426,
         n1427, n1428, n1429, n1430, n1431, n1432, n1433, n1434, n1435, n1436,
         n1437, n1438, n1439, n1440, n1441, n1442, n1443, n1444, n1445, n1446,
         n1447, n1448, n1449, n1450, n1451, n1452, n1453, n1454, n1455, n1456,
         n1457, n1458, n1459, n1460, n1461, n1462, n1463, n1464, n1465, n1466,
         n1467, n1468, n1469, n1470, n1471, n1472, n1473, n1474, n1475, n1476,
         n1477, n1478, n1479, n1480, n1481, n1482, n1483, n1484, n1485, n1486,
         n1487, n1488, n1489, n1490, n1491, n1492, n1493, n1494, n1495, n1496,
         n1497, n1498, n1499, n1500, n1501, n1502, n1503, n1504, n1505, n1506,
         n1507, n1508, n1509, n1510, n1511, n1512, n1513, n1514, n1515, n1516,
         n1517, n1518, n1519, n1520, n1521, n1522, n1523, n1524, n1525, n1526,
         n1527, n1528, n1529, n1530, n1531, n1532, n1533, n1534, n1535, n1536,
         n1537, n1538, n1539, n1540, n1541, n1542, n1543, n1544, n1545, n1546,
         n1547, n1548, n1549, n1550, n1551, n1552, n1553, n1554, n1555, n1556,
         n1557, n1558, n1559, n1560, n1561, n1562, n1563, n1564, n1565, n1566,
         n1567, n1568, n1569, n1570, n1571, n1572, n1573, n1574, n1575, n1576,
         n1577, n1578, n1579, n1580, n1581, n1582, n1583, n1584, n1585, n1586,
         n1587, n1588, n1589, n1590, n1591, n1592, n1593, n1594, n1595, n1596,
         n1597, n1598, n1599, n1600, n1601, n1602, n1603, n1604, n1605, n1606,
         n1607, n1608, n1609, n1610, n1611, n1612, n1613, n1614, n1615, n1616,
         n1617, n1618, n1619, n1620, n1621, n1622, n1623, n1624, n1625, n1626,
         n1627, n1628, n1629, n1630, n1631, n1632, n1633, n1634, n1635, n1636,
         n1637, n1638, n1639, n1640, n1641, n1642, n1643, n1644, n1645, n1646,
         n1647, n1648, n1649, n1650, n1651, n1652, n1653, n1654, n1655, n1656,
         n1657, n1658, n1659, n1660, n1661, n1662, n1663, n1664, n1665, n1666,
         n1667, n1668, n1669, n1670, n1671, n1672, n1673, n1674, n1675, n1676,
         n1677, n1678, n1679, n1680, n1681, n1682, n1683, n1684, n1685, n1686,
         n1687, n1688, n1689, n1690, n1691;
  assign n1 = a[1];
  assign n7 = a[3];
  assign n13 = a[5];
  assign n19 = a[7];
  assign n25 = a[9];
  assign n31 = a[11];
  assign n37 = a[13];
  assign n43 = a[15];
  assign n50 = a[17];
  assign n55 = b[0];
  assign n608 = a[0];
  assign n932 = b[17];
  assign n933 = b[15];
  assign n934 = b[14];
  assign n935 = b[13];
  assign n936 = b[12];
  assign n937 = b[11];
  assign n938 = b[10];
  assign n939 = b[9];
  assign n940 = b[8];
  assign n941 = b[7];
  assign n942 = b[6];
  assign n943 = b[5];
  assign n944 = b[4];
  assign n945 = b[3];
  assign n946 = b[2];
  assign n947 = b[1];

  XOR2X1 U58 ( .A(n91), .B(n58), .Y(product[31]) );
  NAND2X1 U59 ( .A(n90), .B(n1548), .Y(n58) );
  NAND2X1 U62 ( .A(n331), .B(n332), .Y(n90) );
  XOR2X1 U63 ( .A(n104), .B(n59), .Y(product[30]) );
  AOI21X1 U64 ( .A(n1541), .B(n1414), .C(n93), .Y(n91) );
  AOI21X1 U68 ( .A(n1445), .B(n96), .C(n97), .Y(n95) );
  NOR2X1 U69 ( .A(n98), .B(n120), .Y(n96) );
  OAI21X1 U70 ( .A(n121), .B(n98), .C(n99), .Y(n97) );
  NAND2X1 U71 ( .A(n1547), .B(n301), .Y(n98) );
  AOI21X1 U72 ( .A(n1547), .B(n110), .C(n101), .Y(n99) );
  NAND2X1 U75 ( .A(n103), .B(n1547), .Y(n59) );
  NAND2X1 U78 ( .A(n333), .B(n336), .Y(n103) );
  XOR2X1 U79 ( .A(n113), .B(n60), .Y(product[29]) );
  AOI21X1 U80 ( .A(n1414), .B(n105), .C(n106), .Y(n104) );
  NOR2X1 U81 ( .A(n107), .B(n116), .Y(n105) );
  OAI21X1 U82 ( .A(n117), .B(n107), .C(n108), .Y(n106) );
  NAND2X1 U87 ( .A(n108), .B(n301), .Y(n60) );
  NOR2X1 U89 ( .A(n337), .B(n340), .Y(n107) );
  NAND2X1 U90 ( .A(n337), .B(n340), .Y(n108) );
  XOR2X1 U91 ( .A(n130), .B(n61), .Y(product[28]) );
  AOI21X1 U92 ( .A(n1233), .B(n114), .C(n115), .Y(n113) );
  NAND2X1 U95 ( .A(n118), .B(n1449), .Y(n116) );
  AOI21X1 U96 ( .A(n118), .B(n1445), .C(n119), .Y(n117) );
  NAND2X1 U99 ( .A(n305), .B(n122), .Y(n120) );
  AOI21X1 U100 ( .A(n122), .B(n158), .C(n123), .Y(n121) );
  NOR2X1 U101 ( .A(n146), .B(n124), .Y(n122) );
  OAI21X1 U102 ( .A(n124), .B(n149), .C(n125), .Y(n123) );
  NAND2X1 U103 ( .A(n1543), .B(n303), .Y(n124) );
  AOI21X1 U104 ( .A(n136), .B(n1543), .C(n127), .Y(n125) );
  NAND2X1 U107 ( .A(n129), .B(n1543), .Y(n61) );
  NAND2X1 U110 ( .A(n341), .B(n346), .Y(n129) );
  XOR2X1 U111 ( .A(n139), .B(n62), .Y(product[27]) );
  AOI21X1 U112 ( .A(n1477), .B(n131), .C(n132), .Y(n130) );
  NOR2X1 U113 ( .A(n133), .B(n142), .Y(n131) );
  OAI21X1 U114 ( .A(n143), .B(n133), .C(n134), .Y(n132) );
  NAND2X1 U119 ( .A(n134), .B(n303), .Y(n62) );
  NOR2X1 U121 ( .A(n347), .B(n352), .Y(n133) );
  NAND2X1 U122 ( .A(n347), .B(n352), .Y(n134) );
  XOR2X1 U123 ( .A(n150), .B(n63), .Y(product[26]) );
  AOI21X1 U124 ( .A(n140), .B(n1485), .C(n141), .Y(n139) );
  NAND2X1 U127 ( .A(n144), .B(n162), .Y(n142) );
  AOI21X1 U128 ( .A(n163), .B(n144), .C(n145), .Y(n143) );
  NOR2X1 U129 ( .A(n146), .B(n155), .Y(n144) );
  OAI21X1 U130 ( .A(n146), .B(n156), .C(n149), .Y(n145) );
  NAND2X1 U133 ( .A(n149), .B(n304), .Y(n63) );
  NOR2X1 U135 ( .A(n353), .B(n360), .Y(n146) );
  NAND2X1 U136 ( .A(n353), .B(n360), .Y(n149) );
  AOI21X1 U138 ( .A(n1477), .B(n151), .C(n152), .Y(n150) );
  NOR2X1 U139 ( .A(n1095), .B(n164), .Y(n151) );
  OAI21X1 U140 ( .A(n165), .B(n1095), .C(n156), .Y(n152) );
  NOR2X1 U149 ( .A(n361), .B(n368), .Y(n155) );
  NAND2X1 U150 ( .A(n361), .B(n368), .Y(n156) );
  XOR2X1 U151 ( .A(n174), .B(n65), .Y(product[24]) );
  AOI21X1 U152 ( .A(n1220), .B(n1449), .C(n1445), .Y(n161) );
  NOR2X1 U157 ( .A(n186), .B(n168), .Y(n162) );
  OAI21X1 U158 ( .A(n1568), .B(n187), .C(n169), .Y(n163) );
  NAND2X1 U159 ( .A(n1542), .B(n1529), .Y(n168) );
  AOI21X1 U160 ( .A(n180), .B(n1542), .C(n171), .Y(n169) );
  NAND2X1 U163 ( .A(n173), .B(n1542), .Y(n65) );
  NAND2X1 U166 ( .A(n369), .B(n378), .Y(n173) );
  AOI21X1 U168 ( .A(n175), .B(n1220), .C(n176), .Y(n174) );
  NOR2X1 U169 ( .A(n177), .B(n186), .Y(n175) );
  OAI21X1 U170 ( .A(n177), .B(n187), .C(n178), .Y(n176) );
  NAND2X1 U178 ( .A(n388), .B(n379), .Y(n178) );
  XNOR2X1 U179 ( .A(n1477), .B(n67), .Y(product[22]) );
  AOI21X1 U180 ( .A(n1485), .B(n308), .C(n1170), .Y(n183) );
  NAND2X1 U187 ( .A(n187), .B(n308), .Y(n67) );
  NOR2X1 U189 ( .A(n389), .B(n400), .Y(n186) );
  NAND2X1 U190 ( .A(n389), .B(n400), .Y(n187) );
  XOR2X1 U191 ( .A(n199), .B(n68), .Y(product[21]) );
  OAI21X1 U192 ( .A(n1459), .B(n193), .C(n194), .Y(n57) );
  NAND2X1 U193 ( .A(n207), .B(n1424), .Y(n193) );
  AOI21X1 U194 ( .A(n1424), .B(n208), .C(n196), .Y(n194) );
  OAI21X1 U196 ( .A(n1455), .B(n205), .C(n198), .Y(n196) );
  NAND2X1 U197 ( .A(n198), .B(n309), .Y(n68) );
  NOR2X1 U199 ( .A(n401), .B(n412), .Y(n197) );
  NAND2X1 U200 ( .A(n401), .B(n412), .Y(n198) );
  AOI21X1 U202 ( .A(n1197), .B(n200), .C(n201), .Y(n199) );
  NOR2X1 U203 ( .A(n1464), .B(n209), .Y(n200) );
  OAI21X1 U204 ( .A(n210), .B(n1464), .C(n205), .Y(n201) );
  NOR2X1 U209 ( .A(n426), .B(n413), .Y(n202) );
  NAND2X1 U210 ( .A(n413), .B(n426), .Y(n205) );
  XOR2X1 U211 ( .A(n215), .B(n70), .Y(product[19]) );
  AOI21X1 U212 ( .A(n220), .B(n1451), .C(n1079), .Y(n206) );
  NOR2X1 U217 ( .A(n218), .B(n1441), .Y(n207) );
  OAI21X1 U218 ( .A(n219), .B(n213), .C(n214), .Y(n208) );
  NAND2X1 U219 ( .A(n214), .B(n311), .Y(n70) );
  NOR2X1 U221 ( .A(n440), .B(n427), .Y(n213) );
  NAND2X1 U222 ( .A(n1251), .B(n427), .Y(n214) );
  AOI21X1 U224 ( .A(n1420), .B(n1117), .C(n217), .Y(n215) );
  NAND2X1 U227 ( .A(n219), .B(n312), .Y(n71) );
  NOR2X1 U229 ( .A(n456), .B(n441), .Y(n218) );
  NAND2X1 U230 ( .A(n441), .B(n456), .Y(n219) );
  AOI21X1 U233 ( .A(n230), .B(n222), .C(n223), .Y(n221) );
  NOR2X1 U234 ( .A(n227), .B(n224), .Y(n222) );
  OAI21X1 U235 ( .A(n1432), .B(n228), .C(n225), .Y(n223) );
  NOR2X1 U238 ( .A(n472), .B(n457), .Y(n224) );
  NAND2X1 U239 ( .A(n457), .B(n472), .Y(n225) );
  XOR2X1 U240 ( .A(n73), .B(n229), .Y(product[16]) );
  OAI21X1 U241 ( .A(n229), .B(n1452), .C(n1133), .Y(n226) );
  NAND2X1 U242 ( .A(n314), .B(n228), .Y(n73) );
  NOR2X1 U244 ( .A(n486), .B(n473), .Y(n227) );
  NAND2X1 U245 ( .A(n473), .B(n486), .Y(n228) );
  OAI21X1 U248 ( .A(n243), .B(n231), .C(n232), .Y(n230) );
  NAND2X1 U249 ( .A(n316), .B(n1545), .Y(n231) );
  AOI21X1 U250 ( .A(n1545), .B(n1198), .C(n234), .Y(n232) );
  NAND2X1 U256 ( .A(n500), .B(n487), .Y(n236) );
  XNOR2X1 U257 ( .A(n242), .B(n75), .Y(product[14]) );
  AOI21X1 U258 ( .A(n242), .B(n1199), .C(n1198), .Y(n237) );
  NAND2X1 U261 ( .A(n241), .B(n316), .Y(n75) );
  NOR2X1 U263 ( .A(n512), .B(n501), .Y(n240) );
  XNOR2X1 U265 ( .A(n1532), .B(n76), .Y(product[13]) );
  AOI21X1 U267 ( .A(n248), .B(n1546), .C(n1412), .Y(n243) );
  NAND2X1 U270 ( .A(n247), .B(n1546), .Y(n76) );
  XOR2X1 U274 ( .A(n255), .B(n77), .Y(product[12]) );
  OAI21X1 U275 ( .A(n261), .B(n249), .C(n250), .Y(n248) );
  NAND2X1 U276 ( .A(n1478), .B(n1370), .Y(n249) );
  AOI21X1 U277 ( .A(n1478), .B(n1366), .C(n252), .Y(n250) );
  NAND2X1 U280 ( .A(n254), .B(n1123), .Y(n77) );
  NOR2X1 U282 ( .A(n534), .B(n525), .Y(n253) );
  NAND2X1 U283 ( .A(n534), .B(n525), .Y(n254) );
  XNOR2X1 U284 ( .A(n260), .B(n78), .Y(product[11]) );
  AOI21X1 U285 ( .A(n1402), .B(n260), .C(n1366), .Y(n255) );
  NAND2X1 U288 ( .A(n259), .B(n1370), .Y(n78) );
  NOR2X1 U290 ( .A(n544), .B(n535), .Y(n258) );
  XNOR2X1 U292 ( .A(n79), .B(n1458), .Y(product[10]) );
  AOI21X1 U294 ( .A(n266), .B(n1544), .C(n263), .Y(n261) );
  NAND2X1 U297 ( .A(n265), .B(n1544), .Y(n79) );
  NAND2X1 U300 ( .A(n545), .B(n552), .Y(n265) );
  OAI21X1 U302 ( .A(n269), .B(n267), .C(n268), .Y(n266) );
  NAND2X1 U303 ( .A(n268), .B(n321), .Y(n80) );
  NOR2X1 U305 ( .A(n560), .B(n553), .Y(n267) );
  NAND2X1 U306 ( .A(n553), .B(n560), .Y(n268) );
  XNOR2X1 U307 ( .A(n81), .B(n1426), .Y(product[8]) );
  AOI21X1 U308 ( .A(n274), .B(n1550), .C(n271), .Y(n269) );
  NAND2X1 U311 ( .A(n273), .B(n1550), .Y(n81) );
  NAND2X1 U314 ( .A(n566), .B(n561), .Y(n273) );
  XOR2X1 U315 ( .A(n82), .B(n1533), .Y(product[7]) );
  OAI21X1 U316 ( .A(n277), .B(n275), .C(n276), .Y(n274) );
  NAND2X1 U317 ( .A(n276), .B(n323), .Y(n82) );
  NOR2X1 U319 ( .A(n572), .B(n567), .Y(n275) );
  NAND2X1 U320 ( .A(n572), .B(n567), .Y(n276) );
  XNOR2X1 U321 ( .A(n83), .B(n1430), .Y(product[6]) );
  AOI21X1 U322 ( .A(n282), .B(n1549), .C(n279), .Y(n277) );
  NAND2X1 U325 ( .A(n1549), .B(n281), .Y(n83) );
  NAND2X1 U328 ( .A(n576), .B(n573), .Y(n281) );
  XOR2X1 U329 ( .A(n84), .B(n285), .Y(product[5]) );
  OAI21X1 U330 ( .A(n283), .B(n285), .C(n284), .Y(n282) );
  NAND2X1 U331 ( .A(n284), .B(n325), .Y(n84) );
  NOR2X1 U333 ( .A(n580), .B(n577), .Y(n283) );
  NAND2X1 U334 ( .A(n577), .B(n580), .Y(n284) );
  XOR2X1 U335 ( .A(n85), .B(n1467), .Y(product[4]) );
  OAI21X1 U337 ( .A(n287), .B(n289), .C(n288), .Y(n286) );
  NAND2X1 U338 ( .A(n288), .B(n326), .Y(n85) );
  NOR2X1 U340 ( .A(n582), .B(n581), .Y(n287) );
  NAND2X1 U341 ( .A(n582), .B(n581), .Y(n288) );
  XNOR2X1 U342 ( .A(n86), .B(n294), .Y(product[3]) );
  AOI21X1 U343 ( .A(n294), .B(n1555), .C(n291), .Y(n289) );
  NAND2X1 U346 ( .A(n293), .B(n1555), .Y(n86) );
  NAND2X1 U349 ( .A(n617), .B(n583), .Y(n293) );
  XOR2X1 U350 ( .A(n87), .B(n298), .Y(product[2]) );
  OAI21X1 U351 ( .A(n295), .B(n298), .C(n296), .Y(n294) );
  NAND2X1 U352 ( .A(n296), .B(n328), .Y(n87) );
  NOR2X1 U354 ( .A(n769), .B(n753), .Y(n295) );
  NAND2X1 U355 ( .A(n769), .B(n753), .Y(n296) );
  NAND2X1 U357 ( .A(n298), .B(n1556), .Y(n88) );
  NAND2X1 U360 ( .A(n770), .B(n618), .Y(n298) );
  XOR2X1 U361 ( .A(n334), .B(n330), .Y(n331) );
  FAX1 U363 ( .A(n335), .B(n633), .C(n338), .YC(n332), .YS(n333) );
  FAX1 U365 ( .A(n634), .B(n342), .C(n339), .YC(n336), .YS(n337) );
  FAX1 U366 ( .A(n344), .B(n620), .C(n650), .YC(n338), .YS(n339) );
  FAX1 U367 ( .A(n350), .B(n343), .C(n348), .YC(n340), .YS(n341) );
  FAX1 U368 ( .A(n635), .B(n345), .C(n651), .YC(n342), .YS(n343) );
  FAX1 U370 ( .A(n356), .B(n349), .C(n354), .YC(n346), .YS(n347) );
  FAX1 U371 ( .A(n664), .B(n652), .C(n351), .YC(n348), .YS(n349) );
  FAX1 U372 ( .A(n1093), .B(n621), .C(n636), .YC(n350), .YS(n351) );
  FAX1 U373 ( .A(n364), .B(n355), .C(n362), .YC(n352), .YS(n353) );
  FAX1 U374 ( .A(n665), .B(n366), .C(n357), .YC(n354), .YS(n355) );
  FAX1 U375 ( .A(n653), .B(n637), .C(n359), .YC(n356), .YS(n357) );
  FAX1 U377 ( .A(n372), .B(n363), .C(n370), .YC(n360), .YS(n361) );
  FAX1 U378 ( .A(n367), .B(n374), .C(n365), .YC(n362), .YS(n363) );
  FAX1 U379 ( .A(n638), .B(n682), .C(n666), .YC(n364), .YS(n365) );
  FAX1 U380 ( .A(n376), .B(n654), .C(n622), .YC(n366), .YS(n367) );
  FAX1 U381 ( .A(n382), .B(n371), .C(n380), .YC(n368), .YS(n369) );
  FAX1 U384 ( .A(n623), .B(n667), .C(n639), .YC(n374), .YS(n375) );
  FAX1 U386 ( .A(n1065), .B(n390), .C(n381), .YC(n378), .YS(n379) );
  FAX1 U388 ( .A(n684), .B(n387), .C(n396), .YC(n382), .YS(n383) );
  FAX1 U389 ( .A(n624), .B(n640), .C(n700), .YC(n384), .YS(n385) );
  FAX1 U391 ( .A(n393), .B(n391), .C(n402), .YC(n388), .YS(n389) );
  FAX1 U394 ( .A(n685), .B(n399), .C(n701), .YC(n394), .YS(n395) );
  FAX1 U401 ( .A(n626), .B(n686), .C(n642), .YC(n408), .YS(n409) );
  FAX1 U402 ( .A(n1270), .B(n656), .C(n670), .YC(n410), .YS(n411) );
  FAX1 U405 ( .A(n423), .B(n421), .C(n434), .YC(n416), .YS(n417) );
  FAX1 U406 ( .A(n719), .B(n436), .C(n438), .YC(n418), .YS(n419) );
  FAX1 U407 ( .A(n687), .B(n703), .C(n425), .YC(n420), .YS(n421) );
  FAX1 U408 ( .A(n643), .B(n671), .C(n627), .YC(n422), .YS(n423) );
  FAX1 U413 ( .A(n437), .B(n452), .C(n439), .YC(n432), .YS(n433) );
  FAX1 U414 ( .A(n720), .B(n736), .C(n688), .YC(n434), .YS(n435) );
  FAX1 U416 ( .A(n657), .B(n672), .C(n454), .YC(n438), .YS(n439) );
  FAX1 U419 ( .A(n1181), .B(n449), .C(n464), .YC(n444), .YS(n445) );
  FAX1 U422 ( .A(n705), .B(n721), .C(n455), .YC(n450), .YS(n451) );
  FAX1 U429 ( .A(n754), .B(n738), .C(n471), .YC(n464), .YS(n465) );
  FAX1 U430 ( .A(n706), .B(n674), .C(n690), .YC(n466), .YS(n467) );
  XNOR2X1 U432 ( .A(n658), .B(n722), .Y(n471) );
  OR2X2 U433 ( .A(n658), .B(n722), .Y(n470) );
  FAX1 U438 ( .A(n498), .B(n739), .C(n691), .YC(n480), .YS(n481) );
  FAX1 U439 ( .A(n631), .B(n707), .C(n647), .YC(n482), .YS(n483) );
  FAX1 U448 ( .A(n514), .B(n505), .C(n503), .YC(n500), .YS(n501) );
  FAX1 U457 ( .A(n612), .B(n710), .C(n694), .YC(n518), .YS(n519) );
  FAX1 U458 ( .A(n758), .B(n662), .C(n678), .YC(n520), .YS(n521) );
  HAX1 U459 ( .A(n742), .B(n726), .YC(n522), .YS(n523) );
  FAX1 U475 ( .A(n614), .B(n559), .C(n564), .YC(n554), .YS(n555) );
  FAX1 U476 ( .A(n714), .B(n730), .C(n698), .YC(n556), .YS(n557) );
  HAX1 U477 ( .A(n762), .B(n746), .YC(n558), .YS(n559) );
  FAX1 U480 ( .A(n763), .B(n747), .C(n731), .YC(n564), .YS(n565) );
  HAX1 U483 ( .A(n748), .B(n764), .YC(n570), .YS(n571) );
  FAX1 U486 ( .A(n734), .B(n616), .C(n579), .YC(n576), .YS(n577) );
  HAX1 U487 ( .A(n766), .B(n750), .YC(n578), .YS(n579) );
  FAX1 U488 ( .A(n767), .B(n751), .C(n735), .YC(n580), .YS(n581) );
  XNOR2X1 U508 ( .A(n1416), .B(n50), .Y(n771) );
  XNOR2X1 U509 ( .A(n1670), .B(n50), .Y(n772) );
  XNOR2X1 U510 ( .A(n1668), .B(n50), .Y(n773) );
  XNOR2X1 U511 ( .A(n50), .B(n1666), .Y(n774) );
  XNOR2X1 U512 ( .A(n50), .B(n1664), .Y(n775) );
  XNOR2X1 U513 ( .A(n1439), .B(n50), .Y(n776) );
  XNOR2X1 U514 ( .A(n50), .B(n1403), .Y(n777) );
  XNOR2X1 U515 ( .A(n50), .B(n1656), .Y(n778) );
  XNOR2X1 U516 ( .A(n50), .B(n1654), .Y(n779) );
  XNOR2X1 U517 ( .A(n50), .B(n1652), .Y(n780) );
  XNOR2X1 U518 ( .A(n50), .B(n1460), .Y(n781) );
  XNOR2X1 U519 ( .A(n50), .B(n1367), .Y(n782) );
  XNOR2X1 U521 ( .A(n50), .B(n1642), .Y(n784) );
  OR2X1 U524 ( .A(n1690), .B(n976), .Y(n787) );
  OAI22X1 U526 ( .A(n805), .B(n1454), .C(n1173), .D(n1633), .Y(n611) );
  OAI22X1 U529 ( .A(n1631), .B(n788), .C(n1632), .D(n789), .Y(n633) );
  OAI22X1 U530 ( .A(n790), .B(n1632), .C(n1631), .D(n789), .Y(n634) );
  OAI22X1 U531 ( .A(n1454), .B(n790), .C(n791), .D(n1632), .Y(n635) );
  OAI22X1 U532 ( .A(n791), .B(n1631), .C(n792), .D(n1632), .Y(n636) );
  OAI22X1 U533 ( .A(n792), .B(n1454), .C(n793), .D(n1632), .Y(n637) );
  OAI22X1 U534 ( .A(n793), .B(n1631), .C(n794), .D(n1632), .Y(n638) );
  OAI22X1 U535 ( .A(n794), .B(n1454), .C(n795), .D(n1632), .Y(n639) );
  OAI22X1 U536 ( .A(n795), .B(n1631), .C(n796), .D(n1632), .Y(n640) );
  OAI22X1 U537 ( .A(n796), .B(n1454), .C(n797), .D(n1632), .Y(n641) );
  OAI22X1 U538 ( .A(n797), .B(n1631), .C(n798), .D(n1632), .Y(n642) );
  OAI22X1 U539 ( .A(n798), .B(n1454), .C(n799), .D(n1633), .Y(n643) );
  OAI22X1 U540 ( .A(n799), .B(n1631), .C(n800), .D(n1632), .Y(n644) );
  OAI22X1 U541 ( .A(n800), .B(n1454), .C(n801), .D(n1633), .Y(n645) );
  OAI22X1 U542 ( .A(n801), .B(n1631), .C(n802), .D(n1633), .Y(n646) );
  OAI22X1 U543 ( .A(n802), .B(n1454), .C(n803), .D(n1633), .Y(n647) );
  OAI22X1 U544 ( .A(n803), .B(n1631), .C(n804), .D(n1632), .Y(n648) );
  AND2X1 U545 ( .A(n1690), .B(n1389), .Y(n649) );
  XNOR2X1 U547 ( .A(n1587), .B(n1688), .Y(n788) );
  XNOR2X1 U548 ( .A(n1592), .B(n1688), .Y(n789) );
  XNOR2X1 U549 ( .A(n1671), .B(n1688), .Y(n790) );
  XNOR2X1 U550 ( .A(n1668), .B(n1688), .Y(n791) );
  XNOR2X1 U551 ( .A(n1688), .B(n1666), .Y(n792) );
  XNOR2X1 U552 ( .A(n1688), .B(n1664), .Y(n793) );
  XNOR2X1 U553 ( .A(n1688), .B(n1399), .Y(n794) );
  XNOR2X1 U554 ( .A(n1688), .B(n1658), .Y(n795) );
  XNOR2X1 U555 ( .A(n1688), .B(n1656), .Y(n796) );
  XNOR2X1 U556 ( .A(n1688), .B(n1654), .Y(n797) );
  XNOR2X1 U557 ( .A(n1688), .B(n1652), .Y(n798) );
  XNOR2X1 U558 ( .A(n1688), .B(n1649), .Y(n799) );
  XNOR2X1 U560 ( .A(n1688), .B(n1055), .Y(n801) );
  XNOR2X1 U561 ( .A(n1688), .B(n1643), .Y(n802) );
  XNOR2X1 U562 ( .A(n1688), .B(n1640), .Y(n803) );
  XNOR2X1 U563 ( .A(n1688), .B(n1689), .Y(n804) );
  OAI22X1 U566 ( .A(n1628), .B(n823), .C(n978), .D(n1629), .Y(n612) );
  OAI22X1 U569 ( .A(n1371), .B(n806), .C(n1408), .D(n807), .Y(n651) );
  OAI22X1 U570 ( .A(n1071), .B(n808), .C(n1371), .D(n807), .Y(n652) );
  OAI22X1 U571 ( .A(n809), .B(n1408), .C(n1371), .D(n808), .Y(n653) );
  OAI22X1 U572 ( .A(n1371), .B(n809), .C(n810), .D(n1408), .Y(n654) );
  OAI22X1 U573 ( .A(n810), .B(n1371), .C(n811), .D(n1415), .Y(n376) );
  OAI22X1 U574 ( .A(n811), .B(n1371), .C(n812), .D(n1415), .Y(n655) );
  OAI22X1 U575 ( .A(n1371), .B(n812), .C(n813), .D(n1415), .Y(n398) );
  OAI22X1 U576 ( .A(n813), .B(n1628), .C(n814), .D(n1629), .Y(n656) );
  OAI22X1 U578 ( .A(n815), .B(n1628), .C(n816), .D(n1629), .Y(n657) );
  OAI22X1 U579 ( .A(n816), .B(n1628), .C(n1630), .D(n817), .Y(n454) );
  OAI22X1 U580 ( .A(n817), .B(n1628), .C(n818), .D(n1629), .Y(n658) );
  OAI22X1 U581 ( .A(n818), .B(n1628), .C(n819), .D(n1630), .Y(n659) );
  OAI22X1 U582 ( .A(n1144), .B(n1628), .C(n820), .D(n1629), .Y(n660) );
  OAI22X1 U584 ( .A(n821), .B(n1628), .C(n822), .D(n1629), .Y(n662) );
  XNOR2X1 U587 ( .A(n1587), .B(n1535), .Y(n806) );
  XNOR2X1 U588 ( .A(n1416), .B(n1602), .Y(n807) );
  XNOR2X1 U589 ( .A(n1670), .B(n1134), .Y(n808) );
  XNOR2X1 U590 ( .A(n1668), .B(n1602), .Y(n809) );
  XNOR2X1 U591 ( .A(n1602), .B(n1666), .Y(n810) );
  XNOR2X1 U592 ( .A(n1536), .B(n1664), .Y(n811) );
  XNOR2X1 U593 ( .A(n1602), .B(n1399), .Y(n812) );
  XNOR2X1 U594 ( .A(n1536), .B(n1404), .Y(n813) );
  XNOR2X1 U595 ( .A(n1534), .B(n1656), .Y(n814) );
  XNOR2X1 U599 ( .A(n1536), .B(n1368), .Y(n818) );
  XNOR2X1 U601 ( .A(n1136), .B(n1642), .Y(n820) );
  XNOR2X1 U602 ( .A(n1536), .B(n1639), .Y(n821) );
  XNOR2X1 U603 ( .A(n1535), .B(n1689), .Y(n822) );
  OR2X1 U604 ( .A(n1690), .B(n978), .Y(n823) );
  OAI22X1 U606 ( .A(n841), .B(n1625), .C(n979), .D(n1383), .Y(n613) );
  OAI22X1 U609 ( .A(n1125), .B(n824), .C(n1391), .D(n825), .Y(n665) );
  OAI22X1 U610 ( .A(n1391), .B(n826), .C(n1440), .D(n825), .Y(n666) );
  OAI22X1 U611 ( .A(n827), .B(n1383), .C(n1440), .D(n826), .Y(n667) );
  OAI22X1 U612 ( .A(n1440), .B(n827), .C(n828), .D(n1391), .Y(n668) );
  OAI22X1 U614 ( .A(n829), .B(n1625), .C(n830), .D(n1383), .Y(n670) );
  OAI22X1 U615 ( .A(n830), .B(n1625), .C(n831), .D(n1383), .Y(n671) );
  OAI22X1 U616 ( .A(n831), .B(n1625), .C(n832), .D(n1530), .Y(n672) );
  OAI22X1 U617 ( .A(n832), .B(n1625), .C(n833), .D(n1383), .Y(n673) );
  OAI22X1 U618 ( .A(n833), .B(n1625), .C(n834), .D(n1530), .Y(n674) );
  OAI22X1 U620 ( .A(n835), .B(n1625), .C(n836), .D(n1383), .Y(n676) );
  OAI22X1 U621 ( .A(n836), .B(n1625), .C(n1530), .D(n837), .Y(n677) );
  OAI22X1 U622 ( .A(n837), .B(n1625), .C(n1530), .D(n838), .Y(n678) );
  OAI22X1 U623 ( .A(n838), .B(n1625), .C(n1284), .D(n1383), .Y(n679) );
  OAI22X1 U624 ( .A(n1284), .B(n1625), .C(n840), .D(n1530), .Y(n680) );
  XNOR2X1 U627 ( .A(n1587), .B(n1447), .Y(n824) );
  XNOR2X1 U628 ( .A(n1592), .B(n1447), .Y(n825) );
  XNOR2X1 U629 ( .A(n1671), .B(n1447), .Y(n826) );
  XNOR2X1 U630 ( .A(n1668), .B(n1447), .Y(n827) );
  XNOR2X1 U631 ( .A(n1447), .B(n1666), .Y(n828) );
  XNOR2X1 U632 ( .A(n1447), .B(n1664), .Y(n829) );
  XNOR2X1 U633 ( .A(n1439), .B(n1447), .Y(n830) );
  XNOR2X1 U634 ( .A(n1463), .B(n1403), .Y(n831) );
  XNOR2X1 U635 ( .A(n1463), .B(n1656), .Y(n832) );
  XNOR2X1 U636 ( .A(n1463), .B(n1654), .Y(n833) );
  XNOR2X1 U637 ( .A(n1463), .B(n1652), .Y(n834) );
  XNOR2X1 U638 ( .A(n1463), .B(n1460), .Y(n835) );
  XNOR2X1 U639 ( .A(n1463), .B(n1368), .Y(n836) );
  XNOR2X1 U640 ( .A(n1463), .B(n1055), .Y(n837) );
  XNOR2X1 U641 ( .A(n1463), .B(n1643), .Y(n838) );
  XNOR2X1 U643 ( .A(n1463), .B(n1689), .Y(n840) );
  OR2X1 U644 ( .A(n1689), .B(n979), .Y(n841) );
  OAI22X1 U646 ( .A(n859), .B(n1620), .C(n980), .D(n1622), .Y(n614) );
  OAI22X1 U649 ( .A(n1397), .B(n842), .C(n1166), .D(n843), .Y(n683) );
  OAI22X1 U650 ( .A(n1623), .B(n844), .C(n1397), .D(n843), .Y(n684) );
  OAI22X1 U651 ( .A(n845), .B(n1623), .C(n1397), .D(n844), .Y(n685) );
  OAI22X1 U652 ( .A(n845), .B(n1620), .C(n846), .D(n1623), .Y(n686) );
  OAI22X1 U653 ( .A(n846), .B(n1620), .C(n847), .D(n1622), .Y(n687) );
  OAI22X1 U654 ( .A(n847), .B(n1620), .C(n848), .D(n1623), .Y(n688) );
  OAI22X1 U655 ( .A(n848), .B(n1620), .C(n849), .D(n1622), .Y(n689) );
  OAI22X1 U656 ( .A(n849), .B(n1620), .C(n850), .D(n1622), .Y(n690) );
  OAI22X1 U657 ( .A(n850), .B(n1620), .C(n851), .D(n1623), .Y(n691) );
  OAI22X1 U658 ( .A(n851), .B(n1456), .C(n852), .D(n1622), .Y(n692) );
  OAI22X1 U659 ( .A(n852), .B(n1620), .C(n853), .D(n1623), .Y(n693) );
  OAI22X1 U660 ( .A(n853), .B(n1620), .C(n854), .D(n1622), .Y(n694) );
  OAI22X1 U661 ( .A(n854), .B(n1620), .C(n855), .D(n1623), .Y(n695) );
  OAI22X1 U662 ( .A(n855), .B(n1456), .C(n856), .D(n1622), .Y(n696) );
  OAI22X1 U663 ( .A(n856), .B(n1620), .C(n1210), .D(n857), .Y(n697) );
  OAI22X1 U664 ( .A(n857), .B(n1620), .C(n858), .D(n1622), .Y(n698) );
  XNOR2X1 U667 ( .A(n1587), .B(n1438), .Y(n842) );
  XNOR2X1 U668 ( .A(n1416), .B(n1080), .Y(n843) );
  XNOR2X1 U669 ( .A(n1670), .B(n1438), .Y(n844) );
  XNOR2X1 U670 ( .A(n1668), .B(n1428), .Y(n845) );
  XNOR2X1 U671 ( .A(n1080), .B(n1666), .Y(n846) );
  XNOR2X1 U672 ( .A(n1684), .B(n1178), .Y(n847) );
  XNOR2X1 U673 ( .A(n1428), .B(n1661), .Y(n848) );
  XNOR2X1 U674 ( .A(n1428), .B(n1658), .Y(n849) );
  XNOR2X1 U675 ( .A(n1684), .B(n1656), .Y(n850) );
  XNOR2X1 U676 ( .A(n1428), .B(n1654), .Y(n851) );
  XNOR2X1 U677 ( .A(n1438), .B(n1652), .Y(n852) );
  XNOR2X1 U678 ( .A(n1428), .B(n1649), .Y(n853) );
  XNOR2X1 U679 ( .A(n1428), .B(n1368), .Y(n854) );
  XNOR2X1 U680 ( .A(n1428), .B(n1645), .Y(n855) );
  XNOR2X1 U682 ( .A(n1428), .B(n1639), .Y(n857) );
  XNOR2X1 U683 ( .A(n1438), .B(n1689), .Y(n858) );
  OR2X1 U684 ( .A(n1689), .B(n980), .Y(n859) );
  OAI22X1 U686 ( .A(n1365), .B(n877), .C(n981), .D(n1059), .Y(n615) );
  OAI22X1 U689 ( .A(n1618), .B(n860), .C(n1381), .D(n861), .Y(n701) );
  OAI22X1 U690 ( .A(n1380), .B(n862), .C(n1618), .D(n861), .Y(n702) );
  OAI22X1 U691 ( .A(n1182), .B(n1380), .C(n1365), .D(n862), .Y(n703) );
  OAI22X1 U692 ( .A(n1364), .B(n863), .C(n864), .D(n1394), .Y(n704) );
  OAI22X1 U693 ( .A(n1618), .B(n864), .C(n865), .D(n1282), .Y(n705) );
  OAI22X1 U694 ( .A(n1365), .B(n865), .C(n866), .D(n1282), .Y(n706) );
  OAI22X1 U695 ( .A(n1619), .B(n866), .C(n1380), .D(n867), .Y(n707) );
  OAI22X1 U696 ( .A(n1365), .B(n867), .C(n868), .D(n1381), .Y(n708) );
  OAI22X1 U697 ( .A(n1365), .B(n868), .C(n869), .D(n1381), .Y(n709) );
  OAI22X1 U698 ( .A(n1618), .B(n869), .C(n870), .D(n1059), .Y(n710) );
  OAI22X1 U699 ( .A(n1365), .B(n870), .C(n871), .D(n1395), .Y(n711) );
  OAI22X1 U700 ( .A(n1618), .B(n871), .C(n872), .D(n1381), .Y(n712) );
  OAI22X1 U701 ( .A(n1365), .B(n872), .C(n873), .D(n1282), .Y(n713) );
  OAI22X1 U702 ( .A(n1619), .B(n873), .C(n874), .D(n1394), .Y(n714) );
  OAI22X1 U703 ( .A(n1364), .B(n874), .C(n875), .D(n1059), .Y(n715) );
  OAI22X1 U704 ( .A(n1619), .B(n875), .C(n876), .D(n1395), .Y(n716) );
  AND2X1 U705 ( .A(n1690), .B(n1617), .Y(n717) );
  XNOR2X1 U707 ( .A(n1587), .B(n1437), .Y(n860) );
  XNOR2X1 U708 ( .A(n1588), .B(n1437), .Y(n861) );
  XNOR2X1 U709 ( .A(n1671), .B(n1682), .Y(n862) );
  XNOR2X1 U710 ( .A(n1286), .B(n1682), .Y(n863) );
  XNOR2X1 U711 ( .A(n1407), .B(n1666), .Y(n864) );
  XNOR2X1 U712 ( .A(n1682), .B(n1178), .Y(n865) );
  XNOR2X1 U713 ( .A(n1661), .B(n1682), .Y(n866) );
  XNOR2X1 U714 ( .A(n1407), .B(n1404), .Y(n867) );
  XNOR2X1 U715 ( .A(n1682), .B(n1656), .Y(n868) );
  XNOR2X1 U716 ( .A(n1682), .B(n1654), .Y(n869) );
  XNOR2X1 U717 ( .A(n1682), .B(n1652), .Y(n870) );
  XNOR2X1 U718 ( .A(n1407), .B(n1460), .Y(n871) );
  XNOR2X1 U719 ( .A(n1407), .B(n1367), .Y(n872) );
  XNOR2X1 U720 ( .A(n1682), .B(n1055), .Y(n873) );
  XNOR2X1 U721 ( .A(n1682), .B(n1643), .Y(n874) );
  XNOR2X1 U722 ( .A(n1407), .B(n1640), .Y(n875) );
  XNOR2X1 U723 ( .A(n1437), .B(n1689), .Y(n876) );
  OR2X1 U724 ( .A(n1689), .B(n981), .Y(n877) );
  OAI22X1 U726 ( .A(n1436), .B(n895), .C(n1222), .D(n1484), .Y(n616) );
  OAI22X1 U729 ( .A(n1401), .B(n878), .C(n1060), .D(n879), .Y(n719) );
  OAI22X1 U730 ( .A(n1616), .B(n880), .C(n1436), .D(n879), .Y(n720) );
  OAI22X1 U731 ( .A(n1175), .B(n1585), .C(n1401), .D(n880), .Y(n721) );
  OAI22X1 U732 ( .A(n882), .B(n1175), .C(n1436), .D(n1585), .Y(n722) );
  OAI22X1 U733 ( .A(n1436), .B(n882), .C(n883), .D(n1615), .Y(n723) );
  OAI22X1 U734 ( .A(n1382), .B(n883), .C(n1616), .D(n884), .Y(n724) );
  OAI22X1 U735 ( .A(n1436), .B(n884), .C(n885), .D(n1615), .Y(n725) );
  OAI22X1 U736 ( .A(n1382), .B(n885), .C(n886), .D(n1615), .Y(n726) );
  OAI22X1 U737 ( .A(n886), .B(n1382), .C(n887), .D(n1616), .Y(n727) );
  OAI22X1 U738 ( .A(n1436), .B(n887), .C(n888), .D(n1175), .Y(n728) );
  OAI22X1 U739 ( .A(n1382), .B(n888), .C(n889), .D(n1616), .Y(n729) );
  OAI22X1 U740 ( .A(n1436), .B(n889), .C(n890), .D(n1175), .Y(n730) );
  OAI22X1 U741 ( .A(n1382), .B(n890), .C(n891), .D(n1616), .Y(n731) );
  OAI22X1 U742 ( .A(n891), .B(n1436), .C(n892), .D(n1175), .Y(n732) );
  OAI22X1 U744 ( .A(n1436), .B(n893), .C(n894), .D(n1175), .Y(n734) );
  AND2X1 U745 ( .A(n1690), .B(n1577), .Y(n735) );
  XNOR2X1 U747 ( .A(n1587), .B(n1679), .Y(n878) );
  XNOR2X1 U751 ( .A(n1679), .B(n1666), .Y(n882) );
  XNOR2X1 U752 ( .A(n1678), .B(n1178), .Y(n883) );
  XNOR2X1 U753 ( .A(n1662), .B(n1679), .Y(n884) );
  XNOR2X1 U754 ( .A(n1679), .B(n1659), .Y(n885) );
  XNOR2X1 U756 ( .A(n1679), .B(n1654), .Y(n887) );
  XNOR2X1 U757 ( .A(n1678), .B(n1465), .Y(n888) );
  XNOR2X1 U758 ( .A(n1679), .B(n1649), .Y(n889) );
  XNOR2X1 U759 ( .A(n1678), .B(n1367), .Y(n890) );
  XNOR2X1 U760 ( .A(n1679), .B(n1645), .Y(n891) );
  XNOR2X1 U761 ( .A(n1678), .B(n1642), .Y(n892) );
  XNOR2X1 U763 ( .A(n1678), .B(n1689), .Y(n894) );
  OR2X1 U764 ( .A(n1689), .B(n1222), .Y(n895) );
  OAI22X1 U766 ( .A(n1067), .B(n913), .C(n983), .D(n1376), .Y(n617) );
  OAI22X1 U769 ( .A(n896), .B(n1537), .C(n1614), .D(n897), .Y(n737) );
  OAI22X1 U770 ( .A(n898), .B(n1614), .C(n897), .D(n1537), .Y(n738) );
  OAI22X1 U771 ( .A(n1614), .B(n1497), .C(n1067), .D(n898), .Y(n739) );
  OAI22X1 U772 ( .A(n1614), .B(n900), .C(n1537), .D(n899), .Y(n740) );
  OAI22X1 U773 ( .A(n1376), .B(n901), .C(n1067), .D(n900), .Y(n741) );
  OAI22X1 U774 ( .A(n1067), .B(n901), .C(n1081), .D(n1442), .Y(n742) );
  OAI22X1 U775 ( .A(n903), .B(n1265), .C(n902), .D(n1067), .Y(n743) );
  OAI22X1 U776 ( .A(n1081), .B(n904), .C(n1537), .D(n903), .Y(n744) );
  OAI22X1 U777 ( .A(n905), .B(n1265), .C(n1612), .D(n904), .Y(n745) );
  OAI22X1 U778 ( .A(n1612), .B(n905), .C(n1265), .D(n906), .Y(n746) );
  OAI22X1 U779 ( .A(n907), .B(n1265), .C(n1537), .D(n906), .Y(n747) );
  OAI22X1 U780 ( .A(n907), .B(n1537), .C(n1613), .D(n908), .Y(n748) );
  OAI22X1 U781 ( .A(n908), .B(n1537), .C(n909), .D(n1613), .Y(n749) );
  OAI22X1 U782 ( .A(n909), .B(n1538), .C(n910), .D(n1613), .Y(n750) );
  OAI22X1 U783 ( .A(n910), .B(n1612), .C(n911), .D(n1613), .Y(n751) );
  OAI22X1 U784 ( .A(n911), .B(n1537), .C(n912), .D(n1614), .Y(n752) );
  AND2X1 U785 ( .A(n1690), .B(n605), .Y(n753) );
  XNOR2X1 U787 ( .A(n1586), .B(n1466), .Y(n896) );
  XNOR2X1 U790 ( .A(n1286), .B(n1434), .Y(n899) );
  XNOR2X1 U791 ( .A(n1666), .B(n1466), .Y(n900) );
  XNOR2X1 U792 ( .A(n1405), .B(n1434), .Y(n901) );
  XNOR2X1 U794 ( .A(n1659), .B(n1434), .Y(n903) );
  XNOR2X1 U796 ( .A(n1434), .B(n1654), .Y(n905) );
  XNOR2X1 U798 ( .A(n1650), .B(n1676), .Y(n907) );
  XNOR2X1 U799 ( .A(n1434), .B(n1367), .Y(n908) );
  XNOR2X1 U800 ( .A(n1419), .B(n1646), .Y(n909) );
  XNOR2X1 U801 ( .A(n1676), .B(n1643), .Y(n910) );
  XNOR2X1 U802 ( .A(n1419), .B(n1640), .Y(n911) );
  XNOR2X1 U803 ( .A(n1676), .B(n1689), .Y(n912) );
  OR2X1 U804 ( .A(n1689), .B(n983), .Y(n913) );
  OAI22X1 U806 ( .A(n1610), .B(n931), .C(n984), .D(n1611), .Y(n618) );
  OAI22X1 U809 ( .A(n1610), .B(n914), .C(n1611), .D(n915), .Y(n755) );
  OAI22X1 U810 ( .A(n1611), .B(n1413), .C(n1610), .D(n915), .Y(n756) );
  OAI22X1 U811 ( .A(n1611), .B(n917), .C(n916), .D(n1610), .Y(n757) );
  OAI22X1 U812 ( .A(n1611), .B(n918), .C(n1610), .D(n917), .Y(n758) );
  OAI22X1 U813 ( .A(n919), .B(n1611), .C(n918), .D(n1610), .Y(n759) );
  OAI22X1 U814 ( .A(n1610), .B(n919), .C(n1611), .D(n920), .Y(n760) );
  OAI22X1 U816 ( .A(n1611), .B(n922), .C(n1610), .D(n921), .Y(n762) );
  OAI22X1 U817 ( .A(n1611), .B(n923), .C(n1610), .D(n922), .Y(n763) );
  OAI22X1 U818 ( .A(n1610), .B(n923), .C(n1611), .D(n924), .Y(n764) );
  OAI22X1 U819 ( .A(n1611), .B(n925), .C(n1610), .D(n1169), .Y(n765) );
  OAI22X1 U820 ( .A(n926), .B(n1611), .C(n1610), .D(n925), .Y(n766) );
  OAI22X1 U821 ( .A(n1611), .B(n927), .C(n1069), .D(n1610), .Y(n767) );
  OAI22X1 U822 ( .A(n928), .B(n1611), .C(n1610), .D(n927), .Y(n768) );
  OAI22X1 U823 ( .A(n1610), .B(n928), .C(n929), .D(n1611), .Y(n769) );
  OAI22X1 U824 ( .A(n1610), .B(n929), .C(n930), .D(n1611), .Y(n770) );
  AND2X1 U825 ( .A(n1690), .B(n608), .Y(product[0]) );
  XNOR2X1 U828 ( .A(n1416), .B(n1462), .Y(n915) );
  XNOR2X1 U830 ( .A(n1286), .B(n1462), .Y(n917) );
  XNOR2X1 U831 ( .A(n1666), .B(n1462), .Y(n918) );
  XNOR2X1 U832 ( .A(n1405), .B(n1372), .Y(n919) );
  XNOR2X1 U836 ( .A(n1654), .B(n1372), .Y(n923) );
  XNOR2X1 U837 ( .A(n1465), .B(n1674), .Y(n924) );
  XNOR2X1 U838 ( .A(n1650), .B(n1462), .Y(n925) );
  XNOR2X1 U839 ( .A(n1367), .B(n1674), .Y(n926) );
  XNOR2X1 U840 ( .A(n1645), .B(n1462), .Y(n927) );
  XNOR2X1 U841 ( .A(n1642), .B(n1462), .Y(n928) );
  XNOR2X1 U842 ( .A(n1462), .B(n1639), .Y(n929) );
  XNOR2X1 U843 ( .A(n1674), .B(n1689), .Y(n930) );
  OR2X1 U844 ( .A(n1689), .B(n984), .Y(n931) );
  NAND2X1 U881 ( .A(n952), .B(n34), .Y(n36) );
  XOR2X1 U882 ( .A(a[10]), .B(n31), .Y(n952) );
  XOR2X1 U894 ( .A(a[2]), .B(n1676), .Y(n956) );
  XOR2X1 U897 ( .A(n1674), .B(n608), .Y(n957) );
  INVX4 U901 ( .A(n1145), .Y(n1055) );
  INVX4 U902 ( .A(n1645), .Y(n1145) );
  INVX1 U903 ( .A(n1644), .Y(n1646) );
  BUFX4 U904 ( .A(n1634), .Y(n1238) );
  INVX1 U905 ( .A(n1625), .Y(n1056) );
  BUFX2 U906 ( .A(n522), .Y(n1057) );
  NAND3X1 U907 ( .A(n1216), .B(n1217), .C(n1218), .Y(n1058) );
  NAND2X1 U908 ( .A(n1619), .B(n954), .Y(n1059) );
  BUFX2 U909 ( .A(n1484), .Y(n1060) );
  BUFX2 U910 ( .A(n1616), .Y(n1484) );
  BUFX2 U911 ( .A(n1515), .Y(n1061) );
  INVX1 U912 ( .A(n1613), .Y(n1375) );
  INVX2 U913 ( .A(n415), .Y(n1062) );
  INVX2 U914 ( .A(n1062), .Y(n1063) );
  BUFX2 U915 ( .A(n491), .Y(n1064) );
  BUFX4 U916 ( .A(n383), .Y(n1065) );
  BUFX2 U917 ( .A(n404), .Y(n1066) );
  BUFX4 U918 ( .A(n1538), .Y(n1067) );
  BUFX2 U919 ( .A(n574), .Y(n1068) );
  XNOR2X1 U920 ( .A(n1367), .B(n1674), .Y(n1069) );
  NAND3X1 U921 ( .A(n1322), .B(n1323), .C(n1324), .Y(n1070) );
  BUFX2 U922 ( .A(n1141), .Y(n1071) );
  BUFX2 U923 ( .A(n1514), .Y(n1072) );
  NAND3X1 U924 ( .A(n1470), .B(n1471), .C(n1472), .Y(n1073) );
  OAI22X1 U925 ( .A(n1371), .B(n812), .C(n813), .D(n1415), .Y(n1074) );
  XOR2X1 U926 ( .A(n1075), .B(n1076), .Y(n517) );
  XNOR2X1 U927 ( .A(n523), .B(n532), .Y(n1075) );
  INVX1 U928 ( .A(n521), .Y(n1076) );
  NAND3X1 U929 ( .A(n1473), .B(n1474), .C(n1475), .Y(n1077) );
  INVX2 U930 ( .A(n1270), .Y(n425) );
  INVX1 U931 ( .A(n1090), .Y(n1078) );
  INVX2 U932 ( .A(n489), .Y(n1090) );
  INVX2 U933 ( .A(n210), .Y(n1079) );
  INVX2 U934 ( .A(n208), .Y(n210) );
  INVX2 U935 ( .A(n980), .Y(n1080) );
  INVX1 U936 ( .A(n1553), .Y(n1081) );
  NOR2X1 U937 ( .A(n426), .B(n413), .Y(n1082) );
  BUFX2 U938 ( .A(n549), .Y(n1083) );
  INVX1 U939 ( .A(n417), .Y(n1084) );
  INVX1 U940 ( .A(n1084), .Y(n1085) );
  NAND3X1 U941 ( .A(n1228), .B(n1229), .C(n1230), .Y(n1086) );
  XOR2X1 U942 ( .A(n1087), .B(n463), .Y(n459) );
  XOR2X1 U943 ( .A(n476), .B(n478), .Y(n1087) );
  NAND3X1 U944 ( .A(n1518), .B(n1519), .C(n1517), .Y(n1088) );
  NAND3X1 U945 ( .A(n1603), .B(n1604), .C(n1605), .Y(n1089) );
  INVX1 U946 ( .A(n1090), .Y(n1091) );
  NAND2X1 U947 ( .A(n497), .B(n1417), .Y(n1092) );
  NOR2X1 U948 ( .A(n776), .B(n1635), .Y(n1093) );
  NAND2X1 U949 ( .A(n1262), .B(n1263), .Y(n1094) );
  BUFX2 U950 ( .A(n155), .Y(n1095) );
  XNOR2X1 U951 ( .A(n1516), .B(n1096), .Y(n429) );
  INVX1 U952 ( .A(n444), .Y(n1096) );
  BUFX2 U953 ( .A(n430), .Y(n1097) );
  XOR2X1 U954 ( .A(n748), .B(n764), .Y(n1098) );
  XOR2X1 U955 ( .A(n518), .B(n511), .Y(n1099) );
  XOR2X1 U956 ( .A(n1139), .B(n1099), .Y(n505) );
  NAND2X1 U957 ( .A(n1139), .B(n511), .Y(n1100) );
  NAND2X1 U958 ( .A(n1139), .B(n518), .Y(n1101) );
  NAND2X1 U959 ( .A(n511), .B(n518), .Y(n1102) );
  NAND3X1 U960 ( .A(n1101), .B(n1100), .C(n1102), .Y(n504) );
  INVX2 U961 ( .A(n1138), .Y(n1139) );
  XOR2X1 U962 ( .A(n490), .B(n492), .Y(n1103) );
  XOR2X1 U963 ( .A(n479), .B(n1103), .Y(n475) );
  NAND2X1 U964 ( .A(n479), .B(n1077), .Y(n1104) );
  NAND2X1 U965 ( .A(n479), .B(n1086), .Y(n1105) );
  NAND2X1 U966 ( .A(n1077), .B(n1086), .Y(n1106) );
  NAND3X1 U967 ( .A(n1105), .B(n1104), .C(n1106), .Y(n474) );
  OR2X1 U968 ( .A(n1530), .B(n835), .Y(n1483) );
  XOR2X1 U969 ( .A(n641), .B(n625), .Y(n1107) );
  XOR2X1 U970 ( .A(n669), .B(n1107), .Y(n397) );
  NAND2X1 U971 ( .A(n669), .B(n641), .Y(n1108) );
  NAND2X1 U972 ( .A(n669), .B(n625), .Y(n1109) );
  NAND2X1 U973 ( .A(n641), .B(n625), .Y(n1110) );
  NAND3X1 U974 ( .A(n1109), .B(n1108), .C(n1110), .Y(n396) );
  NOR2X1 U975 ( .A(n828), .B(n1440), .Y(n1111) );
  NOR2X1 U976 ( .A(n829), .B(n1383), .Y(n1112) );
  OR2X2 U977 ( .A(n1111), .B(n1112), .Y(n669) );
  BUFX2 U978 ( .A(n1625), .Y(n1440) );
  XOR2X1 U979 ( .A(n1113), .B(n1167), .Y(n537) );
  XNOR2X1 U980 ( .A(n548), .B(n550), .Y(n1113) );
  INVX1 U981 ( .A(n1483), .Y(n1114) );
  INVX1 U982 ( .A(n1114), .Y(n1115) );
  XOR2X1 U983 ( .A(n768), .B(n752), .Y(n583) );
  INVX2 U984 ( .A(n1116), .Y(n582) );
  NAND2X1 U985 ( .A(n768), .B(n752), .Y(n1116) );
  BUFX2 U986 ( .A(n312), .Y(n1117) );
  XOR2X1 U987 ( .A(n709), .B(n677), .Y(n1118) );
  XOR2X1 U988 ( .A(n1057), .B(n1118), .Y(n509) );
  NAND2X1 U989 ( .A(n522), .B(n709), .Y(n1119) );
  NAND2X1 U990 ( .A(n522), .B(n677), .Y(n1120) );
  NAND2X1 U991 ( .A(n709), .B(n677), .Y(n1121) );
  NAND3X1 U992 ( .A(n1120), .B(n1119), .C(n1121), .Y(n508) );
  INVX1 U993 ( .A(n1478), .Y(n1122) );
  INVX1 U994 ( .A(n1122), .Y(n1123) );
  NAND3X1 U995 ( .A(n1159), .B(n1158), .C(n1160), .Y(n1124) );
  BUFX2 U996 ( .A(n1625), .Y(n1125) );
  XNOR2X1 U997 ( .A(n527), .B(n1126), .Y(n525) );
  XNOR2X1 U998 ( .A(n536), .B(n529), .Y(n1126) );
  XNOR2X1 U999 ( .A(n1127), .B(n531), .Y(n527) );
  XNOR2X1 U1000 ( .A(n540), .B(n1329), .Y(n1127) );
  XOR2X1 U1001 ( .A(n1128), .B(n510), .Y(n493) );
  XOR2X1 U1002 ( .A(n499), .B(n756), .Y(n1128) );
  INVX1 U1003 ( .A(n36), .Y(n1626) );
  INVX4 U1004 ( .A(n1626), .Y(n1383) );
  INVX4 U1005 ( .A(n1234), .Y(n1614) );
  XOR2X1 U1006 ( .A(n543), .B(n712), .Y(n1129) );
  XOR2X1 U1007 ( .A(n696), .B(n1129), .Y(n539) );
  NAND2X1 U1008 ( .A(n696), .B(n543), .Y(n1130) );
  NAND2X1 U1009 ( .A(n696), .B(n712), .Y(n1131) );
  NAND2X1 U1010 ( .A(n543), .B(n712), .Y(n1132) );
  NAND3X1 U1011 ( .A(n1131), .B(n1130), .C(n1132), .Y(n538) );
  XOR2X1 U1012 ( .A(n1428), .B(n1641), .Y(n856) );
  INVX4 U1013 ( .A(n1641), .Y(n1642) );
  INVX4 U1014 ( .A(n1673), .Y(n1462) );
  INVX4 U1015 ( .A(n1406), .Y(n1659) );
  BUFX2 U1016 ( .A(n228), .Y(n1133) );
  INVX1 U1017 ( .A(n978), .Y(n1134) );
  INVX4 U1018 ( .A(n1535), .Y(n978) );
  BUFX2 U1019 ( .A(n1527), .Y(n1135) );
  BUFX4 U1020 ( .A(n1687), .Y(n1136) );
  XOR2X1 U1021 ( .A(n1534), .B(n1137), .Y(n816) );
  INVX8 U1022 ( .A(n1652), .Y(n1137) );
  INVX2 U1023 ( .A(n520), .Y(n1138) );
  INVX1 U1024 ( .A(n1422), .Y(n1140) );
  INVX4 U1025 ( .A(n1448), .Y(n1175) );
  INVX4 U1026 ( .A(n941), .Y(n1653) );
  XOR2X1 U1027 ( .A(n1678), .B(n1655), .Y(n886) );
  INVX2 U1028 ( .A(n162), .Y(n164) );
  INVX1 U1029 ( .A(n1422), .Y(n1141) );
  INVX2 U1030 ( .A(n1422), .Y(n1630) );
  XOR2X1 U1031 ( .A(n1173), .B(n1367), .Y(n800) );
  XNOR2X1 U1032 ( .A(n1142), .B(n759), .Y(n533) );
  XNOR2X1 U1033 ( .A(n727), .B(n743), .Y(n1142) );
  INVX1 U1034 ( .A(n1538), .Y(n605) );
  XOR2X1 U1035 ( .A(n1143), .B(n429), .Y(n427) );
  XNOR2X1 U1036 ( .A(n442), .B(n1239), .Y(n1143) );
  XOR2X1 U1037 ( .A(n1136), .B(n1145), .Y(n1144) );
  XOR2X1 U1038 ( .A(n1136), .B(n1145), .Y(n819) );
  XNOR2X1 U1039 ( .A(n1146), .B(n1147), .Y(n441) );
  XOR2X1 U1040 ( .A(n458), .B(n445), .Y(n1146) );
  INVX2 U1041 ( .A(n443), .Y(n1147) );
  INVX1 U1042 ( .A(n30), .Y(n1621) );
  INVX2 U1043 ( .A(n1660), .Y(n1662) );
  INVX1 U1044 ( .A(n1422), .Y(n1408) );
  XNOR2X1 U1045 ( .A(n1148), .B(n469), .Y(n463) );
  XNOR2X1 U1046 ( .A(n484), .B(n482), .Y(n1148) );
  XOR2X1 U1047 ( .A(n428), .B(n417), .Y(n1149) );
  XOR2X1 U1048 ( .A(n1063), .B(n1149), .Y(n413) );
  NAND2X1 U1049 ( .A(n415), .B(n1088), .Y(n1150) );
  NAND2X1 U1050 ( .A(n415), .B(n417), .Y(n1151) );
  NAND2X1 U1051 ( .A(n1088), .B(n1085), .Y(n1152) );
  NAND3X1 U1052 ( .A(n1151), .B(n1150), .C(n1152), .Y(n412) );
  INVX1 U1053 ( .A(n282), .Y(n1429) );
  XOR2X1 U1054 ( .A(n749), .B(n765), .Y(n1153) );
  XOR2X1 U1055 ( .A(n733), .B(n1153), .Y(n575) );
  NAND2X1 U1056 ( .A(n733), .B(n749), .Y(n1154) );
  NAND2X1 U1057 ( .A(n733), .B(n765), .Y(n1155) );
  NAND2X1 U1058 ( .A(n749), .B(n765), .Y(n1156) );
  NAND3X1 U1059 ( .A(n1155), .B(n1154), .C(n1156), .Y(n574) );
  XOR2X1 U1060 ( .A(n697), .B(n681), .Y(n1157) );
  XOR2X1 U1061 ( .A(n1559), .B(n1157), .Y(n549) );
  NAND2X1 U1062 ( .A(n1559), .B(n697), .Y(n1158) );
  NAND2X1 U1063 ( .A(n1559), .B(n681), .Y(n1159) );
  NAND2X1 U1064 ( .A(n681), .B(n697), .Y(n1160) );
  NAND3X1 U1065 ( .A(n1159), .B(n1158), .C(n1160), .Y(n548) );
  BUFX2 U1066 ( .A(n558), .Y(n1559) );
  XNOR2X1 U1067 ( .A(n1161), .B(n504), .Y(n489) );
  XNOR2X1 U1068 ( .A(n493), .B(n497), .Y(n1161) );
  XOR2X1 U1069 ( .A(n557), .B(n562), .Y(n1162) );
  XOR2X1 U1070 ( .A(n555), .B(n1162), .Y(n553) );
  NAND2X1 U1071 ( .A(n555), .B(n557), .Y(n1163) );
  NAND2X1 U1072 ( .A(n555), .B(n562), .Y(n1164) );
  NAND2X1 U1073 ( .A(n557), .B(n562), .Y(n1165) );
  NAND3X1 U1074 ( .A(n1164), .B(n1163), .C(n1165), .Y(n552) );
  XOR2X1 U1075 ( .A(n1655), .B(n1466), .Y(n904) );
  INVX1 U1076 ( .A(n155), .Y(n305) );
  INVX4 U1077 ( .A(n1679), .Y(n1222) );
  BUFX2 U1078 ( .A(n1622), .Y(n1166) );
  INVX1 U1079 ( .A(n541), .Y(n1167) );
  NAND3X1 U1080 ( .A(n1561), .B(n1562), .C(n1563), .Y(n1168) );
  XNOR2X1 U1081 ( .A(n1465), .B(n1674), .Y(n1169) );
  INVX4 U1082 ( .A(n1648), .Y(n1650) );
  AND2X1 U1083 ( .A(n389), .B(n400), .Y(n1170) );
  INVX4 U1084 ( .A(n944), .Y(n1647) );
  BUFX2 U1085 ( .A(n495), .Y(n1171) );
  BUFX2 U1086 ( .A(n465), .Y(n1172) );
  BUFX2 U1087 ( .A(n977), .Y(n1173) );
  BUFX2 U1088 ( .A(n556), .Y(n1174) );
  INVX4 U1089 ( .A(n1201), .Y(n1448) );
  NAND3X1 U1090 ( .A(n1225), .B(n1227), .C(n1226), .Y(n1176) );
  NAND3X1 U1091 ( .A(n1092), .B(n1581), .C(n1580), .Y(n1177) );
  BUFX4 U1092 ( .A(n937), .Y(n1178) );
  BUFX2 U1093 ( .A(n937), .Y(n1405) );
  BUFX2 U1094 ( .A(n481), .Y(n1179) );
  INVX4 U1095 ( .A(n943), .Y(n1648) );
  INVX4 U1096 ( .A(n1648), .Y(n1649) );
  INVX1 U1097 ( .A(n186), .Y(n308) );
  INVX1 U1098 ( .A(n143), .Y(n141) );
  INVX1 U1099 ( .A(n146), .Y(n304) );
  BUFX2 U1100 ( .A(n680), .Y(n1180) );
  BUFX4 U1101 ( .A(n451), .Y(n1181) );
  BUFX2 U1102 ( .A(n863), .Y(n1182) );
  INVX4 U1103 ( .A(n1644), .Y(n1645) );
  OAI21X1 U1104 ( .A(n243), .B(n231), .C(n232), .Y(n1183) );
  XNOR2X1 U1105 ( .A(n1677), .B(n1639), .Y(n1184) );
  INVX1 U1106 ( .A(n1184), .Y(n893) );
  BUFX4 U1107 ( .A(n942), .Y(n1465) );
  BUFX2 U1108 ( .A(n475), .Y(n1185) );
  BUFX4 U1109 ( .A(n432), .Y(n1186) );
  BUFX2 U1110 ( .A(n723), .Y(n1187) );
  NAND3X1 U1111 ( .A(n1526), .B(n1135), .C(n1528), .Y(n1188) );
  XNOR2X1 U1112 ( .A(n1189), .B(n1209), .Y(n437) );
  XNOR2X1 U1113 ( .A(n704), .B(n628), .Y(n1189) );
  BUFX2 U1114 ( .A(n460), .Y(n1190) );
  INVX2 U1115 ( .A(n1283), .Y(n1537) );
  INVX8 U1116 ( .A(n1558), .Y(n1611) );
  INVX2 U1117 ( .A(n1), .Y(n1673) );
  INVX4 U1118 ( .A(n1673), .Y(n1674) );
  INVX1 U1119 ( .A(n1634), .Y(n1636) );
  INVX8 U1120 ( .A(n977), .Y(n1688) );
  INVX4 U1121 ( .A(n43), .Y(n977) );
  BUFX4 U1122 ( .A(n1407), .Y(n1437) );
  XNOR2X1 U1123 ( .A(a[4]), .B(n1676), .Y(n1191) );
  INVX4 U1124 ( .A(n7), .Y(n1675) );
  INVX8 U1125 ( .A(n1675), .Y(n1676) );
  INVX2 U1126 ( .A(n1234), .Y(n1265) );
  INVX2 U1127 ( .A(n1418), .Y(n1417) );
  INVX1 U1128 ( .A(n219), .Y(n217) );
  INVX2 U1129 ( .A(n253), .Y(n1478) );
  XNOR2X1 U1130 ( .A(n1192), .B(n613), .Y(n541) );
  XNOR2X1 U1131 ( .A(n680), .B(n728), .Y(n1192) );
  XNOR2X1 U1132 ( .A(n1193), .B(n1190), .Y(n443) );
  XNOR2X1 U1133 ( .A(n447), .B(n462), .Y(n1193) );
  XNOR2X1 U1134 ( .A(n1681), .B(n1194), .Y(n954) );
  INVX2 U1135 ( .A(a[6]), .Y(n1194) );
  INVX8 U1136 ( .A(n1647), .Y(n1367) );
  XOR2X1 U1137 ( .A(n206), .B(n1195), .Y(product[20]) );
  INVX8 U1138 ( .A(n1392), .Y(n1195) );
  INVX1 U1139 ( .A(n117), .Y(n115) );
  INVX1 U1140 ( .A(n1420), .Y(n1196) );
  INVX1 U1141 ( .A(n1196), .Y(n1197) );
  BUFX4 U1142 ( .A(n1687), .Y(n1535) );
  AND2X2 U1143 ( .A(n501), .B(n512), .Y(n1198) );
  INVX1 U1144 ( .A(n1198), .Y(n241) );
  BUFX2 U1145 ( .A(n316), .Y(n1199) );
  INVX1 U1146 ( .A(n121), .Y(n119) );
  XNOR2X1 U1147 ( .A(n1200), .B(n1457), .Y(n503) );
  XNOR2X1 U1148 ( .A(n509), .B(n507), .Y(n1200) );
  NAND2X1 U1149 ( .A(n955), .B(n1191), .Y(n1201) );
  XOR2X1 U1150 ( .A(n480), .B(n467), .Y(n1202) );
  XOR2X1 U1151 ( .A(n1202), .B(n1172), .Y(n461) );
  NAND2X1 U1152 ( .A(n480), .B(n467), .Y(n1203) );
  NAND2X1 U1153 ( .A(n480), .B(n465), .Y(n1204) );
  NAND2X1 U1154 ( .A(n467), .B(n465), .Y(n1205) );
  NAND3X1 U1155 ( .A(n1203), .B(n1204), .C(n1205), .Y(n460) );
  NAND2X1 U1156 ( .A(n1058), .B(n447), .Y(n1206) );
  NAND2X1 U1157 ( .A(n1058), .B(n460), .Y(n1207) );
  NAND2X1 U1158 ( .A(n447), .B(n460), .Y(n1208) );
  NAND3X1 U1159 ( .A(n1206), .B(n1207), .C(n1208), .Y(n442) );
  OAI22X1 U1160 ( .A(n799), .B(n1631), .C(n800), .D(n1632), .Y(n1209) );
  INVX1 U1161 ( .A(n1384), .Y(n1210) );
  BUFX4 U1162 ( .A(n36), .Y(n1530) );
  OR2X2 U1163 ( .A(n834), .B(n1625), .Y(n1482) );
  INVX4 U1164 ( .A(n1384), .Y(n1622) );
  XOR2X1 U1165 ( .A(n1669), .B(n1462), .Y(n916) );
  INVX2 U1166 ( .A(n1669), .Y(n1670) );
  AND2X2 U1167 ( .A(n1211), .B(n1634), .Y(n628) );
  XOR2X1 U1168 ( .A(n50), .B(n1645), .Y(n1211) );
  INVX2 U1169 ( .A(n30), .Y(n1384) );
  XOR2X1 U1170 ( .A(n630), .B(n610), .Y(n1212) );
  XOR2X1 U1171 ( .A(n1212), .B(n646), .Y(n469) );
  NAND2X1 U1172 ( .A(n630), .B(n610), .Y(n1213) );
  NAND2X1 U1173 ( .A(n630), .B(n646), .Y(n1214) );
  NAND2X1 U1174 ( .A(n610), .B(n646), .Y(n1215) );
  NAND3X1 U1175 ( .A(n1213), .B(n1214), .C(n1215), .Y(n468) );
  NAND2X1 U1176 ( .A(n484), .B(n482), .Y(n1216) );
  NAND2X1 U1177 ( .A(n484), .B(n469), .Y(n1217) );
  NAND2X1 U1178 ( .A(n482), .B(n469), .Y(n1218) );
  NAND3X1 U1179 ( .A(n1216), .B(n1217), .C(n1218), .Y(n462) );
  XOR2X1 U1180 ( .A(n724), .B(n740), .Y(n499) );
  INVX2 U1181 ( .A(n1219), .Y(n498) );
  NAND2X1 U1182 ( .A(n724), .B(n740), .Y(n1219) );
  INVX2 U1183 ( .A(n1637), .Y(n1220) );
  INVX2 U1184 ( .A(n1637), .Y(n1485) );
  BUFX2 U1185 ( .A(n568), .Y(n1221) );
  INVX2 U1186 ( .A(n1617), .Y(n1618) );
  XNOR2X1 U1187 ( .A(n161), .B(n1223), .Y(product[25]) );
  AND2X2 U1188 ( .A(n156), .B(n305), .Y(n1223) );
  XOR2X1 U1189 ( .A(n1536), .B(n1648), .Y(n817) );
  XOR2X1 U1190 ( .A(n741), .B(n725), .Y(n1224) );
  XOR2X1 U1191 ( .A(n661), .B(n1224), .Y(n511) );
  NAND2X1 U1192 ( .A(n741), .B(n725), .Y(n1225) );
  NAND2X1 U1193 ( .A(n741), .B(n661), .Y(n1226) );
  NAND2X1 U1194 ( .A(n725), .B(n661), .Y(n1227) );
  NAND3X1 U1195 ( .A(n1225), .B(n1227), .C(n1226), .Y(n510) );
  NAND2X1 U1196 ( .A(n499), .B(n756), .Y(n1228) );
  NAND2X1 U1197 ( .A(n499), .B(n1176), .Y(n1229) );
  NAND2X1 U1198 ( .A(n756), .B(n1176), .Y(n1230) );
  NAND3X1 U1199 ( .A(n1228), .B(n1229), .C(n1230), .Y(n492) );
  NOR2X1 U1200 ( .A(n820), .B(n1628), .Y(n1231) );
  NOR2X1 U1201 ( .A(n821), .B(n1141), .Y(n1232) );
  OR2X2 U1202 ( .A(n1231), .B(n1232), .Y(n661) );
  INVX1 U1203 ( .A(n1237), .Y(n1233) );
  BUFX4 U1204 ( .A(n1536), .Y(n1602) );
  INVX4 U1205 ( .A(n590), .Y(n1371) );
  AND2X2 U1206 ( .A(n956), .B(n1612), .Y(n1234) );
  XOR2X1 U1207 ( .A(n760), .B(n744), .Y(n543) );
  INVX2 U1208 ( .A(n1235), .Y(n542) );
  NAND2X1 U1209 ( .A(n744), .B(n760), .Y(n1235) );
  NAND3X1 U1210 ( .A(n1280), .B(n1279), .C(n1281), .Y(n1236) );
  INVX1 U1211 ( .A(n1220), .Y(n1237) );
  INVX8 U1212 ( .A(n431), .Y(n1239) );
  AND2X2 U1213 ( .A(n1240), .B(n1238), .Y(n630) );
  XOR2X1 U1214 ( .A(n50), .B(n1639), .Y(n1240) );
  INVX1 U1215 ( .A(n274), .Y(n1425) );
  INVX2 U1216 ( .A(n892), .Y(n1578) );
  XOR2X1 U1217 ( .A(n699), .B(n715), .Y(n1241) );
  XOR2X1 U1218 ( .A(n1241), .B(n570), .Y(n563) );
  XOR2X1 U1219 ( .A(n568), .B(n565), .Y(n1242) );
  XOR2X1 U1220 ( .A(n1242), .B(n563), .Y(n561) );
  NAND2X1 U1221 ( .A(n699), .B(n715), .Y(n1243) );
  NAND2X1 U1222 ( .A(n699), .B(n570), .Y(n1244) );
  NAND2X1 U1223 ( .A(n715), .B(n570), .Y(n1245) );
  NAND3X1 U1224 ( .A(n1243), .B(n1244), .C(n1245), .Y(n562) );
  NAND2X1 U1225 ( .A(n565), .B(n1221), .Y(n1246) );
  NAND2X1 U1226 ( .A(n565), .B(n563), .Y(n1247) );
  NAND2X1 U1227 ( .A(n1221), .B(n563), .Y(n1248) );
  NAND3X1 U1228 ( .A(n1246), .B(n1247), .C(n1248), .Y(n560) );
  XNOR2X1 U1229 ( .A(n1249), .B(n496), .Y(n479) );
  XNOR2X1 U1230 ( .A(n485), .B(n755), .Y(n1249) );
  XNOR2X1 U1231 ( .A(n1250), .B(n675), .Y(n485) );
  XNOR2X1 U1232 ( .A(n659), .B(n723), .Y(n1250) );
  NAND3X1 U1233 ( .A(n1352), .B(n1351), .C(n1353), .Y(n1251) );
  XOR2X1 U1234 ( .A(n418), .B(n407), .Y(n1252) );
  XOR2X1 U1235 ( .A(n1252), .B(n1094), .Y(n403) );
  XOR2X1 U1236 ( .A(n416), .B(n414), .Y(n1253) );
  XOR2X1 U1237 ( .A(n1253), .B(n403), .Y(n401) );
  NAND2X1 U1238 ( .A(n418), .B(n407), .Y(n1254) );
  NAND2X1 U1239 ( .A(n418), .B(n405), .Y(n1255) );
  NAND2X1 U1240 ( .A(n407), .B(n405), .Y(n1256) );
  NAND3X1 U1241 ( .A(n1254), .B(n1255), .C(n1256), .Y(n402) );
  NAND2X1 U1242 ( .A(n416), .B(n414), .Y(n1257) );
  NAND2X1 U1243 ( .A(n416), .B(n403), .Y(n1258) );
  NAND2X1 U1244 ( .A(n414), .B(n403), .Y(n1259) );
  NAND3X1 U1245 ( .A(n1257), .B(n1258), .C(n1259), .Y(n400) );
  NAND2X1 U1246 ( .A(n1539), .B(n1261), .Y(n1262) );
  NAND2X1 U1247 ( .A(n1260), .B(n409), .Y(n1263) );
  NAND2X1 U1248 ( .A(n1262), .B(n1263), .Y(n405) );
  INVX1 U1249 ( .A(n1539), .Y(n1260) );
  INVX1 U1250 ( .A(n409), .Y(n1261) );
  XOR2X1 U1251 ( .A(n226), .B(n1264), .Y(product[17]) );
  AND2X1 U1252 ( .A(n225), .B(n313), .Y(n1264) );
  XOR2X1 U1253 ( .A(n718), .B(n702), .Y(n1266) );
  XOR2X1 U1254 ( .A(n411), .B(n1266), .Y(n407) );
  NAND2X1 U1255 ( .A(n411), .B(n718), .Y(n1267) );
  NAND2X1 U1256 ( .A(n411), .B(n702), .Y(n1268) );
  NAND2X1 U1257 ( .A(n718), .B(n702), .Y(n1269) );
  NAND3X1 U1258 ( .A(n1268), .B(n1267), .C(n1269), .Y(n406) );
  OAI22X1 U1259 ( .A(n814), .B(n1628), .C(n815), .D(n1140), .Y(n1270) );
  XOR2X1 U1260 ( .A(n221), .B(n71), .Y(product[18]) );
  XOR2X1 U1261 ( .A(n1271), .B(n459), .Y(n457) );
  XNOR2X1 U1262 ( .A(n1600), .B(n461), .Y(n1271) );
  NOR2X1 U1263 ( .A(n227), .B(n224), .Y(n1272) );
  NAND3X1 U1264 ( .A(n1513), .B(n1061), .C(n1072), .Y(n1273) );
  INVX1 U1265 ( .A(n1456), .Y(n596) );
  AND2X2 U1266 ( .A(n1690), .B(n596), .Y(n699) );
  XOR2X1 U1267 ( .A(n554), .B(n549), .Y(n1274) );
  XOR2X1 U1268 ( .A(n547), .B(n1274), .Y(n545) );
  NAND2X1 U1269 ( .A(n547), .B(n554), .Y(n1275) );
  NAND2X1 U1270 ( .A(n547), .B(n1083), .Y(n1276) );
  NAND2X1 U1271 ( .A(n554), .B(n1083), .Y(n1277) );
  NAND3X1 U1272 ( .A(n1276), .B(n1275), .C(n1277), .Y(n544) );
  XOR2X1 U1273 ( .A(n551), .B(n713), .Y(n1278) );
  XOR2X1 U1274 ( .A(n1174), .B(n1278), .Y(n547) );
  NAND2X1 U1275 ( .A(n556), .B(n551), .Y(n1279) );
  NAND2X1 U1276 ( .A(n556), .B(n713), .Y(n1280) );
  NAND2X1 U1277 ( .A(n551), .B(n713), .Y(n1281) );
  NAND3X1 U1278 ( .A(n1280), .B(n1279), .C(n1281), .Y(n546) );
  INVX2 U1279 ( .A(n1691), .Y(n1689) );
  INVX2 U1280 ( .A(n55), .Y(n1691) );
  INVX2 U1281 ( .A(n1393), .Y(n1392) );
  INVX2 U1282 ( .A(n1363), .Y(n1362) );
  INVX2 U1283 ( .A(n1647), .Y(n1368) );
  NAND2X1 U1284 ( .A(n1619), .B(n954), .Y(n1282) );
  INVX2 U1285 ( .A(n1459), .Y(n1420) );
  XOR2X1 U1286 ( .A(a[2]), .B(n1435), .Y(n1283) );
  INVX2 U1287 ( .A(n258), .Y(n1370) );
  XOR2X1 U1288 ( .A(n1446), .B(n1640), .Y(n1284) );
  BUFX2 U1289 ( .A(n1619), .Y(n1364) );
  AOI21X1 U1290 ( .A(n248), .B(n1546), .C(n1412), .Y(n1285) );
  INVX2 U1291 ( .A(n1377), .Y(n1439) );
  XOR2X1 U1292 ( .A(n1390), .B(n1654), .Y(n815) );
  BUFX4 U1293 ( .A(n935), .Y(n1286) );
  XOR2X1 U1294 ( .A(n450), .B(n1295), .Y(n1287) );
  XOR2X1 U1295 ( .A(n1287), .B(n435), .Y(n431) );
  NAND2X1 U1296 ( .A(n450), .B(n448), .Y(n1288) );
  NAND2X1 U1297 ( .A(n450), .B(n435), .Y(n1289) );
  NAND2X1 U1298 ( .A(n448), .B(n435), .Y(n1290) );
  NAND3X1 U1299 ( .A(n1288), .B(n1289), .C(n1290), .Y(n430) );
  XOR2X1 U1300 ( .A(n419), .B(n1186), .Y(n1291) );
  XOR2X1 U1301 ( .A(n1291), .B(n1097), .Y(n415) );
  NAND2X1 U1302 ( .A(n1186), .B(n419), .Y(n1292) );
  NAND2X1 U1303 ( .A(n430), .B(n1186), .Y(n1293) );
  NAND2X1 U1304 ( .A(n419), .B(n430), .Y(n1294) );
  NAND3X1 U1305 ( .A(n1292), .B(n1293), .C(n1294), .Y(n414) );
  NAND3X1 U1306 ( .A(n1488), .B(n1487), .C(n1489), .Y(n1295) );
  INVX1 U1307 ( .A(n935), .Y(n1667) );
  XOR2X1 U1308 ( .A(n711), .B(n663), .Y(n1296) );
  XOR2X1 U1309 ( .A(n1296), .B(n679), .Y(n531) );
  NAND2X1 U1310 ( .A(n663), .B(n711), .Y(n1297) );
  NAND2X1 U1311 ( .A(n663), .B(n679), .Y(n1298) );
  NAND2X1 U1312 ( .A(n711), .B(n679), .Y(n1299) );
  NAND3X1 U1313 ( .A(n1297), .B(n1298), .C(n1299), .Y(n530) );
  NAND2X1 U1314 ( .A(n1070), .B(n1329), .Y(n1300) );
  NAND2X1 U1315 ( .A(n1070), .B(n531), .Y(n1301) );
  NAND2X1 U1316 ( .A(n1329), .B(n531), .Y(n1302) );
  NAND3X1 U1317 ( .A(n1300), .B(n1301), .C(n1302), .Y(n526) );
  XOR2X1 U1318 ( .A(n526), .B(n517), .Y(n1303) );
  XOR2X1 U1319 ( .A(n515), .B(n1303), .Y(n513) );
  NAND2X1 U1320 ( .A(n515), .B(n526), .Y(n1304) );
  NAND2X1 U1321 ( .A(n515), .B(n517), .Y(n1305) );
  NAND2X1 U1322 ( .A(n526), .B(n517), .Y(n1306) );
  NAND3X1 U1323 ( .A(n1305), .B(n1304), .C(n1306), .Y(n512) );
  XOR2X1 U1324 ( .A(n528), .B(n530), .Y(n1307) );
  XOR2X1 U1325 ( .A(n519), .B(n1307), .Y(n515) );
  NAND2X1 U1326 ( .A(n519), .B(n528), .Y(n1308) );
  NAND2X1 U1327 ( .A(n519), .B(n530), .Y(n1309) );
  NAND2X1 U1328 ( .A(n528), .B(n530), .Y(n1310) );
  NAND3X1 U1329 ( .A(n1309), .B(n1308), .C(n1310), .Y(n514) );
  XOR2X1 U1330 ( .A(n695), .B(n542), .Y(n1311) );
  XOR2X1 U1331 ( .A(n1311), .B(n533), .Y(n529) );
  NAND2X1 U1332 ( .A(n743), .B(n727), .Y(n1312) );
  NAND2X1 U1333 ( .A(n743), .B(n759), .Y(n1313) );
  NAND2X1 U1334 ( .A(n727), .B(n759), .Y(n1314) );
  NAND3X1 U1335 ( .A(n1312), .B(n1313), .C(n1314), .Y(n532) );
  NAND2X1 U1336 ( .A(n695), .B(n542), .Y(n1315) );
  NAND2X1 U1337 ( .A(n695), .B(n533), .Y(n1316) );
  NAND2X1 U1338 ( .A(n542), .B(n533), .Y(n1317) );
  NAND3X1 U1339 ( .A(n1315), .B(n1316), .C(n1317), .Y(n528) );
  XOR2X1 U1340 ( .A(n546), .B(n539), .Y(n1318) );
  XOR2X1 U1341 ( .A(n537), .B(n1318), .Y(n535) );
  NAND2X1 U1342 ( .A(n537), .B(n1236), .Y(n1319) );
  NAND2X1 U1343 ( .A(n537), .B(n539), .Y(n1320) );
  NAND2X1 U1344 ( .A(n1236), .B(n539), .Y(n1321) );
  NAND3X1 U1345 ( .A(n1321), .B(n1319), .C(n1320), .Y(n534) );
  NAND2X1 U1346 ( .A(n1180), .B(n728), .Y(n1322) );
  NAND2X1 U1347 ( .A(n728), .B(n613), .Y(n1323) );
  NAND2X1 U1348 ( .A(n1180), .B(n613), .Y(n1324) );
  NAND3X1 U1349 ( .A(n1322), .B(n1323), .C(n1324), .Y(n540) );
  NAND2X1 U1350 ( .A(n1124), .B(n550), .Y(n1325) );
  NAND2X1 U1351 ( .A(n541), .B(n550), .Y(n1326) );
  NAND2X1 U1352 ( .A(n541), .B(n1124), .Y(n1327) );
  NAND3X1 U1353 ( .A(n1325), .B(n1326), .C(n1327), .Y(n536) );
  INVX2 U1354 ( .A(n538), .Y(n1328) );
  INVX4 U1355 ( .A(n1328), .Y(n1329) );
  XOR2X1 U1356 ( .A(n757), .B(n649), .Y(n1330) );
  XOR2X1 U1357 ( .A(n693), .B(n1330), .Y(n507) );
  NAND2X1 U1358 ( .A(n757), .B(n693), .Y(n1331) );
  NAND2X1 U1359 ( .A(n693), .B(n649), .Y(n1332) );
  NAND2X1 U1360 ( .A(n757), .B(n649), .Y(n1333) );
  NAND3X1 U1361 ( .A(n1332), .B(n1331), .C(n1333), .Y(n506) );
  XOR2X1 U1362 ( .A(n488), .B(n477), .Y(n1334) );
  XOR2X1 U1363 ( .A(n1185), .B(n1334), .Y(n473) );
  NAND2X1 U1364 ( .A(n475), .B(n1177), .Y(n1335) );
  NAND2X1 U1365 ( .A(n475), .B(n477), .Y(n1336) );
  NAND2X1 U1366 ( .A(n1177), .B(n477), .Y(n1337) );
  NAND3X1 U1367 ( .A(n1336), .B(n1335), .C(n1337), .Y(n472) );
  XOR2X1 U1368 ( .A(n729), .B(n745), .Y(n1338) );
  XOR2X1 U1369 ( .A(n761), .B(n1338), .Y(n551) );
  NAND2X1 U1370 ( .A(n761), .B(n745), .Y(n1339) );
  NAND2X1 U1371 ( .A(n761), .B(n729), .Y(n1340) );
  NAND2X1 U1372 ( .A(n745), .B(n729), .Y(n1341) );
  NAND3X1 U1373 ( .A(n1340), .B(n1339), .C(n1341), .Y(n550) );
  NOR2X1 U1374 ( .A(n1611), .B(n921), .Y(n1342) );
  NOR2X1 U1375 ( .A(n1610), .B(n920), .Y(n1343) );
  OR2X2 U1376 ( .A(n1342), .B(n1343), .Y(n761) );
  XOR2X1 U1377 ( .A(n660), .B(n676), .Y(n1344) );
  XOR2X1 U1378 ( .A(n1344), .B(n708), .Y(n497) );
  NAND2X1 U1379 ( .A(n660), .B(n676), .Y(n1345) );
  NAND2X1 U1380 ( .A(n708), .B(n660), .Y(n1346) );
  NAND2X1 U1381 ( .A(n676), .B(n708), .Y(n1347) );
  NAND3X1 U1382 ( .A(n1345), .B(n1346), .C(n1347), .Y(n496) );
  NAND2X1 U1383 ( .A(n755), .B(n485), .Y(n1348) );
  NAND2X1 U1384 ( .A(n755), .B(n496), .Y(n1349) );
  NAND2X1 U1385 ( .A(n485), .B(n496), .Y(n1350) );
  NAND3X1 U1386 ( .A(n1348), .B(n1349), .C(n1350), .Y(n478) );
  NAND2X1 U1387 ( .A(n443), .B(n1089), .Y(n1351) );
  NAND2X1 U1388 ( .A(n443), .B(n445), .Y(n1352) );
  NAND2X1 U1389 ( .A(n1089), .B(n445), .Y(n1353) );
  NAND3X1 U1390 ( .A(n1352), .B(n1351), .C(n1353), .Y(n440) );
  XOR2X1 U1391 ( .A(n645), .B(n629), .Y(n1354) );
  XOR2X1 U1392 ( .A(n1354), .B(n673), .Y(n453) );
  XOR2X1 U1393 ( .A(n466), .B(n468), .Y(n1355) );
  XOR2X1 U1394 ( .A(n1355), .B(n453), .Y(n447) );
  NAND2X1 U1395 ( .A(n629), .B(n645), .Y(n1356) );
  NAND2X1 U1396 ( .A(n629), .B(n673), .Y(n1357) );
  NAND2X1 U1397 ( .A(n645), .B(n673), .Y(n1358) );
  NAND3X1 U1398 ( .A(n1356), .B(n1357), .C(n1358), .Y(n452) );
  NAND2X1 U1399 ( .A(n468), .B(n466), .Y(n1359) );
  NAND2X1 U1400 ( .A(n468), .B(n453), .Y(n1360) );
  NAND2X1 U1401 ( .A(n466), .B(n453), .Y(n1361) );
  NAND3X1 U1402 ( .A(n1359), .B(n1360), .C(n1361), .Y(n446) );
  INVX1 U1403 ( .A(n283), .Y(n325) );
  INVX2 U1404 ( .A(n1674), .Y(n1409) );
  XOR2X1 U1405 ( .A(n237), .B(n1362), .Y(product[15]) );
  AND2X2 U1406 ( .A(n236), .B(n1545), .Y(n1363) );
  INVX8 U1407 ( .A(n1388), .Y(n1632) );
  INVX1 U1408 ( .A(n939), .Y(n1657) );
  INVX4 U1409 ( .A(n1389), .Y(n1631) );
  INVX2 U1410 ( .A(n1378), .Y(n663) );
  BUFX4 U1411 ( .A(n1619), .Y(n1365) );
  AND2X2 U1412 ( .A(n544), .B(n535), .Y(n1366) );
  INVX1 U1413 ( .A(n1366), .Y(n259) );
  XOR2X1 U1414 ( .A(a[14]), .B(n1390), .Y(n1369) );
  XOR2X1 U1415 ( .A(n1377), .B(n1466), .Y(n902) );
  INVX8 U1416 ( .A(n1446), .Y(n1447) );
  XOR2X1 U1417 ( .A(n1385), .B(n1686), .Y(n1400) );
  INVX2 U1418 ( .A(n1628), .Y(n590) );
  INVX2 U1419 ( .A(n1421), .Y(n1372) );
  INVX1 U1420 ( .A(n1435), .Y(n1421) );
  BUFX2 U1421 ( .A(n1), .Y(n1435) );
  NAND2X1 U1422 ( .A(n1373), .B(n1374), .Y(n30) );
  XOR2X1 U1423 ( .A(n1684), .B(a[8]), .Y(n1373) );
  XNOR2X1 U1424 ( .A(n1681), .B(a[8]), .Y(n1374) );
  INVX2 U1425 ( .A(a[12]), .Y(n1385) );
  INVX2 U1426 ( .A(n1375), .Y(n1376) );
  INVX2 U1427 ( .A(n938), .Y(n1377) );
  INVX2 U1428 ( .A(n938), .Y(n1660) );
  BUFX4 U1429 ( .A(n1687), .Y(n1534) );
  INVX2 U1430 ( .A(n1686), .Y(n1687) );
  NAND2X1 U1431 ( .A(n1690), .B(n590), .Y(n1378) );
  INVX8 U1432 ( .A(n1677), .Y(n1678) );
  INVX2 U1433 ( .A(n31), .Y(n1685) );
  NAND2X1 U1434 ( .A(n1482), .B(n1115), .Y(n1379) );
  AND2X2 U1435 ( .A(n1056), .B(n1690), .Y(n681) );
  NAND2X1 U1436 ( .A(n1619), .B(n954), .Y(n1380) );
  NAND2X1 U1437 ( .A(n1619), .B(n954), .Y(n1381) );
  INVX4 U1438 ( .A(n1577), .Y(n1382) );
  INVX2 U1439 ( .A(n1191), .Y(n1577) );
  XNOR2X1 U1440 ( .A(n977), .B(a[14]), .Y(n950) );
  INVX4 U1441 ( .A(n1396), .Y(n1536) );
  BUFX2 U1442 ( .A(n611), .Y(n1386) );
  XNOR2X1 U1443 ( .A(n1651), .B(n1433), .Y(n906) );
  INVX4 U1444 ( .A(n1676), .Y(n1433) );
  INVX2 U1445 ( .A(n1691), .Y(n1690) );
  INVX2 U1446 ( .A(n1684), .Y(n1427) );
  INVX1 U1447 ( .A(n1684), .Y(n980) );
  XOR2X1 U1448 ( .A(n1390), .B(a[14]), .Y(n1387) );
  INVX2 U1449 ( .A(n37), .Y(n1390) );
  INVX2 U1450 ( .A(n40), .Y(n1627) );
  AND2X2 U1451 ( .A(n950), .B(n1387), .Y(n1388) );
  INVX2 U1452 ( .A(n942), .Y(n1651) );
  XNOR2X1 U1453 ( .A(n1390), .B(a[14]), .Y(n1389) );
  BUFX2 U1454 ( .A(n1530), .Y(n1391) );
  XOR2X1 U1455 ( .A(n13), .B(a[4]), .Y(n955) );
  NAND2X1 U1456 ( .A(n205), .B(n310), .Y(n1393) );
  INVX4 U1457 ( .A(n1680), .Y(n1681) );
  NAND2X1 U1458 ( .A(n1619), .B(n954), .Y(n1394) );
  NAND2X1 U1459 ( .A(n1619), .B(n954), .Y(n1395) );
  OR2X2 U1460 ( .A(n1689), .B(n1173), .Y(n805) );
  INVX1 U1461 ( .A(n37), .Y(n1396) );
  INVX1 U1462 ( .A(n596), .Y(n1397) );
  INVX8 U1463 ( .A(n1627), .Y(n1628) );
  INVX4 U1464 ( .A(n1553), .Y(n1613) );
  INVX2 U1465 ( .A(n1661), .Y(n1398) );
  INVX4 U1466 ( .A(n1398), .Y(n1399) );
  INVX2 U1467 ( .A(n31), .Y(n1446) );
  INVX1 U1468 ( .A(n1577), .Y(n1401) );
  INVX8 U1469 ( .A(n1677), .Y(n1679) );
  BUFX2 U1470 ( .A(n1370), .Y(n1402) );
  INVX2 U1471 ( .A(n1657), .Y(n1403) );
  INVX2 U1472 ( .A(n1657), .Y(n1404) );
  INVX1 U1473 ( .A(n937), .Y(n1663) );
  INVX2 U1474 ( .A(n939), .Y(n1406) );
  INVX1 U1475 ( .A(n221), .Y(n220) );
  INVX4 U1476 ( .A(n1680), .Y(n1407) );
  INVX1 U1477 ( .A(n265), .Y(n263) );
  XOR2X1 U1478 ( .A(n1586), .B(n1409), .Y(n914) );
  INVX2 U1479 ( .A(n37), .Y(n1686) );
  XOR2X1 U1480 ( .A(n977), .B(a[16]), .Y(n52) );
  BUFX2 U1481 ( .A(n269), .Y(n1410) );
  INVX8 U1482 ( .A(n1683), .Y(n1684) );
  XNOR2X1 U1483 ( .A(n183), .B(n1411), .Y(product[23]) );
  AND2X2 U1484 ( .A(n178), .B(n1529), .Y(n1411) );
  AND2X2 U1485 ( .A(n513), .B(n524), .Y(n1412) );
  INVX1 U1486 ( .A(n1412), .Y(n247) );
  BUFX2 U1487 ( .A(n916), .Y(n1413) );
  INVX1 U1488 ( .A(n1237), .Y(n1414) );
  INVX4 U1489 ( .A(n1680), .Y(n1682) );
  INVX1 U1490 ( .A(n1682), .Y(n981) );
  INVX1 U1491 ( .A(n1423), .Y(n1415) );
  INVX4 U1492 ( .A(n1423), .Y(n1629) );
  BUFX4 U1493 ( .A(n933), .Y(n1416) );
  INVX2 U1494 ( .A(n493), .Y(n1418) );
  XOR2X1 U1495 ( .A(a[10]), .B(n1683), .Y(n34) );
  XNOR2X1 U1496 ( .A(n1669), .B(n983), .Y(n898) );
  INVX4 U1497 ( .A(n1419), .Y(n983) );
  INVX4 U1498 ( .A(n1651), .Y(n1652) );
  INVX4 U1499 ( .A(n1433), .Y(n1419) );
  BUFX2 U1500 ( .A(n1684), .Y(n1438) );
  XNOR2X1 U1501 ( .A(n1406), .B(n1421), .Y(n921) );
  AND2X2 U1502 ( .A(n1400), .B(n40), .Y(n1422) );
  AND2X2 U1503 ( .A(n1400), .B(n40), .Y(n1423) );
  NOR2X1 U1504 ( .A(n197), .B(n202), .Y(n1424) );
  INVX1 U1505 ( .A(n218), .Y(n312) );
  INVX2 U1506 ( .A(n1425), .Y(n1426) );
  INVX8 U1507 ( .A(n1427), .Y(n1428) );
  INVX2 U1508 ( .A(n1429), .Y(n1430) );
  BUFX2 U1509 ( .A(n527), .Y(n1431) );
  NOR2X1 U1510 ( .A(n472), .B(n457), .Y(n1432) );
  INVX8 U1511 ( .A(n1433), .Y(n1434) );
  BUFX4 U1512 ( .A(n1191), .Y(n1436) );
  INVX2 U1513 ( .A(n454), .Y(n455) );
  NOR2X1 U1514 ( .A(n1251), .B(n427), .Y(n1441) );
  XNOR2X1 U1515 ( .A(n1655), .B(n984), .Y(n922) );
  INVX4 U1516 ( .A(n940), .Y(n1655) );
  XNOR2X1 U1517 ( .A(n1662), .B(n1466), .Y(n1442) );
  XNOR2X1 U1518 ( .A(n13), .B(a[6]), .Y(n22) );
  INVX1 U1519 ( .A(n737), .Y(n1443) );
  INVX1 U1520 ( .A(n1443), .Y(n1444) );
  BUFX2 U1521 ( .A(n163), .Y(n1445) );
  INVX2 U1522 ( .A(n164), .Y(n1449) );
  XOR2X1 U1523 ( .A(n1407), .B(a[8]), .Y(n1450) );
  INVX1 U1524 ( .A(n209), .Y(n1451) );
  INVX1 U1525 ( .A(n314), .Y(n1452) );
  INVX4 U1526 ( .A(n1369), .Y(n1453) );
  INVX8 U1527 ( .A(n1453), .Y(n1454) );
  NOR2X1 U1528 ( .A(n412), .B(n401), .Y(n1455) );
  XNOR2X1 U1529 ( .A(n1682), .B(a[8]), .Y(n1456) );
  INVX4 U1530 ( .A(n1554), .Y(n1616) );
  NAND3X1 U1531 ( .A(n1523), .B(n1524), .C(n1525), .Y(n1457) );
  BUFX2 U1532 ( .A(n266), .Y(n1458) );
  AOI21X1 U1533 ( .A(n230), .B(n1272), .C(n223), .Y(n1459) );
  INVX8 U1534 ( .A(n1653), .Y(n1654) );
  INVX2 U1535 ( .A(n1648), .Y(n1460) );
  BUFX2 U1536 ( .A(n536), .Y(n1461) );
  INVX8 U1537 ( .A(n1685), .Y(n1463) );
  BUFX2 U1538 ( .A(n1082), .Y(n1464) );
  BUFX4 U1539 ( .A(n1676), .Y(n1466) );
  INVX8 U1540 ( .A(n1655), .Y(n1656) );
  INVX2 U1541 ( .A(n1183), .Y(n229) );
  INVX1 U1542 ( .A(n287), .Y(n326) );
  AND2X2 U1543 ( .A(n1690), .B(n1238), .Y(n631) );
  INVX4 U1544 ( .A(n1621), .Y(n1623) );
  BUFX2 U1545 ( .A(n289), .Y(n1467) );
  INVX8 U1546 ( .A(n1624), .Y(n1625) );
  INVX2 U1547 ( .A(n34), .Y(n1624) );
  XOR2X1 U1548 ( .A(n611), .B(n692), .Y(n1468) );
  XOR2X1 U1549 ( .A(n1468), .B(n648), .Y(n495) );
  XOR2X1 U1550 ( .A(n1511), .B(n506), .Y(n1469) );
  XOR2X1 U1551 ( .A(n1469), .B(n1171), .Y(n491) );
  NAND2X1 U1552 ( .A(n1476), .B(n1386), .Y(n1470) );
  NAND2X1 U1553 ( .A(n1476), .B(n648), .Y(n1471) );
  NAND2X1 U1554 ( .A(n1386), .B(n648), .Y(n1472) );
  NAND3X1 U1555 ( .A(n1470), .B(n1471), .C(n1472), .Y(n494) );
  NAND2X1 U1556 ( .A(n1511), .B(n506), .Y(n1473) );
  NAND2X1 U1557 ( .A(n1511), .B(n495), .Y(n1474) );
  NAND2X1 U1558 ( .A(n506), .B(n495), .Y(n1475) );
  NAND3X1 U1559 ( .A(n1473), .B(n1474), .C(n1475), .Y(n490) );
  BUFX2 U1560 ( .A(n692), .Y(n1476) );
  BUFX2 U1561 ( .A(n57), .Y(n1477) );
  NAND2X1 U1562 ( .A(n1379), .B(n659), .Y(n1479) );
  NAND2X1 U1563 ( .A(n1379), .B(n723), .Y(n1480) );
  NAND2X1 U1564 ( .A(n659), .B(n1187), .Y(n1481) );
  NAND3X1 U1565 ( .A(n1480), .B(n1479), .C(n1481), .Y(n484) );
  NAND2X1 U1566 ( .A(n1483), .B(n1482), .Y(n675) );
  INVX2 U1567 ( .A(n57), .Y(n1637) );
  INVX2 U1568 ( .A(n933), .Y(n1552) );
  XOR2X1 U1569 ( .A(n737), .B(n689), .Y(n1486) );
  XOR2X1 U1570 ( .A(n1486), .B(n470), .Y(n449) );
  NAND2X1 U1571 ( .A(n470), .B(n689), .Y(n1487) );
  NAND2X1 U1572 ( .A(n470), .B(n1444), .Y(n1488) );
  NAND2X1 U1573 ( .A(n737), .B(n689), .Y(n1489) );
  NAND3X1 U1574 ( .A(n1488), .B(n1487), .C(n1489), .Y(n448) );
  XOR2X1 U1575 ( .A(n717), .B(n578), .Y(n1490) );
  XOR2X1 U1576 ( .A(n575), .B(n1490), .Y(n573) );
  NAND2X1 U1577 ( .A(n575), .B(n717), .Y(n1491) );
  NAND2X1 U1578 ( .A(n575), .B(n578), .Y(n1492) );
  NAND2X1 U1579 ( .A(n717), .B(n578), .Y(n1493) );
  NAND3X1 U1580 ( .A(n1492), .B(n1491), .C(n1493), .Y(n572) );
  NAND2X1 U1581 ( .A(n1431), .B(n1461), .Y(n1494) );
  NAND2X1 U1582 ( .A(n1431), .B(n529), .Y(n1495) );
  NAND2X1 U1583 ( .A(n1461), .B(n529), .Y(n1496) );
  NAND3X1 U1584 ( .A(n1495), .B(n1494), .C(n1496), .Y(n524) );
  INVX4 U1585 ( .A(n1557), .Y(n1633) );
  BUFX2 U1586 ( .A(n899), .Y(n1497) );
  XOR2X1 U1587 ( .A(n377), .B(n683), .Y(n1498) );
  XOR2X1 U1588 ( .A(n1498), .B(n386), .Y(n373) );
  XOR2X1 U1589 ( .A(n375), .B(n384), .Y(n1499) );
  XOR2X1 U1590 ( .A(n1499), .B(n373), .Y(n371) );
  NAND2X1 U1591 ( .A(n377), .B(n683), .Y(n1500) );
  NAND2X1 U1592 ( .A(n377), .B(n386), .Y(n1501) );
  NAND2X1 U1593 ( .A(n683), .B(n386), .Y(n1502) );
  NAND3X1 U1594 ( .A(n1500), .B(n1501), .C(n1502), .Y(n372) );
  NAND2X1 U1595 ( .A(n375), .B(n384), .Y(n1503) );
  NAND2X1 U1596 ( .A(n375), .B(n373), .Y(n1504) );
  NAND2X1 U1597 ( .A(n384), .B(n373), .Y(n1505) );
  NAND3X1 U1598 ( .A(n1503), .B(n1504), .C(n1505), .Y(n370) );
  XOR2X1 U1599 ( .A(n398), .B(n655), .Y(n1506) );
  XOR2X1 U1600 ( .A(n668), .B(n1506), .Y(n387) );
  NAND2X1 U1601 ( .A(n668), .B(n398), .Y(n1507) );
  NAND2X1 U1602 ( .A(n668), .B(n655), .Y(n1508) );
  NAND2X1 U1603 ( .A(n1074), .B(n655), .Y(n1509) );
  NAND3X1 U1604 ( .A(n1508), .B(n1507), .C(n1509), .Y(n386) );
  INVX2 U1605 ( .A(n508), .Y(n1510) );
  INVX4 U1606 ( .A(n1510), .Y(n1511) );
  XOR2X1 U1607 ( .A(n1073), .B(n483), .Y(n1512) );
  XOR2X1 U1608 ( .A(n1179), .B(n1512), .Y(n477) );
  NAND2X1 U1609 ( .A(n481), .B(n494), .Y(n1513) );
  NAND2X1 U1610 ( .A(n483), .B(n481), .Y(n1514) );
  NAND2X1 U1611 ( .A(n1073), .B(n483), .Y(n1515) );
  NAND3X1 U1612 ( .A(n1514), .B(n1515), .C(n1513), .Y(n476) );
  XOR2X1 U1613 ( .A(n433), .B(n446), .Y(n1516) );
  NAND2X1 U1614 ( .A(n433), .B(n446), .Y(n1517) );
  NAND2X1 U1615 ( .A(n446), .B(n444), .Y(n1518) );
  NAND2X1 U1616 ( .A(n433), .B(n444), .Y(n1519) );
  NAND3X1 U1617 ( .A(n1518), .B(n1519), .C(n1517), .Y(n428) );
  NAND2X1 U1618 ( .A(n431), .B(n442), .Y(n1520) );
  NAND2X1 U1619 ( .A(n429), .B(n431), .Y(n1521) );
  NAND2X1 U1620 ( .A(n429), .B(n442), .Y(n1522) );
  NAND3X1 U1621 ( .A(n1520), .B(n1521), .C(n1522), .Y(n426) );
  INVX4 U1622 ( .A(n1450), .Y(n1620) );
  NAND2X1 U1623 ( .A(n523), .B(n532), .Y(n1523) );
  NAND2X1 U1624 ( .A(n523), .B(n521), .Y(n1524) );
  NAND2X1 U1625 ( .A(n532), .B(n521), .Y(n1525) );
  NAND3X1 U1626 ( .A(n1523), .B(n1524), .C(n1525), .Y(n516) );
  NAND2X1 U1627 ( .A(n509), .B(n507), .Y(n1526) );
  NAND2X1 U1628 ( .A(n516), .B(n509), .Y(n1527) );
  NAND2X1 U1629 ( .A(n507), .B(n516), .Y(n1528) );
  NAND3X1 U1630 ( .A(n1526), .B(n1527), .C(n1528), .Y(n502) );
  INVX1 U1631 ( .A(n261), .Y(n260) );
  OR2X2 U1632 ( .A(n388), .B(n379), .Y(n1529) );
  INVX1 U1633 ( .A(n1529), .Y(n177) );
  INVX8 U1634 ( .A(n13), .Y(n1677) );
  XNOR2X1 U1635 ( .A(a[12]), .B(n31), .Y(n40) );
  INVX4 U1636 ( .A(n1448), .Y(n1615) );
  INVX1 U1637 ( .A(n248), .Y(n1531) );
  INVX1 U1638 ( .A(n1531), .Y(n1532) );
  BUFX2 U1639 ( .A(n277), .Y(n1533) );
  INVX1 U1640 ( .A(n1283), .Y(n1538) );
  INVX1 U1641 ( .A(n267), .Y(n321) );
  OR2X2 U1642 ( .A(n369), .B(n378), .Y(n1542) );
  OR2X2 U1643 ( .A(n341), .B(n346), .Y(n1543) );
  XOR2X1 U1644 ( .A(n420), .B(n422), .Y(n1539) );
  OR2X2 U1645 ( .A(n487), .B(n500), .Y(n1545) );
  OR2X2 U1646 ( .A(n524), .B(n513), .Y(n1546) );
  OR2X2 U1647 ( .A(n545), .B(n552), .Y(n1544) );
  XOR2X1 U1648 ( .A(n1410), .B(n80), .Y(product[9]) );
  OR2X2 U1649 ( .A(n333), .B(n336), .Y(n1547) );
  XOR2X1 U1650 ( .A(n1540), .B(n489), .Y(n487) );
  XOR2X1 U1651 ( .A(n502), .B(n491), .Y(n1540) );
  OR2X2 U1652 ( .A(n576), .B(n573), .Y(n1549) );
  OR2X2 U1653 ( .A(n566), .B(n561), .Y(n1550) );
  OR2X2 U1654 ( .A(n617), .B(n583), .Y(n1555) );
  INVX1 U1655 ( .A(n947), .Y(n1638) );
  INVX2 U1656 ( .A(n608), .Y(n975) );
  INVX2 U1657 ( .A(n946), .Y(n1641) );
  INVX2 U1658 ( .A(n945), .Y(n1644) );
  AND2X2 U1659 ( .A(n96), .B(n1449), .Y(n1541) );
  INVX4 U1660 ( .A(n1634), .Y(n1635) );
  OR2X1 U1661 ( .A(n331), .B(n332), .Y(n1548) );
  INVX2 U1662 ( .A(n601), .Y(n718) );
  INVX2 U1663 ( .A(n595), .Y(n682) );
  INVX2 U1664 ( .A(n1283), .Y(n1612) );
  INVX2 U1665 ( .A(n598), .Y(n700) );
  INVX2 U1666 ( .A(n592), .Y(n664) );
  INVX2 U1667 ( .A(n589), .Y(n650) );
  XNOR2X1 U1668 ( .A(n586), .B(n619), .Y(n330) );
  INVX2 U1669 ( .A(n607), .Y(n754) );
  XNOR2X1 U1670 ( .A(n1551), .B(n716), .Y(n569) );
  XNOR2X1 U1671 ( .A(n1098), .B(n732), .Y(n1551) );
  INVX2 U1672 ( .A(n604), .Y(n736) );
  XOR2X1 U1673 ( .A(n1552), .B(n1434), .Y(n897) );
  AND2X2 U1674 ( .A(n956), .B(n1612), .Y(n1553) );
  AND2X2 U1675 ( .A(n955), .B(n1191), .Y(n1554) );
  INVX2 U1676 ( .A(n1663), .Y(n1664) );
  OR2X1 U1677 ( .A(n770), .B(n618), .Y(n1556) );
  INVX2 U1678 ( .A(n1638), .Y(n1639) );
  INVX2 U1679 ( .A(n1638), .Y(n1640) );
  XOR2X1 U1680 ( .A(n1286), .B(n1222), .Y(n1585) );
  AND2X2 U1681 ( .A(n950), .B(n1387), .Y(n1557) );
  INVX2 U1682 ( .A(n1641), .Y(n1643) );
  INVX4 U1683 ( .A(n975), .Y(n1609) );
  AND2X2 U1684 ( .A(n1610), .B(n957), .Y(n1558) );
  NOR2X1 U1685 ( .A(n777), .B(n1635), .Y(n622) );
  NOR2X1 U1686 ( .A(n778), .B(n1635), .Y(n623) );
  NOR2X1 U1687 ( .A(n779), .B(n1635), .Y(n624) );
  NOR2X1 U1688 ( .A(n780), .B(n1635), .Y(n625) );
  NOR2X1 U1689 ( .A(n781), .B(n1635), .Y(n626) );
  NOR2X1 U1690 ( .A(n782), .B(n1635), .Y(n627) );
  NOR2X1 U1691 ( .A(n784), .B(n1636), .Y(n629) );
  NOR2X1 U1692 ( .A(n776), .B(n1635), .Y(n358) );
  NOR2X1 U1693 ( .A(n775), .B(n1635), .Y(n621) );
  NOR2X1 U1694 ( .A(n774), .B(n1635), .Y(n344) );
  NOR2X1 U1695 ( .A(n1635), .B(n773), .Y(n620) );
  NOR2X1 U1696 ( .A(n1635), .B(n772), .Y(n334) );
  NOR2X1 U1697 ( .A(n1635), .B(n771), .Y(n619) );
  NOR2X1 U1698 ( .A(n787), .B(n1636), .Y(n610) );
  INVX2 U1699 ( .A(n1657), .Y(n1658) );
  INVX2 U1700 ( .A(n1660), .Y(n1661) );
  INVX1 U1701 ( .A(n1082), .Y(n310) );
  XOR2X1 U1702 ( .A(n410), .B(n408), .Y(n1560) );
  XOR2X1 U1703 ( .A(n1560), .B(n397), .Y(n393) );
  NAND2X1 U1704 ( .A(n410), .B(n408), .Y(n1561) );
  NAND2X1 U1705 ( .A(n410), .B(n397), .Y(n1562) );
  NAND2X1 U1706 ( .A(n408), .B(n397), .Y(n1563) );
  NAND3X1 U1707 ( .A(n1561), .B(n1562), .C(n1563), .Y(n392) );
  XOR2X1 U1708 ( .A(n394), .B(n385), .Y(n1564) );
  XOR2X1 U1709 ( .A(n1564), .B(n1168), .Y(n381) );
  NAND2X1 U1710 ( .A(n394), .B(n385), .Y(n1565) );
  NAND2X1 U1711 ( .A(n394), .B(n392), .Y(n1566) );
  NAND2X1 U1712 ( .A(n385), .B(n392), .Y(n1567) );
  NAND3X1 U1713 ( .A(n1565), .B(n1566), .C(n1567), .Y(n380) );
  INVX4 U1714 ( .A(n52), .Y(n1634) );
  NAND2X1 U1715 ( .A(n1542), .B(n1529), .Y(n1568) );
  NAND2X1 U1716 ( .A(n422), .B(n420), .Y(n1569) );
  NAND2X1 U1717 ( .A(n422), .B(n409), .Y(n1570) );
  NAND2X1 U1718 ( .A(n420), .B(n409), .Y(n1571) );
  NAND3X1 U1719 ( .A(n1569), .B(n1570), .C(n1571), .Y(n404) );
  XOR2X1 U1720 ( .A(n395), .B(n406), .Y(n1572) );
  XOR2X1 U1721 ( .A(n1572), .B(n1066), .Y(n391) );
  NAND2X1 U1722 ( .A(n395), .B(n406), .Y(n1573) );
  NAND2X1 U1723 ( .A(n395), .B(n404), .Y(n1574) );
  NAND2X1 U1724 ( .A(n406), .B(n404), .Y(n1575) );
  NAND3X1 U1725 ( .A(n1573), .B(n1574), .C(n1575), .Y(n390) );
  XNOR2X1 U1726 ( .A(n1669), .B(n1222), .Y(n880) );
  INVX1 U1727 ( .A(n1600), .Y(n1601) );
  INVX4 U1728 ( .A(n936), .Y(n1665) );
  INVX2 U1729 ( .A(n1576), .Y(n733) );
  AOI22X1 U1730 ( .A(n1577), .B(n1578), .C(n1184), .D(n1448), .Y(n1576) );
  NAND2X1 U1731 ( .A(n497), .B(n1417), .Y(n1579) );
  NAND2X1 U1732 ( .A(n497), .B(n504), .Y(n1580) );
  NAND2X1 U1733 ( .A(n1417), .B(n504), .Y(n1581) );
  NAND3X1 U1734 ( .A(n1579), .B(n1580), .C(n1581), .Y(n488) );
  NAND2X1 U1735 ( .A(n1064), .B(n1188), .Y(n1582) );
  NAND2X1 U1736 ( .A(n1078), .B(n1064), .Y(n1583) );
  NAND2X1 U1737 ( .A(n1188), .B(n1091), .Y(n1584) );
  NAND3X1 U1738 ( .A(n1582), .B(n1583), .C(n1584), .Y(n486) );
  INVX1 U1739 ( .A(n163), .Y(n165) );
  INVX1 U1740 ( .A(n207), .Y(n209) );
  XOR2X1 U1741 ( .A(n1672), .B(n1679), .Y(n879) );
  INVX4 U1742 ( .A(n1669), .Y(n1671) );
  BUFX4 U1743 ( .A(n932), .Y(n1586) );
  BUFX2 U1744 ( .A(n932), .Y(n1587) );
  INVX2 U1745 ( .A(n1672), .Y(n1588) );
  INVX1 U1746 ( .A(n1455), .Y(n309) );
  INVX1 U1747 ( .A(n227), .Y(n314) );
  INVX1 U1748 ( .A(n293), .Y(n291) );
  INVX1 U1749 ( .A(n281), .Y(n279) );
  NAND2X1 U1750 ( .A(n644), .B(n704), .Y(n1589) );
  NAND2X1 U1751 ( .A(n644), .B(n628), .Y(n1590) );
  NAND2X1 U1752 ( .A(n704), .B(n628), .Y(n1591) );
  NAND3X1 U1753 ( .A(n1590), .B(n1589), .C(n1591), .Y(n436) );
  INVX4 U1754 ( .A(n25), .Y(n1683) );
  BUFX2 U1755 ( .A(n1588), .Y(n1592) );
  INVX1 U1756 ( .A(n1441), .Y(n311) );
  INVX2 U1757 ( .A(n933), .Y(n1672) );
  XOR2X1 U1758 ( .A(n615), .B(n574), .Y(n1593) );
  XOR2X1 U1759 ( .A(n569), .B(n1593), .Y(n567) );
  NAND2X1 U1760 ( .A(n732), .B(n571), .Y(n1594) );
  NAND2X1 U1761 ( .A(n732), .B(n716), .Y(n1595) );
  NAND2X1 U1762 ( .A(n1098), .B(n716), .Y(n1596) );
  NAND3X1 U1763 ( .A(n1594), .B(n1595), .C(n1596), .Y(n568) );
  NAND2X1 U1764 ( .A(n615), .B(n1068), .Y(n1597) );
  NAND2X1 U1765 ( .A(n569), .B(n615), .Y(n1598) );
  NAND2X1 U1766 ( .A(n569), .B(n1068), .Y(n1599) );
  NAND3X1 U1767 ( .A(n1597), .B(n1598), .C(n1599), .Y(n566) );
  XOR2X1 U1768 ( .A(n1377), .B(n1372), .Y(n920) );
  INVX2 U1769 ( .A(n474), .Y(n1600) );
  INVX2 U1770 ( .A(n1667), .Y(n1668) );
  INVX4 U1771 ( .A(n934), .Y(n1669) );
  INVX1 U1772 ( .A(n275), .Y(n323) );
  NAND2X1 U1773 ( .A(n478), .B(n1273), .Y(n1603) );
  NAND2X1 U1774 ( .A(n463), .B(n478), .Y(n1604) );
  NAND2X1 U1775 ( .A(n1273), .B(n463), .Y(n1605) );
  NAND3X1 U1776 ( .A(n1603), .B(n1604), .C(n1605), .Y(n458) );
  NAND2X1 U1777 ( .A(n461), .B(n1601), .Y(n1606) );
  NAND2X1 U1778 ( .A(n459), .B(n461), .Y(n1607) );
  NAND2X1 U1779 ( .A(n459), .B(n1601), .Y(n1608) );
  NAND3X1 U1780 ( .A(n1606), .B(n1607), .C(n1608), .Y(n456) );
  INVX4 U1781 ( .A(n19), .Y(n1680) );
  INVX1 U1782 ( .A(n224), .Y(n313) );
  INVX4 U1783 ( .A(n22), .Y(n1617) );
  INVX8 U1784 ( .A(n1609), .Y(n1610) );
  INVX8 U1785 ( .A(n1617), .Y(n1619) );
  INVX8 U1786 ( .A(n1665), .Y(n1666) );
  INVX2 U1787 ( .A(n88), .Y(product[1]) );
  INVX2 U1788 ( .A(n1462), .Y(n984) );
  INVX2 U1789 ( .A(n1463), .Y(n979) );
  INVX2 U1790 ( .A(n95), .Y(n93) );
  OAI22X1 U1791 ( .A(n914), .B(n1610), .C(n914), .D(n1611), .Y(n607) );
  OAI22X1 U1792 ( .A(n896), .B(n1612), .C(n896), .D(n1614), .Y(n604) );
  OAI22X1 U1793 ( .A(n878), .B(n1401), .C(n878), .D(n1060), .Y(n601) );
  OAI22X1 U1794 ( .A(n860), .B(n1618), .C(n860), .D(n1395), .Y(n598) );
  OAI22X1 U1795 ( .A(n842), .B(n1620), .C(n842), .D(n1623), .Y(n595) );
  OAI22X1 U1796 ( .A(n824), .B(n1440), .C(n824), .D(n1391), .Y(n592) );
  OAI22X1 U1797 ( .A(n806), .B(n1371), .C(n806), .D(n1408), .Y(n589) );
  OAI22X1 U1798 ( .A(n788), .B(n1454), .C(n788), .D(n1632), .Y(n586) );
  INVX2 U1799 ( .A(n50), .Y(n976) );
  INVX2 U1800 ( .A(n1074), .Y(n399) );
  INVX2 U1801 ( .A(n376), .Y(n377) );
  INVX2 U1802 ( .A(n358), .Y(n359) );
  INVX2 U1803 ( .A(n344), .Y(n345) );
  INVX2 U1804 ( .A(n334), .Y(n335) );
  INVX2 U1805 ( .A(n295), .Y(n328) );
  INVX2 U1806 ( .A(n286), .Y(n285) );
  INVX2 U1807 ( .A(n273), .Y(n271) );
  INVX2 U1808 ( .A(n254), .Y(n252) );
  INVX2 U1809 ( .A(n1285), .Y(n242) );
  INVX2 U1810 ( .A(n240), .Y(n316) );
  INVX2 U1811 ( .A(n236), .Y(n234) );
  INVX2 U1812 ( .A(n178), .Y(n180) );
  INVX2 U1813 ( .A(n173), .Y(n171) );
  INVX2 U1814 ( .A(n156), .Y(n158) );
  INVX2 U1815 ( .A(n142), .Y(n140) );
  INVX2 U1816 ( .A(n134), .Y(n136) );
  INVX2 U1817 ( .A(n133), .Y(n303) );
  INVX2 U1818 ( .A(n129), .Y(n127) );
  INVX2 U1819 ( .A(n120), .Y(n118) );
  INVX2 U1820 ( .A(n116), .Y(n114) );
  INVX2 U1821 ( .A(n108), .Y(n110) );
  INVX2 U1822 ( .A(n107), .Y(n301) );
  INVX2 U1823 ( .A(n103), .Y(n101) );
endmodule


module address_counter ( clk, n_rst, i_inc_raddr, i_inc_waddr, i_init_raddr, 
        i_init_waddr, i_img_width, i_img_height, o_raddr, o_waddr, o_r_ready, 
        o_w_ready, o_done );
  input [31:0] i_init_raddr;
  input [31:0] i_init_waddr;
  input [15:0] i_img_width;
  input [15:0] i_img_height;
  output [31:0] o_raddr;
  output [31:0] o_waddr;
  input clk, n_rst, i_inc_raddr, i_inc_waddr;
  output o_r_ready, o_w_ready, o_done;
  wire   n1507, n1508, n_done, N248, N249, N250, N251, N252, N253, N254, N255,
         N256, N257, N258, N259, N260, N261, N262, N263, N264, N265, N266,
         N267, N268, N269, N270, N271, N272, N273, N274, N275, N276, N277,
         N278, N279, N280, N281, N282, N283, N284, N285, N286, N287, N288,
         N289, N290, N291, N292, N293, N294, N295, N296, N297, N298, N299,
         N300, N301, N302, N303, N304, N305, N306, N307, N308, N309, N310,
         N311, N315, N316, N317, N318, N319, N320, N321, N322, N323, N324,
         N325, N326, N327, N328, N329, N330, N331, N332, N333, N334, N335,
         N336, N337, N338, N339, N340, N341, N342, N343, N344, N345, N346,
         N664, N665, N666, N667, N668, N669, N670, N671, N672, N673, N674,
         N675, N676, N677, N678, N679, N680, N681, N682, N683, N684, N685,
         N686, N687, N688, N689, N690, N691, N692, N693, N694, N695, N696,
         N697, N698, N699, N700, N701, N702, N703, N704, N705, N706, N707,
         N708, N709, N710, N711, N712, N713, N714, N715, N716, N717, N718,
         N719, N720, N721, N722, N723, N724, N725, N726, N727, N763, N764,
         N765, N766, N767, N768, N769, N770, N771, N772, N773, N774, N775,
         N776, N777, N778, N779, N780, N781, N782, N783, N784, N785, N786,
         N787, N788, N789, N790, N791, N792, N793, N794, n510, n522, n663,
         n664, n665, n682, n685, n686, n687, n723, n828, n864, n870, n871,
         n872, n873, n877, n878, n879, n880, n881, n883, n884, n885, n887,
         n888, n889, n890, n892, n893, n894, n895, n897, n919, n920, n921,
         n922, n923, n924, n925, n926, n1018, n1021, n1024, n1027, n1030,
         n1033, n1036, n1039, n1042, n1045, n1048, n1051, n1054, n1057, n1060,
         n1063, n1066, n1069, n1072, n1075, n1078, n1081, n1084, n1087, n1090,
         n1093, n1096, n1099, n1102, n1105, n1108, n1111, n1114, n1115, n1116,
         n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126,
         n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136,
         n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146,
         n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156,
         n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166,
         n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176,
         n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184, n1185, n1186,
         n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194, n1195, n1196,
         n1197, n1198, n1201, n1204, n1207, n1210, n1213, n1216, n1219, n1222,
         n1225, n1228, n1231, n1234, n1237, n1240, n1243, n1246, n1249, n1252,
         n1255, n1258, n1261, n1264, n1267, n1270, n1273, n1276, n1279, n1282,
         n1285, n1288, n1291, n1294, n1295, n1296, n1297, n1298, n1299, n1300,
         n1301, n1302, n1303, n1304, n1305, n1306, n1307, n1308, n1309, n1310,
         n1311, n1312, n1313, n1314, n1316, n1317, N99, N98, N97, N96, N95,
         N94, N93, N92, N91, N90, N89, N88, N70, N69, N68, N67, N66, N65, N64,
         N63, N62, N61, N60, N59, N58, N57, N56, N55, N54, N53, N52, N51, N50,
         N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, N39, N136, N135,
         N134, N133, N132, N131, N130, N129, N128, N127, N126, N125, N124,
         N123, N122, N121, N120, N119, N118, N117, N116, N115, N114, N113,
         N112, N111, N110, N109, N108, N107, N106, N105, N103, N102, N101,
         N100, n1, n2, n5, n6, n7, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n146,
         n147, n178, n179, n182, n184, n185, n187, n188, n190, n191, n193,
         n194, n196, n197, n199, n200, n202, n203, n205, n206, n208, n209,
         n211, n212, n214, n215, n217, n218, n220, n221, n223, n224, n226,
         n227, n229, n230, n232, n233, n235, n236, n238, n239, n241, n242,
         n244, n245, n247, n248, n250, n251, n253, n254, n256, n257, n259,
         n260, n262, n263, n264, n265, n266, n267, n299, n300, n325, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
         n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396,
         n397, n398, n399, n400, n401, n402, n403, n404, n405, n406, n407,
         n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418,
         n419, n420, n421, n422, n423, n424, n425, n426, n427, n428, n429,
         n430, n431, n432, n433, n434, n435, n436, n437, n438, n439, n440,
         n441, n442, n443, n444, n445, n446, n447, n448, n449, n450, n451,
         n452, n453, n454, n455, n456, n457, n458, n459, n460, n461, n462,
         n463, n464, n465, n466, n467, n468, n469, n470, n471, n472, n473,
         n474, n475, n476, n477, n478, n479, n480, n481, n482, n483, n484,
         n485, n486, n487, n488, n489, n490, n491, n492, n493, n494, n495,
         n496, n497, n498, n499, n500, n501, n502, n503, n504, n505, n506,
         n507, n508, n509, n511, n512, n513, n514, n515, n516, n517, n518,
         n519, n520, n521, n523, n524, n525, n526, n527, n528, n529, n530,
         n531, n532, n533, n534, n535, n536, n537, n538, n539, n540, n541,
         n542, n543, n544, n545, n546, n547, n548, n549, n550, n551, n552,
         n553, n554, n555, n556, n557, n558, n559, n560, n561, n562, n563,
         n564, n565, n566, n567, n568, n569, n570, n571, n572, n573, n574,
         n575, n576, n577, n578, n579, n580, n581, n582, n583, n584, n585,
         n586, n587, n588, n589, n590, n591, n592, n593, n594, n595, n596,
         n597, n598, n599, n600, n601, n602, n603, n604, n605, n606, n607,
         n608, n609, n610, n611, n612, n613, n614, n615, n616, n617, n618,
         n619, n620, n621, n622, n623, n624, n625, n626, n627, n628, n629,
         n630, n631, n632, n633, n634, n635, n636, n637, n638, n639, n640,
         n641, n642, n643, n644, n645, n646, n647, n648, n649, n650, n651,
         n652, n653, n654, n655, n656, n657, n658, n659, n660, n661, n662,
         n666, n667, n668, n669, n670, n671, n672, n673, n674, n675, n676,
         n677, n678, n679, n680, n681, n683, n684, n688, n689, n690, n691,
         n692, n693, n694, n695, n696, n697, n698, n699, n700, n701, n702,
         n703, n704, n705, n706, n707, n708, n709, n710, n711, n712, n713,
         n714, n715, n716, n717, n718, n719, n720, n721, n722, n724, n725,
         n726, n727, n728, n729, n730, n731, n732, n733, n734, n735, n736,
         n737, n738, n739, n740, n741, n742, n743, n744, n745, n746, n747,
         n748, n749, n750, n751, n752, n753, n754, n755, n756, n757, n758,
         n759, n760, n761, n762, n763, n764, n765, n766, n767, n768, n769,
         n770, n771, n772, n773, n774, n775, n776, n777, n778, n779, n780,
         n781, n782, n783, n784, n785, n786, n787, n788, n789, n790, n791,
         n792, n793, n794, n795, n796, n797, n798, n799, n800, n801, n802,
         n803, n804, n805, n806, n807, n808, n809, n810, n811, n812, n813,
         n814, n815, n816, n817, n818, n819, n820, n821, n822, n823, n824,
         n825, n826, n827, n829, n830, n831, n832, n833, n834, n835, n836,
         n837, n838, n839, n840, n841, n842, n843, n844, n845, n846, n847,
         n848, n849, n850, n851, n852, n853, n854, n855, n856, n857, n858,
         n859, n860, n861, n862, n863, n865, n866, n867, n868, n869, n874,
         n875, n876, n882, n886, n891, n896, n898, n899, n900, n901, n902,
         n903, n904, n905, n906, n907, n908, n909, n910, n911, n912, n913,
         n914, n915, n916, n917, n918, n927, n928, n929, n930, n931, n932,
         n933, n934, n935, n936, n937, n938, n939, n940, n941, n942, n943,
         n944, n945, n946, n947, n948, n949, n950, n951, n952, n953, n954,
         n955, n956, n957, n958, n959, n960, n961, n962, n963, n964, n965,
         n966, n967, n968, n969, n970, n971, n972, n973, n974, n975, n976,
         n977, n978, n979, n980, n981, n982, n983, n984, n985, n986, n987,
         n988, n989, n990, n991, n992, n993, n994, n995, n996, n997, n998,
         n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008,
         n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1019,
         n1020, n1022, n1023, n1025, n1026, n1028, n1029, n1031, n1032, n1034,
         n1035, n1037, n1038, n1040, n1041, n1043, n1044, n1046, n1047, n1049,
         n1050, n1052, n1053, n1055, n1056, n1058, n1059, n1061, n1062, n1064,
         n1065, n1067, n1068, n1070, n1071, n1073, n1074, n1076, n1077, n1079,
         n1080, n1082, n1083, n1085, n1086, n1088, n1089, n1091, n1092, n1094,
         n1095, n1097, n1098, n1100, n1101, n1103, n1104, n1106, n1107, n1109,
         n1110, n1112, n1113, n1199, n1200, n1202, n1203, n1205, n1206, n1208,
         n1209, n1211, n1212, n1214, n1215, n1217, n1218, n1220, n1221, n1223,
         n1224, n1226, n1227, n1229, n1230, n1232, n1233, n1235, n1236, n1238,
         n1239, n1241, n1242, n1244, n1245, n1247, n1248, n1250, n1251, n1253,
         n1254, n1256, n1257, n1259, n1260, n1262, n1263, n1265, n1266, n1268,
         n1269, n1271, n1272, n1274, n1275, n1277, n1278, n1280, n1281, n1283,
         n1284, n1286, n1287, n1289, n1290, n1292, n1293, n1315, n1318, n1319,
         n1320, n1321, n1322, n1323, n1324, n1325, n1326, n1327, n1328, n1329,
         n1330, n1331, n1332, n1333, n1334, n1335, n1336, n1337, n1338, n1339,
         n1340, n1341, n1342, n1343, n1344, n1345, n1346, n1347, n1348, n1349,
         n1350, n1351, n1352, n1353, n1354, n1355, n1356, n1357, n1358, n1359,
         n1360, n1361, n1362, n1363, n1364, n1365, n1366, n1367, n1368, n1369,
         n1370, n1371, n1372, n1373, n1374, n1375, n1376, n1377, n1378, n1379,
         n1380, n1381, n1382, n1383, n1384, n1385, n1386, n1387, n1388, n1389,
         n1390, n1391, n1392, n1393, n1394, n1395, n1396, n1397, n1398, n1399,
         n1400, n1401, n1402, n1403, n1404, n1405, n1406, n1407, n1408, n1409,
         n1410, n1411, n1412, n1413, n1414, n1415, n1416, n1417, n1418, n1419,
         n1420, n1421, n1422, n1423, n1424, n1425, n1426, n1427, n1428, n1429,
         n1430, n1431, n1432, n1433, n1434, n1435, n1436, n1437, n1438, n1439,
         n1440, n1441, n1442, n1443, n1444, n1445, n1446, n1447, n1448, n1449,
         n1450, n1451, n1452, n1453, n1454, n1455, n1456, n1457, n1458, n1459,
         n1460, n1461, n1462, n1463, n1464, n1465, n1466, n1467, n1468, n1469,
         n1470, n1471, n1472, n1473, n1474, n1475, n1476, n1477, n1478, n1479,
         n1480, n1481, n1482, n1483, n1484, n1485, n1486, n1487, n1488, n1489,
         n1490, n1491, n1492, n1493, n1494, n1495, n1496, n1497, n1498, n1499,
         n1500, n1501, n1502, n1503, n1504;
  wire   [15:0] boundary_1;
  wire   [15:0] boundary_2;
  wire   [31:0] boundary_4;
  wire   [31:0] rrowpt;
  wire   [31:0] rcolpt;
  wire   [31:0] wpt;
  wire   [2:0] rct1;
  wire   [2:0] rct2;
  wire   [15:0] rct3;
  wire   [1:0] wct1;
  wire   [1:0] wct2;
  wire   [15:0] wct3;
  wire   [4:0] curr_read_state;
  wire   [4:0] curr_write_state;
  wire   [4:0] next_write_state;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30, SYNOPSYS_UNCONNECTED__31;
  assign boundary_1[0] = i_img_width[0];
  assign boundary_2[1] = i_img_width[1];
  assign N88 = i_img_height[0];

  DFFSR \curr_read_state_reg[0]  ( .D(n1317), .CLK(clk), .R(n260), .S(1'b1), 
        .Q(curr_read_state[0]) );
  DFFSR \rct2_reg[2]  ( .D(n1294), .CLK(clk), .R(n251), .S(1'b1), .Q(rct2[2])
         );
  DFFSR \curr_read_state_reg[2]  ( .D(n35), .CLK(clk), .R(n251), .S(1'b1), .Q(
        curr_read_state[2]) );
  DFFSR o_r_ready_reg ( .D(n1330), .CLK(clk), .R(n251), .S(1'b1), .Q(o_r_ready) );
  DFFSR \curr_read_state_reg[1]  ( .D(n1316), .CLK(clk), .R(n251), .S(1'b1), 
        .Q(curr_read_state[1]) );
  DFFSR \curr_read_state_reg[3]  ( .D(n1314), .CLK(clk), .R(n251), .S(1'b1), 
        .Q(curr_read_state[3]) );
  DFFSR \rct2_reg[0]  ( .D(n1295), .CLK(clk), .R(1'b1), .S(n_rst), .Q(rct2[0])
         );
  DFFSR \rct2_reg[1]  ( .D(n1336), .CLK(clk), .R(n251), .S(1'b1), .Q(rct2[1])
         );
  DFFSR \rct3_reg[0]  ( .D(n1313), .CLK(clk), .R(1'b1), .S(n_rst), .Q(rct3[0])
         );
  DFFSR \rct3_reg[1]  ( .D(n1312), .CLK(clk), .R(1'b1), .S(n266), .Q(rct3[1])
         );
  DFFSR \rct3_reg[2]  ( .D(n1311), .CLK(clk), .R(n251), .S(1'b1), .Q(rct3[2])
         );
  DFFSR \rct3_reg[3]  ( .D(n1310), .CLK(clk), .R(n251), .S(1'b1), .Q(rct3[3])
         );
  DFFSR \rct3_reg[4]  ( .D(n1309), .CLK(clk), .R(n251), .S(1'b1), .Q(rct3[4])
         );
  DFFSR \rct3_reg[5]  ( .D(n1308), .CLK(clk), .R(n251), .S(1'b1), .Q(rct3[5])
         );
  DFFSR \rct3_reg[6]  ( .D(n1307), .CLK(clk), .R(n251), .S(1'b1), .Q(rct3[6])
         );
  DFFSR \rct3_reg[7]  ( .D(n1306), .CLK(clk), .R(n253), .S(1'b1), .Q(rct3[7])
         );
  DFFSR \rct3_reg[8]  ( .D(n1305), .CLK(clk), .R(n253), .S(1'b1), .Q(rct3[8])
         );
  DFFSR \rct3_reg[9]  ( .D(n1304), .CLK(clk), .R(n253), .S(1'b1), .Q(rct3[9])
         );
  DFFSR \rct3_reg[10]  ( .D(n1303), .CLK(clk), .R(n253), .S(1'b1), .Q(rct3[10]) );
  DFFSR \rct3_reg[11]  ( .D(n1302), .CLK(clk), .R(n253), .S(1'b1), .Q(rct3[11]) );
  DFFSR \rct3_reg[12]  ( .D(n1301), .CLK(clk), .R(n253), .S(1'b1), .Q(rct3[12]) );
  DFFSR \rct3_reg[13]  ( .D(n1300), .CLK(clk), .R(n253), .S(1'b1), .Q(rct3[13]) );
  DFFSR \rct3_reg[14]  ( .D(n1299), .CLK(clk), .R(n253), .S(1'b1), .Q(rct3[14]) );
  DFFSR \rct3_reg[15]  ( .D(n1298), .CLK(clk), .R(n253), .S(1'b1), .Q(rct3[15]) );
  DFFSR \rct1_reg[0]  ( .D(n1297), .CLK(clk), .R(n253), .S(1'b1), .Q(rct1[0])
         );
  DFFSR \rct1_reg[1]  ( .D(n1335), .CLK(clk), .R(n253), .S(1'b1), .Q(rct1[1])
         );
  DFFSR \rct1_reg[2]  ( .D(n1296), .CLK(clk), .R(n253), .S(1'b1), .Q(rct1[2])
         );
  DFFSR \rcolpt_reg[31]  ( .D(n1166), .CLK(clk), .R(n254), .S(1'b1), .Q(
        rcolpt[31]) );
  DFFSR \o_raddr_reg[31]  ( .D(n1198), .CLK(clk), .R(n1378), .S(n1377), .Q(
        o_raddr[31]) );
  DFFSR \rcolpt_reg[0]  ( .D(n1197), .CLK(clk), .R(n254), .S(1'b1), .Q(
        rcolpt[0]) );
  DFFSR \rcolpt_reg[1]  ( .D(n1196), .CLK(clk), .R(n254), .S(1'b1), .Q(
        rcolpt[1]) );
  DFFSR \rcolpt_reg[2]  ( .D(n1195), .CLK(clk), .R(n254), .S(1'b1), .Q(
        rcolpt[2]) );
  DFFSR \rcolpt_reg[3]  ( .D(n1194), .CLK(clk), .R(n254), .S(1'b1), .Q(
        rcolpt[3]) );
  DFFSR \rcolpt_reg[4]  ( .D(n1193), .CLK(clk), .R(n254), .S(1'b1), .Q(
        rcolpt[4]) );
  DFFSR \rcolpt_reg[5]  ( .D(n1192), .CLK(clk), .R(n254), .S(1'b1), .Q(
        rcolpt[5]) );
  DFFSR \rcolpt_reg[6]  ( .D(n1191), .CLK(clk), .R(n254), .S(1'b1), .Q(
        rcolpt[6]) );
  DFFSR \rcolpt_reg[7]  ( .D(n1190), .CLK(clk), .R(n254), .S(1'b1), .Q(
        rcolpt[7]) );
  DFFSR \rcolpt_reg[8]  ( .D(n1189), .CLK(clk), .R(n254), .S(1'b1), .Q(
        rcolpt[8]) );
  DFFSR \rcolpt_reg[9]  ( .D(n1188), .CLK(clk), .R(n254), .S(1'b1), .Q(
        rcolpt[9]) );
  DFFSR \rcolpt_reg[10]  ( .D(n1187), .CLK(clk), .R(n254), .S(1'b1), .Q(
        rcolpt[10]) );
  DFFSR \rcolpt_reg[11]  ( .D(n1186), .CLK(clk), .R(n256), .S(1'b1), .Q(
        rcolpt[11]) );
  DFFSR \rcolpt_reg[12]  ( .D(n1185), .CLK(clk), .R(n256), .S(1'b1), .Q(
        rcolpt[12]) );
  DFFSR \rcolpt_reg[13]  ( .D(n1184), .CLK(clk), .R(n256), .S(1'b1), .Q(
        rcolpt[13]) );
  DFFSR \rcolpt_reg[14]  ( .D(n1183), .CLK(clk), .R(n256), .S(1'b1), .Q(
        rcolpt[14]) );
  DFFSR \rcolpt_reg[15]  ( .D(n1182), .CLK(clk), .R(n256), .S(1'b1), .Q(
        rcolpt[15]) );
  DFFSR \rcolpt_reg[16]  ( .D(n1181), .CLK(clk), .R(n256), .S(1'b1), .Q(
        rcolpt[16]) );
  DFFSR \rcolpt_reg[17]  ( .D(n1180), .CLK(clk), .R(n256), .S(1'b1), .Q(
        rcolpt[17]) );
  DFFSR \rcolpt_reg[18]  ( .D(n1179), .CLK(clk), .R(n256), .S(1'b1), .Q(
        rcolpt[18]) );
  DFFSR \rcolpt_reg[19]  ( .D(n1178), .CLK(clk), .R(n256), .S(1'b1), .Q(
        rcolpt[19]) );
  DFFSR \rcolpt_reg[20]  ( .D(n1177), .CLK(clk), .R(n256), .S(1'b1), .Q(
        rcolpt[20]) );
  DFFSR \rcolpt_reg[21]  ( .D(n1176), .CLK(clk), .R(n256), .S(1'b1), .Q(
        rcolpt[21]) );
  DFFSR \rcolpt_reg[22]  ( .D(n1175), .CLK(clk), .R(n256), .S(1'b1), .Q(
        rcolpt[22]) );
  DFFSR \rcolpt_reg[23]  ( .D(n1174), .CLK(clk), .R(n257), .S(1'b1), .Q(
        rcolpt[23]) );
  DFFSR \rcolpt_reg[24]  ( .D(n1173), .CLK(clk), .R(n257), .S(1'b1), .Q(
        rcolpt[24]) );
  DFFSR \rcolpt_reg[25]  ( .D(n1172), .CLK(clk), .R(n257), .S(1'b1), .Q(
        rcolpt[25]) );
  DFFSR \rcolpt_reg[26]  ( .D(n1171), .CLK(clk), .R(n257), .S(1'b1), .Q(
        rcolpt[26]) );
  DFFSR \rcolpt_reg[27]  ( .D(n1170), .CLK(clk), .R(n257), .S(1'b1), .Q(
        rcolpt[27]) );
  DFFSR \rcolpt_reg[28]  ( .D(n1169), .CLK(clk), .R(n257), .S(1'b1), .Q(
        rcolpt[28]) );
  DFFSR \rcolpt_reg[29]  ( .D(n1168), .CLK(clk), .R(n257), .S(1'b1), .Q(
        rcolpt[29]) );
  DFFSR \rcolpt_reg[30]  ( .D(n1167), .CLK(clk), .R(n257), .S(1'b1), .Q(
        rcolpt[30]) );
  DFFSR \o_raddr_reg[30]  ( .D(n1201), .CLK(clk), .R(n1380), .S(n1379), .Q(
        o_raddr[30]) );
  DFFSR \o_raddr_reg[29]  ( .D(n1204), .CLK(clk), .R(n1382), .S(n1381), .Q(
        o_raddr[29]) );
  DFFSR \o_raddr_reg[0]  ( .D(n1291), .CLK(clk), .R(n1440), .S(n1439), .Q(
        o_raddr[0]) );
  DFFSR \rrowpt_reg[0]  ( .D(n1337), .CLK(clk), .R(n257), .S(1'b1), .Q(
        rrowpt[0]) );
  DFFSR \o_raddr_reg[1]  ( .D(n1288), .CLK(clk), .R(n1438), .S(n1437), .Q(
        o_raddr[1]) );
  DFFSR \rrowpt_reg[1]  ( .D(n1338), .CLK(clk), .R(n257), .S(1'b1), .Q(
        rrowpt[1]) );
  DFFSR \o_raddr_reg[2]  ( .D(n1285), .CLK(clk), .R(n1436), .S(n1435), .Q(
        o_raddr[2]) );
  DFFSR \rrowpt_reg[2]  ( .D(n1339), .CLK(clk), .R(n257), .S(1'b1), .Q(
        rrowpt[2]) );
  DFFSR \o_raddr_reg[3]  ( .D(n1282), .CLK(clk), .R(n1434), .S(n1433), .Q(
        o_raddr[3]) );
  DFFSR \rrowpt_reg[3]  ( .D(n1340), .CLK(clk), .R(n257), .S(1'b1), .Q(
        rrowpt[3]) );
  DFFSR \o_raddr_reg[4]  ( .D(n1279), .CLK(clk), .R(n1432), .S(n1431), .Q(
        o_raddr[4]) );
  DFFSR \rrowpt_reg[4]  ( .D(n1341), .CLK(clk), .R(n259), .S(1'b1), .Q(
        rrowpt[4]) );
  DFFSR \o_raddr_reg[5]  ( .D(n1276), .CLK(clk), .R(n1430), .S(n1429), .Q(
        o_raddr[5]) );
  DFFSR \rrowpt_reg[5]  ( .D(n1342), .CLK(clk), .R(n259), .S(1'b1), .Q(
        rrowpt[5]) );
  DFFSR \o_raddr_reg[6]  ( .D(n1273), .CLK(clk), .R(n1428), .S(n1427), .Q(
        o_raddr[6]) );
  DFFSR \rrowpt_reg[6]  ( .D(n1343), .CLK(clk), .R(n259), .S(1'b1), .Q(
        rrowpt[6]) );
  DFFSR \o_raddr_reg[7]  ( .D(n1270), .CLK(clk), .R(n1426), .S(n1425), .Q(
        o_raddr[7]) );
  DFFSR \rrowpt_reg[7]  ( .D(n1344), .CLK(clk), .R(n259), .S(1'b1), .Q(
        rrowpt[7]) );
  DFFSR \o_raddr_reg[8]  ( .D(n1267), .CLK(clk), .R(n1424), .S(n1423), .Q(
        o_raddr[8]) );
  DFFSR \rrowpt_reg[8]  ( .D(n1345), .CLK(clk), .R(n259), .S(1'b1), .Q(
        rrowpt[8]) );
  DFFSR \o_raddr_reg[9]  ( .D(n1264), .CLK(clk), .R(n1422), .S(n1421), .Q(
        o_raddr[9]) );
  DFFSR \rrowpt_reg[9]  ( .D(n1346), .CLK(clk), .R(n259), .S(1'b1), .Q(
        rrowpt[9]) );
  DFFSR \o_raddr_reg[10]  ( .D(n1261), .CLK(clk), .R(n1420), .S(n1419), .Q(
        o_raddr[10]) );
  DFFSR \rrowpt_reg[10]  ( .D(n1347), .CLK(clk), .R(n259), .S(1'b1), .Q(
        rrowpt[10]) );
  DFFSR \o_raddr_reg[11]  ( .D(n1258), .CLK(clk), .R(n1418), .S(n1417), .Q(
        o_raddr[11]) );
  DFFSR \rrowpt_reg[11]  ( .D(n1348), .CLK(clk), .R(n259), .S(1'b1), .Q(
        rrowpt[11]) );
  DFFSR \o_raddr_reg[12]  ( .D(n1255), .CLK(clk), .R(n1416), .S(n1415), .Q(
        o_raddr[12]) );
  DFFSR \rrowpt_reg[12]  ( .D(n1349), .CLK(clk), .R(n259), .S(1'b1), .Q(
        rrowpt[12]) );
  DFFSR \o_raddr_reg[13]  ( .D(n1252), .CLK(clk), .R(n1414), .S(n1413), .Q(
        o_raddr[13]) );
  DFFSR \rrowpt_reg[13]  ( .D(n1350), .CLK(clk), .R(n259), .S(1'b1), .Q(
        rrowpt[13]) );
  DFFSR \o_raddr_reg[14]  ( .D(n1249), .CLK(clk), .R(n1412), .S(n1411), .Q(
        o_raddr[14]) );
  DFFSR \rrowpt_reg[14]  ( .D(n1351), .CLK(clk), .R(n259), .S(1'b1), .Q(
        rrowpt[14]) );
  DFFSR \o_raddr_reg[15]  ( .D(n1246), .CLK(clk), .R(n1410), .S(n1409), .Q(
        o_raddr[15]) );
  DFFSR \rrowpt_reg[15]  ( .D(n1352), .CLK(clk), .R(n259), .S(1'b1), .Q(
        rrowpt[15]) );
  DFFSR \o_raddr_reg[16]  ( .D(n1243), .CLK(clk), .R(n1408), .S(n1407), .Q(
        o_raddr[16]) );
  DFFSR \rrowpt_reg[16]  ( .D(n1353), .CLK(clk), .R(n260), .S(1'b1), .Q(
        rrowpt[16]) );
  DFFSR \o_raddr_reg[17]  ( .D(n1240), .CLK(clk), .R(n1406), .S(n1405), .Q(
        o_raddr[17]) );
  DFFSR \rrowpt_reg[17]  ( .D(n1354), .CLK(clk), .R(n260), .S(1'b1), .Q(
        rrowpt[17]) );
  DFFSR \o_raddr_reg[18]  ( .D(n1237), .CLK(clk), .R(n1404), .S(n1403), .Q(
        o_raddr[18]) );
  DFFSR \rrowpt_reg[18]  ( .D(n1355), .CLK(clk), .R(n260), .S(1'b1), .Q(
        rrowpt[18]) );
  DFFSR \o_raddr_reg[19]  ( .D(n1234), .CLK(clk), .R(n1402), .S(n1401), .Q(
        o_raddr[19]) );
  DFFSR \rrowpt_reg[19]  ( .D(n1356), .CLK(clk), .R(n260), .S(1'b1), .Q(
        rrowpt[19]) );
  DFFSR \o_raddr_reg[20]  ( .D(n1231), .CLK(clk), .R(n1400), .S(n1399), .Q(
        o_raddr[20]) );
  DFFSR \rrowpt_reg[20]  ( .D(n1357), .CLK(clk), .R(n260), .S(1'b1), .Q(
        rrowpt[20]) );
  DFFSR \o_raddr_reg[21]  ( .D(n1228), .CLK(clk), .R(n1398), .S(n1397), .Q(
        o_raddr[21]) );
  DFFSR \rrowpt_reg[21]  ( .D(n1358), .CLK(clk), .R(n260), .S(1'b1), .Q(
        rrowpt[21]) );
  DFFSR \o_raddr_reg[22]  ( .D(n1225), .CLK(clk), .R(n1396), .S(n1395), .Q(
        o_raddr[22]) );
  DFFSR \rrowpt_reg[22]  ( .D(n1359), .CLK(clk), .R(n260), .S(1'b1), .Q(
        rrowpt[22]) );
  DFFSR \o_raddr_reg[23]  ( .D(n1222), .CLK(clk), .R(n1394), .S(n1393), .Q(
        o_raddr[23]) );
  DFFSR \rrowpt_reg[23]  ( .D(n1360), .CLK(clk), .R(n260), .S(1'b1), .Q(
        rrowpt[23]) );
  DFFSR \o_raddr_reg[24]  ( .D(n1219), .CLK(clk), .R(n1392), .S(n1391), .Q(
        o_raddr[24]) );
  DFFSR \rrowpt_reg[24]  ( .D(n1361), .CLK(clk), .R(n260), .S(1'b1), .Q(
        rrowpt[24]) );
  DFFSR \o_raddr_reg[25]  ( .D(n1216), .CLK(clk), .R(n1390), .S(n1389), .Q(
        o_raddr[25]) );
  DFFSR \rrowpt_reg[25]  ( .D(n1362), .CLK(clk), .R(n260), .S(1'b1), .Q(
        rrowpt[25]) );
  DFFSR \o_raddr_reg[26]  ( .D(n1213), .CLK(clk), .R(n1388), .S(n1387), .Q(
        o_raddr[26]) );
  DFFSR \rrowpt_reg[26]  ( .D(n1363), .CLK(clk), .R(n260), .S(1'b1), .Q(
        rrowpt[26]) );
  DFFSR \o_raddr_reg[27]  ( .D(n1210), .CLK(clk), .R(n1386), .S(n1385), .Q(
        o_raddr[27]) );
  DFFSR \rrowpt_reg[27]  ( .D(n1364), .CLK(clk), .R(n262), .S(1'b1), .Q(
        rrowpt[27]) );
  DFFSR \o_raddr_reg[28]  ( .D(n1207), .CLK(clk), .R(n1384), .S(n1383), .Q(
        o_raddr[28]) );
  DFFSR \rrowpt_reg[28]  ( .D(n1365), .CLK(clk), .R(n262), .S(1'b1), .Q(
        rrowpt[28]) );
  DFFSR \rrowpt_reg[29]  ( .D(n1366), .CLK(clk), .R(n262), .S(1'b1), .Q(
        rrowpt[29]) );
  DFFSR \rrowpt_reg[30]  ( .D(n1367), .CLK(clk), .R(n262), .S(1'b1), .Q(
        rrowpt[30]) );
  DFFSR \rrowpt_reg[31]  ( .D(n1368), .CLK(clk), .R(n262), .S(1'b1), .Q(
        rrowpt[31]) );
  DFFSR \curr_write_state_reg[0]  ( .D(next_write_state[0]), .CLK(clk), .R(
        1'b1), .S(n_rst), .Q(curr_write_state[0]) );
  DFFSR \curr_write_state_reg[4]  ( .D(next_write_state[4]), .CLK(clk), .R(
        n262), .S(1'b1), .Q(curr_write_state[4]) );
  DFFSR \wct3_reg[15]  ( .D(n1148), .CLK(clk), .R(n262), .S(1'b1), .Q(wct3[15]) );
  DFFSR \curr_write_state_reg[3]  ( .D(next_write_state[3]), .CLK(clk), .R(
        1'b1), .S(n266), .Q(curr_write_state[3]) );
  DFFSR \wct3_reg[0]  ( .D(n1163), .CLK(clk), .R(1'b1), .S(n_rst), .Q(wct3[0])
         );
  DFFSR \wct3_reg[1]  ( .D(n1162), .CLK(clk), .R(1'b1), .S(n266), .Q(wct3[1])
         );
  DFFSR \wct3_reg[2]  ( .D(n1161), .CLK(clk), .R(n262), .S(1'b1), .Q(wct3[2])
         );
  DFFSR \wct3_reg[3]  ( .D(n1160), .CLK(clk), .R(n262), .S(1'b1), .Q(wct3[3])
         );
  DFFSR \wct3_reg[4]  ( .D(n1159), .CLK(clk), .R(n262), .S(1'b1), .Q(wct3[4])
         );
  DFFSR \wct3_reg[5]  ( .D(n1158), .CLK(clk), .R(n263), .S(1'b1), .Q(wct3[5])
         );
  DFFSR \wct3_reg[6]  ( .D(n1157), .CLK(clk), .R(n262), .S(1'b1), .Q(wct3[6])
         );
  DFFSR \wct3_reg[7]  ( .D(n1156), .CLK(clk), .R(n263), .S(1'b1), .Q(wct3[7])
         );
  DFFSR \wct3_reg[8]  ( .D(n1155), .CLK(clk), .R(n263), .S(1'b1), .Q(wct3[8])
         );
  DFFSR \wct3_reg[9]  ( .D(n1154), .CLK(clk), .R(n263), .S(1'b1), .Q(wct3[9])
         );
  DFFSR \wct3_reg[10]  ( .D(n1153), .CLK(clk), .R(n263), .S(1'b1), .Q(wct3[10]) );
  DFFSR \wct3_reg[11]  ( .D(n1152), .CLK(clk), .R(n262), .S(1'b1), .Q(wct3[11]) );
  DFFSR \wct3_reg[12]  ( .D(n1151), .CLK(clk), .R(n263), .S(1'b1), .Q(wct3[12]) );
  DFFSR \wct3_reg[13]  ( .D(n1150), .CLK(clk), .R(n263), .S(1'b1), .Q(wct3[13]) );
  DFFSR \wct3_reg[14]  ( .D(n1149), .CLK(clk), .R(n263), .S(1'b1), .Q(wct3[14]) );
  DFFSR o_w_ready_reg ( .D(n843), .CLK(clk), .R(n263), .S(1'b1), .Q(o_w_ready)
         );
  DFFSR \curr_write_state_reg[1]  ( .D(next_write_state[1]), .CLK(clk), .R(
        n263), .S(1'b1), .Q(curr_write_state[1]) );
  DFFSR \curr_write_state_reg[2]  ( .D(next_write_state[2]), .CLK(clk), .R(
        n264), .S(1'b1), .Q(curr_write_state[2]) );
  DFFSR \wct1_reg[0]  ( .D(n1147), .CLK(clk), .R(n263), .S(1'b1), .Q(wct1[0])
         );
  DFFSR \wct1_reg[1]  ( .D(n1146), .CLK(clk), .R(n264), .S(1'b1), .Q(wct1[1])
         );
  DFFSR \wct2_reg[0]  ( .D(n1165), .CLK(clk), .R(1'b1), .S(n_rst), .Q(wct2[0])
         );
  DFFSR \wct2_reg[1]  ( .D(n1164), .CLK(clk), .R(n264), .S(1'b1), .Q(wct2[1])
         );
  DFFSR \o_waddr_reg[31]  ( .D(n1018), .CLK(clk), .R(n1504), .S(n1503), .Q(
        o_waddr[31]) );
  DFFSR \wpt_reg[0]  ( .D(n1145), .CLK(clk), .R(n264), .S(1'b1), .Q(wpt[0]) );
  DFFSR \wpt_reg[1]  ( .D(n1144), .CLK(clk), .R(n264), .S(1'b1), .Q(wpt[1]) );
  DFFSR \wpt_reg[2]  ( .D(n1143), .CLK(clk), .R(n264), .S(1'b1), .Q(wpt[2]) );
  DFFSR \wpt_reg[3]  ( .D(n1142), .CLK(clk), .R(n264), .S(1'b1), .Q(wpt[3]) );
  DFFSR \wpt_reg[4]  ( .D(n1141), .CLK(clk), .R(n263), .S(1'b1), .Q(wpt[4]) );
  DFFSR \wpt_reg[5]  ( .D(n1140), .CLK(clk), .R(n264), .S(1'b1), .Q(wpt[5]) );
  DFFSR \wpt_reg[6]  ( .D(n1139), .CLK(clk), .R(n264), .S(1'b1), .Q(wpt[6]) );
  DFFSR \wpt_reg[7]  ( .D(n1138), .CLK(clk), .R(n265), .S(1'b1), .Q(wpt[7]) );
  DFFSR \wpt_reg[8]  ( .D(n1137), .CLK(clk), .R(n264), .S(1'b1), .Q(wpt[8]) );
  DFFSR \wpt_reg[9]  ( .D(n1136), .CLK(clk), .R(n265), .S(1'b1), .Q(wpt[9]) );
  DFFSR \wpt_reg[10]  ( .D(n1135), .CLK(clk), .R(n264), .S(1'b1), .Q(wpt[10])
         );
  DFFSR \wpt_reg[11]  ( .D(n1134), .CLK(clk), .R(n265), .S(1'b1), .Q(wpt[11])
         );
  DFFSR \wpt_reg[12]  ( .D(n1133), .CLK(clk), .R(n265), .S(1'b1), .Q(wpt[12])
         );
  DFFSR \wpt_reg[13]  ( .D(n1132), .CLK(clk), .R(n265), .S(1'b1), .Q(wpt[13])
         );
  DFFSR \wpt_reg[14]  ( .D(n1131), .CLK(clk), .R(n265), .S(1'b1), .Q(wpt[14])
         );
  DFFSR \wpt_reg[15]  ( .D(n1130), .CLK(clk), .R(n265), .S(1'b1), .Q(wpt[15])
         );
  DFFSR \wpt_reg[16]  ( .D(n1129), .CLK(clk), .R(n265), .S(1'b1), .Q(wpt[16])
         );
  DFFSR \wpt_reg[17]  ( .D(n1128), .CLK(clk), .R(n265), .S(1'b1), .Q(wpt[17])
         );
  DFFSR \wpt_reg[18]  ( .D(n1127), .CLK(clk), .R(n265), .S(1'b1), .Q(wpt[18])
         );
  DFFSR \wpt_reg[19]  ( .D(n1126), .CLK(clk), .R(n264), .S(1'b1), .Q(wpt[19])
         );
  DFFSR \wpt_reg[20]  ( .D(n1125), .CLK(clk), .R(n265), .S(1'b1), .Q(wpt[20])
         );
  DFFSR \wpt_reg[21]  ( .D(n1124), .CLK(clk), .R(n266), .S(1'b1), .Q(wpt[21])
         );
  DFFSR \wpt_reg[22]  ( .D(n1123), .CLK(clk), .R(n265), .S(1'b1), .Q(wpt[22])
         );
  DFFSR \wpt_reg[23]  ( .D(n1122), .CLK(clk), .R(n266), .S(1'b1), .Q(wpt[23])
         );
  DFFSR \wpt_reg[24]  ( .D(n1121), .CLK(clk), .R(n266), .S(1'b1), .Q(wpt[24])
         );
  DFFSR \wpt_reg[25]  ( .D(n1120), .CLK(clk), .R(n266), .S(1'b1), .Q(wpt[25])
         );
  DFFSR \wpt_reg[26]  ( .D(n1119), .CLK(clk), .R(n266), .S(1'b1), .Q(wpt[26])
         );
  DFFSR \wpt_reg[27]  ( .D(n1118), .CLK(clk), .R(n266), .S(1'b1), .Q(wpt[27])
         );
  DFFSR \wpt_reg[28]  ( .D(n1117), .CLK(clk), .R(n266), .S(1'b1), .Q(wpt[28])
         );
  DFFSR \wpt_reg[29]  ( .D(n1116), .CLK(clk), .R(n266), .S(1'b1), .Q(wpt[29])
         );
  DFFSR \wpt_reg[30]  ( .D(n1115), .CLK(clk), .R(n266), .S(1'b1), .Q(wpt[30])
         );
  DFFSR \o_waddr_reg[30]  ( .D(n1021), .CLK(clk), .R(n1502), .S(n1501), .Q(
        o_waddr[30]) );
  DFFSR \o_waddr_reg[29]  ( .D(n1024), .CLK(clk), .R(n1500), .S(n1499), .Q(
        o_waddr[29]) );
  DFFSR \o_waddr_reg[0]  ( .D(n1111), .CLK(clk), .R(n1454), .S(n1453), .Q(
        n1508) );
  DFFSR \o_waddr_reg[1]  ( .D(n1108), .CLK(clk), .R(n1456), .S(n1455), .Q(
        o_waddr[1]) );
  DFFSR \o_waddr_reg[2]  ( .D(n1105), .CLK(clk), .R(n1458), .S(n1457), .Q(
        o_waddr[2]) );
  DFFSR \o_waddr_reg[3]  ( .D(n1102), .CLK(clk), .R(n1460), .S(n1459), .Q(
        o_waddr[3]) );
  DFFSR \o_waddr_reg[4]  ( .D(n1099), .CLK(clk), .R(n1462), .S(n1461), .Q(
        o_waddr[4]) );
  DFFSR \o_waddr_reg[5]  ( .D(n1096), .CLK(clk), .R(n1464), .S(n1463), .Q(
        o_waddr[5]) );
  DFFSR \o_waddr_reg[6]  ( .D(n1093), .CLK(clk), .R(n1442), .S(n1441), .Q(
        o_waddr[6]) );
  DFFSR \o_waddr_reg[7]  ( .D(n1090), .CLK(clk), .R(n1466), .S(n1465), .Q(
        o_waddr[7]) );
  DFFSR \o_waddr_reg[8]  ( .D(n1087), .CLK(clk), .R(n1444), .S(n1443), .Q(
        o_waddr[8]) );
  DFFSR \o_waddr_reg[9]  ( .D(n1084), .CLK(clk), .R(n1468), .S(n1467), .Q(
        o_waddr[9]) );
  DFFSR \o_waddr_reg[10]  ( .D(n1081), .CLK(clk), .R(n1446), .S(n1445), .Q(
        o_waddr[10]) );
  DFFSR \o_waddr_reg[11]  ( .D(n1078), .CLK(clk), .R(n1448), .S(n1447), .Q(
        o_waddr[11]) );
  DFFSR \o_waddr_reg[12]  ( .D(n1075), .CLK(clk), .R(n1470), .S(n1469), .Q(
        o_waddr[12]) );
  DFFSR \o_waddr_reg[13]  ( .D(n1072), .CLK(clk), .R(n1472), .S(n1471), .Q(
        o_waddr[13]) );
  DFFSR \o_waddr_reg[14]  ( .D(n1069), .CLK(clk), .R(n1474), .S(n1473), .Q(
        o_waddr[14]) );
  DFFSR \o_waddr_reg[15]  ( .D(n1066), .CLK(clk), .R(n1476), .S(n1475), .Q(
        o_waddr[15]) );
  DFFSR \o_waddr_reg[16]  ( .D(n1063), .CLK(clk), .R(n1450), .S(n1449), .Q(
        o_waddr[16]) );
  DFFSR \o_waddr_reg[17]  ( .D(n1060), .CLK(clk), .R(n1452), .S(n1451), .Q(
        o_waddr[17]) );
  DFFSR \o_waddr_reg[18]  ( .D(n1057), .CLK(clk), .R(n1478), .S(n1477), .Q(
        o_waddr[18]) );
  DFFSR \o_waddr_reg[19]  ( .D(n1054), .CLK(clk), .R(n1480), .S(n1479), .Q(
        o_waddr[19]) );
  DFFSR \o_waddr_reg[20]  ( .D(n1051), .CLK(clk), .R(n1482), .S(n1481), .Q(
        o_waddr[20]) );
  DFFSR \o_waddr_reg[21]  ( .D(n1048), .CLK(clk), .R(n1484), .S(n1483), .Q(
        o_waddr[21]) );
  DFFSR \o_waddr_reg[22]  ( .D(n1045), .CLK(clk), .R(n1486), .S(n1485), .Q(
        o_waddr[22]) );
  DFFSR \o_waddr_reg[23]  ( .D(n1042), .CLK(clk), .R(n1488), .S(n1487), .Q(
        o_waddr[23]) );
  DFFSR \o_waddr_reg[24]  ( .D(n1039), .CLK(clk), .R(n1490), .S(n1489), .Q(
        o_waddr[24]) );
  DFFSR \o_waddr_reg[25]  ( .D(n1036), .CLK(clk), .R(n1492), .S(n1491), .Q(
        o_waddr[25]) );
  DFFSR \o_waddr_reg[26]  ( .D(n1033), .CLK(clk), .R(n1494), .S(n1493), .Q(
        o_waddr[26]) );
  DFFSR \o_waddr_reg[27]  ( .D(n1030), .CLK(clk), .R(n1496), .S(n1495), .Q(
        o_waddr[27]) );
  DFFSR \o_waddr_reg[28]  ( .D(n1027), .CLK(clk), .R(n1498), .S(n1497), .Q(
        n1507) );
  DFFSR \wpt_reg[31]  ( .D(n1114), .CLK(clk), .R(n266), .S(1'b1), .Q(wpt[31])
         );
  DFFSR o_done_reg ( .D(n_done), .CLK(clk), .R(n251), .S(1'b1), .Q(o_done) );
  NOR2X1 U785 ( .A(n247), .B(n1324), .Y(n663) );
  OAI21X1 U787 ( .A(n1326), .B(n1324), .C(n664), .Y(n665) );
  OAI21X1 U825 ( .A(n685), .B(n1333), .C(n686), .Y(n1164) );
  NAND3X1 U826 ( .A(n1325), .B(n1333), .C(wct2[0]), .Y(n686) );
  AOI21X1 U827 ( .A(n664), .B(n510), .C(n522), .Y(n685) );
  NAND2X1 U828 ( .A(n664), .B(n687), .Y(n1165) );
  AOI21X1 U829 ( .A(n510), .B(wct2[0]), .C(n522), .Y(n687) );
  NOR2X1 U832 ( .A(n244), .B(n682), .Y(n664) );
  NOR2X1 U1105 ( .A(rct3[6]), .B(rct3[5]), .Y(n871) );
  NOR2X1 U1106 ( .A(rct3[9]), .B(rct3[8]), .Y(n870) );
  NOR2X1 U1107 ( .A(n872), .B(n873), .Y(n864) );
  NAND2X1 U1108 ( .A(n1370), .B(n1328), .Y(n873) );
  NAND3X1 U1114 ( .A(rct1[0]), .B(n1375), .C(n877), .Y(n723) );
  NOR2X1 U1115 ( .A(rct2[1]), .B(rct1[2]), .Y(n877) );
  NAND3X1 U1117 ( .A(n30), .B(n1321), .C(rct2[1]), .Y(n879) );
  AOI21X1 U1118 ( .A(n1329), .B(n1371), .C(n880), .Y(n878) );
  AOI22X1 U1119 ( .A(n880), .B(rct2[1]), .C(n1371), .D(n30), .Y(n881) );
  OAI21X1 U1121 ( .A(rct2[0]), .B(n883), .C(n884), .Y(n880) );
  XNOR2X1 U1124 ( .A(rct2[0]), .B(n1329), .Y(n885) );
  OAI21X1 U1126 ( .A(n887), .B(n1376), .C(n888), .Y(n1296) );
  NAND3X1 U1127 ( .A(n31), .B(n1376), .C(rct1[1]), .Y(n888) );
  AOI21X1 U1128 ( .A(n1331), .B(n1375), .C(n889), .Y(n887) );
  AOI22X1 U1129 ( .A(n889), .B(rct1[1]), .C(n1375), .D(n31), .Y(n890) );
  OAI21X1 U1131 ( .A(rct1[0]), .B(n892), .C(n32), .Y(n889) );
  OAI21X1 U1132 ( .A(n32), .B(n1373), .C(n893), .Y(n1297) );
  OAI21X1 U1134 ( .A(rct1[0]), .B(n892), .C(n828), .Y(n895) );
  NAND2X1 U1136 ( .A(n892), .B(n828), .Y(n897) );
  OAI22X1 U1174 ( .A(n1332), .B(n921), .C(n1374), .D(n892), .Y(n920) );
  OAI21X1 U1175 ( .A(n1369), .B(n883), .C(n206), .Y(n919) );
  OAI21X1 U1178 ( .A(n883), .B(n923), .C(n206), .Y(n926) );
  NAND3X1 U1179 ( .A(rct2[0]), .B(n1371), .C(rct2[2]), .Y(n923) );
  NOR2X1 U1180 ( .A(n892), .B(n922), .Y(n925) );
  NAND3X1 U1181 ( .A(rct1[0]), .B(n1375), .C(rct1[2]), .Y(n922) );
  address_counter_DW01_dec_0 sub_1_root_sub_0_root_add_79 ( .A(i_init_waddr), 
        .SUM({N70, N69, N68, N67, N66, N65, N64, N63, N62, N61, N60, N59, N58, 
        N57, N56, N55, N54, N53, N52, N51, N50, N49, N48, N47, N46, N45, N44, 
        N43, N42, N41, N40, N39}) );
  address_counter_DW01_add_10 add_387 ( .A({o_waddr[31:1], n1508}), .B({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1}), .CI(1'b0), .SUM({N794, 
        N793, N792, N791, N790, N789, N788, N787, N786, N785, N784, N783, N782, 
        N781, N780, N779, N778, N777, N776, N775, N774, N773, N772, N771, N770, 
        N769, N768, N767, N766, N765, N764, N763}) );
  address_counter_DW01_add_11 add_257 ( .A(o_raddr), .B({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b1, 1'b1}), .CI(1'b0), .SUM({N346, N345, N344, 
        N343, N342, N341, N340, N339, N338, N337, N336, N335, N334, N333, N332, 
        N331, N330, N329, N328, N327, N326, N325, N324, N323, N322, N321, N320, 
        N319, N318, N317, N316, N315}) );
  address_counter_DW01_add_9 add_368 ( .A({o_waddr[31:1], n1508}), .B({n239, 
        n239, n239, n239, n239, n239, n239, n239, n239, n239, n239, n239, n239, 
        n239, n239, n239, boundary_2[15:3], n82, n102, boundary_1[0]}), .CI(
        1'b0), .SUM({N727, N726, N725, N724, N723, N722, N721, N720, N719, 
        N718, N717, N716, N715, N714, N713, N712, N711, N710, N709, N708, N707, 
        N706, N705, N704, N703, N702, N701, N700, N699, N698, N697, N696}) );
  address_counter_DW01_add_8 add_238 ( .A(o_raddr), .B({n239, n239, n239, n239, 
        n239, n239, n239, n239, n239, n239, n239, n239, n239, n239, n239, n239, 
        boundary_2[15:3], n82, n102, boundary_1[0]}), .CI(1'b0), .SUM({N311, 
        N310, N309, N308, N307, N306, N305, N304, N303, N302, N301, N300, N299, 
        N298, N297, N296, N295, N294, N293, N292, N291, N290, N289, N288, N287, 
        N286, N285, N284, N283, N282, N281, N280}) );
  address_counter_DW01_inc_2 add_234 ( .A(o_raddr), .SUM({N279, N278, N277, 
        N276, N275, N274, N273, N272, N271, N270, N269, N268, N267, N266, N265, 
        N264, N263, N262, N261, N260, N259, N258, N257, N256, N255, N254, N253, 
        N252, N251, N250, N249, N248}) );
  address_counter_DW01_inc_3 r419 ( .A({o_waddr[31:1], n1508}), .SUM({N695, 
        N694, N693, N692, N691, N690, N689, N688, N687, N686, N685, N684, N683, 
        N682, N681, N680, N679, N678, N677, N676, N675, N674, N673, N672, N671, 
        N670, N669, N668, N667, N666, N665, N664}) );
  address_counter_DW01_add_12 add_0_root_sub_0_root_add_79 ( .A({N70, N69, N68, 
        N67, N66, N65, N64, N63, N62, N61, N60, N59, N58, N57, N56, N55, N54, 
        N53, N52, N51, N50, N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, 
        N39}), .B({N136, N135, N134, N133, N132, N131, N130, N129, N128, N127, 
        N126, N125, N124, N123, N122, N121, N120, N119, N118, N117, N116, N115, 
        N114, N113, N112, N111, N110, N109, N108, N107, N106, N105}), .CI(1'b0), .SUM(boundary_4) );
  address_counter_DW_mult_uns_2 mult_79 ( .a({n94, n94, n94, n94, n94, n94, 
        n94, n94, n94, n94, n94, n94, n94, n94, n94, n70, boundary_1[15], n67, 
        n105, n179, boundary_1[11:9], n85, boundary_1[7:6], n191, 
        boundary_1[4], n58, boundary_1[2], n7, boundary_1[0]}), .b({n1323, 
        n1323, n1323, n1323, n1323, n1323, n1323, n1323, n1323, n1323, n1323, 
        n1323, n1323, n1323, n1323, n1323, N103, N102, N101, N100, N99, N98, 
        N97, N96, N95, N94, N93, N92, N91, N90, N89, N88}), .product({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30, SYNOPSYS_UNCONNECTED__31, N136, N135, N134, 
        N133, N132, N131, N130, N129, N128, N127, N126, N125, N124, N123, N122, 
        N121, N120, N119, N118, N117, N116, N115, N114, N113, N112, N111, N110, 
        N109, N108, N107, N106, N105}) );
  OR2X1 U5 ( .A(n495), .B(n53), .Y(n59) );
  INVX4 U6 ( .A(n93), .Y(n70) );
  INVX1 U7 ( .A(i_img_width[6]), .Y(n1) );
  INVX1 U8 ( .A(i_img_width[6]), .Y(n798) );
  INVX1 U9 ( .A(n789), .Y(n2) );
  XOR2X1 U10 ( .A(boundary_4[29]), .B(n5), .Y(n866) );
  INVX8 U13 ( .A(n19), .Y(n5) );
  AND2X2 U14 ( .A(n6), .B(n15), .Y(n87) );
  AND2X1 U15 ( .A(n81), .B(n108), .Y(n6) );
  INVX1 U18 ( .A(n212), .Y(n7) );
  INVX2 U19 ( .A(n212), .Y(boundary_1[1]) );
  XOR2X1 U20 ( .A(boundary_4[24]), .B(n10), .Y(n818) );
  INVX8 U21 ( .A(n11), .Y(n10) );
  INVX8 U22 ( .A(n23), .Y(n11) );
  AND2X2 U23 ( .A(n65), .B(n76), .Y(n12) );
  INVX1 U24 ( .A(n12), .Y(n14) );
  AND2X1 U25 ( .A(n65), .B(n486), .Y(n13) );
  NOR2X1 U26 ( .A(n88), .B(i_img_height[9]), .Y(n15) );
  NOR2X1 U27 ( .A(n99), .B(n42), .Y(n16) );
  AND2X2 U28 ( .A(n54), .B(n16), .Y(n17) );
  BUFX4 U29 ( .A(n24), .Y(n101) );
  INVX2 U30 ( .A(n497), .Y(n42) );
  BUFX2 U31 ( .A(n28), .Y(n18) );
  INVX8 U32 ( .A(n20), .Y(n19) );
  INVX8 U33 ( .A(o_waddr[29]), .Y(n20) );
  INVX2 U34 ( .A(n22), .Y(n90) );
  AND2X2 U35 ( .A(n13), .B(n76), .Y(n21) );
  INVX2 U36 ( .A(i_img_height[9]), .Y(n486) );
  INVX2 U37 ( .A(n211), .Y(n24) );
  BUFX2 U38 ( .A(n87), .Y(n197) );
  INVX2 U39 ( .A(n394), .Y(n22) );
  INVX2 U40 ( .A(n394), .Y(n438) );
  INVX8 U41 ( .A(o_waddr[24]), .Y(n23) );
  INVX1 U42 ( .A(n436), .Y(n95) );
  INVX2 U43 ( .A(n211), .Y(n212) );
  INVX2 U44 ( .A(n56), .Y(n57) );
  INVX2 U45 ( .A(n36), .Y(o_waddr[28]) );
  AND2X2 U46 ( .A(curr_read_state[1]), .B(n344), .Y(n25) );
  AND2X2 U47 ( .A(curr_read_state[0]), .B(curr_read_state[2]), .Y(n26) );
  AND2X2 U48 ( .A(n344), .B(n349), .Y(n27) );
  INVX2 U49 ( .A(i_img_width[3]), .Y(n61) );
  AND2X2 U50 ( .A(n61), .B(n1334), .Y(n28) );
  INVX2 U51 ( .A(i_img_height[10]), .Y(n109) );
  AND2X2 U52 ( .A(n633), .B(n503), .Y(n29) );
  AND2X2 U53 ( .A(rct2[0]), .B(n1329), .Y(n30) );
  AND2X2 U54 ( .A(rct1[0]), .B(n1331), .Y(n31) );
  OR2X2 U55 ( .A(n894), .B(n897), .Y(n32) );
  AND2X2 U56 ( .A(curr_read_state[0]), .B(n1332), .Y(n33) );
  AND2X2 U57 ( .A(curr_write_state[2]), .B(curr_write_state[1]), .Y(n34) );
  OR2X2 U58 ( .A(n919), .B(n920), .Y(n35) );
  INVX1 U59 ( .A(n1507), .Y(n36) );
  NAND3X1 U60 ( .A(n789), .B(n792), .C(n786), .Y(n38) );
  INVX4 U61 ( .A(i_img_width[10]), .Y(n786) );
  INVX1 U62 ( .A(n87), .Y(n39) );
  INVX1 U63 ( .A(n39), .Y(n40) );
  NOR3X1 U64 ( .A(n147), .B(n389), .C(n113), .Y(n41) );
  OR2X2 U65 ( .A(i_img_width[4]), .B(i_img_width[5]), .Y(n147) );
  INVX2 U66 ( .A(i_img_height[2]), .Y(n497) );
  INVX1 U67 ( .A(n73), .Y(n74) );
  OR2X2 U68 ( .A(n73), .B(i_img_height[13]), .Y(n56) );
  OR2X2 U69 ( .A(i_img_height[11]), .B(i_img_height[12]), .Y(n73) );
  INVX1 U70 ( .A(n211), .Y(n43) );
  INVX1 U71 ( .A(i_img_width[6]), .Y(n64) );
  INVX1 U72 ( .A(n436), .Y(n44) );
  NOR2X1 U73 ( .A(i_img_height[5]), .B(i_img_height[6]), .Y(n45) );
  INVX1 U74 ( .A(i_img_height[5]), .Y(n492) );
  INVX1 U106 ( .A(i_img_height[6]), .Y(n490) );
  BUFX2 U107 ( .A(n804), .Y(n46) );
  INVX4 U138 ( .A(n111), .Y(n179) );
  INVX2 U139 ( .A(n476), .Y(n47) );
  INVX1 U141 ( .A(i_img_width[5]), .Y(n48) );
  INVX1 U142 ( .A(i_img_width[5]), .Y(n801) );
  INVX2 U144 ( .A(n50), .Y(n199) );
  BUFX2 U145 ( .A(n22), .Y(n49) );
  NAND2X1 U147 ( .A(n57), .B(n197), .Y(n50) );
  INVX1 U148 ( .A(n493), .Y(n53) );
  NOR2X1 U150 ( .A(n53), .B(n97), .Y(n54) );
  INVX2 U151 ( .A(n496), .Y(n97) );
  BUFX2 U153 ( .A(n102), .Y(n55) );
  NAND2X1 U154 ( .A(n57), .B(n197), .Y(n476) );
  OAI21X1 U156 ( .A(n102), .B(n806), .C(n368), .Y(n58) );
  INVX1 U157 ( .A(i_img_width[3]), .Y(n60) );
  INVX2 U159 ( .A(i_img_width[2]), .Y(n62) );
  INVX1 U160 ( .A(i_img_width[2]), .Y(n1334) );
  INVX4 U162 ( .A(n455), .Y(n67) );
  BUFX2 U163 ( .A(n795), .Y(n63) );
  AND2X1 U165 ( .A(n487), .B(n488), .Y(n65) );
  NAND2X1 U166 ( .A(n76), .B(n488), .Y(n66) );
  INVX1 U168 ( .A(n66), .Y(n196) );
  INVX1 U169 ( .A(i_img_height[7]), .Y(n488) );
  INVX1 U171 ( .A(n455), .Y(boundary_1[14]) );
  AND2X2 U172 ( .A(n795), .B(n64), .Y(n92) );
  BUFX2 U174 ( .A(n416), .Y(n68) );
  BUFX2 U175 ( .A(n85), .Y(n69) );
  BUFX2 U177 ( .A(n412), .Y(n71) );
  AND2X2 U178 ( .A(n17), .B(n492), .Y(n72) );
  NAND2X1 U180 ( .A(n74), .B(n40), .Y(n479) );
  INVX1 U181 ( .A(n2), .Y(n75) );
  INVX2 U183 ( .A(i_img_width[9]), .Y(n789) );
  AND2X2 U184 ( .A(n185), .B(n45), .Y(n76) );
  INVX1 U186 ( .A(n76), .Y(n489) );
  INVX2 U187 ( .A(n780), .Y(n112) );
  BUFX2 U189 ( .A(boundary_1[11]), .Y(n77) );
  BUFX2 U190 ( .A(boundary_1[10]), .Y(n78) );
  INVX1 U192 ( .A(n61), .Y(n79) );
  BUFX2 U193 ( .A(n76), .Y(n80) );
  NOR2X1 U195 ( .A(n182), .B(n184), .Y(n81) );
  OR2X2 U196 ( .A(i_img_height[2]), .B(i_img_height[1]), .Y(n182) );
  BUFX2 U198 ( .A(n62), .Y(n82) );
  INVX1 U199 ( .A(n419), .Y(n83) );
  BUFX2 U201 ( .A(boundary_1[2]), .Y(n84) );
  INVX1 U202 ( .A(boundary_1[6]), .Y(n591) );
  BUFX4 U204 ( .A(boundary_1[8]), .Y(n85) );
  BUFX2 U205 ( .A(boundary_1[4]), .Y(n86) );
  INVX1 U207 ( .A(n197), .Y(n484) );
  OR2X1 U208 ( .A(i_img_height[8]), .B(i_img_height[7]), .Y(n88) );
  INVX1 U210 ( .A(n792), .Y(n89) );
  INVX1 U211 ( .A(n417), .Y(n91) );
  INVX4 U213 ( .A(n1320), .Y(n93) );
  INVX8 U214 ( .A(n93), .Y(n94) );
  INVX2 U216 ( .A(n473), .Y(n1320) );
  INVX1 U217 ( .A(n44), .Y(n96) );
  INVX1 U219 ( .A(boundary_1[15]), .Y(n588) );
  INVX4 U220 ( .A(n110), .Y(boundary_1[11]) );
  INVX1 U222 ( .A(n400), .Y(n98) );
  BUFX2 U223 ( .A(i_img_height[1]), .Y(n99) );
  BUFX2 U224 ( .A(n454), .Y(n100) );
  BUFX4 U225 ( .A(n24), .Y(n102) );
  INVX1 U226 ( .A(n62), .Y(n103) );
  XOR2X1 U227 ( .A(boundary_4[28]), .B(n36), .Y(n819) );
  INVX2 U259 ( .A(n406), .Y(n405) );
  INVX1 U260 ( .A(n482), .Y(n481) );
  INVX1 U285 ( .A(i_img_height[12]), .Y(n480) );
  INVX1 U290 ( .A(n397), .Y(n104) );
  NAND2X1 U291 ( .A(n454), .B(n416), .Y(n105) );
  NAND2X1 U292 ( .A(n68), .B(n100), .Y(n106) );
  BUFX2 U293 ( .A(n191), .Y(n107) );
  AND2X1 U294 ( .A(n45), .B(n109), .Y(n108) );
  INVX1 U295 ( .A(n179), .Y(n584) );
  AND2X2 U296 ( .A(n396), .B(n406), .Y(n110) );
  AOI22X1 U297 ( .A(n780), .B(n405), .C(n406), .D(n112), .Y(n111) );
  INVX4 U298 ( .A(i_img_width[8]), .Y(n792) );
  INVX1 U299 ( .A(n58), .Y(n576) );
  NAND3X1 U300 ( .A(n789), .B(n792), .C(n786), .Y(n113) );
  BUFX2 U301 ( .A(n798), .Y(n114) );
  NOR3X1 U302 ( .A(n147), .B(n389), .C(n38), .Y(n146) );
  INVX1 U303 ( .A(n41), .Y(n395) );
  INVX1 U304 ( .A(n113), .Y(n433) );
  AND2X2 U305 ( .A(n104), .B(n789), .Y(n178) );
  INVX1 U306 ( .A(o_raddr[0]), .Y(n1283) );
  BUFX2 U307 ( .A(n1508), .Y(o_waddr[0]) );
  NOR2X1 U308 ( .A(n182), .B(n184), .Y(n185) );
  OR2X1 U309 ( .A(i_img_height[4]), .B(i_img_height[3]), .Y(n184) );
  OR2X2 U310 ( .A(wct3[0]), .B(wct3[1]), .Y(n514) );
  INVX2 U311 ( .A(n615), .Y(n221) );
  INVX2 U312 ( .A(n615), .Y(n220) );
  INVX2 U313 ( .A(n828), .Y(n235) );
  INVX2 U314 ( .A(n828), .Y(n233) );
  INVX2 U315 ( .A(n642), .Y(n244) );
  INVX2 U316 ( .A(n642), .Y(n242) );
  INVX2 U317 ( .A(n917), .Y(n238) );
  INVX2 U318 ( .A(n917), .Y(n236) );
  INVX2 U319 ( .A(n641), .Y(n245) );
  INVX2 U320 ( .A(n472), .Y(n250) );
  INVX2 U321 ( .A(n472), .Y(n248) );
  INVX2 U322 ( .A(n641), .Y(n247) );
  INVX2 U323 ( .A(n267), .Y(n265) );
  INVX2 U324 ( .A(n299), .Y(n264) );
  INVX2 U325 ( .A(n299), .Y(n263) );
  INVX2 U326 ( .A(n299), .Y(n262) );
  INVX2 U327 ( .A(n300), .Y(n259) );
  INVX2 U328 ( .A(n300), .Y(n257) );
  INVX2 U329 ( .A(n325), .Y(n256) );
  INVX2 U330 ( .A(n325), .Y(n254) );
  INVX2 U331 ( .A(n325), .Y(n253) );
  INVX2 U332 ( .A(n300), .Y(n260) );
  INVX2 U333 ( .A(n330), .Y(n251) );
  INVX2 U334 ( .A(n267), .Y(n266) );
  INVX4 U335 ( .A(n1322), .Y(n241) );
  BUFX2 U336 ( .A(boundary_1[7]), .Y(n193) );
  INVX2 U337 ( .A(n909), .Y(n226) );
  INVX2 U338 ( .A(n909), .Y(n227) );
  INVX2 U339 ( .A(n187), .Y(n218) );
  INVX2 U340 ( .A(n187), .Y(n217) );
  INVX2 U341 ( .A(n915), .Y(n230) );
  INVX2 U342 ( .A(n915), .Y(n229) );
  INVX2 U343 ( .A(n188), .Y(n206) );
  INVX2 U344 ( .A(n916), .Y(n232) );
  BUFX2 U345 ( .A(n343), .Y(n325) );
  BUFX2 U346 ( .A(n325), .Y(n300) );
  BUFX2 U347 ( .A(n343), .Y(n299) );
  BUFX2 U348 ( .A(n325), .Y(n267) );
  BUFX2 U349 ( .A(n343), .Y(n330) );
  BUFX2 U350 ( .A(n343), .Y(n331) );
  BUFX2 U351 ( .A(n299), .Y(n332) );
  BUFX2 U352 ( .A(n343), .Y(n333) );
  BUFX2 U353 ( .A(n343), .Y(n334) );
  BUFX2 U354 ( .A(n343), .Y(n335) );
  BUFX2 U355 ( .A(n343), .Y(n337) );
  BUFX2 U356 ( .A(n299), .Y(n338) );
  BUFX2 U357 ( .A(n343), .Y(n339) );
  BUFX2 U358 ( .A(n325), .Y(n340) );
  BUFX2 U359 ( .A(n299), .Y(n341) );
  BUFX2 U360 ( .A(n343), .Y(n336) );
  BUFX2 U361 ( .A(n343), .Y(n342) );
  AND2X2 U362 ( .A(n610), .B(n1318), .Y(n187) );
  INVX2 U363 ( .A(n208), .Y(n209) );
  AND2X2 U364 ( .A(n33), .B(n25), .Y(n188) );
  INVX2 U365 ( .A(n882), .Y(n223) );
  INVX2 U366 ( .A(n882), .Y(n224) );
  INVX2 U367 ( .A(n639), .Y(n214) );
  INVX2 U368 ( .A(n639), .Y(n215) );
  INVX2 U369 ( .A(n_rst), .Y(n343) );
  XNOR2X1 U370 ( .A(rct3[10]), .B(n78), .Y(n443) );
  INVX2 U371 ( .A(n612), .Y(n208) );
  XNOR2X1 U372 ( .A(n86), .B(rct3[4]), .Y(n450) );
  INVX2 U373 ( .A(boundary_1[5]), .Y(n190) );
  INVX4 U374 ( .A(n190), .Y(n191) );
  INVX4 U375 ( .A(i_img_width[12]), .Y(n780) );
  BUFX2 U376 ( .A(n417), .Y(n194) );
  INVX2 U377 ( .A(n474), .Y(n1323) );
  INVX1 U378 ( .A(boundary_1[9]), .Y(n570) );
  INVX2 U379 ( .A(boundary_2[1]), .Y(n211) );
  AND2X1 U380 ( .A(n475), .B(n200), .Y(n202) );
  INVX2 U381 ( .A(i_img_height[14]), .Y(n200) );
  AND2X2 U382 ( .A(n199), .B(n200), .Y(n203) );
  OR2X2 U383 ( .A(n99), .B(n42), .Y(n205) );
  INVX1 U384 ( .A(n99), .Y(N89) );
  OR2X2 U385 ( .A(n205), .B(n97), .Y(n495) );
  INVX1 U386 ( .A(i_img_height[3]), .Y(n496) );
  INVX1 U387 ( .A(n495), .Y(n494) );
  INVX1 U388 ( .A(i_img_height[4]), .Y(n493) );
  INVX1 U389 ( .A(n479), .Y(n478) );
  INVX1 U390 ( .A(i_img_height[13]), .Y(n477) );
  INVX8 U391 ( .A(n241), .Y(n239) );
  INVX2 U392 ( .A(curr_read_state[3]), .Y(n344) );
  INVX2 U393 ( .A(curr_read_state[0]), .Y(n345) );
  NAND3X1 U394 ( .A(n25), .B(curr_read_state[2]), .C(n345), .Y(n916) );
  NAND2X1 U395 ( .A(n26), .B(n25), .Y(n917) );
  NAND2X1 U396 ( .A(n916), .B(n917), .Y(n894) );
  INVX2 U397 ( .A(curr_read_state[1]), .Y(n349) );
  NAND2X1 U398 ( .A(n26), .B(n27), .Y(n828) );
  INVX2 U399 ( .A(curr_read_state[2]), .Y(n1332) );
  NAND3X1 U400 ( .A(n25), .B(n1332), .C(n345), .Y(n883) );
  NAND2X1 U401 ( .A(n33), .B(n27), .Y(n892) );
  INVX2 U402 ( .A(n883), .Y(n1329) );
  INVX2 U403 ( .A(n894), .Y(n1327) );
  NAND3X1 U404 ( .A(n27), .B(curr_read_state[2]), .C(n345), .Y(n915) );
  NAND3X1 U405 ( .A(n828), .B(n1327), .C(n915), .Y(n472) );
  NOR2X1 U406 ( .A(n1329), .B(n472), .Y(n348) );
  NOR2X1 U407 ( .A(curr_read_state[0]), .B(curr_read_state[1]), .Y(n346) );
  NAND3X1 U408 ( .A(curr_read_state[3]), .B(n1332), .C(n346), .Y(n875) );
  INVX2 U409 ( .A(n875), .Y(n1330) );
  INVX2 U410 ( .A(n892), .Y(n1331) );
  NOR2X1 U411 ( .A(n1330), .B(n1331), .Y(n347) );
  NAND3X1 U412 ( .A(n348), .B(n206), .C(n347), .Y(n921) );
  OAI21X1 U413 ( .A(n921), .B(n349), .C(n924), .Y(n1316) );
  NAND2X1 U414 ( .A(n206), .B(n917), .Y(n409) );
  INVX2 U415 ( .A(n409), .Y(n351) );
  MUX2X1 U416 ( .B(n188), .A(n351), .S(rct3[0]), .Y(n350) );
  NAND2X1 U417 ( .A(n917), .B(n350), .Y(n1313) );
  OAI21X1 U418 ( .A(rct3[0]), .B(n351), .C(rct3[1]), .Y(n353) );
  INVX2 U419 ( .A(rct3[0]), .Y(n891) );
  INVX2 U420 ( .A(rct3[1]), .Y(n446) );
  NAND2X1 U421 ( .A(n891), .B(n446), .Y(n357) );
  INVX2 U422 ( .A(n357), .Y(n352) );
  NAND2X1 U423 ( .A(n352), .B(n188), .Y(n354) );
  NAND3X1 U424 ( .A(n353), .B(n917), .C(n354), .Y(n1312) );
  NAND2X1 U425 ( .A(n357), .B(n188), .Y(n356) );
  AND2X2 U426 ( .A(n354), .B(n409), .Y(n355) );
  MUX2X1 U427 ( .B(n356), .A(n355), .S(rct3[2]), .Y(n1311) );
  NAND2X1 U428 ( .A(rct3[2]), .B(n357), .Y(n360) );
  INVX2 U429 ( .A(n360), .Y(n364) );
  NAND2X1 U430 ( .A(n364), .B(n188), .Y(n359) );
  OAI21X1 U431 ( .A(n206), .B(n364), .C(n409), .Y(n358) );
  INVX2 U432 ( .A(n358), .Y(n362) );
  MUX2X1 U433 ( .B(n359), .A(n362), .S(rct3[3]), .Y(n1310) );
  NOR2X1 U434 ( .A(rct3[4]), .B(n360), .Y(n361) );
  MUX2X1 U435 ( .B(rct3[4]), .A(n361), .S(rct3[3]), .Y(n363) );
  INVX2 U436 ( .A(rct3[4]), .Y(n904) );
  OAI22X1 U437 ( .A(n206), .B(n363), .C(n362), .D(n904), .Y(n1309) );
  NAND3X1 U438 ( .A(rct3[4]), .B(rct3[3]), .C(n364), .Y(n369) );
  INVX2 U439 ( .A(n369), .Y(n374) );
  NAND2X1 U440 ( .A(n374), .B(n188), .Y(n366) );
  OAI21X1 U441 ( .A(n206), .B(n374), .C(n409), .Y(n371) );
  INVX2 U442 ( .A(n371), .Y(n365) );
  MUX2X1 U443 ( .B(n366), .A(n365), .S(rct3[5]), .Y(n1308) );
  INVX2 U444 ( .A(i_img_width[4]), .Y(n804) );
  NAND3X1 U445 ( .A(n804), .B(boundary_1[1]), .C(n28), .Y(n367) );
  INVX2 U446 ( .A(n367), .Y(n417) );
  NAND2X1 U447 ( .A(n417), .B(n48), .Y(n420) );
  OAI21X1 U448 ( .A(n48), .B(n194), .C(n420), .Y(boundary_1[5]) );
  NAND3X1 U449 ( .A(n60), .B(n62), .C(boundary_1[1]), .Y(n394) );
  OAI21X1 U450 ( .A(n22), .B(n804), .C(n91), .Y(boundary_1[4]) );
  OAI21X1 U451 ( .A(n101), .B(n103), .C(n79), .Y(n368) );
  NOR2X1 U452 ( .A(rct3[6]), .B(n369), .Y(n370) );
  MUX2X1 U453 ( .B(rct3[6]), .A(n370), .S(rct3[5]), .Y(n373) );
  NAND2X1 U454 ( .A(rct3[6]), .B(n371), .Y(n372) );
  OAI21X1 U455 ( .A(n206), .B(n373), .C(n372), .Y(n1307) );
  NAND3X1 U456 ( .A(rct3[6]), .B(rct3[5]), .C(n374), .Y(n377) );
  INVX2 U457 ( .A(n377), .Y(n382) );
  NAND2X1 U458 ( .A(n382), .B(n188), .Y(n376) );
  OAI21X1 U459 ( .A(n206), .B(n382), .C(n409), .Y(n379) );
  INVX2 U460 ( .A(n379), .Y(n375) );
  MUX2X1 U461 ( .B(n376), .A(n375), .S(rct3[7]), .Y(n1306) );
  NOR2X1 U462 ( .A(rct3[8]), .B(n377), .Y(n378) );
  MUX2X1 U463 ( .B(rct3[8]), .A(n378), .S(rct3[7]), .Y(n381) );
  NAND2X1 U464 ( .A(rct3[8]), .B(n379), .Y(n380) );
  OAI21X1 U465 ( .A(n206), .B(n381), .C(n380), .Y(n1305) );
  NAND3X1 U466 ( .A(rct3[8]), .B(rct3[7]), .C(n382), .Y(n385) );
  INVX2 U467 ( .A(n385), .Y(n391) );
  NAND2X1 U468 ( .A(n391), .B(n188), .Y(n384) );
  OAI21X1 U469 ( .A(n206), .B(n391), .C(n409), .Y(n383) );
  INVX2 U470 ( .A(n383), .Y(n387) );
  MUX2X1 U471 ( .B(n384), .A(n387), .S(rct3[9]), .Y(n1304) );
  NOR2X1 U472 ( .A(rct3[10]), .B(n385), .Y(n386) );
  MUX2X1 U473 ( .B(rct3[10]), .A(n386), .S(rct3[9]), .Y(n388) );
  INVX2 U474 ( .A(rct3[10]), .Y(n1328) );
  OAI22X1 U475 ( .A(n206), .B(n388), .C(n1328), .D(n387), .Y(n1303) );
  NOR2X1 U476 ( .A(n89), .B(n101), .Y(n390) );
  INVX2 U477 ( .A(i_img_width[7]), .Y(n795) );
  NAND2X1 U478 ( .A(n795), .B(n798), .Y(n389) );
  NAND3X1 U479 ( .A(n804), .B(n801), .C(n92), .Y(n436) );
  NAND3X1 U480 ( .A(n18), .B(n390), .C(n95), .Y(n397) );
  INVX2 U481 ( .A(n397), .Y(n400) );
  NAND2X1 U482 ( .A(n789), .B(n400), .Y(n399) );
  NAND3X1 U483 ( .A(n789), .B(n792), .C(n786), .Y(n414) );
  NAND2X1 U484 ( .A(n438), .B(n41), .Y(n412) );
  OAI21X1 U485 ( .A(n786), .B(n178), .C(n71), .Y(boundary_1[10]) );
  NAND3X1 U486 ( .A(rct3[9]), .B(rct3[10]), .C(n391), .Y(n401) );
  INVX2 U487 ( .A(n401), .Y(n407) );
  NAND2X1 U488 ( .A(n407), .B(n188), .Y(n393) );
  OAI21X1 U489 ( .A(n206), .B(n407), .C(n409), .Y(n392) );
  INVX2 U490 ( .A(n392), .Y(n403) );
  MUX2X1 U491 ( .B(n393), .A(n403), .S(rct3[11]), .Y(n1302) );
  INVX2 U492 ( .A(i_img_width[11]), .Y(n783) );
  NAND3X1 U493 ( .A(n783), .B(n438), .C(n146), .Y(n406) );
  OAI21X1 U494 ( .A(n90), .B(n395), .C(i_img_width[11]), .Y(n396) );
  NAND2X1 U495 ( .A(n44), .B(n22), .Y(n418) );
  INVX2 U496 ( .A(n418), .Y(n398) );
  OAI21X1 U497 ( .A(n398), .B(n792), .C(n98), .Y(boundary_1[8]) );
  OAI21X1 U498 ( .A(n400), .B(n75), .C(n399), .Y(boundary_1[9]) );
  NOR2X1 U499 ( .A(rct3[12]), .B(n401), .Y(n402) );
  MUX2X1 U500 ( .B(rct3[12]), .A(n402), .S(rct3[11]), .Y(n404) );
  INVX2 U501 ( .A(rct3[12]), .Y(n1315) );
  OAI22X1 U502 ( .A(n206), .B(n404), .C(n403), .D(n1315), .Y(n1301) );
  NAND3X1 U503 ( .A(rct3[12]), .B(rct3[11]), .C(n407), .Y(n408) );
  INVX2 U504 ( .A(n408), .Y(n423) );
  NAND2X1 U505 ( .A(n423), .B(n188), .Y(n411) );
  OAI21X1 U506 ( .A(n206), .B(n423), .C(n409), .Y(n410) );
  INVX2 U507 ( .A(n410), .Y(n424) );
  MUX2X1 U508 ( .B(n411), .A(n424), .S(rct3[13]), .Y(n1300) );
  NAND2X1 U509 ( .A(n783), .B(n780), .Y(n413) );
  OAI21X1 U510 ( .A(n413), .B(n412), .C(i_img_width[13]), .Y(n416) );
  INVX2 U511 ( .A(i_img_width[13]), .Y(n777) );
  NAND3X1 U512 ( .A(n780), .B(n777), .C(n783), .Y(n432) );
  NOR2X1 U513 ( .A(n414), .B(n432), .Y(n415) );
  NAND3X1 U514 ( .A(n415), .B(n438), .C(n44), .Y(n454) );
  NAND3X1 U515 ( .A(n801), .B(n114), .C(n417), .Y(n421) );
  INVX2 U516 ( .A(n421), .Y(n419) );
  OAI21X1 U517 ( .A(n419), .B(n795), .C(n418), .Y(boundary_1[7]) );
  INVX2 U518 ( .A(n420), .Y(n422) );
  OAI21X1 U519 ( .A(n422), .B(n1), .C(n83), .Y(boundary_1[6]) );
  NAND3X1 U520 ( .A(rct3[13]), .B(n423), .C(n188), .Y(n426) );
  OAI21X1 U521 ( .A(rct3[13]), .B(n206), .C(n424), .Y(n428) );
  INVX2 U522 ( .A(n428), .Y(n425) );
  MUX2X1 U523 ( .B(n426), .A(n425), .S(rct3[14]), .Y(n1299) );
  INVX2 U524 ( .A(n426), .Y(n427) );
  NAND2X1 U525 ( .A(rct3[14]), .B(n427), .Y(n431) );
  INVX2 U526 ( .A(rct3[14]), .Y(n429) );
  AOI21X1 U527 ( .A(n188), .B(n429), .C(n428), .Y(n430) );
  MUX2X1 U528 ( .B(n431), .A(n430), .S(rct3[15]), .Y(n1298) );
  OAI21X1 U529 ( .A(i_img_width[14]), .B(n454), .C(i_img_width[15]), .Y(n439)
         );
  INVX2 U530 ( .A(i_img_width[15]), .Y(n771) );
  INVX2 U531 ( .A(n432), .Y(n434) );
  INVX2 U532 ( .A(i_img_width[14]), .Y(n774) );
  NAND3X1 U533 ( .A(n434), .B(n433), .C(n774), .Y(n435) );
  NOR2X1 U534 ( .A(n96), .B(n435), .Y(n437) );
  NAND3X1 U535 ( .A(n49), .B(n771), .C(n437), .Y(n473) );
  NAND2X1 U536 ( .A(n473), .B(n439), .Y(boundary_1[15]) );
  AOI21X1 U537 ( .A(i_inc_raddr), .B(n27), .C(curr_read_state[0]), .Y(n471) );
  XOR2X1 U538 ( .A(rct3[3]), .B(n576), .Y(n444) );
  XOR2X1 U539 ( .A(n69), .B(rct3[8]), .Y(n441) );
  XOR2X1 U540 ( .A(n77), .B(rct3[11]), .Y(n440) );
  NOR2X1 U541 ( .A(n441), .B(n440), .Y(n442) );
  NAND3X1 U542 ( .A(n444), .B(n443), .C(n442), .Y(n453) );
  XOR2X1 U543 ( .A(n107), .B(rct3[5]), .Y(n445) );
  NOR2X1 U544 ( .A(n206), .B(n445), .Y(n451) );
  XOR2X1 U545 ( .A(n446), .B(n55), .Y(n448) );
  XOR2X1 U546 ( .A(n43), .B(n62), .Y(boundary_1[2]) );
  XOR2X1 U547 ( .A(n84), .B(rct3[2]), .Y(n447) );
  NOR2X1 U548 ( .A(n448), .B(n447), .Y(n449) );
  NAND3X1 U549 ( .A(n451), .B(n450), .C(n449), .Y(n452) );
  NOR2X1 U550 ( .A(n453), .B(n452), .Y(n469) );
  XOR2X1 U551 ( .A(rct3[6]), .B(n591), .Y(n460) );
  XOR2X1 U552 ( .A(rct3[15]), .B(n588), .Y(n459) );
  XOR2X1 U553 ( .A(n454), .B(i_img_width[14]), .Y(n455) );
  XOR2X1 U554 ( .A(rct3[14]), .B(boundary_1[14]), .Y(n457) );
  XOR2X1 U555 ( .A(boundary_1[0]), .B(rct3[0]), .Y(n456) );
  NOR2X1 U556 ( .A(n457), .B(n456), .Y(n458) );
  NAND3X1 U557 ( .A(n460), .B(n459), .C(n458), .Y(n467) );
  XOR2X1 U558 ( .A(rct3[9]), .B(n570), .Y(n465) );
  XOR2X1 U559 ( .A(rct3[12]), .B(n584), .Y(n464) );
  XOR2X1 U560 ( .A(n193), .B(rct3[7]), .Y(n462) );
  XOR2X1 U561 ( .A(n106), .B(rct3[13]), .Y(n461) );
  NOR2X1 U562 ( .A(n462), .B(n461), .Y(n463) );
  NAND3X1 U563 ( .A(n465), .B(n464), .C(n463), .Y(n466) );
  NOR2X1 U564 ( .A(n467), .B(n466), .Y(n468) );
  AOI21X1 U565 ( .A(n469), .B(n468), .C(n1329), .Y(n470) );
  OAI21X1 U566 ( .A(n471), .B(n921), .C(n470), .Y(n1317) );
  INVX2 U567 ( .A(i_img_height[11]), .Y(n483) );
  NAND2X1 U568 ( .A(n483), .B(n87), .Y(n482) );
  INVX2 U569 ( .A(i_img_height[15]), .Y(n475) );
  NAND2X1 U570 ( .A(n202), .B(n199), .Y(n474) );
  OAI21X1 U571 ( .A(n475), .B(n203), .C(n474), .Y(N103) );
  XOR2X1 U572 ( .A(i_img_height[14]), .B(n47), .Y(N102) );
  OAI21X1 U573 ( .A(n478), .B(n477), .C(n476), .Y(N101) );
  OAI21X1 U574 ( .A(n481), .B(n480), .C(n479), .Y(N100) );
  OAI21X1 U575 ( .A(n197), .B(n483), .C(n482), .Y(N99) );
  INVX2 U576 ( .A(i_img_height[8]), .Y(n487) );
  NAND2X1 U577 ( .A(n12), .B(n486), .Y(n485) );
  OAI21X1 U578 ( .A(n21), .B(n109), .C(n484), .Y(N98) );
  OAI21X1 U579 ( .A(n12), .B(n486), .C(n485), .Y(N97) );
  OAI21X1 U580 ( .A(n196), .B(n487), .C(n14), .Y(N96) );
  OAI21X1 U581 ( .A(n80), .B(n488), .C(n66), .Y(N95) );
  NAND2X1 U582 ( .A(n17), .B(n492), .Y(n491) );
  OAI21X1 U583 ( .A(n72), .B(n490), .C(n489), .Y(N94) );
  OAI21X1 U584 ( .A(n17), .B(n492), .C(n491), .Y(N93) );
  OAI21X1 U585 ( .A(n494), .B(n493), .C(n59), .Y(N92) );
  OAI21X1 U586 ( .A(n16), .B(n496), .C(n495), .Y(N91) );
  OAI21X1 U587 ( .A(N89), .B(n497), .C(n205), .Y(N90) );
  INVX2 U588 ( .A(curr_write_state[4]), .Y(n601) );
  INVX2 U589 ( .A(curr_write_state[0]), .Y(n600) );
  NAND3X1 U590 ( .A(curr_write_state[3]), .B(n601), .C(n600), .Y(n498) );
  INVX2 U591 ( .A(n498), .Y(n505) );
  INVX2 U592 ( .A(curr_write_state[2]), .Y(n633) );
  NAND3X1 U593 ( .A(curr_write_state[1]), .B(n505), .C(n633), .Y(n628) );
  INVX2 U594 ( .A(n628), .Y(n1324) );
  INVX2 U595 ( .A(wct1[0]), .Y(n1326) );
  NAND2X1 U596 ( .A(n1324), .B(n1326), .Y(n627) );
  NAND2X1 U597 ( .A(n34), .B(n505), .Y(n641) );
  INVX2 U598 ( .A(n665), .Y(n499) );
  NAND3X1 U599 ( .A(n627), .B(n641), .C(n499), .Y(n1147) );
  NAND2X1 U600 ( .A(n1324), .B(wct1[0]), .Y(n502) );
  INVX2 U601 ( .A(n627), .Y(n500) );
  AOI21X1 U602 ( .A(n664), .B(n663), .C(n500), .Y(n501) );
  MUX2X1 U603 ( .B(n502), .A(n501), .S(wct1[1]), .Y(n1146) );
  NOR2X1 U604 ( .A(curr_write_state[0]), .B(n601), .Y(n504) );
  INVX2 U605 ( .A(curr_write_state[1]), .Y(n604) );
  INVX2 U606 ( .A(curr_write_state[3]), .Y(n503) );
  NAND3X1 U607 ( .A(n504), .B(n604), .C(n29), .Y(n1318) );
  NAND3X1 U608 ( .A(curr_write_state[2]), .B(n505), .C(n604), .Y(n612) );
  NAND2X1 U609 ( .A(n209), .B(n1318), .Y(n607) );
  INVX2 U610 ( .A(n607), .Y(n507) );
  MUX2X1 U611 ( .B(n208), .A(n507), .S(wct3[0]), .Y(n506) );
  NAND2X1 U612 ( .A(n1318), .B(n506), .Y(n1163) );
  OAI21X1 U613 ( .A(wct3[0]), .B(n507), .C(wct3[1]), .Y(n509) );
  INVX2 U614 ( .A(n514), .Y(n508) );
  NAND2X1 U615 ( .A(n508), .B(n208), .Y(n511) );
  NAND3X1 U616 ( .A(n509), .B(n1318), .C(n511), .Y(n1162) );
  NAND2X1 U617 ( .A(n208), .B(n514), .Y(n513) );
  AND2X2 U618 ( .A(n511), .B(n607), .Y(n512) );
  MUX2X1 U619 ( .B(n513), .A(n512), .S(wct3[2]), .Y(n1161) );
  NAND2X1 U620 ( .A(wct3[2]), .B(n514), .Y(n517) );
  INVX2 U621 ( .A(n517), .Y(n523) );
  NAND2X1 U622 ( .A(n523), .B(n208), .Y(n516) );
  OAI21X1 U623 ( .A(n523), .B(n612), .C(n607), .Y(n519) );
  INVX2 U624 ( .A(n519), .Y(n515) );
  MUX2X1 U625 ( .B(n516), .A(n515), .S(wct3[3]), .Y(n1160) );
  NOR2X1 U626 ( .A(wct3[4]), .B(n517), .Y(n518) );
  MUX2X1 U627 ( .B(wct3[4]), .A(n518), .S(wct3[3]), .Y(n521) );
  NAND2X1 U628 ( .A(wct3[4]), .B(n519), .Y(n520) );
  OAI21X1 U629 ( .A(n209), .B(n521), .C(n520), .Y(n1159) );
  NAND3X1 U630 ( .A(wct3[4]), .B(wct3[3]), .C(n523), .Y(n526) );
  INVX2 U631 ( .A(n526), .Y(n531) );
  NAND2X1 U632 ( .A(n531), .B(n208), .Y(n525) );
  OAI21X1 U633 ( .A(n531), .B(n612), .C(n607), .Y(n528) );
  INVX2 U634 ( .A(n528), .Y(n524) );
  MUX2X1 U635 ( .B(n525), .A(n524), .S(wct3[5]), .Y(n1158) );
  NOR2X1 U636 ( .A(wct3[6]), .B(n526), .Y(n527) );
  MUX2X1 U637 ( .B(wct3[6]), .A(n527), .S(wct3[5]), .Y(n530) );
  NAND2X1 U638 ( .A(wct3[6]), .B(n528), .Y(n529) );
  OAI21X1 U639 ( .A(n209), .B(n530), .C(n529), .Y(n1157) );
  NAND3X1 U640 ( .A(wct3[6]), .B(wct3[5]), .C(n531), .Y(n534) );
  INVX2 U641 ( .A(n534), .Y(n539) );
  NAND2X1 U642 ( .A(n539), .B(n208), .Y(n533) );
  OAI21X1 U643 ( .A(n539), .B(n612), .C(n607), .Y(n536) );
  INVX2 U644 ( .A(n536), .Y(n532) );
  MUX2X1 U645 ( .B(n533), .A(n532), .S(wct3[7]), .Y(n1156) );
  NOR2X1 U646 ( .A(wct3[8]), .B(n534), .Y(n535) );
  MUX2X1 U647 ( .B(wct3[8]), .A(n535), .S(wct3[7]), .Y(n538) );
  NAND2X1 U648 ( .A(wct3[8]), .B(n536), .Y(n537) );
  OAI21X1 U649 ( .A(n209), .B(n538), .C(n537), .Y(n1155) );
  NAND3X1 U650 ( .A(wct3[8]), .B(wct3[7]), .C(n539), .Y(n542) );
  INVX2 U651 ( .A(n542), .Y(n547) );
  NAND2X1 U652 ( .A(n547), .B(n208), .Y(n541) );
  OAI21X1 U653 ( .A(n547), .B(n612), .C(n607), .Y(n544) );
  INVX2 U654 ( .A(n544), .Y(n540) );
  MUX2X1 U655 ( .B(n541), .A(n540), .S(wct3[9]), .Y(n1154) );
  NOR2X1 U656 ( .A(wct3[10]), .B(n542), .Y(n543) );
  MUX2X1 U657 ( .B(wct3[10]), .A(n543), .S(wct3[9]), .Y(n546) );
  NAND2X1 U658 ( .A(wct3[10]), .B(n544), .Y(n545) );
  OAI21X1 U659 ( .A(n209), .B(n546), .C(n545), .Y(n1153) );
  NAND3X1 U660 ( .A(wct3[9]), .B(wct3[10]), .C(n547), .Y(n550) );
  INVX2 U661 ( .A(n550), .Y(n555) );
  NAND2X1 U662 ( .A(n555), .B(n208), .Y(n549) );
  OAI21X1 U663 ( .A(n555), .B(n612), .C(n607), .Y(n552) );
  INVX2 U664 ( .A(n552), .Y(n548) );
  MUX2X1 U665 ( .B(n549), .A(n548), .S(wct3[11]), .Y(n1152) );
  NOR2X1 U666 ( .A(wct3[12]), .B(n550), .Y(n551) );
  MUX2X1 U667 ( .B(wct3[12]), .A(n551), .S(wct3[11]), .Y(n554) );
  NAND2X1 U668 ( .A(wct3[12]), .B(n552), .Y(n553) );
  OAI21X1 U669 ( .A(n209), .B(n554), .C(n553), .Y(n1151) );
  NAND3X1 U670 ( .A(wct3[12]), .B(wct3[11]), .C(n555), .Y(n556) );
  INVX2 U671 ( .A(n556), .Y(n559) );
  NAND2X1 U672 ( .A(n559), .B(n208), .Y(n558) );
  OAI21X1 U673 ( .A(n559), .B(n209), .C(n607), .Y(n557) );
  INVX2 U674 ( .A(n557), .Y(n560) );
  MUX2X1 U675 ( .B(n558), .A(n560), .S(wct3[13]), .Y(n1150) );
  NAND3X1 U676 ( .A(wct3[13]), .B(n559), .C(n208), .Y(n562) );
  OAI21X1 U677 ( .A(wct3[13]), .B(n209), .C(n560), .Y(n564) );
  INVX2 U678 ( .A(n564), .Y(n561) );
  MUX2X1 U679 ( .B(n562), .A(n561), .S(wct3[14]), .Y(n1149) );
  INVX2 U680 ( .A(n562), .Y(n563) );
  NAND2X1 U681 ( .A(wct3[14]), .B(n563), .Y(n567) );
  INVX2 U682 ( .A(wct3[14]), .Y(n565) );
  AOI21X1 U683 ( .A(n208), .B(n565), .C(n564), .Y(n566) );
  MUX2X1 U684 ( .B(n567), .A(n566), .S(wct3[15]), .Y(n1148) );
  XOR2X1 U685 ( .A(n102), .B(wct3[1]), .Y(n573) );
  XOR2X1 U686 ( .A(n193), .B(wct3[7]), .Y(n569) );
  XOR2X1 U687 ( .A(n69), .B(wct3[8]), .Y(n568) );
  NOR2X1 U688 ( .A(n569), .B(n568), .Y(n572) );
  XOR2X1 U689 ( .A(wct3[9]), .B(n570), .Y(n571) );
  NAND3X1 U690 ( .A(n573), .B(n572), .C(n571), .Y(n581) );
  XOR2X1 U691 ( .A(n77), .B(wct3[11]), .Y(n575) );
  XOR2X1 U692 ( .A(n78), .B(wct3[10]), .Y(n574) );
  NOR2X1 U693 ( .A(n575), .B(n574), .Y(n579) );
  XNOR2X1 U694 ( .A(wct3[2]), .B(n84), .Y(n578) );
  XOR2X1 U695 ( .A(wct3[3]), .B(n576), .Y(n577) );
  NAND3X1 U696 ( .A(n579), .B(n578), .C(n577), .Y(n580) );
  NOR2X1 U697 ( .A(n581), .B(n580), .Y(n598) );
  XOR2X1 U698 ( .A(wct3[14]), .B(boundary_1[14]), .Y(n583) );
  XOR2X1 U699 ( .A(wct3[0]), .B(boundary_1[0]), .Y(n582) );
  NOR2X1 U700 ( .A(n583), .B(n582), .Y(n587) );
  XNOR2X1 U701 ( .A(wct3[13]), .B(n106), .Y(n586) );
  XOR2X1 U702 ( .A(wct3[12]), .B(n584), .Y(n585) );
  NAND3X1 U703 ( .A(n587), .B(n586), .C(n585), .Y(n596) );
  XOR2X1 U704 ( .A(wct3[15]), .B(n588), .Y(n594) );
  XOR2X1 U705 ( .A(n107), .B(wct3[5]), .Y(n590) );
  XOR2X1 U706 ( .A(n86), .B(wct3[4]), .Y(n589) );
  NOR2X1 U707 ( .A(n590), .B(n589), .Y(n593) );
  XOR2X1 U708 ( .A(wct3[6]), .B(n591), .Y(n592) );
  NAND3X1 U709 ( .A(n594), .B(n593), .C(n592), .Y(n595) );
  NOR2X1 U710 ( .A(n596), .B(n595), .Y(n597) );
  NAND2X1 U711 ( .A(n598), .B(n597), .Y(n613) );
  NAND3X1 U712 ( .A(curr_write_state[3]), .B(curr_write_state[0]), .C(n601), 
        .Y(n599) );
  INVX2 U713 ( .A(n599), .Y(n605) );
  NAND3X1 U714 ( .A(n605), .B(n604), .C(n633), .Y(n625) );
  NAND3X1 U715 ( .A(n605), .B(curr_write_state[1]), .C(n633), .Y(n510) );
  NOR2X1 U716 ( .A(n601), .B(n600), .Y(n602) );
  NAND3X1 U717 ( .A(n602), .B(n604), .C(n29), .Y(n840) );
  NAND3X1 U718 ( .A(n625), .B(n510), .C(n840), .Y(n603) );
  NOR2X1 U719 ( .A(n1324), .B(n603), .Y(n609) );
  NAND3X1 U720 ( .A(n605), .B(curr_write_state[2]), .C(n604), .Y(n610) );
  NAND2X1 U721 ( .A(n605), .B(n34), .Y(n642) );
  NAND3X1 U722 ( .A(n610), .B(n641), .C(n642), .Y(n606) );
  NOR2X1 U723 ( .A(n607), .B(n606), .Y(n608) );
  NAND2X1 U724 ( .A(n609), .B(n608), .Y(n632) );
  INVX2 U725 ( .A(n632), .Y(n623) );
  NAND3X1 U726 ( .A(n187), .B(n642), .C(n641), .Y(n615) );
  AOI21X1 U727 ( .A(n623), .B(curr_write_state[4]), .C(n615), .Y(n611) );
  OAI21X1 U728 ( .A(n209), .B(n613), .C(n611), .Y(next_write_state[4]) );
  NAND2X1 U729 ( .A(n208), .B(n613), .Y(n629) );
  NAND3X1 U730 ( .A(n629), .B(n628), .C(n840), .Y(n614) );
  INVX2 U731 ( .A(n614), .Y(n626) );
  INVX2 U732 ( .A(n625), .Y(n618) );
  INVX2 U733 ( .A(i_inc_waddr), .Y(n616) );
  AOI22X1 U734 ( .A(n623), .B(curr_write_state[0]), .C(n618), .D(n616), .Y(
        n617) );
  NAND3X1 U735 ( .A(n626), .B(n221), .C(n617), .Y(next_write_state[0]) );
  INVX2 U736 ( .A(n510), .Y(n1325) );
  INVX2 U737 ( .A(wct2[1]), .Y(n1333) );
  AOI22X1 U738 ( .A(i_inc_waddr), .B(n618), .C(n1325), .D(n1333), .Y(n622) );
  INVX2 U739 ( .A(wct2[0]), .Y(n636) );
  NAND2X1 U740 ( .A(n1325), .B(n636), .Y(n1319) );
  NAND2X1 U741 ( .A(wct1[1]), .B(wct1[0]), .Y(n619) );
  OAI21X1 U742 ( .A(n628), .B(n619), .C(n629), .Y(n620) );
  AOI21X1 U743 ( .A(n623), .B(curr_write_state[1]), .C(n620), .Y(n621) );
  NAND3X1 U744 ( .A(n622), .B(n1319), .C(n621), .Y(next_write_state[1]) );
  AOI21X1 U745 ( .A(n623), .B(curr_write_state[3]), .C(n1325), .Y(n624) );
  NAND3X1 U746 ( .A(n626), .B(n625), .C(n624), .Y(next_write_state[3]) );
  OAI21X1 U747 ( .A(wct1[1]), .B(n628), .C(n627), .Y(n635) );
  INVX2 U748 ( .A(n629), .Y(n630) );
  NOR2X1 U749 ( .A(n1325), .B(n630), .Y(n631) );
  OAI21X1 U750 ( .A(n633), .B(n632), .C(n631), .Y(n634) );
  OR2X1 U751 ( .A(n635), .B(n634), .Y(next_write_state[2]) );
  NOR2X1 U752 ( .A(n1326), .B(n636), .Y(n638) );
  NOR2X1 U753 ( .A(wct2[1]), .B(wct1[1]), .Y(n637) );
  NAND3X1 U754 ( .A(n638), .B(n843), .C(n637), .Y(n639) );
  MUX2X1 U755 ( .B(wpt[29]), .A(N792), .S(n214), .Y(n640) );
  INVX2 U756 ( .A(n640), .Y(n1116) );
  AOI22X1 U757 ( .A(o_waddr[29]), .B(n221), .C(N693), .D(n217), .Y(n644) );
  AOI22X1 U758 ( .A(N725), .B(n245), .C(wpt[29]), .D(n242), .Y(n643) );
  NAND2X1 U759 ( .A(n644), .B(n643), .Y(n1024) );
  INVX2 U760 ( .A(i_init_waddr[29]), .Y(n645) );
  NAND2X1 U761 ( .A(n645), .B(n267), .Y(n1500) );
  NAND2X1 U762 ( .A(i_init_waddr[29]), .B(n299), .Y(n1499) );
  MUX2X1 U763 ( .B(wpt[28]), .A(N791), .S(n214), .Y(n646) );
  INVX2 U764 ( .A(n646), .Y(n1117) );
  AOI22X1 U765 ( .A(o_waddr[28]), .B(n220), .C(N692), .D(n217), .Y(n648) );
  AOI22X1 U766 ( .A(N724), .B(n245), .C(wpt[28]), .D(n242), .Y(n647) );
  NAND2X1 U767 ( .A(n648), .B(n647), .Y(n1027) );
  INVX2 U768 ( .A(i_init_waddr[28]), .Y(n649) );
  NAND2X1 U769 ( .A(n649), .B(n300), .Y(n1498) );
  NAND2X1 U770 ( .A(i_init_waddr[28]), .B(n325), .Y(n1497) );
  MUX2X1 U771 ( .B(wpt[27]), .A(N790), .S(n214), .Y(n650) );
  INVX2 U772 ( .A(n650), .Y(n1118) );
  AOI22X1 U773 ( .A(o_waddr[27]), .B(n221), .C(N691), .D(n217), .Y(n652) );
  AOI22X1 U774 ( .A(N723), .B(n245), .C(wpt[27]), .D(n242), .Y(n651) );
  NAND2X1 U775 ( .A(n652), .B(n651), .Y(n1030) );
  INVX2 U776 ( .A(i_init_waddr[27]), .Y(n653) );
  NAND2X1 U777 ( .A(n653), .B(n330), .Y(n1496) );
  NAND2X1 U778 ( .A(i_init_waddr[27]), .B(n330), .Y(n1495) );
  MUX2X1 U779 ( .B(wpt[26]), .A(N789), .S(n214), .Y(n654) );
  INVX2 U780 ( .A(n654), .Y(n1119) );
  AOI22X1 U781 ( .A(o_waddr[26]), .B(n220), .C(N690), .D(n217), .Y(n656) );
  AOI22X1 U782 ( .A(N722), .B(n245), .C(wpt[26]), .D(n242), .Y(n655) );
  NAND2X1 U783 ( .A(n656), .B(n655), .Y(n1033) );
  INVX2 U784 ( .A(i_init_waddr[26]), .Y(n657) );
  NAND2X1 U786 ( .A(n657), .B(n330), .Y(n1494) );
  NAND2X1 U788 ( .A(i_init_waddr[26]), .B(n330), .Y(n1493) );
  MUX2X1 U789 ( .B(wpt[24]), .A(N787), .S(n214), .Y(n658) );
  INVX2 U790 ( .A(n658), .Y(n1121) );
  AOI22X1 U791 ( .A(o_waddr[24]), .B(n221), .C(N688), .D(n217), .Y(n660) );
  AOI22X1 U792 ( .A(N720), .B(n245), .C(wpt[24]), .D(n242), .Y(n659) );
  NAND2X1 U793 ( .A(n660), .B(n659), .Y(n1039) );
  INVX2 U794 ( .A(i_init_waddr[24]), .Y(n661) );
  NAND2X1 U795 ( .A(n661), .B(n330), .Y(n1490) );
  NAND2X1 U796 ( .A(i_init_waddr[24]), .B(n330), .Y(n1489) );
  MUX2X1 U797 ( .B(wpt[23]), .A(N786), .S(n214), .Y(n662) );
  INVX2 U798 ( .A(n662), .Y(n1122) );
  AOI22X1 U799 ( .A(o_waddr[23]), .B(n220), .C(N687), .D(n217), .Y(n667) );
  AOI22X1 U800 ( .A(N719), .B(n245), .C(wpt[23]), .D(n242), .Y(n666) );
  NAND2X1 U801 ( .A(n667), .B(n666), .Y(n1042) );
  INVX2 U802 ( .A(i_init_waddr[23]), .Y(n668) );
  NAND2X1 U803 ( .A(n668), .B(n330), .Y(n1488) );
  NAND2X1 U804 ( .A(i_init_waddr[23]), .B(n331), .Y(n1487) );
  MUX2X1 U805 ( .B(wpt[22]), .A(N785), .S(n214), .Y(n669) );
  INVX2 U806 ( .A(n669), .Y(n1123) );
  AOI22X1 U807 ( .A(o_waddr[22]), .B(n221), .C(N686), .D(n217), .Y(n671) );
  AOI22X1 U808 ( .A(N718), .B(n245), .C(wpt[22]), .D(n242), .Y(n670) );
  NAND2X1 U809 ( .A(n671), .B(n670), .Y(n1045) );
  INVX2 U810 ( .A(i_init_waddr[22]), .Y(n672) );
  NAND2X1 U811 ( .A(n672), .B(n331), .Y(n1486) );
  NAND2X1 U812 ( .A(i_init_waddr[22]), .B(n331), .Y(n1485) );
  MUX2X1 U813 ( .B(wpt[21]), .A(N784), .S(n214), .Y(n673) );
  INVX2 U814 ( .A(n673), .Y(n1124) );
  AOI22X1 U815 ( .A(o_waddr[21]), .B(n221), .C(N685), .D(n217), .Y(n675) );
  AOI22X1 U816 ( .A(N717), .B(n245), .C(wpt[21]), .D(n242), .Y(n674) );
  NAND2X1 U817 ( .A(n675), .B(n674), .Y(n1048) );
  INVX2 U818 ( .A(i_init_waddr[21]), .Y(n676) );
  NAND2X1 U819 ( .A(n676), .B(n331), .Y(n1484) );
  NAND2X1 U820 ( .A(i_init_waddr[21]), .B(n331), .Y(n1483) );
  MUX2X1 U821 ( .B(wpt[20]), .A(N783), .S(n214), .Y(n677) );
  INVX2 U822 ( .A(n677), .Y(n1125) );
  AOI22X1 U823 ( .A(o_waddr[20]), .B(n221), .C(N684), .D(n217), .Y(n679) );
  AOI22X1 U824 ( .A(N716), .B(n245), .C(wpt[20]), .D(n242), .Y(n678) );
  NAND2X1 U830 ( .A(n679), .B(n678), .Y(n1051) );
  INVX2 U831 ( .A(i_init_waddr[20]), .Y(n680) );
  NAND2X1 U833 ( .A(n680), .B(n331), .Y(n1482) );
  NAND2X1 U834 ( .A(i_init_waddr[20]), .B(n331), .Y(n1481) );
  MUX2X1 U835 ( .B(wpt[19]), .A(N782), .S(n214), .Y(n681) );
  INVX2 U836 ( .A(n681), .Y(n1126) );
  AOI22X1 U837 ( .A(o_waddr[19]), .B(n221), .C(N683), .D(n217), .Y(n684) );
  AOI22X1 U838 ( .A(N715), .B(n245), .C(wpt[19]), .D(n242), .Y(n683) );
  NAND2X1 U839 ( .A(n684), .B(n683), .Y(n1054) );
  INVX2 U840 ( .A(i_init_waddr[19]), .Y(n688) );
  NAND2X1 U841 ( .A(n688), .B(n331), .Y(n1480) );
  NAND2X1 U842 ( .A(i_init_waddr[19]), .B(n331), .Y(n1479) );
  MUX2X1 U843 ( .B(wpt[18]), .A(N781), .S(n214), .Y(n689) );
  INVX2 U844 ( .A(n689), .Y(n1127) );
  AOI22X1 U845 ( .A(o_waddr[18]), .B(n221), .C(N682), .D(n217), .Y(n691) );
  AOI22X1 U846 ( .A(N714), .B(n245), .C(wpt[18]), .D(n242), .Y(n690) );
  NAND2X1 U847 ( .A(n691), .B(n690), .Y(n1057) );
  INVX2 U848 ( .A(i_init_waddr[18]), .Y(n692) );
  NAND2X1 U849 ( .A(n692), .B(n331), .Y(n1478) );
  NAND2X1 U850 ( .A(i_init_waddr[18]), .B(n332), .Y(n1477) );
  MUX2X1 U851 ( .B(wpt[17]), .A(N780), .S(n214), .Y(n693) );
  INVX2 U852 ( .A(n693), .Y(n1128) );
  AOI22X1 U853 ( .A(o_waddr[17]), .B(n221), .C(N681), .D(n217), .Y(n695) );
  AOI22X1 U854 ( .A(N713), .B(n245), .C(wpt[17]), .D(n242), .Y(n694) );
  NAND2X1 U855 ( .A(n695), .B(n694), .Y(n1060) );
  INVX2 U856 ( .A(i_init_waddr[17]), .Y(n696) );
  NAND2X1 U857 ( .A(n696), .B(n332), .Y(n1452) );
  NAND2X1 U858 ( .A(i_init_waddr[17]), .B(n332), .Y(n1451) );
  MUX2X1 U859 ( .B(wpt[16]), .A(N779), .S(n214), .Y(n697) );
  INVX2 U860 ( .A(n697), .Y(n1129) );
  AOI22X1 U861 ( .A(o_waddr[16]), .B(n221), .C(N680), .D(n217), .Y(n699) );
  AOI22X1 U862 ( .A(N712), .B(n245), .C(wpt[16]), .D(n242), .Y(n698) );
  NAND2X1 U863 ( .A(n699), .B(n698), .Y(n1063) );
  INVX2 U864 ( .A(i_init_waddr[16]), .Y(n700) );
  NAND2X1 U865 ( .A(n700), .B(n332), .Y(n1450) );
  NAND2X1 U866 ( .A(i_init_waddr[16]), .B(n332), .Y(n1449) );
  MUX2X1 U867 ( .B(wpt[15]), .A(N778), .S(n215), .Y(n701) );
  INVX2 U868 ( .A(n701), .Y(n1130) );
  AOI22X1 U869 ( .A(o_waddr[15]), .B(n221), .C(N679), .D(n218), .Y(n703) );
  AOI22X1 U870 ( .A(N711), .B(n247), .C(wpt[15]), .D(n244), .Y(n702) );
  NAND2X1 U871 ( .A(n703), .B(n702), .Y(n1066) );
  INVX2 U872 ( .A(i_init_waddr[15]), .Y(n704) );
  NAND2X1 U873 ( .A(n704), .B(n332), .Y(n1476) );
  NAND2X1 U874 ( .A(i_init_waddr[15]), .B(n332), .Y(n1475) );
  MUX2X1 U875 ( .B(wpt[14]), .A(N777), .S(n215), .Y(n705) );
  INVX2 U876 ( .A(n705), .Y(n1131) );
  AOI22X1 U877 ( .A(o_waddr[14]), .B(n221), .C(N678), .D(n218), .Y(n707) );
  AOI22X1 U878 ( .A(N710), .B(n247), .C(wpt[14]), .D(n244), .Y(n706) );
  NAND2X1 U879 ( .A(n707), .B(n706), .Y(n1069) );
  INVX2 U880 ( .A(i_init_waddr[14]), .Y(n708) );
  NAND2X1 U881 ( .A(n708), .B(n332), .Y(n1474) );
  NAND2X1 U882 ( .A(i_init_waddr[14]), .B(n332), .Y(n1473) );
  MUX2X1 U883 ( .B(wpt[13]), .A(N776), .S(n215), .Y(n709) );
  INVX2 U884 ( .A(n709), .Y(n1132) );
  AOI22X1 U885 ( .A(o_waddr[13]), .B(n221), .C(N677), .D(n218), .Y(n711) );
  AOI22X1 U886 ( .A(N709), .B(n245), .C(wpt[13]), .D(n244), .Y(n710) );
  NAND2X1 U887 ( .A(n711), .B(n710), .Y(n1072) );
  INVX2 U888 ( .A(i_init_waddr[13]), .Y(n712) );
  NAND2X1 U889 ( .A(n712), .B(n332), .Y(n1472) );
  NAND2X1 U890 ( .A(i_init_waddr[13]), .B(n333), .Y(n1471) );
  MUX2X1 U891 ( .B(wpt[12]), .A(N775), .S(n215), .Y(n713) );
  INVX2 U892 ( .A(n713), .Y(n1133) );
  AOI22X1 U893 ( .A(o_waddr[12]), .B(n221), .C(N676), .D(n218), .Y(n715) );
  AOI22X1 U894 ( .A(N708), .B(n247), .C(wpt[12]), .D(n244), .Y(n714) );
  NAND2X1 U895 ( .A(n715), .B(n714), .Y(n1075) );
  INVX2 U896 ( .A(i_init_waddr[12]), .Y(n716) );
  NAND2X1 U897 ( .A(n716), .B(n333), .Y(n1470) );
  NAND2X1 U898 ( .A(i_init_waddr[12]), .B(n333), .Y(n1469) );
  MUX2X1 U899 ( .B(wpt[11]), .A(N774), .S(n215), .Y(n717) );
  INVX2 U900 ( .A(n717), .Y(n1134) );
  AOI22X1 U901 ( .A(o_waddr[11]), .B(n221), .C(N675), .D(n218), .Y(n719) );
  AOI22X1 U902 ( .A(N707), .B(n245), .C(wpt[11]), .D(n244), .Y(n718) );
  NAND2X1 U903 ( .A(n719), .B(n718), .Y(n1078) );
  INVX2 U904 ( .A(i_init_waddr[11]), .Y(n720) );
  NAND2X1 U905 ( .A(n720), .B(n333), .Y(n1448) );
  NAND2X1 U906 ( .A(i_init_waddr[11]), .B(n333), .Y(n1447) );
  MUX2X1 U907 ( .B(wpt[10]), .A(N773), .S(n215), .Y(n721) );
  INVX2 U908 ( .A(n721), .Y(n1135) );
  AOI22X1 U909 ( .A(o_waddr[10]), .B(n221), .C(N674), .D(n218), .Y(n724) );
  AOI22X1 U910 ( .A(N706), .B(n245), .C(wpt[10]), .D(n244), .Y(n722) );
  NAND2X1 U911 ( .A(n724), .B(n722), .Y(n1081) );
  INVX2 U912 ( .A(i_init_waddr[10]), .Y(n725) );
  NAND2X1 U913 ( .A(n725), .B(n333), .Y(n1446) );
  NAND2X1 U914 ( .A(i_init_waddr[10]), .B(n333), .Y(n1445) );
  MUX2X1 U915 ( .B(wpt[9]), .A(N772), .S(n215), .Y(n726) );
  INVX2 U916 ( .A(n726), .Y(n1136) );
  AOI22X1 U917 ( .A(o_waddr[9]), .B(n220), .C(N673), .D(n218), .Y(n728) );
  AOI22X1 U918 ( .A(N705), .B(n245), .C(wpt[9]), .D(n244), .Y(n727) );
  NAND2X1 U919 ( .A(n728), .B(n727), .Y(n1084) );
  INVX2 U920 ( .A(i_init_waddr[9]), .Y(n729) );
  NAND2X1 U921 ( .A(n729), .B(n333), .Y(n1468) );
  NAND2X1 U922 ( .A(i_init_waddr[9]), .B(n333), .Y(n1467) );
  MUX2X1 U923 ( .B(wpt[8]), .A(N771), .S(n215), .Y(n730) );
  INVX2 U924 ( .A(n730), .Y(n1137) );
  AOI22X1 U925 ( .A(o_waddr[8]), .B(n220), .C(N672), .D(n218), .Y(n732) );
  AOI22X1 U926 ( .A(N704), .B(n247), .C(wpt[8]), .D(n244), .Y(n731) );
  NAND2X1 U927 ( .A(n732), .B(n731), .Y(n1087) );
  INVX2 U928 ( .A(i_init_waddr[8]), .Y(n733) );
  NAND2X1 U929 ( .A(n733), .B(n333), .Y(n1444) );
  NAND2X1 U930 ( .A(i_init_waddr[8]), .B(n334), .Y(n1443) );
  MUX2X1 U931 ( .B(wpt[7]), .A(N770), .S(n215), .Y(n734) );
  INVX2 U932 ( .A(n734), .Y(n1138) );
  AOI22X1 U933 ( .A(o_waddr[7]), .B(n220), .C(N671), .D(n218), .Y(n736) );
  AOI22X1 U934 ( .A(N703), .B(n247), .C(wpt[7]), .D(n244), .Y(n735) );
  NAND2X1 U935 ( .A(n736), .B(n735), .Y(n1090) );
  INVX2 U936 ( .A(i_init_waddr[7]), .Y(n737) );
  NAND2X1 U937 ( .A(n737), .B(n334), .Y(n1466) );
  NAND2X1 U938 ( .A(i_init_waddr[7]), .B(n334), .Y(n1465) );
  MUX2X1 U939 ( .B(wpt[6]), .A(N769), .S(n215), .Y(n738) );
  INVX2 U940 ( .A(n738), .Y(n1139) );
  AOI22X1 U941 ( .A(o_waddr[6]), .B(n220), .C(N670), .D(n218), .Y(n740) );
  AOI22X1 U942 ( .A(N702), .B(n245), .C(wpt[6]), .D(n244), .Y(n739) );
  NAND2X1 U943 ( .A(n740), .B(n739), .Y(n1093) );
  INVX2 U944 ( .A(i_init_waddr[6]), .Y(n741) );
  NAND2X1 U945 ( .A(n741), .B(n334), .Y(n1442) );
  NAND2X1 U946 ( .A(i_init_waddr[6]), .B(n334), .Y(n1441) );
  MUX2X1 U947 ( .B(wpt[5]), .A(N768), .S(n215), .Y(n742) );
  INVX2 U948 ( .A(n742), .Y(n1140) );
  AOI22X1 U949 ( .A(o_waddr[5]), .B(n220), .C(N669), .D(n218), .Y(n744) );
  AOI22X1 U950 ( .A(N701), .B(n247), .C(wpt[5]), .D(n244), .Y(n743) );
  NAND2X1 U951 ( .A(n744), .B(n743), .Y(n1096) );
  INVX2 U952 ( .A(i_init_waddr[5]), .Y(n745) );
  NAND2X1 U953 ( .A(n745), .B(n334), .Y(n1464) );
  NAND2X1 U954 ( .A(i_init_waddr[5]), .B(n334), .Y(n1463) );
  MUX2X1 U955 ( .B(wpt[4]), .A(N767), .S(n215), .Y(n746) );
  INVX2 U956 ( .A(n746), .Y(n1141) );
  AOI22X1 U957 ( .A(o_waddr[4]), .B(n220), .C(N668), .D(n218), .Y(n748) );
  AOI22X1 U958 ( .A(N700), .B(n245), .C(wpt[4]), .D(n244), .Y(n747) );
  NAND2X1 U959 ( .A(n748), .B(n747), .Y(n1099) );
  INVX2 U960 ( .A(i_init_waddr[4]), .Y(n749) );
  NAND2X1 U961 ( .A(n749), .B(n334), .Y(n1462) );
  NAND2X1 U962 ( .A(i_init_waddr[4]), .B(n334), .Y(n1461) );
  MUX2X1 U963 ( .B(wpt[3]), .A(N766), .S(n215), .Y(n750) );
  INVX2 U964 ( .A(n750), .Y(n1142) );
  AOI22X1 U965 ( .A(o_waddr[3]), .B(n220), .C(N667), .D(n218), .Y(n752) );
  AOI22X1 U966 ( .A(N699), .B(n245), .C(wpt[3]), .D(n244), .Y(n751) );
  NAND2X1 U967 ( .A(n752), .B(n751), .Y(n1102) );
  INVX2 U968 ( .A(i_init_waddr[3]), .Y(n753) );
  NAND2X1 U969 ( .A(n753), .B(n334), .Y(n1460) );
  NAND2X1 U970 ( .A(i_init_waddr[3]), .B(n335), .Y(n1459) );
  MUX2X1 U971 ( .B(wpt[2]), .A(N765), .S(n215), .Y(n754) );
  INVX2 U972 ( .A(n754), .Y(n1143) );
  AOI22X1 U973 ( .A(o_waddr[2]), .B(n220), .C(N666), .D(n217), .Y(n756) );
  AOI22X1 U974 ( .A(N698), .B(n247), .C(wpt[2]), .D(n242), .Y(n755) );
  NAND2X1 U975 ( .A(n756), .B(n755), .Y(n1105) );
  INVX2 U976 ( .A(i_init_waddr[2]), .Y(n757) );
  NAND2X1 U977 ( .A(n757), .B(n335), .Y(n1458) );
  NAND2X1 U978 ( .A(i_init_waddr[2]), .B(n335), .Y(n1457) );
  MUX2X1 U979 ( .B(wpt[1]), .A(N764), .S(n214), .Y(n758) );
  INVX2 U980 ( .A(n758), .Y(n1144) );
  AOI22X1 U981 ( .A(o_waddr[1]), .B(n220), .C(N665), .D(n218), .Y(n760) );
  AOI22X1 U982 ( .A(N697), .B(n247), .C(wpt[1]), .D(n242), .Y(n759) );
  NAND2X1 U983 ( .A(n760), .B(n759), .Y(n1108) );
  INVX2 U984 ( .A(i_init_waddr[1]), .Y(n761) );
  NAND2X1 U985 ( .A(n761), .B(n335), .Y(n1456) );
  NAND2X1 U986 ( .A(i_init_waddr[1]), .B(n335), .Y(n1455) );
  MUX2X1 U987 ( .B(wpt[0]), .A(N763), .S(n214), .Y(n762) );
  INVX2 U988 ( .A(n762), .Y(n1145) );
  AOI22X1 U989 ( .A(o_waddr[0]), .B(n220), .C(N664), .D(n218), .Y(n764) );
  AOI22X1 U990 ( .A(N696), .B(n247), .C(wpt[0]), .D(n242), .Y(n763) );
  NAND2X1 U991 ( .A(n764), .B(n763), .Y(n1111) );
  INVX2 U992 ( .A(i_init_waddr[0]), .Y(n765) );
  NAND2X1 U993 ( .A(n765), .B(n335), .Y(n1454) );
  NAND2X1 U994 ( .A(i_init_waddr[0]), .B(n335), .Y(n1453) );
  MUX2X1 U995 ( .B(wpt[30]), .A(N793), .S(n215), .Y(n766) );
  INVX2 U996 ( .A(n766), .Y(n1115) );
  AOI22X1 U997 ( .A(o_waddr[30]), .B(n220), .C(N694), .D(n217), .Y(n768) );
  AOI22X1 U998 ( .A(N726), .B(n247), .C(wpt[30]), .D(n242), .Y(n767) );
  NAND2X1 U999 ( .A(n768), .B(n767), .Y(n1021) );
  INVX2 U1000 ( .A(i_init_waddr[30]), .Y(n769) );
  NAND2X1 U1001 ( .A(n769), .B(n335), .Y(n1502) );
  NAND2X1 U1002 ( .A(i_init_waddr[30]), .B(n335), .Y(n1501) );
  NAND2X1 U1003 ( .A(n805), .B(n46), .Y(n803) );
  INVX2 U1004 ( .A(n803), .Y(n802) );
  NAND2X1 U1005 ( .A(n802), .B(n48), .Y(n800) );
  INVX2 U1006 ( .A(n800), .Y(n799) );
  NAND2X1 U1007 ( .A(n799), .B(n1), .Y(n797) );
  INVX2 U1008 ( .A(n797), .Y(n796) );
  NAND2X1 U1009 ( .A(n796), .B(n63), .Y(n794) );
  INVX2 U1010 ( .A(n794), .Y(n793) );
  NAND2X1 U1011 ( .A(n793), .B(n792), .Y(n791) );
  INVX2 U1012 ( .A(n791), .Y(n790) );
  NAND2X1 U1013 ( .A(n790), .B(n75), .Y(n788) );
  INVX2 U1014 ( .A(n788), .Y(n787) );
  NAND2X1 U1015 ( .A(n787), .B(n786), .Y(n785) );
  INVX2 U1016 ( .A(n785), .Y(n784) );
  NAND2X1 U1017 ( .A(n784), .B(n783), .Y(n782) );
  INVX2 U1018 ( .A(n782), .Y(n781) );
  NAND2X1 U1019 ( .A(n781), .B(n780), .Y(n779) );
  INVX2 U1020 ( .A(n779), .Y(n778) );
  NAND2X1 U1021 ( .A(n778), .B(n777), .Y(n776) );
  INVX2 U1022 ( .A(n776), .Y(n775) );
  NAND2X1 U1023 ( .A(n775), .B(n774), .Y(n773) );
  INVX2 U1024 ( .A(n773), .Y(n772) );
  NAND2X1 U1025 ( .A(n772), .B(n771), .Y(n770) );
  INVX2 U1026 ( .A(n770), .Y(n1322) );
  OAI21X1 U1027 ( .A(n772), .B(n771), .C(n770), .Y(boundary_2[15]) );
  OAI21X1 U1028 ( .A(n775), .B(n774), .C(n773), .Y(boundary_2[14]) );
  OAI21X1 U1029 ( .A(n778), .B(n777), .C(n776), .Y(boundary_2[13]) );
  OAI21X1 U1030 ( .A(n781), .B(n780), .C(n779), .Y(boundary_2[12]) );
  OAI21X1 U1031 ( .A(n784), .B(n783), .C(n782), .Y(boundary_2[11]) );
  OAI21X1 U1032 ( .A(n787), .B(n786), .C(n785), .Y(boundary_2[10]) );
  OAI21X1 U1033 ( .A(n790), .B(n75), .C(n788), .Y(boundary_2[9]) );
  OAI21X1 U1034 ( .A(n793), .B(n792), .C(n791), .Y(boundary_2[8]) );
  OAI21X1 U1035 ( .A(n796), .B(n63), .C(n794), .Y(boundary_2[7]) );
  OAI21X1 U1036 ( .A(n799), .B(n114), .C(n797), .Y(boundary_2[6]) );
  OAI21X1 U1037 ( .A(n802), .B(n48), .C(n800), .Y(boundary_2[5]) );
  NAND2X1 U1038 ( .A(n61), .B(n62), .Y(n806) );
  INVX2 U1039 ( .A(n806), .Y(n805) );
  OAI21X1 U1040 ( .A(n805), .B(n46), .C(n803), .Y(boundary_2[4]) );
  OAI21X1 U1041 ( .A(n82), .B(n60), .C(n806), .Y(boundary_2[3]) );
  MUX2X1 U1042 ( .B(wpt[31]), .A(N794), .S(n214), .Y(n807) );
  INVX2 U1043 ( .A(n807), .Y(n1114) );
  AOI22X1 U1044 ( .A(o_waddr[31]), .B(n220), .C(N695), .D(n217), .Y(n809) );
  AOI22X1 U1045 ( .A(N727), .B(n247), .C(wpt[31]), .D(n242), .Y(n808) );
  NAND2X1 U1046 ( .A(n809), .B(n808), .Y(n1018) );
  INVX2 U1047 ( .A(i_init_waddr[31]), .Y(n810) );
  NAND2X1 U1048 ( .A(n810), .B(n335), .Y(n1504) );
  NAND2X1 U1049 ( .A(i_init_waddr[31]), .B(n336), .Y(n1503) );
  MUX2X1 U1050 ( .B(wpt[25]), .A(N788), .S(n215), .Y(n811) );
  INVX2 U1051 ( .A(n811), .Y(n1120) );
  AOI22X1 U1052 ( .A(o_waddr[25]), .B(n220), .C(N689), .D(n218), .Y(n813) );
  AOI22X1 U1053 ( .A(N721), .B(n247), .C(wpt[25]), .D(n242), .Y(n812) );
  NAND2X1 U1054 ( .A(n813), .B(n812), .Y(n1036) );
  INVX2 U1055 ( .A(i_init_waddr[25]), .Y(n814) );
  NAND2X1 U1056 ( .A(n814), .B(n336), .Y(n1492) );
  NAND2X1 U1057 ( .A(i_init_waddr[25]), .B(n336), .Y(n1491) );
  XNOR2X1 U1058 ( .A(o_waddr[26]), .B(boundary_4[26]), .Y(n817) );
  XNOR2X1 U1059 ( .A(o_waddr[25]), .B(boundary_4[25]), .Y(n816) );
  XNOR2X1 U1060 ( .A(o_waddr[27]), .B(boundary_4[27]), .Y(n815) );
  NAND3X1 U1061 ( .A(n817), .B(n816), .C(n815), .Y(n874) );
  XOR2X1 U1062 ( .A(o_waddr[31]), .B(boundary_4[31]), .Y(n869) );
  NAND2X1 U1063 ( .A(n819), .B(n818), .Y(n863) );
  XOR2X1 U1064 ( .A(boundary_4[23]), .B(o_waddr[23]), .Y(n862) );
  XOR2X1 U1065 ( .A(boundary_4[22]), .B(o_waddr[22]), .Y(n822) );
  XOR2X1 U1066 ( .A(boundary_4[18]), .B(o_waddr[18]), .Y(n821) );
  XOR2X1 U1067 ( .A(boundary_4[19]), .B(o_waddr[19]), .Y(n820) );
  NOR3X1 U1068 ( .A(n820), .B(n821), .C(n822), .Y(n860) );
  XNOR2X1 U1069 ( .A(o_waddr[21]), .B(boundary_4[21]), .Y(n824) );
  XNOR2X1 U1070 ( .A(boundary_4[20]), .B(o_waddr[20]), .Y(n823) );
  NAND2X1 U1071 ( .A(n824), .B(n823), .Y(n858) );
  XOR2X1 U1072 ( .A(o_waddr[17]), .B(boundary_4[17]), .Y(n826) );
  XOR2X1 U1073 ( .A(o_waddr[15]), .B(boundary_4[15]), .Y(n825) );
  NOR2X1 U1074 ( .A(n826), .B(n825), .Y(n832) );
  XNOR2X1 U1075 ( .A(o_waddr[16]), .B(boundary_4[16]), .Y(n831) );
  XOR2X1 U1076 ( .A(o_waddr[14]), .B(boundary_4[14]), .Y(n829) );
  XOR2X1 U1077 ( .A(o_waddr[13]), .B(boundary_4[13]), .Y(n827) );
  NOR2X1 U1078 ( .A(n829), .B(n827), .Y(n830) );
  NAND3X1 U1079 ( .A(n832), .B(n831), .C(n830), .Y(n857) );
  XNOR2X1 U1080 ( .A(boundary_4[6]), .B(o_waddr[6]), .Y(n834) );
  XNOR2X1 U1081 ( .A(boundary_4[7]), .B(o_waddr[7]), .Y(n833) );
  NAND2X1 U1082 ( .A(n834), .B(n833), .Y(n839) );
  XNOR2X1 U1083 ( .A(boundary_4[3]), .B(o_waddr[3]), .Y(n837) );
  XNOR2X1 U1084 ( .A(boundary_4[4]), .B(o_waddr[4]), .Y(n836) );
  XNOR2X1 U1085 ( .A(o_waddr[5]), .B(boundary_4[5]), .Y(n835) );
  NAND3X1 U1086 ( .A(n837), .B(n836), .C(n835), .Y(n838) );
  NOR2X1 U1087 ( .A(n839), .B(n838), .Y(n855) );
  XOR2X1 U1088 ( .A(o_waddr[1]), .B(boundary_4[1]), .Y(n845) );
  INVX2 U1089 ( .A(n840), .Y(n843) );
  XNOR2X1 U1090 ( .A(boundary_4[0]), .B(n1508), .Y(n842) );
  XNOR2X1 U1091 ( .A(o_waddr[2]), .B(boundary_4[2]), .Y(n841) );
  NAND3X1 U1092 ( .A(n843), .B(n842), .C(n841), .Y(n844) );
  NOR2X1 U1093 ( .A(n845), .B(n844), .Y(n854) );
  XNOR2X1 U1094 ( .A(o_waddr[8]), .B(boundary_4[8]), .Y(n847) );
  XNOR2X1 U1095 ( .A(o_waddr[9]), .B(boundary_4[9]), .Y(n846) );
  NAND2X1 U1096 ( .A(n847), .B(n846), .Y(n852) );
  XNOR2X1 U1097 ( .A(o_waddr[10]), .B(boundary_4[10]), .Y(n850) );
  XNOR2X1 U1098 ( .A(o_waddr[12]), .B(boundary_4[12]), .Y(n849) );
  XNOR2X1 U1099 ( .A(o_waddr[11]), .B(boundary_4[11]), .Y(n848) );
  NAND3X1 U1100 ( .A(n850), .B(n849), .C(n848), .Y(n851) );
  NOR2X1 U1101 ( .A(n852), .B(n851), .Y(n853) );
  NAND3X1 U1102 ( .A(n855), .B(n854), .C(n853), .Y(n856) );
  NOR3X1 U1103 ( .A(n856), .B(n857), .C(n858), .Y(n859) );
  NAND2X1 U1104 ( .A(n859), .B(n860), .Y(n861) );
  NOR3X1 U1109 ( .A(n862), .B(n863), .C(n861), .Y(n867) );
  XNOR2X1 U1110 ( .A(boundary_4[30]), .B(o_waddr[30]), .Y(n865) );
  NAND3X1 U1111 ( .A(n867), .B(n866), .C(n865), .Y(n868) );
  NOR3X1 U1112 ( .A(n874), .B(n869), .C(n868), .Y(n_done) );
  INVX2 U1113 ( .A(rct2[2]), .Y(n1321) );
  OAI21X1 U1116 ( .A(n878), .B(n1321), .C(n879), .Y(n1294) );
  NOR2X1 U1120 ( .A(n723), .B(n875), .Y(n876) );
  NAND3X1 U1122 ( .A(rct2[0]), .B(n1321), .C(n876), .Y(n882) );
  MUX2X1 U1123 ( .B(rcolpt[30]), .A(N345), .S(n223), .Y(n886) );
  INVX2 U1125 ( .A(n886), .Y(n1167) );
  INVX2 U1130 ( .A(rrowpt[30]), .Y(n911) );
  INVX2 U1133 ( .A(o_raddr[30]), .Y(n910) );
  NAND3X1 U1135 ( .A(n864), .B(n870), .C(n1372), .Y(n899) );
  NOR2X1 U1137 ( .A(n1321), .B(n891), .Y(n896) );
  NAND3X1 U1138 ( .A(n871), .B(rct3[1]), .C(n896), .Y(n898) );
  NOR2X1 U1139 ( .A(n899), .B(n898), .Y(n908) );
  INVX2 U1140 ( .A(rct3[3]), .Y(n902) );
  INVX2 U1141 ( .A(rct3[7]), .Y(n901) );
  INVX2 U1142 ( .A(rct3[2]), .Y(n900) );
  NAND3X1 U1143 ( .A(n902), .B(n901), .C(n900), .Y(n906) );
  NOR2X1 U1144 ( .A(rct3[15]), .B(rct3[14]), .Y(n903) );
  NAND3X1 U1145 ( .A(n1330), .B(n904), .C(n903), .Y(n905) );
  NOR2X1 U1146 ( .A(n906), .B(n905), .Y(n907) );
  NAND2X1 U1147 ( .A(n908), .B(n907), .Y(n909) );
  MUX2X1 U1148 ( .B(n911), .A(n910), .S(n226), .Y(n1367) );
  MUX2X1 U1149 ( .B(rcolpt[29]), .A(N344), .S(n223), .Y(n912) );
  INVX2 U1150 ( .A(n912), .Y(n1168) );
  INVX2 U1151 ( .A(rrowpt[29]), .Y(n914) );
  INVX2 U1152 ( .A(o_raddr[29]), .Y(n913) );
  MUX2X1 U1153 ( .B(n914), .A(n913), .S(n226), .Y(n1366) );
  AOI22X1 U1154 ( .A(o_raddr[29]), .B(n248), .C(N277), .D(n229), .Y(n928) );
  NAND2X1 U1155 ( .A(rcolpt[29]), .B(n232), .Y(n927) );
  AOI22X1 U1156 ( .A(rrowpt[29]), .B(n236), .C(N309), .D(n233), .Y(n918) );
  NAND3X1 U1157 ( .A(n928), .B(n927), .C(n918), .Y(n1204) );
  INVX2 U1158 ( .A(i_init_raddr[29]), .Y(n929) );
  NAND2X1 U1159 ( .A(n929), .B(n336), .Y(n1382) );
  NAND2X1 U1160 ( .A(i_init_raddr[29]), .B(n336), .Y(n1381) );
  MUX2X1 U1161 ( .B(rcolpt[28]), .A(N343), .S(n223), .Y(n930) );
  INVX2 U1162 ( .A(n930), .Y(n1169) );
  INVX2 U1163 ( .A(rrowpt[28]), .Y(n932) );
  INVX2 U1164 ( .A(o_raddr[28]), .Y(n931) );
  MUX2X1 U1165 ( .B(n932), .A(n931), .S(n226), .Y(n1365) );
  AOI22X1 U1166 ( .A(o_raddr[28]), .B(n248), .C(N276), .D(n229), .Y(n935) );
  NAND2X1 U1167 ( .A(rcolpt[28]), .B(n232), .Y(n934) );
  AOI22X1 U1168 ( .A(rrowpt[28]), .B(n236), .C(N308), .D(n233), .Y(n933) );
  NAND3X1 U1169 ( .A(n935), .B(n934), .C(n933), .Y(n1207) );
  INVX2 U1170 ( .A(i_init_raddr[28]), .Y(n936) );
  NAND2X1 U1171 ( .A(n936), .B(n336), .Y(n1384) );
  NAND2X1 U1172 ( .A(i_init_raddr[28]), .B(n336), .Y(n1383) );
  MUX2X1 U1173 ( .B(rcolpt[27]), .A(N342), .S(n223), .Y(n937) );
  INVX2 U1176 ( .A(n937), .Y(n1170) );
  INVX2 U1177 ( .A(rrowpt[27]), .Y(n939) );
  INVX2 U1182 ( .A(o_raddr[27]), .Y(n938) );
  MUX2X1 U1183 ( .B(n939), .A(n938), .S(n226), .Y(n1364) );
  AOI22X1 U1184 ( .A(o_raddr[27]), .B(n248), .C(N275), .D(n229), .Y(n942) );
  NAND2X1 U1185 ( .A(rcolpt[27]), .B(n232), .Y(n941) );
  AOI22X1 U1186 ( .A(rrowpt[27]), .B(n236), .C(N307), .D(n233), .Y(n940) );
  NAND3X1 U1187 ( .A(n942), .B(n941), .C(n940), .Y(n1210) );
  INVX2 U1188 ( .A(i_init_raddr[27]), .Y(n943) );
  NAND2X1 U1189 ( .A(n943), .B(n336), .Y(n1386) );
  NAND2X1 U1190 ( .A(i_init_raddr[27]), .B(n336), .Y(n1385) );
  MUX2X1 U1191 ( .B(rcolpt[26]), .A(N341), .S(n223), .Y(n944) );
  INVX2 U1192 ( .A(n944), .Y(n1171) );
  INVX2 U1193 ( .A(rrowpt[26]), .Y(n946) );
  INVX2 U1194 ( .A(o_raddr[26]), .Y(n945) );
  MUX2X1 U1195 ( .B(n946), .A(n945), .S(n226), .Y(n1363) );
  AOI22X1 U1196 ( .A(o_raddr[26]), .B(n248), .C(N274), .D(n229), .Y(n949) );
  NAND2X1 U1197 ( .A(rcolpt[26]), .B(n232), .Y(n948) );
  AOI22X1 U1198 ( .A(rrowpt[26]), .B(n236), .C(N306), .D(n233), .Y(n947) );
  NAND3X1 U1199 ( .A(n949), .B(n948), .C(n947), .Y(n1213) );
  INVX2 U1200 ( .A(i_init_raddr[26]), .Y(n950) );
  NAND2X1 U1201 ( .A(n950), .B(n336), .Y(n1388) );
  NAND2X1 U1202 ( .A(i_init_raddr[26]), .B(n337), .Y(n1387) );
  MUX2X1 U1203 ( .B(rcolpt[25]), .A(N340), .S(n223), .Y(n951) );
  INVX2 U1204 ( .A(n951), .Y(n1172) );
  INVX2 U1205 ( .A(rrowpt[25]), .Y(n953) );
  INVX2 U1206 ( .A(o_raddr[25]), .Y(n952) );
  MUX2X1 U1207 ( .B(n953), .A(n952), .S(n226), .Y(n1362) );
  AOI22X1 U1208 ( .A(o_raddr[25]), .B(n248), .C(N273), .D(n229), .Y(n956) );
  NAND2X1 U1209 ( .A(rcolpt[25]), .B(n232), .Y(n955) );
  AOI22X1 U1210 ( .A(rrowpt[25]), .B(n236), .C(N305), .D(n233), .Y(n954) );
  NAND3X1 U1211 ( .A(n956), .B(n955), .C(n954), .Y(n1216) );
  INVX2 U1212 ( .A(i_init_raddr[25]), .Y(n957) );
  NAND2X1 U1213 ( .A(n957), .B(n337), .Y(n1390) );
  NAND2X1 U1214 ( .A(i_init_raddr[25]), .B(n337), .Y(n1389) );
  MUX2X1 U1215 ( .B(rcolpt[24]), .A(N339), .S(n223), .Y(n958) );
  INVX2 U1216 ( .A(n958), .Y(n1173) );
  INVX2 U1217 ( .A(rrowpt[24]), .Y(n960) );
  INVX2 U1218 ( .A(o_raddr[24]), .Y(n959) );
  MUX2X1 U1219 ( .B(n960), .A(n959), .S(n226), .Y(n1361) );
  AOI22X1 U1220 ( .A(o_raddr[24]), .B(n248), .C(N272), .D(n229), .Y(n963) );
  NAND2X1 U1221 ( .A(rcolpt[24]), .B(n232), .Y(n962) );
  AOI22X1 U1222 ( .A(rrowpt[24]), .B(n236), .C(N304), .D(n233), .Y(n961) );
  NAND3X1 U1223 ( .A(n963), .B(n962), .C(n961), .Y(n1219) );
  INVX2 U1224 ( .A(i_init_raddr[24]), .Y(n964) );
  NAND2X1 U1225 ( .A(n964), .B(n337), .Y(n1392) );
  NAND2X1 U1226 ( .A(i_init_raddr[24]), .B(n337), .Y(n1391) );
  MUX2X1 U1227 ( .B(rcolpt[23]), .A(N338), .S(n223), .Y(n965) );
  INVX2 U1228 ( .A(n965), .Y(n1174) );
  INVX2 U1229 ( .A(rrowpt[23]), .Y(n967) );
  INVX2 U1230 ( .A(o_raddr[23]), .Y(n966) );
  MUX2X1 U1231 ( .B(n967), .A(n966), .S(n226), .Y(n1360) );
  AOI22X1 U1232 ( .A(o_raddr[23]), .B(n248), .C(N271), .D(n229), .Y(n970) );
  NAND2X1 U1233 ( .A(rcolpt[23]), .B(n232), .Y(n969) );
  AOI22X1 U1234 ( .A(rrowpt[23]), .B(n236), .C(N303), .D(n233), .Y(n968) );
  NAND3X1 U1235 ( .A(n970), .B(n969), .C(n968), .Y(n1222) );
  INVX2 U1236 ( .A(i_init_raddr[23]), .Y(n971) );
  NAND2X1 U1237 ( .A(n971), .B(n337), .Y(n1394) );
  NAND2X1 U1238 ( .A(i_init_raddr[23]), .B(n337), .Y(n1393) );
  MUX2X1 U1239 ( .B(rcolpt[22]), .A(N337), .S(n223), .Y(n972) );
  INVX2 U1240 ( .A(n972), .Y(n1175) );
  INVX2 U1241 ( .A(rrowpt[22]), .Y(n974) );
  INVX2 U1242 ( .A(o_raddr[22]), .Y(n973) );
  MUX2X1 U1243 ( .B(n974), .A(n973), .S(n226), .Y(n1359) );
  AOI22X1 U1244 ( .A(o_raddr[22]), .B(n248), .C(N270), .D(n229), .Y(n977) );
  NAND2X1 U1245 ( .A(rcolpt[22]), .B(n232), .Y(n976) );
  AOI22X1 U1246 ( .A(rrowpt[22]), .B(n236), .C(N302), .D(n233), .Y(n975) );
  NAND3X1 U1247 ( .A(n977), .B(n976), .C(n975), .Y(n1225) );
  INVX2 U1248 ( .A(i_init_raddr[22]), .Y(n978) );
  NAND2X1 U1249 ( .A(n978), .B(n337), .Y(n1396) );
  NAND2X1 U1250 ( .A(i_init_raddr[22]), .B(n337), .Y(n1395) );
  MUX2X1 U1251 ( .B(rcolpt[21]), .A(N336), .S(n223), .Y(n979) );
  INVX2 U1252 ( .A(n979), .Y(n1176) );
  INVX2 U1253 ( .A(rrowpt[21]), .Y(n981) );
  INVX2 U1254 ( .A(o_raddr[21]), .Y(n980) );
  MUX2X1 U1255 ( .B(n981), .A(n980), .S(n226), .Y(n1358) );
  AOI22X1 U1256 ( .A(o_raddr[21]), .B(n248), .C(N269), .D(n229), .Y(n984) );
  NAND2X1 U1257 ( .A(rcolpt[21]), .B(n232), .Y(n983) );
  AOI22X1 U1258 ( .A(rrowpt[21]), .B(n236), .C(N301), .D(n233), .Y(n982) );
  NAND3X1 U1259 ( .A(n984), .B(n983), .C(n982), .Y(n1228) );
  INVX2 U1260 ( .A(i_init_raddr[21]), .Y(n985) );
  NAND2X1 U1261 ( .A(n985), .B(n337), .Y(n1398) );
  NAND2X1 U1262 ( .A(i_init_raddr[21]), .B(n338), .Y(n1397) );
  MUX2X1 U1263 ( .B(rcolpt[20]), .A(N335), .S(n223), .Y(n986) );
  INVX2 U1264 ( .A(n986), .Y(n1177) );
  INVX2 U1265 ( .A(rrowpt[20]), .Y(n988) );
  INVX2 U1266 ( .A(o_raddr[20]), .Y(n987) );
  MUX2X1 U1267 ( .B(n988), .A(n987), .S(n226), .Y(n1357) );
  AOI22X1 U1268 ( .A(o_raddr[20]), .B(n248), .C(N268), .D(n229), .Y(n991) );
  NAND2X1 U1269 ( .A(rcolpt[20]), .B(n232), .Y(n990) );
  AOI22X1 U1270 ( .A(rrowpt[20]), .B(n236), .C(N300), .D(n233), .Y(n989) );
  NAND3X1 U1271 ( .A(n991), .B(n990), .C(n989), .Y(n1231) );
  INVX2 U1272 ( .A(i_init_raddr[20]), .Y(n992) );
  NAND2X1 U1273 ( .A(n992), .B(n338), .Y(n1400) );
  NAND2X1 U1274 ( .A(i_init_raddr[20]), .B(n338), .Y(n1399) );
  MUX2X1 U1275 ( .B(rcolpt[19]), .A(N334), .S(n223), .Y(n993) );
  INVX2 U1276 ( .A(n993), .Y(n1178) );
  INVX2 U1277 ( .A(rrowpt[19]), .Y(n995) );
  INVX2 U1278 ( .A(o_raddr[19]), .Y(n994) );
  MUX2X1 U1279 ( .B(n995), .A(n994), .S(n226), .Y(n1356) );
  AOI22X1 U1280 ( .A(o_raddr[19]), .B(n248), .C(N267), .D(n229), .Y(n998) );
  NAND2X1 U1281 ( .A(rcolpt[19]), .B(n232), .Y(n997) );
  AOI22X1 U1282 ( .A(rrowpt[19]), .B(n236), .C(N299), .D(n233), .Y(n996) );
  NAND3X1 U1283 ( .A(n998), .B(n997), .C(n996), .Y(n1234) );
  INVX2 U1284 ( .A(i_init_raddr[19]), .Y(n999) );
  NAND2X1 U1285 ( .A(n999), .B(n338), .Y(n1402) );
  NAND2X1 U1286 ( .A(i_init_raddr[19]), .B(n338), .Y(n1401) );
  MUX2X1 U1287 ( .B(rcolpt[18]), .A(N333), .S(n223), .Y(n1000) );
  INVX2 U1288 ( .A(n1000), .Y(n1179) );
  INVX2 U1289 ( .A(rrowpt[18]), .Y(n1002) );
  INVX2 U1290 ( .A(o_raddr[18]), .Y(n1001) );
  MUX2X1 U1291 ( .B(n1002), .A(n1001), .S(n226), .Y(n1355) );
  AOI22X1 U1292 ( .A(o_raddr[18]), .B(n248), .C(N266), .D(n229), .Y(n1005) );
  NAND2X1 U1293 ( .A(rcolpt[18]), .B(n232), .Y(n1004) );
  AOI22X1 U1294 ( .A(rrowpt[18]), .B(n236), .C(N298), .D(n233), .Y(n1003) );
  NAND3X1 U1295 ( .A(n1005), .B(n1004), .C(n1003), .Y(n1237) );
  INVX2 U1296 ( .A(i_init_raddr[18]), .Y(n1006) );
  NAND2X1 U1297 ( .A(n1006), .B(n338), .Y(n1404) );
  NAND2X1 U1298 ( .A(i_init_raddr[18]), .B(n338), .Y(n1403) );
  MUX2X1 U1299 ( .B(rcolpt[17]), .A(N332), .S(n224), .Y(n1007) );
  INVX2 U1300 ( .A(n1007), .Y(n1180) );
  INVX2 U1301 ( .A(rrowpt[17]), .Y(n1009) );
  INVX2 U1302 ( .A(o_raddr[17]), .Y(n1008) );
  MUX2X1 U1303 ( .B(n1009), .A(n1008), .S(n227), .Y(n1354) );
  AOI22X1 U1304 ( .A(o_raddr[17]), .B(n248), .C(N265), .D(n229), .Y(n1012) );
  NAND2X1 U1305 ( .A(rcolpt[17]), .B(n232), .Y(n1011) );
  AOI22X1 U1306 ( .A(rrowpt[17]), .B(n236), .C(N297), .D(n233), .Y(n1010) );
  NAND3X1 U1307 ( .A(n1012), .B(n1011), .C(n1010), .Y(n1240) );
  INVX2 U1308 ( .A(i_init_raddr[17]), .Y(n1013) );
  NAND2X1 U1309 ( .A(n1013), .B(n338), .Y(n1406) );
  NAND2X1 U1310 ( .A(i_init_raddr[17]), .B(n338), .Y(n1405) );
  MUX2X1 U1311 ( .B(rcolpt[16]), .A(N331), .S(n224), .Y(n1014) );
  INVX2 U1312 ( .A(n1014), .Y(n1181) );
  INVX2 U1313 ( .A(rrowpt[16]), .Y(n1016) );
  INVX2 U1314 ( .A(o_raddr[16]), .Y(n1015) );
  MUX2X1 U1315 ( .B(n1016), .A(n1015), .S(n227), .Y(n1353) );
  AOI22X1 U1316 ( .A(o_raddr[16]), .B(n250), .C(N264), .D(n230), .Y(n1020) );
  NAND2X1 U1317 ( .A(rcolpt[16]), .B(n232), .Y(n1019) );
  AOI22X1 U1318 ( .A(rrowpt[16]), .B(n238), .C(N296), .D(n235), .Y(n1017) );
  NAND3X1 U1319 ( .A(n1020), .B(n1019), .C(n1017), .Y(n1243) );
  INVX2 U1320 ( .A(i_init_raddr[16]), .Y(n1022) );
  NAND2X1 U1321 ( .A(n1022), .B(n338), .Y(n1408) );
  NAND2X1 U1322 ( .A(i_init_raddr[16]), .B(n339), .Y(n1407) );
  MUX2X1 U1323 ( .B(rcolpt[15]), .A(N330), .S(n224), .Y(n1023) );
  INVX2 U1324 ( .A(n1023), .Y(n1182) );
  INVX2 U1325 ( .A(rrowpt[15]), .Y(n1026) );
  INVX2 U1326 ( .A(o_raddr[15]), .Y(n1025) );
  MUX2X1 U1327 ( .B(n1026), .A(n1025), .S(n227), .Y(n1352) );
  AOI22X1 U1328 ( .A(o_raddr[15]), .B(n250), .C(N263), .D(n230), .Y(n1031) );
  NAND2X1 U1329 ( .A(rcolpt[15]), .B(n232), .Y(n1029) );
  AOI22X1 U1330 ( .A(rrowpt[15]), .B(n238), .C(N295), .D(n235), .Y(n1028) );
  NAND3X1 U1331 ( .A(n1031), .B(n1029), .C(n1028), .Y(n1246) );
  INVX2 U1332 ( .A(i_init_raddr[15]), .Y(n1032) );
  NAND2X1 U1333 ( .A(n1032), .B(n339), .Y(n1410) );
  NAND2X1 U1334 ( .A(i_init_raddr[15]), .B(n339), .Y(n1409) );
  MUX2X1 U1335 ( .B(rcolpt[14]), .A(N329), .S(n224), .Y(n1034) );
  INVX2 U1336 ( .A(n1034), .Y(n1183) );
  INVX2 U1337 ( .A(rrowpt[14]), .Y(n1037) );
  INVX2 U1338 ( .A(o_raddr[14]), .Y(n1035) );
  MUX2X1 U1339 ( .B(n1037), .A(n1035), .S(n227), .Y(n1351) );
  AOI22X1 U1340 ( .A(o_raddr[14]), .B(n250), .C(N262), .D(n230), .Y(n1041) );
  NAND2X1 U1341 ( .A(rcolpt[14]), .B(n232), .Y(n1040) );
  AOI22X1 U1342 ( .A(rrowpt[14]), .B(n238), .C(N294), .D(n235), .Y(n1038) );
  NAND3X1 U1343 ( .A(n1041), .B(n1040), .C(n1038), .Y(n1249) );
  INVX2 U1344 ( .A(i_init_raddr[14]), .Y(n1043) );
  NAND2X1 U1345 ( .A(n1043), .B(n339), .Y(n1412) );
  NAND2X1 U1346 ( .A(i_init_raddr[14]), .B(n339), .Y(n1411) );
  MUX2X1 U1347 ( .B(rcolpt[13]), .A(N328), .S(n224), .Y(n1044) );
  INVX2 U1348 ( .A(n1044), .Y(n1184) );
  INVX2 U1349 ( .A(rrowpt[13]), .Y(n1047) );
  INVX2 U1350 ( .A(o_raddr[13]), .Y(n1046) );
  MUX2X1 U1351 ( .B(n1047), .A(n1046), .S(n227), .Y(n1350) );
  AOI22X1 U1352 ( .A(o_raddr[13]), .B(n250), .C(N261), .D(n230), .Y(n1052) );
  NAND2X1 U1353 ( .A(rcolpt[13]), .B(n232), .Y(n1050) );
  AOI22X1 U1354 ( .A(rrowpt[13]), .B(n238), .C(N293), .D(n235), .Y(n1049) );
  NAND3X1 U1355 ( .A(n1052), .B(n1050), .C(n1049), .Y(n1252) );
  INVX2 U1356 ( .A(i_init_raddr[13]), .Y(n1053) );
  NAND2X1 U1357 ( .A(n1053), .B(n339), .Y(n1414) );
  NAND2X1 U1358 ( .A(i_init_raddr[13]), .B(n339), .Y(n1413) );
  MUX2X1 U1359 ( .B(rcolpt[12]), .A(N327), .S(n224), .Y(n1055) );
  INVX2 U1360 ( .A(n1055), .Y(n1185) );
  INVX2 U1361 ( .A(rrowpt[12]), .Y(n1058) );
  INVX2 U1362 ( .A(o_raddr[12]), .Y(n1056) );
  MUX2X1 U1363 ( .B(n1058), .A(n1056), .S(n227), .Y(n1349) );
  AOI22X1 U1364 ( .A(o_raddr[12]), .B(n250), .C(N260), .D(n230), .Y(n1062) );
  NAND2X1 U1365 ( .A(rcolpt[12]), .B(n232), .Y(n1061) );
  AOI22X1 U1366 ( .A(rrowpt[12]), .B(n238), .C(N292), .D(n235), .Y(n1059) );
  NAND3X1 U1367 ( .A(n1062), .B(n1061), .C(n1059), .Y(n1255) );
  INVX2 U1368 ( .A(i_init_raddr[12]), .Y(n1064) );
  NAND2X1 U1369 ( .A(n1064), .B(n339), .Y(n1416) );
  NAND2X1 U1370 ( .A(i_init_raddr[12]), .B(n339), .Y(n1415) );
  MUX2X1 U1371 ( .B(rcolpt[11]), .A(N326), .S(n224), .Y(n1065) );
  INVX2 U1372 ( .A(n1065), .Y(n1186) );
  INVX2 U1373 ( .A(rrowpt[11]), .Y(n1068) );
  INVX2 U1374 ( .A(o_raddr[11]), .Y(n1067) );
  MUX2X1 U1375 ( .B(n1068), .A(n1067), .S(n227), .Y(n1348) );
  AOI22X1 U1376 ( .A(o_raddr[11]), .B(n250), .C(N259), .D(n230), .Y(n1073) );
  NAND2X1 U1377 ( .A(rcolpt[11]), .B(n232), .Y(n1071) );
  AOI22X1 U1378 ( .A(rrowpt[11]), .B(n238), .C(N291), .D(n235), .Y(n1070) );
  NAND3X1 U1379 ( .A(n1073), .B(n1071), .C(n1070), .Y(n1258) );
  INVX2 U1380 ( .A(i_init_raddr[11]), .Y(n1074) );
  NAND2X1 U1381 ( .A(n1074), .B(n339), .Y(n1418) );
  NAND2X1 U1382 ( .A(i_init_raddr[11]), .B(n340), .Y(n1417) );
  MUX2X1 U1383 ( .B(rcolpt[10]), .A(N325), .S(n224), .Y(n1076) );
  INVX2 U1384 ( .A(n1076), .Y(n1187) );
  INVX2 U1385 ( .A(rrowpt[10]), .Y(n1079) );
  INVX2 U1386 ( .A(o_raddr[10]), .Y(n1077) );
  MUX2X1 U1387 ( .B(n1079), .A(n1077), .S(n227), .Y(n1347) );
  AOI22X1 U1388 ( .A(o_raddr[10]), .B(n250), .C(N258), .D(n230), .Y(n1083) );
  NAND2X1 U1389 ( .A(rcolpt[10]), .B(n232), .Y(n1082) );
  AOI22X1 U1390 ( .A(rrowpt[10]), .B(n238), .C(N290), .D(n235), .Y(n1080) );
  NAND3X1 U1391 ( .A(n1083), .B(n1082), .C(n1080), .Y(n1261) );
  INVX2 U1392 ( .A(i_init_raddr[10]), .Y(n1085) );
  NAND2X1 U1393 ( .A(n1085), .B(n340), .Y(n1420) );
  NAND2X1 U1394 ( .A(i_init_raddr[10]), .B(n340), .Y(n1419) );
  MUX2X1 U1395 ( .B(rcolpt[9]), .A(N324), .S(n224), .Y(n1086) );
  INVX2 U1396 ( .A(n1086), .Y(n1188) );
  INVX2 U1397 ( .A(rrowpt[9]), .Y(n1089) );
  INVX2 U1398 ( .A(o_raddr[9]), .Y(n1088) );
  MUX2X1 U1399 ( .B(n1089), .A(n1088), .S(n227), .Y(n1346) );
  AOI22X1 U1400 ( .A(o_raddr[9]), .B(n250), .C(N257), .D(n230), .Y(n1094) );
  NAND2X1 U1401 ( .A(rcolpt[9]), .B(n232), .Y(n1092) );
  AOI22X1 U1402 ( .A(rrowpt[9]), .B(n238), .C(N289), .D(n235), .Y(n1091) );
  NAND3X1 U1403 ( .A(n1094), .B(n1092), .C(n1091), .Y(n1264) );
  INVX2 U1404 ( .A(i_init_raddr[9]), .Y(n1095) );
  NAND2X1 U1405 ( .A(n1095), .B(n340), .Y(n1422) );
  NAND2X1 U1406 ( .A(i_init_raddr[9]), .B(n340), .Y(n1421) );
  MUX2X1 U1407 ( .B(rcolpt[8]), .A(N323), .S(n224), .Y(n1097) );
  INVX2 U1408 ( .A(n1097), .Y(n1189) );
  INVX2 U1409 ( .A(rrowpt[8]), .Y(n1100) );
  INVX2 U1410 ( .A(o_raddr[8]), .Y(n1098) );
  MUX2X1 U1411 ( .B(n1100), .A(n1098), .S(n227), .Y(n1345) );
  AOI22X1 U1412 ( .A(o_raddr[8]), .B(n250), .C(N256), .D(n230), .Y(n1104) );
  NAND2X1 U1413 ( .A(rcolpt[8]), .B(n232), .Y(n1103) );
  AOI22X1 U1414 ( .A(rrowpt[8]), .B(n238), .C(N288), .D(n235), .Y(n1101) );
  NAND3X1 U1415 ( .A(n1104), .B(n1103), .C(n1101), .Y(n1267) );
  INVX2 U1416 ( .A(i_init_raddr[8]), .Y(n1106) );
  NAND2X1 U1417 ( .A(n1106), .B(n340), .Y(n1424) );
  NAND2X1 U1418 ( .A(i_init_raddr[8]), .B(n340), .Y(n1423) );
  MUX2X1 U1419 ( .B(rcolpt[7]), .A(N322), .S(n224), .Y(n1107) );
  INVX2 U1420 ( .A(n1107), .Y(n1190) );
  INVX2 U1421 ( .A(rrowpt[7]), .Y(n1110) );
  INVX2 U1422 ( .A(o_raddr[7]), .Y(n1109) );
  MUX2X1 U1423 ( .B(n1110), .A(n1109), .S(n227), .Y(n1344) );
  AOI22X1 U1424 ( .A(o_raddr[7]), .B(n250), .C(N255), .D(n230), .Y(n1199) );
  NAND2X1 U1425 ( .A(rcolpt[7]), .B(n232), .Y(n1113) );
  AOI22X1 U1426 ( .A(rrowpt[7]), .B(n238), .C(N287), .D(n235), .Y(n1112) );
  NAND3X1 U1427 ( .A(n1199), .B(n1113), .C(n1112), .Y(n1270) );
  INVX2 U1428 ( .A(i_init_raddr[7]), .Y(n1200) );
  NAND2X1 U1429 ( .A(n1200), .B(n340), .Y(n1426) );
  NAND2X1 U1430 ( .A(i_init_raddr[7]), .B(n340), .Y(n1425) );
  MUX2X1 U1431 ( .B(rcolpt[6]), .A(N321), .S(n224), .Y(n1202) );
  INVX2 U1432 ( .A(n1202), .Y(n1191) );
  INVX2 U1433 ( .A(rrowpt[6]), .Y(n1205) );
  INVX2 U1434 ( .A(o_raddr[6]), .Y(n1203) );
  MUX2X1 U1435 ( .B(n1205), .A(n1203), .S(n227), .Y(n1343) );
  AOI22X1 U1436 ( .A(o_raddr[6]), .B(n250), .C(N254), .D(n230), .Y(n1209) );
  NAND2X1 U1437 ( .A(rcolpt[6]), .B(n232), .Y(n1208) );
  AOI22X1 U1438 ( .A(rrowpt[6]), .B(n238), .C(N286), .D(n235), .Y(n1206) );
  NAND3X1 U1439 ( .A(n1209), .B(n1208), .C(n1206), .Y(n1273) );
  INVX2 U1440 ( .A(i_init_raddr[6]), .Y(n1211) );
  NAND2X1 U1441 ( .A(n1211), .B(n340), .Y(n1428) );
  NAND2X1 U1442 ( .A(i_init_raddr[6]), .B(n341), .Y(n1427) );
  MUX2X1 U1443 ( .B(rcolpt[5]), .A(N320), .S(n224), .Y(n1212) );
  INVX2 U1444 ( .A(n1212), .Y(n1192) );
  INVX2 U1445 ( .A(rrowpt[5]), .Y(n1215) );
  INVX2 U1446 ( .A(o_raddr[5]), .Y(n1214) );
  MUX2X1 U1447 ( .B(n1215), .A(n1214), .S(n227), .Y(n1342) );
  AOI22X1 U1448 ( .A(o_raddr[5]), .B(n250), .C(N253), .D(n230), .Y(n1220) );
  NAND2X1 U1449 ( .A(rcolpt[5]), .B(n232), .Y(n1218) );
  AOI22X1 U1450 ( .A(rrowpt[5]), .B(n238), .C(N285), .D(n235), .Y(n1217) );
  NAND3X1 U1451 ( .A(n1220), .B(n1218), .C(n1217), .Y(n1276) );
  INVX2 U1452 ( .A(i_init_raddr[5]), .Y(n1221) );
  NAND2X1 U1453 ( .A(n1221), .B(n341), .Y(n1430) );
  NAND2X1 U1454 ( .A(i_init_raddr[5]), .B(n341), .Y(n1429) );
  MUX2X1 U1455 ( .B(rcolpt[4]), .A(N319), .S(n224), .Y(n1223) );
  INVX2 U1456 ( .A(n1223), .Y(n1193) );
  INVX2 U1457 ( .A(rrowpt[4]), .Y(n1226) );
  INVX2 U1458 ( .A(o_raddr[4]), .Y(n1224) );
  MUX2X1 U1459 ( .B(n1226), .A(n1224), .S(n227), .Y(n1341) );
  AOI22X1 U1460 ( .A(o_raddr[4]), .B(n250), .C(N252), .D(n230), .Y(n1230) );
  NAND2X1 U1461 ( .A(rcolpt[4]), .B(n232), .Y(n1229) );
  AOI22X1 U1462 ( .A(rrowpt[4]), .B(n238), .C(N284), .D(n235), .Y(n1227) );
  NAND3X1 U1463 ( .A(n1230), .B(n1229), .C(n1227), .Y(n1279) );
  INVX2 U1464 ( .A(i_init_raddr[4]), .Y(n1232) );
  NAND2X1 U1465 ( .A(n1232), .B(n341), .Y(n1432) );
  NAND2X1 U1466 ( .A(i_init_raddr[4]), .B(n341), .Y(n1431) );
  MUX2X1 U1467 ( .B(rcolpt[3]), .A(N318), .S(n224), .Y(n1233) );
  INVX2 U1468 ( .A(n1233), .Y(n1194) );
  INVX2 U1469 ( .A(rrowpt[3]), .Y(n1236) );
  INVX2 U1470 ( .A(o_raddr[3]), .Y(n1235) );
  MUX2X1 U1471 ( .B(n1236), .A(n1235), .S(n226), .Y(n1340) );
  AOI22X1 U1472 ( .A(o_raddr[3]), .B(n248), .C(N251), .D(n229), .Y(n1241) );
  NAND2X1 U1473 ( .A(rcolpt[3]), .B(n232), .Y(n1239) );
  AOI22X1 U1474 ( .A(rrowpt[3]), .B(n236), .C(N283), .D(n233), .Y(n1238) );
  NAND3X1 U1475 ( .A(n1241), .B(n1239), .C(n1238), .Y(n1282) );
  INVX2 U1476 ( .A(i_init_raddr[3]), .Y(n1242) );
  NAND2X1 U1477 ( .A(n1242), .B(n341), .Y(n1434) );
  NAND2X1 U1478 ( .A(i_init_raddr[3]), .B(n341), .Y(n1433) );
  MUX2X1 U1479 ( .B(rcolpt[2]), .A(N317), .S(n223), .Y(n1244) );
  INVX2 U1480 ( .A(n1244), .Y(n1195) );
  INVX2 U1481 ( .A(rrowpt[2]), .Y(n1247) );
  INVX2 U1482 ( .A(o_raddr[2]), .Y(n1245) );
  MUX2X1 U1483 ( .B(n1247), .A(n1245), .S(n227), .Y(n1339) );
  AOI22X1 U1484 ( .A(o_raddr[2]), .B(n248), .C(N250), .D(n229), .Y(n1251) );
  NAND2X1 U1485 ( .A(rcolpt[2]), .B(n232), .Y(n1250) );
  AOI22X1 U1486 ( .A(rrowpt[2]), .B(n236), .C(N282), .D(n233), .Y(n1248) );
  NAND3X1 U1487 ( .A(n1251), .B(n1250), .C(n1248), .Y(n1285) );
  INVX2 U1488 ( .A(i_init_raddr[2]), .Y(n1253) );
  NAND2X1 U1489 ( .A(n1253), .B(n341), .Y(n1436) );
  NAND2X1 U1490 ( .A(i_init_raddr[2]), .B(n341), .Y(n1435) );
  MUX2X1 U1491 ( .B(rcolpt[1]), .A(N316), .S(n224), .Y(n1254) );
  INVX2 U1492 ( .A(n1254), .Y(n1196) );
  INVX2 U1493 ( .A(rrowpt[1]), .Y(n1257) );
  INVX2 U1494 ( .A(o_raddr[1]), .Y(n1256) );
  MUX2X1 U1495 ( .B(n1257), .A(n1256), .S(n227), .Y(n1338) );
  AOI22X1 U1496 ( .A(o_raddr[1]), .B(n250), .C(N249), .D(n230), .Y(n1262) );
  NAND2X1 U1497 ( .A(rcolpt[1]), .B(n232), .Y(n1260) );
  AOI22X1 U1498 ( .A(rrowpt[1]), .B(n238), .C(N281), .D(n235), .Y(n1259) );
  NAND3X1 U1499 ( .A(n1262), .B(n1260), .C(n1259), .Y(n1288) );
  INVX2 U1500 ( .A(i_init_raddr[1]), .Y(n1263) );
  NAND2X1 U1501 ( .A(n1263), .B(n341), .Y(n1438) );
  NAND2X1 U1502 ( .A(i_init_raddr[1]), .B(n342), .Y(n1437) );
  AOI22X1 U1503 ( .A(o_raddr[30]), .B(n250), .C(N278), .D(n230), .Y(n1268) );
  NAND2X1 U1504 ( .A(rcolpt[30]), .B(n232), .Y(n1266) );
  AOI22X1 U1505 ( .A(rrowpt[30]), .B(n238), .C(N310), .D(n235), .Y(n1265) );
  NAND3X1 U1506 ( .A(n1268), .B(n1266), .C(n1265), .Y(n1201) );
  INVX2 U1507 ( .A(i_init_raddr[30]), .Y(n1269) );
  NAND2X1 U1508 ( .A(n1269), .B(n342), .Y(n1380) );
  NAND2X1 U1509 ( .A(i_init_raddr[30]), .B(n342), .Y(n1379) );
  MUX2X1 U1510 ( .B(rcolpt[31]), .A(N346), .S(n223), .Y(n1271) );
  INVX2 U1511 ( .A(n1271), .Y(n1166) );
  INVX2 U1512 ( .A(rrowpt[31]), .Y(n1274) );
  INVX2 U1513 ( .A(o_raddr[31]), .Y(n1272) );
  MUX2X1 U1514 ( .B(n1274), .A(n1272), .S(n226), .Y(n1368) );
  AOI22X1 U1515 ( .A(o_raddr[31]), .B(n248), .C(N279), .D(n229), .Y(n1278) );
  NAND2X1 U1516 ( .A(rcolpt[31]), .B(n232), .Y(n1277) );
  AOI22X1 U1517 ( .A(rrowpt[31]), .B(n236), .C(N311), .D(n233), .Y(n1275) );
  NAND3X1 U1518 ( .A(n1278), .B(n1277), .C(n1275), .Y(n1198) );
  INVX2 U1519 ( .A(i_init_raddr[31]), .Y(n1280) );
  NAND2X1 U1520 ( .A(n1280), .B(n342), .Y(n1378) );
  NAND2X1 U1521 ( .A(i_init_raddr[31]), .B(n342), .Y(n1377) );
  MUX2X1 U1522 ( .B(rcolpt[0]), .A(N315), .S(n223), .Y(n1281) );
  INVX2 U1523 ( .A(n1281), .Y(n1197) );
  INVX2 U1524 ( .A(rrowpt[0]), .Y(n1284) );
  MUX2X1 U1525 ( .B(n1284), .A(n1283), .S(n226), .Y(n1337) );
  AOI22X1 U1526 ( .A(o_raddr[0]), .B(n250), .C(N248), .D(n230), .Y(n1289) );
  NAND2X1 U1527 ( .A(rcolpt[0]), .B(n232), .Y(n1287) );
  AOI22X1 U1528 ( .A(rrowpt[0]), .B(n238), .C(N280), .D(n235), .Y(n1286) );
  NAND3X1 U1529 ( .A(n1289), .B(n1287), .C(n1286), .Y(n1291) );
  INVX2 U1530 ( .A(i_init_raddr[0]), .Y(n1290) );
  NAND2X1 U1531 ( .A(n1290), .B(n342), .Y(n1440) );
  NAND2X1 U1532 ( .A(i_init_raddr[0]), .B(n342), .Y(n1439) );
  INVX2 U1533 ( .A(rct2[0]), .Y(n1370) );
  INVX2 U1534 ( .A(rct3[13]), .Y(n1293) );
  INVX2 U1535 ( .A(rct3[11]), .Y(n1292) );
  NAND3X1 U1536 ( .A(n1315), .B(n1293), .C(n1292), .Y(n872) );
  INVX2 U1537 ( .A(n1318), .Y(n682) );
  INVX2 U1538 ( .A(n1319), .Y(n522) );
  INVX2 U1539 ( .A(n890), .Y(n1335) );
  INVX2 U1540 ( .A(n881), .Y(n1336) );
  INVX2 U1541 ( .A(n923), .Y(n1369) );
  INVX2 U1542 ( .A(rct2[1]), .Y(n1371) );
  INVX2 U1543 ( .A(n723), .Y(n1372) );
  INVX2 U1544 ( .A(rct1[0]), .Y(n1373) );
  INVX2 U1545 ( .A(n922), .Y(n1374) );
  INVX2 U1546 ( .A(rct1[1]), .Y(n1375) );
  INVX2 U1547 ( .A(rct1[2]), .Y(n1376) );
  NOR2X1 U1549 ( .A(n925), .B(n926), .Y(n924) );
  NOR2X1 U1550 ( .A(n894), .B(n895), .Y(n893) );
  OAI21X1 U1551 ( .A(n921), .B(n344), .C(n248), .Y(n1314) );
  NAND2X1 U1552 ( .A(n1327), .B(n885), .Y(n1295) );
  NAND2X1 U1553 ( .A(n1327), .B(n883), .Y(n884) );
endmodule


module AHB_wrapper ( clk, n_rst, done, s_haddr, m_haddr, s_hrdata, m_hrdata, 
        m_hwdata, s_hwdata, s_hwrite, m_hwrite, s_hready, m_hready, re, we, 
        buffer2_data, greyscale_data, read_complete, write_complete );
  input [31:0] s_haddr;
  output [31:0] m_haddr;
  output [31:0] s_hrdata;
  input [31:0] m_hrdata;
  output [31:0] m_hwdata;
  input [31:0] s_hwdata;
  input [31:0] buffer2_data;
  output [31:0] greyscale_data;
  input clk, n_rst, s_hwrite, m_hready, re, we;
  output done, m_hwrite, s_hready, read_complete, write_complete;
  wire   raddr_ready, waddr_ready, inc_raddr, inc_waddr, n1;
  wire   [31:0] waddr;
  wire   [31:0] raddr;
  wire   [31:0] start_raddr;
  wire   [15:0] img_width;
  wire   [15:0] img_height;

  AHB I ( .clk(clk), .n_rst(n_rst), .hready(m_hready), .re(re), .we(we), 
        .stop(n1), .raddr_ready(raddr_ready), .waddr_ready(waddr_ready), 
        .waddr(waddr), .raddr(raddr), .buffer2_data(buffer2_data), .hrdata(
        m_hrdata), .greyscale_data(greyscale_data), .haddr(m_haddr), .hwdata(
        m_hwdata), .hwrite(m_hwrite), .read_complete(read_complete), 
        .write_complete(write_complete), .inc_raddr(inc_raddr), .inc_waddr(
        inc_waddr) );
  AHB_slave II ( .clk(clk), .n_rst(n_rst), .done(done), .haddr(s_haddr), 
        .hwrite(s_hwrite), .hwdata(s_hwdata), .hrdata(s_hrdata), .hready(
        s_hready), .start_raddr(start_raddr), .img_width(img_width), 
        .img_height(img_height) );
  address_counter III ( .clk(clk), .n_rst(n_rst), .i_inc_raddr(inc_raddr), 
        .i_inc_waddr(inc_waddr), .i_init_raddr(start_raddr), .i_init_waddr({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1, 
        1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .i_img_width(
        img_width), .i_img_height(img_height), .o_raddr(raddr), .o_waddr(waddr), .o_r_ready(raddr_ready), .o_w_ready(waddr_ready), .o_done(done) );
  INVX2 U3 ( .A(s_hrdata[0]), .Y(n1) );
endmodule


module grayscale_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;

  wire   [8:1] carry;

  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(SUM[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(carry[1]), .YC(carry[2]), .YS(SUM[1]) );
  AND2X1 U1 ( .A(B[0]), .B(A[0]), .Y(carry[1]) );
endmodule


module grayscale ( clk, n_rst, i_grayscale_start, i_RGB, 
        o_grayscale_data_ready, o_gray );
  input [31:0] i_RGB;
  output [7:0] o_gray;
  input clk, n_rst, i_grayscale_start;
  output o_grayscale_data_ready;
  wire   N129, N130, N131, N132, N133, N134, N135, N136, n181, n184, n187,
         n190, n193, n196, n199, n202, n205, n206, n207, n208, n209, n210,
         n211, n212, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n42, n43, n46, n47, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n182, n183, n185, n186, n188, n189, n191,
         n192, n194, n195, n197, n198, n200, n201, n203, n204, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331;
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
  DFFSR \min_reg[7]  ( .D(n205), .CLK(clk), .R(n308), .S(n307), .Q(min[7]) );
  DFFSR \curr_reg[1]  ( .D(next[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr[1]) );
  DFFSR \curr_reg[3]  ( .D(next[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr[3]) );
  DFFSR \min_reg[6]  ( .D(n206), .CLK(clk), .R(n310), .S(n309), .Q(min[6]) );
  DFFSR \curr_reg[2]  ( .D(next[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr[2]) );
  DFFSR \min_reg[0]  ( .D(n212), .CLK(clk), .R(n322), .S(n321), .Q(min[0]) );
  DFFSR \min_reg[1]  ( .D(n211), .CLK(clk), .R(n320), .S(n319), .Q(min[1]) );
  DFFSR \min_reg[2]  ( .D(n210), .CLK(clk), .R(n318), .S(n317), .Q(min[2]) );
  DFFSR \min_reg[3]  ( .D(n209), .CLK(clk), .R(n316), .S(n315), .Q(min[3]) );
  DFFSR \min_reg[4]  ( .D(n208), .CLK(clk), .R(n314), .S(n313), .Q(min[4]) );
  DFFSR \min_reg[5]  ( .D(n207), .CLK(clk), .R(n312), .S(n311), .Q(min[5]) );
  DFFSR o_grayscale_data_ready_reg ( .D(n323), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(o_grayscale_data_ready) );
  DFFSR \max_reg[0]  ( .D(n202), .CLK(clk), .R(n322), .S(n321), .Q(max[0]) );
  DFFSR \max_reg[1]  ( .D(n199), .CLK(clk), .R(n320), .S(n319), .Q(max[1]) );
  DFFSR \max_reg[2]  ( .D(n196), .CLK(clk), .R(n318), .S(n317), .Q(max[2]) );
  DFFSR \max_reg[3]  ( .D(n193), .CLK(clk), .R(n316), .S(n315), .Q(max[3]) );
  DFFSR \max_reg[4]  ( .D(n190), .CLK(clk), .R(n314), .S(n313), .Q(max[4]) );
  DFFSR \max_reg[5]  ( .D(n187), .CLK(clk), .R(n312), .S(n311), .Q(max[5]) );
  DFFSR \max_reg[6]  ( .D(n184), .CLK(clk), .R(n310), .S(n309), .Q(max[6]) );
  DFFSR \max_reg[7]  ( .D(n181), .CLK(clk), .R(n308), .S(n307), .Q(max[7]) );
  DFFSR \total_reg[1]  ( .D(n324), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[1]) );
  DFFSR \total_reg[2]  ( .D(n325), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[2]) );
  DFFSR \total_reg[3]  ( .D(n326), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[3]) );
  DFFSR \total_reg[4]  ( .D(n327), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[4]) );
  DFFSR \total_reg[5]  ( .D(n328), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[5]) );
  DFFSR \total_reg[6]  ( .D(n329), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[6]) );
  DFFSR \total_reg[7]  ( .D(n330), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[7]) );
  DFFSR \total_reg[8]  ( .D(n331), .CLK(clk), .R(n_rst), .S(1'b1), .Q(total[8]) );
  grayscale_DW01_add_0 add_184 ( .A({1'b0, min}), .B({1'b0, max}), .CI(1'b0), 
        .SUM({N136, N135, N134, N133, N132, N131, N130, N129, 
        SYNOPSYS_UNCONNECTED__0}) );
  AND2X2 U4 ( .A(curr[1]), .B(n77), .Y(n2) );
  INVX2 U7 ( .A(n147), .Y(n108) );
  INVX2 U8 ( .A(n305), .Y(n3) );
  INVX2 U9 ( .A(n_rst), .Y(n4) );
  INVX2 U10 ( .A(curr[3]), .Y(n119) );
  INVX2 U11 ( .A(n234), .Y(n35) );
  OAI21X1 U12 ( .A(n296), .B(n195), .C(n295), .Y(n5) );
  AOI21X1 U13 ( .A(i_RGB[23]), .B(n35), .C(n5), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n205) );
  INVX2 U22 ( .A(i_RGB[31]), .Y(n7) );
  NAND2X1 U23 ( .A(n7), .B(n4), .Y(n308) );
  NAND2X1 U24 ( .A(i_RGB[31]), .B(n4), .Y(n307) );
  INVX2 U25 ( .A(min[6]), .Y(n8) );
  OAI21X1 U26 ( .A(n296), .B(n8), .C(n294), .Y(n9) );
  AOI21X1 U27 ( .A(i_RGB[22]), .B(n35), .C(n9), .Y(n10) );
  INVX2 U28 ( .A(n10), .Y(n206) );
  INVX2 U29 ( .A(i_RGB[30]), .Y(n11) );
  NAND2X1 U30 ( .A(n11), .B(n4), .Y(n310) );
  NAND2X1 U31 ( .A(i_RGB[30]), .B(n4), .Y(n309) );
  OAI21X1 U32 ( .A(n296), .B(n226), .C(n293), .Y(n12) );
  AOI21X1 U33 ( .A(i_RGB[21]), .B(n35), .C(n12), .Y(n13) );
  INVX2 U35 ( .A(n13), .Y(n207) );
  INVX2 U36 ( .A(i_RGB[29]), .Y(n14) );
  NAND2X1 U39 ( .A(n14), .B(n4), .Y(n312) );
  NAND2X1 U40 ( .A(i_RGB[29]), .B(n4), .Y(n311) );
  OAI21X1 U58 ( .A(n296), .B(n215), .C(n292), .Y(n15) );
  AOI21X1 U59 ( .A(i_RGB[20]), .B(n35), .C(n15), .Y(n16) );
  INVX2 U60 ( .A(n16), .Y(n208) );
  INVX2 U61 ( .A(i_RGB[28]), .Y(n17) );
  NAND2X1 U62 ( .A(n17), .B(n4), .Y(n314) );
  NAND2X1 U63 ( .A(i_RGB[28]), .B(n4), .Y(n313) );
  OAI21X1 U64 ( .A(n296), .B(n218), .C(n291), .Y(n18) );
  AOI21X1 U65 ( .A(i_RGB[19]), .B(n35), .C(n18), .Y(n19) );
  INVX2 U66 ( .A(n19), .Y(n209) );
  INVX2 U67 ( .A(i_RGB[27]), .Y(n29) );
  NAND2X1 U68 ( .A(n29), .B(n4), .Y(n316) );
  NAND2X1 U69 ( .A(i_RGB[27]), .B(n4), .Y(n315) );
  INVX2 U70 ( .A(min[2]), .Y(n30) );
  OAI21X1 U71 ( .A(n296), .B(n30), .C(n290), .Y(n31) );
  AOI21X1 U72 ( .A(i_RGB[18]), .B(n35), .C(n31), .Y(n32) );
  INVX2 U73 ( .A(n32), .Y(n210) );
  INVX2 U74 ( .A(i_RGB[26]), .Y(n33) );
  NAND2X1 U75 ( .A(n33), .B(n4), .Y(n318) );
  NAND2X1 U76 ( .A(i_RGB[26]), .B(n4), .Y(n317) );
  INVX2 U77 ( .A(min[1]), .Y(n95) );
  OAI21X1 U78 ( .A(n296), .B(n95), .C(n289), .Y(n34) );
  AOI21X1 U79 ( .A(i_RGB[17]), .B(n35), .C(n34), .Y(n36) );
  INVX2 U80 ( .A(n36), .Y(n211) );
  INVX2 U81 ( .A(i_RGB[25]), .Y(n37) );
  NAND2X1 U82 ( .A(n37), .B(n4), .Y(n320) );
  NAND2X1 U83 ( .A(i_RGB[25]), .B(n4), .Y(n319) );
  NAND3X1 U84 ( .A(curr[3]), .B(curr[0]), .C(n237), .Y(n144) );
  INVX2 U85 ( .A(i_RGB[16]), .Y(n79) );
  NAND2X1 U86 ( .A(i_RGB[24]), .B(n108), .Y(n78) );
  OAI21X1 U87 ( .A(n234), .B(n79), .C(n78), .Y(n39) );
  INVX2 U88 ( .A(min[0]), .Y(n92) );
  INVX2 U89 ( .A(i_RGB[8]), .Y(n97) );
  OAI22X1 U90 ( .A(n296), .B(n92), .C(n144), .D(n97), .Y(n38) );
  OR2X1 U91 ( .A(n39), .B(n38), .Y(n212) );
  INVX2 U92 ( .A(i_RGB[24]), .Y(n40) );
  NAND2X1 U93 ( .A(n40), .B(n4), .Y(n322) );
  NAND2X1 U94 ( .A(i_RGB[24]), .B(n4), .Y(n321) );
  INVX2 U95 ( .A(n146), .Y(n109) );
  OAI21X1 U96 ( .A(n305), .B(n165), .C(n304), .Y(n42) );
  AOI21X1 U97 ( .A(i_RGB[15]), .B(n109), .C(n42), .Y(n43) );
  INVX2 U98 ( .A(n43), .Y(n181) );
  INVX2 U99 ( .A(max[6]), .Y(n46) );
  OAI21X1 U100 ( .A(n305), .B(n46), .C(n303), .Y(n47) );
  AOI21X1 U101 ( .A(i_RGB[14]), .B(n109), .C(n47), .Y(n65) );
  INVX2 U102 ( .A(n65), .Y(n184) );
  OAI21X1 U103 ( .A(n305), .B(n175), .C(n302), .Y(n66) );
  AOI21X1 U104 ( .A(i_RGB[13]), .B(n109), .C(n66), .Y(n67) );
  INVX2 U105 ( .A(n67), .Y(n187) );
  OAI21X1 U106 ( .A(n305), .B(n171), .C(n301), .Y(n68) );
  AOI21X1 U107 ( .A(i_RGB[12]), .B(n109), .C(n68), .Y(n69) );
  INVX2 U108 ( .A(n69), .Y(n190) );
  OAI21X1 U109 ( .A(n305), .B(n183), .C(n300), .Y(n70) );
  AOI21X1 U110 ( .A(i_RGB[11]), .B(n109), .C(n70), .Y(n71) );
  INVX2 U111 ( .A(n71), .Y(n193) );
  INVX2 U112 ( .A(max[2]), .Y(n99) );
  OAI21X1 U113 ( .A(n305), .B(n99), .C(n299), .Y(n72) );
  AOI21X1 U114 ( .A(i_RGB[10]), .B(n109), .C(n72), .Y(n73) );
  INVX2 U115 ( .A(n73), .Y(n196) );
  INVX2 U116 ( .A(max[1]), .Y(n74) );
  OAI21X1 U117 ( .A(n305), .B(n74), .C(n298), .Y(n75) );
  AOI21X1 U118 ( .A(i_RGB[9]), .B(n109), .C(n75), .Y(n76) );
  INVX2 U119 ( .A(n76), .Y(n199) );
  INVX2 U120 ( .A(curr[2]), .Y(n77) );
  NAND2X1 U121 ( .A(n297), .B(n2), .Y(n306) );
  OAI21X1 U122 ( .A(n146), .B(n97), .C(n78), .Y(n81) );
  INVX2 U123 ( .A(max[0]), .Y(n89) );
  OAI22X1 U124 ( .A(n305), .B(n89), .C(n306), .D(n79), .Y(n80) );
  OR2X1 U125 ( .A(n81), .B(n80), .Y(n202) );
  INVX2 U126 ( .A(curr[0]), .Y(n106) );
  NAND3X1 U127 ( .A(curr[3]), .B(n106), .C(n2), .Y(n159) );
  MUX2X1 U128 ( .B(total[1]), .A(N129), .S(n232), .Y(n82) );
  INVX2 U129 ( .A(n82), .Y(n324) );
  NAND3X1 U130 ( .A(curr[1]), .B(curr[0]), .C(n110), .Y(n117) );
  INVX2 U131 ( .A(n117), .Y(n103) );
  MUX2X1 U132 ( .B(total[2]), .A(N130), .S(n232), .Y(n83) );
  INVX2 U133 ( .A(n83), .Y(n325) );
  MUX2X1 U134 ( .B(total[3]), .A(N131), .S(n232), .Y(n84) );
  INVX2 U135 ( .A(n84), .Y(n326) );
  MUX2X1 U136 ( .B(total[4]), .A(N132), .S(n232), .Y(n85) );
  INVX2 U137 ( .A(n85), .Y(n327) );
  MUX2X1 U138 ( .B(total[5]), .A(N133), .S(n232), .Y(n86) );
  INVX2 U139 ( .A(n86), .Y(n328) );
  MUX2X1 U140 ( .B(total[6]), .A(N134), .S(n232), .Y(n87) );
  INVX2 U141 ( .A(n87), .Y(n329) );
  MUX2X1 U142 ( .B(total[8]), .A(N136), .S(n232), .Y(n88) );
  INVX2 U143 ( .A(n88), .Y(n331) );
  INVX2 U144 ( .A(n306), .Y(n104) );
  NAND2X1 U145 ( .A(i_RGB[16]), .B(n89), .Y(n91) );
  INVX2 U146 ( .A(n91), .Y(n90) );
  OAI22X1 U147 ( .A(n90), .B(i_RGB[17]), .C(n99), .D(i_RGB[18]), .Y(n179) );
  OAI21X1 U148 ( .A(n188), .B(n91), .C(max[1]), .Y(n189) );
  OAI22X1 U149 ( .A(n95), .B(i_RGB[17]), .C(i_RGB[16]), .D(n92), .Y(n93) );
  OAI21X1 U150 ( .A(min[1]), .B(n188), .C(n93), .Y(n201) );
  NAND2X1 U151 ( .A(min[0]), .B(n97), .Y(n96) );
  INVX2 U152 ( .A(n96), .Y(n94) );
  OAI22X1 U153 ( .A(n265), .B(n94), .C(n263), .D(min[2]), .Y(n259) );
  OAI21X1 U154 ( .A(i_RGB[9]), .B(n96), .C(n95), .Y(n266) );
  INVX2 U155 ( .A(curr[1]), .Y(n107) );
  OAI21X1 U156 ( .A(max[0]), .B(n97), .C(n265), .Y(n98) );
  OAI21X1 U157 ( .A(n99), .B(i_RGB[10]), .C(n98), .Y(n281) );
  NAND2X1 U158 ( .A(i_RGB[8]), .B(i_RGB[9]), .Y(n100) );
  OAI21X1 U159 ( .A(max[0]), .B(n100), .C(max[1]), .Y(n285) );
  INVX2 U160 ( .A(n144), .Y(n105) );
  MUX2X1 U161 ( .B(total[7]), .A(N135), .S(n232), .Y(n101) );
  INVX2 U162 ( .A(n101), .Y(n330) );
  MUX2X1 U163 ( .B(average[6]), .A(total[7]), .S(n103), .Y(n102) );
  INVX2 U164 ( .A(n102), .Y(n_average[6]) );
  NOR2X1 U165 ( .A(curr[2]), .B(n119), .Y(n110) );
  AOI22X1 U166 ( .A(total[1]), .B(n103), .C(average[0]), .D(n117), .Y(n111) );
  AOI22X1 U167 ( .A(total[2]), .B(n103), .C(average[1]), .D(n117), .Y(n112) );
  AOI22X1 U168 ( .A(total[3]), .B(n103), .C(average[2]), .D(n117), .Y(n113) );
  AOI22X1 U169 ( .A(total[4]), .B(n103), .C(average[3]), .D(n117), .Y(n114) );
  AOI22X1 U170 ( .A(total[5]), .B(n103), .C(average[4]), .D(n117), .Y(n115) );
  AOI22X1 U171 ( .A(total[6]), .B(n103), .C(average[5]), .D(n117), .Y(n116) );
  AOI22X1 U172 ( .A(total[8]), .B(n103), .C(average[7]), .D(n117), .Y(n118) );
  INVX2 U173 ( .A(n111), .Y(n_average[0]) );
  INVX2 U174 ( .A(n112), .Y(n_average[1]) );
  INVX2 U175 ( .A(n113), .Y(n_average[2]) );
  INVX2 U176 ( .A(n114), .Y(n_average[3]) );
  INVX2 U177 ( .A(n115), .Y(n_average[4]) );
  INVX2 U178 ( .A(n116), .Y(n_average[5]) );
  INVX2 U179 ( .A(n118), .Y(n_average[7]) );
  OR2X1 U180 ( .A(n120), .B(n121), .Y(next[3]) );
  OAI21X1 U181 ( .A(n122), .B(n123), .C(n124), .Y(n121) );
  NAND3X1 U182 ( .A(n125), .B(n126), .C(n127), .Y(next[2]) );
  AOI21X1 U183 ( .A(n128), .B(n122), .C(n129), .Y(n127) );
  OAI21X1 U184 ( .A(n130), .B(n131), .C(n124), .Y(n129) );
  OR2X1 U185 ( .A(n132), .B(n133), .Y(n131) );
  INVX1 U186 ( .A(n134), .Y(n122) );
  NOR2X1 U187 ( .A(n104), .B(n109), .Y(n126) );
  AND2X1 U188 ( .A(n135), .B(n136), .Y(n125) );
  NAND3X1 U189 ( .A(n137), .B(n138), .C(n139), .Y(next[1]) );
  NOR2X1 U190 ( .A(n140), .B(n141), .Y(n139) );
  OAI21X1 U191 ( .A(n142), .B(n143), .C(n144), .Y(n141) );
  OR2X1 U192 ( .A(n135), .B(n145), .Y(n143) );
  NAND2X1 U193 ( .A(n146), .B(n147), .Y(n140) );
  AOI22X1 U194 ( .A(n148), .B(n149), .C(n150), .D(curr[1]), .Y(n137) );
  INVX1 U195 ( .A(n151), .Y(n149) );
  NOR2X1 U196 ( .A(n152), .B(n153), .Y(n148) );
  OR2X1 U197 ( .A(n154), .B(n155), .Y(next[0]) );
  OAI21X1 U198 ( .A(n106), .B(n124), .C(n138), .Y(n155) );
  INVX1 U199 ( .A(n156), .Y(n138) );
  OAI21X1 U200 ( .A(n134), .B(n123), .C(n157), .Y(n156) );
  AND2X1 U201 ( .A(n158), .B(n159), .Y(n157) );
  OAI21X1 U202 ( .A(n133), .B(n130), .C(n160), .Y(n158) );
  INVX1 U203 ( .A(n132), .Y(n160) );
  OAI21X1 U204 ( .A(n161), .B(n162), .C(n163), .Y(n130) );
  AOI22X1 U205 ( .A(n164), .B(i_RGB[22]), .C(i_RGB[23]), .D(n165), .Y(n163) );
  NOR2X1 U206 ( .A(max[6]), .B(n166), .Y(n164) );
  OAI21X1 U207 ( .A(i_RGB[21]), .B(n167), .C(n168), .Y(n162) );
  OAI21X1 U208 ( .A(n169), .B(n170), .C(max[5]), .Y(n168) );
  INVX1 U209 ( .A(n170), .Y(n167) );
  NAND2X1 U210 ( .A(i_RGB[20]), .B(n171), .Y(n170) );
  INVX1 U211 ( .A(n172), .Y(n161) );
  NOR2X1 U212 ( .A(n173), .B(n174), .Y(n133) );
  OAI21X1 U213 ( .A(i_RGB[21]), .B(n175), .C(n172), .Y(n174) );
  AOI21X1 U214 ( .A(n176), .B(max[6]), .C(n166), .Y(n172) );
  NOR2X1 U215 ( .A(n165), .B(i_RGB[23]), .Y(n166) );
  OAI21X1 U216 ( .A(i_RGB[20]), .B(n171), .C(n177), .Y(n173) );
  OAI21X1 U217 ( .A(n178), .B(n179), .C(n180), .Y(n177) );
  AOI22X1 U218 ( .A(n182), .B(i_RGB[18]), .C(i_RGB[19]), .D(n183), .Y(n180) );
  NOR2X1 U219 ( .A(max[2]), .B(n185), .Y(n182) );
  NAND2X1 U220 ( .A(n189), .B(n191), .Y(n178) );
  INVX1 U221 ( .A(n185), .Y(n191) );
  NOR2X1 U222 ( .A(n183), .B(i_RGB[19]), .Y(n185) );
  NOR2X1 U223 ( .A(n192), .B(n194), .Y(n134) );
  OAI22X1 U224 ( .A(i_RGB[23]), .B(n195), .C(n197), .D(n198), .Y(n194) );
  INVX1 U225 ( .A(n200), .Y(n198) );
  AOI21X1 U226 ( .A(n201), .B(n203), .C(n204), .Y(n200) );
  INVX1 U227 ( .A(i_RGB[17]), .Y(n188) );
  OAI21X1 U228 ( .A(min[5]), .B(n169), .C(n213), .Y(n197) );
  AOI22X1 U229 ( .A(n203), .B(n214), .C(i_RGB[20]), .D(n215), .Y(n213) );
  OAI21X1 U230 ( .A(min[2]), .B(n186), .C(n216), .Y(n214) );
  INVX1 U231 ( .A(n217), .Y(n203) );
  OAI21X1 U232 ( .A(i_RGB[19]), .B(n218), .C(n219), .Y(n217) );
  NAND3X1 U233 ( .A(n216), .B(n186), .C(min[2]), .Y(n219) );
  INVX1 U234 ( .A(i_RGB[18]), .Y(n186) );
  NAND2X1 U235 ( .A(i_RGB[19]), .B(n218), .Y(n216) );
  OAI21X1 U236 ( .A(n204), .B(n220), .C(n221), .Y(n192) );
  NAND3X1 U237 ( .A(n222), .B(n176), .C(min[6]), .Y(n221) );
  OAI21X1 U238 ( .A(n223), .B(n169), .C(n224), .Y(n220) );
  OAI21X1 U239 ( .A(i_RGB[21]), .B(n225), .C(n226), .Y(n224) );
  INVX1 U240 ( .A(n223), .Y(n225) );
  INVX1 U241 ( .A(i_RGB[21]), .Y(n169) );
  NOR2X1 U242 ( .A(n215), .B(i_RGB[20]), .Y(n223) );
  OAI21X1 U243 ( .A(min[6]), .B(n176), .C(n222), .Y(n204) );
  NAND2X1 U244 ( .A(i_RGB[23]), .B(n195), .Y(n222) );
  INVX1 U245 ( .A(i_RGB[22]), .Y(n176) );
  INVX1 U246 ( .A(n150), .Y(n124) );
  NOR2X1 U247 ( .A(n227), .B(n228), .Y(n150) );
  NAND3X1 U248 ( .A(n229), .B(n132), .C(n3), .Y(n228) );
  NAND2X1 U249 ( .A(n230), .B(n2), .Y(n132) );
  INVX1 U250 ( .A(n120), .Y(n229) );
  NAND3X1 U251 ( .A(n136), .B(n153), .C(n231), .Y(n120) );
  NOR2X1 U252 ( .A(n232), .B(n233), .Y(n231) );
  NAND2X1 U253 ( .A(n234), .B(n144), .Y(n233) );
  INVX1 U254 ( .A(n159), .Y(n232) );
  NAND3X1 U255 ( .A(curr[3]), .B(curr[0]), .C(n2), .Y(n136) );
  NAND3X1 U256 ( .A(n135), .B(n235), .C(n236), .Y(n227) );
  NOR2X1 U257 ( .A(n323), .B(n128), .Y(n236) );
  INVX1 U258 ( .A(n123), .Y(n128) );
  NAND3X1 U259 ( .A(curr[2]), .B(curr[1]), .C(n230), .Y(n123) );
  INVX1 U260 ( .A(n237), .Y(n235) );
  NAND3X1 U261 ( .A(n238), .B(n239), .C(n240), .Y(n154) );
  OAI21X1 U262 ( .A(n152), .B(n151), .C(n241), .Y(n240) );
  INVX1 U263 ( .A(n153), .Y(n241) );
  NAND3X1 U264 ( .A(n237), .B(n106), .C(curr[3]), .Y(n153) );
  OAI21X1 U265 ( .A(n242), .B(n243), .C(n244), .Y(n151) );
  AOI22X1 U266 ( .A(n245), .B(min[6]), .C(min[7]), .D(n246), .Y(n244) );
  INVX1 U267 ( .A(i_RGB[15]), .Y(n246) );
  AND2X1 U268 ( .A(n247), .B(n248), .Y(n245) );
  OAI21X1 U269 ( .A(n249), .B(n250), .C(n251), .Y(n243) );
  OAI21X1 U270 ( .A(i_RGB[13]), .B(n252), .C(n226), .Y(n251) );
  INVX1 U271 ( .A(min[5]), .Y(n226) );
  INVX1 U272 ( .A(n249), .Y(n252) );
  NOR2X1 U273 ( .A(n215), .B(i_RGB[12]), .Y(n249) );
  INVX1 U274 ( .A(min[4]), .Y(n215) );
  NOR2X1 U275 ( .A(n253), .B(n254), .Y(n152) );
  OAI21X1 U276 ( .A(min[5]), .B(n250), .C(n255), .Y(n254) );
  INVX1 U277 ( .A(n242), .Y(n255) );
  OAI21X1 U278 ( .A(min[6]), .B(n247), .C(n248), .Y(n242) );
  NAND2X1 U279 ( .A(i_RGB[15]), .B(n195), .Y(n248) );
  INVX1 U280 ( .A(min[7]), .Y(n195) );
  OAI21X1 U281 ( .A(min[4]), .B(n256), .C(n257), .Y(n253) );
  OAI21X1 U282 ( .A(n258), .B(n259), .C(n260), .Y(n257) );
  AOI22X1 U283 ( .A(n261), .B(min[2]), .C(min[3]), .D(n262), .Y(n260) );
  INVX1 U284 ( .A(i_RGB[11]), .Y(n262) );
  AND2X1 U285 ( .A(n263), .B(n264), .Y(n261) );
  NAND2X1 U286 ( .A(n266), .B(n264), .Y(n258) );
  NAND2X1 U287 ( .A(i_RGB[11]), .B(n218), .Y(n264) );
  INVX1 U288 ( .A(min[3]), .Y(n218) );
  NAND3X1 U289 ( .A(n230), .B(n237), .C(i_grayscale_start), .Y(n239) );
  OAI21X1 U290 ( .A(n145), .B(n142), .C(n267), .Y(n238) );
  INVX1 U291 ( .A(n135), .Y(n267) );
  NAND3X1 U292 ( .A(curr[2]), .B(n107), .C(n230), .Y(n135) );
  NOR2X1 U293 ( .A(curr[3]), .B(curr[0]), .Y(n230) );
  OAI21X1 U294 ( .A(n268), .B(n269), .C(n270), .Y(n142) );
  AOI22X1 U295 ( .A(n271), .B(i_RGB[14]), .C(i_RGB[15]), .D(n165), .Y(n270) );
  NOR2X1 U296 ( .A(max[6]), .B(n272), .Y(n271) );
  OAI21X1 U297 ( .A(i_RGB[13]), .B(n273), .C(n274), .Y(n269) );
  OAI21X1 U298 ( .A(n275), .B(n250), .C(max[5]), .Y(n274) );
  INVX1 U299 ( .A(i_RGB[13]), .Y(n250) );
  INVX1 U300 ( .A(n273), .Y(n275) );
  NOR2X1 U301 ( .A(n256), .B(max[4]), .Y(n273) );
  INVX1 U302 ( .A(i_RGB[12]), .Y(n256) );
  INVX1 U303 ( .A(n276), .Y(n268) );
  NOR2X1 U304 ( .A(n277), .B(n278), .Y(n145) );
  OAI21X1 U305 ( .A(i_RGB[13]), .B(n175), .C(n276), .Y(n278) );
  AOI21X1 U306 ( .A(n247), .B(max[6]), .C(n272), .Y(n276) );
  NOR2X1 U307 ( .A(n165), .B(i_RGB[15]), .Y(n272) );
  INVX1 U308 ( .A(max[7]), .Y(n165) );
  INVX1 U309 ( .A(i_RGB[14]), .Y(n247) );
  INVX1 U310 ( .A(max[5]), .Y(n175) );
  OAI21X1 U311 ( .A(i_RGB[12]), .B(n171), .C(n279), .Y(n277) );
  OAI21X1 U312 ( .A(n280), .B(n281), .C(n282), .Y(n279) );
  AOI22X1 U313 ( .A(n283), .B(i_RGB[10]), .C(i_RGB[11]), .D(n183), .Y(n282) );
  NOR2X1 U314 ( .A(max[2]), .B(n284), .Y(n283) );
  INVX1 U315 ( .A(i_RGB[10]), .Y(n263) );
  NAND2X1 U316 ( .A(n285), .B(n286), .Y(n280) );
  INVX1 U317 ( .A(n284), .Y(n286) );
  NOR2X1 U318 ( .A(n183), .B(i_RGB[11]), .Y(n284) );
  INVX1 U319 ( .A(max[3]), .Y(n183) );
  INVX1 U320 ( .A(i_RGB[9]), .Y(n265) );
  INVX1 U321 ( .A(max[4]), .Y(n171) );
  INVX1 U322 ( .A(n287), .Y(n323) );
  NAND3X1 U323 ( .A(curr[2]), .B(curr[3]), .C(n288), .Y(n287) );
  NOR2X1 U324 ( .A(curr[1]), .B(curr[0]), .Y(n288) );
  AOI22X1 U325 ( .A(n105), .B(i_RGB[9]), .C(n108), .D(i_RGB[25]), .Y(n289) );
  AOI22X1 U326 ( .A(n105), .B(i_RGB[10]), .C(n108), .D(i_RGB[26]), .Y(n290) );
  AOI22X1 U327 ( .A(n105), .B(i_RGB[11]), .C(n108), .D(i_RGB[27]), .Y(n291) );
  AOI22X1 U328 ( .A(n105), .B(i_RGB[12]), .C(n108), .D(i_RGB[28]), .Y(n292) );
  AOI22X1 U329 ( .A(n105), .B(i_RGB[13]), .C(n108), .D(i_RGB[29]), .Y(n293) );
  AOI22X1 U330 ( .A(n105), .B(i_RGB[14]), .C(n108), .D(i_RGB[30]), .Y(n294) );
  NAND3X1 U331 ( .A(n144), .B(n147), .C(n234), .Y(n296) );
  NAND3X1 U332 ( .A(curr[1]), .B(n297), .C(curr[2]), .Y(n234) );
  AOI22X1 U333 ( .A(n105), .B(i_RGB[15]), .C(n108), .D(i_RGB[31]), .Y(n295) );
  AOI22X1 U334 ( .A(n104), .B(i_RGB[17]), .C(n108), .D(i_RGB[25]), .Y(n298) );
  AOI22X1 U335 ( .A(n104), .B(i_RGB[18]), .C(n108), .D(i_RGB[26]), .Y(n299) );
  AOI22X1 U336 ( .A(n104), .B(i_RGB[19]), .C(n108), .D(i_RGB[27]), .Y(n300) );
  AOI22X1 U337 ( .A(n104), .B(i_RGB[20]), .C(n108), .D(i_RGB[28]), .Y(n301) );
  AOI22X1 U338 ( .A(n104), .B(i_RGB[21]), .C(n108), .D(i_RGB[29]), .Y(n302) );
  AOI22X1 U339 ( .A(n104), .B(i_RGB[22]), .C(n108), .D(i_RGB[30]), .Y(n303) );
  NAND3X1 U340 ( .A(n306), .B(n147), .C(n146), .Y(n305) );
  NAND3X1 U341 ( .A(n297), .B(n107), .C(curr[2]), .Y(n146) );
  AOI22X1 U342 ( .A(n104), .B(i_RGB[23]), .C(n108), .D(i_RGB[31]), .Y(n304) );
  NAND2X1 U343 ( .A(n297), .B(n237), .Y(n147) );
  NOR2X1 U344 ( .A(curr[2]), .B(curr[1]), .Y(n237) );
  NOR2X1 U345 ( .A(n106), .B(curr[3]), .Y(n297) );
endmodule


module buffer_window ( clk, n_rst, i_data_in, i_save, i_clear, o_full, o_empty, 
        o_m1, o_m2, o_m3, o_m4, o_m5, o_m6, o_m7, o_m8, o_m9, o_m10, o_m11, 
        o_m12, o_m13, o_m14, o_m15, o_m16, o_m17, o_m18, o_m19, o_m20, o_m21, 
        o_m22, o_m23, o_m24, o_m25 );
  input [7:0] i_data_in;
  output [7:0] o_m1;
  output [7:0] o_m2;
  output [7:0] o_m3;
  output [7:0] o_m4;
  output [7:0] o_m5;
  output [7:0] o_m6;
  output [7:0] o_m7;
  output [7:0] o_m8;
  output [7:0] o_m9;
  output [7:0] o_m10;
  output [7:0] o_m11;
  output [7:0] o_m12;
  output [7:0] o_m13;
  output [7:0] o_m14;
  output [7:0] o_m15;
  output [7:0] o_m16;
  output [7:0] o_m17;
  output [7:0] o_m18;
  output [7:0] o_m19;
  output [7:0] o_m20;
  output [7:0] o_m21;
  output [7:0] o_m22;
  output [7:0] o_m23;
  output [7:0] o_m24;
  output [7:0] o_m25;
  input clk, n_rst, i_save, i_clear;
  output o_full, o_empty;
  wire   n931, n932, n933, n934, n935, n936, n937, n938, n939, n940, n941,
         n942, n943, n944, n945, n946, n947, n948, n949, n950, n951, n952,
         n953, n954, n955, n956, n957, n958, n959, n960, n961, n962, n963,
         n964, n965, n966, n967, next_empty, next_full, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n321,
         n322, n323, n324, n325, n326, n327, n328, n329, n330, n331, n332,
         n333, n334, n335, n336, n337, n338, n339, n340, n341, n342, n343,
         n344, n345, n346, n347, n348, n349, n350, n351, n352, n353, n354,
         n355, n356, n357, n358, n359, n360, n361, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n375, n378, n380,
         n382, n384, n386, n390, n391, n392, n394, n395, n396, n397, n398,
         n400, n401, n402, n403, n405, n406, n407, n408, n409, n411, n412,
         n413, n415, n416, n417, n418, n421, n422, n423, n425, n426, n427,
         n428, n429, n431, n432, n434, n435, n436, n437, n438, n440, n441,
         n443, n444, n445, n446, n447, n449, n450, n452, n453, n454, n455,
         n458, n459, n461, n462, n463, n464, n467, n468, n469, n471, n472,
         n473, n474, n477, n478, n480, n481, n482, n483, n484, n486, n487,
         n488, n490, n491, n492, n493, n496, n497, n498, n500, n501, n502,
         n503, n506, n507, n509, n510, n511, n512, n515, n516, n518, n519,
         n520, n521, n522, n525, n527, n528, n529, n530, n531, n534, n536,
         n537, n538, n539, n540, n542, n543, n545, n546, n547, n548, n549,
         n551, n552, n554, n555, n556, n557, n560, n561, n563, n564, n565,
         n566, n569, n570, n571, n573, n574, n575, n576, n577, n579, n580,
         n582, n583, n584, n585, n586, n588, n589, n590, n592, n593, n594,
         n595, n596, n598, n599, n601, n602, n603, n604, n607, n608, n610,
         n611, n612, n613, n614, n616, n617, n618, n619, n620, n621, n622,
         n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655,
         n656, n657, n658, n659, n660, n661, n662, n663, n664, n665, n666,
         n667, n668, n669, n670, n671, n672, n673, n674, n675, n676, n677,
         n678, n679, n680, n681, n682, n683, n684, n685, n686, n687, n688,
         n689, n690, n691, n692, n693, n694, n695, n696, n697, n698, n699,
         n700, n701, n702, n703, n704, n705, n706, n707, n708, n709, n710,
         n711, n712, n713, n714, n715, n716, n717, n718, n719, n720, n721,
         n722, n723, n724, n725, n726, n727, n728, n729, n730, n731, n732,
         n733, n734, n735, n736, n737, n738, n739, n740, n741, n742, n743,
         n744, n745, n746, n747, n748, n749, n750, n751, n752, n753, n754,
         n755, n756, n757, n758, n759, n760, n761, n762, n763, n764, n765,
         n766, n767, n768, n769, n770, n771, n772, n773, n774, n775, n776,
         n777, n778, n779, n780, n781, n782, n783, n784, n785, n786, n787,
         n788, n789, n790, n791, n792, n793, n794, n795, n796, n797, n798,
         n799, n800, n801, n802, n803, n804, n805, n806, n807, n808, n809,
         n810, n811, n812, n813, n814, n815, n816, n209, n210, n211, n212,
         n214, n233, n235, n237, n307, n388, n393, n404, n414, n420, n430,
         n439, n442, n448, n451, n456, n457, n460, n465, n466, n470, n475,
         n476, n479, n485, n489, n494, n495, n499, n504, n505, n508, n513,
         n514, n517, n523, n524, n526, n532, n533, n535, n541, n544, n550,
         n553, n558, n559, n562, n567, n568, n572, n578, n581, n587, n591,
         n597, n600, n605, n606, n609, n615, n817, n818, n819, n820, n821,
         n822, n823, n824, n825, n826, n827, n828, n829, n830, n831, n832,
         n833, n834, n835, n836, n837, n838, n839, n840, n841, n842, n843,
         n844, n845, n846, n847, n848, n849, n850, n851, n852, n853, n854,
         n855, n856, n857, n858, n859, n860, n861, n862, n863, n864, n865,
         n866, n867, n868, n869, n870, n871, n872, n873, n874, n875, n876,
         n877, n878, n879, n880, n881, n882, n883, n884, n885, n886, n887,
         n888, n889, n890, n891, n892, n893, n894, n895, n896, n897, n898,
         n899, n900, n901, n902, n903, n904, n905, n906, n907, n908, n909,
         n910, n911, n912, n913, n914, n915, n916, n917, n918, n919, n920,
         n921, n922, n923, n924, n925, n926, n927, n928, n929, n930;
  wire   [5:0] curr;
  wire   [5:0] next;

  DFFSR \curr_reg[0]  ( .D(next[0]), .CLK(clk), .R(n581), .S(1'b1), .Q(curr[0]) );
  DFFSR \curr_reg[1]  ( .D(next[1]), .CLK(clk), .R(n581), .S(1'b1), .Q(curr[1]) );
  DFFSR \curr_reg[2]  ( .D(next[2]), .CLK(clk), .R(n581), .S(1'b1), .Q(curr[2]) );
  DFFSR \o_m4_reg[7]  ( .D(n793), .CLK(clk), .R(n581), .S(1'b1), .Q(o_m4[7])
         );
  DFFSR \o_m4_reg[5]  ( .D(n794), .CLK(clk), .R(n581), .S(1'b1), .Q(o_m4[5])
         );
  DFFSR \o_m4_reg[4]  ( .D(n795), .CLK(clk), .R(n581), .S(1'b1), .Q(o_m4[4])
         );
  DFFSR \o_m4_reg[3]  ( .D(n796), .CLK(clk), .R(n581), .S(1'b1), .Q(o_m4[3])
         );
  DFFSR \o_m4_reg[2]  ( .D(n797), .CLK(clk), .R(n581), .S(1'b1), .Q(o_m4[2])
         );
  DFFSR \o_m4_reg[1]  ( .D(n798), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m4[1])
         );
  DFFSR \o_m4_reg[0]  ( .D(n799), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m4[0])
         );
  DFFSR \o_m4_reg[6]  ( .D(n800), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m4[6])
         );
  DFFSR \curr_reg[3]  ( .D(next[3]), .CLK(clk), .R(n578), .S(1'b1), .Q(curr[3]) );
  DFFSR \o_m13_reg[7]  ( .D(n721), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m13[7])
         );
  DFFSR \o_m13_reg[5]  ( .D(n722), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m13[5])
         );
  DFFSR \o_m13_reg[4]  ( .D(n723), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m13[4])
         );
  DFFSR \o_m13_reg[3]  ( .D(n724), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m13[3])
         );
  DFFSR \o_m13_reg[2]  ( .D(n725), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m13[2])
         );
  DFFSR \o_m13_reg[1]  ( .D(n726), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m13[1])
         );
  DFFSR \o_m13_reg[0]  ( .D(n727), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m13[0])
         );
  DFFSR \o_m13_reg[6]  ( .D(n728), .CLK(clk), .R(n578), .S(1'b1), .Q(o_m13[6])
         );
  DFFSR \o_m15_reg[7]  ( .D(n705), .CLK(clk), .R(n572), .S(1'b1), .Q(n961) );
  DFFSR \o_m15_reg[5]  ( .D(n706), .CLK(clk), .R(n572), .S(1'b1), .Q(n963) );
  DFFSR \o_m15_reg[4]  ( .D(n707), .CLK(clk), .R(n572), .S(1'b1), .Q(n964) );
  DFFSR \o_m15_reg[3]  ( .D(n708), .CLK(clk), .R(n572), .S(1'b1), .Q(n965) );
  DFFSR \o_m15_reg[2]  ( .D(n709), .CLK(clk), .R(n572), .S(1'b1), .Q(n966) );
  DFFSR \o_m15_reg[1]  ( .D(n710), .CLK(clk), .R(n572), .S(1'b1), .Q(n967) );
  DFFSR \o_m15_reg[0]  ( .D(n711), .CLK(clk), .R(n572), .S(1'b1), .Q(o_m15[0])
         );
  DFFSR \o_m15_reg[6]  ( .D(n712), .CLK(clk), .R(n572), .S(1'b1), .Q(n962) );
  DFFSR \o_m11_reg[7]  ( .D(n737), .CLK(clk), .R(n572), .S(1'b1), .Q(o_m11[7])
         );
  DFFSR \o_m11_reg[6]  ( .D(n738), .CLK(clk), .R(n572), .S(1'b1), .Q(o_m11[6])
         );
  DFFSR \o_m11_reg[5]  ( .D(n739), .CLK(clk), .R(n572), .S(1'b1), .Q(o_m11[5])
         );
  DFFSR \o_m11_reg[4]  ( .D(n740), .CLK(clk), .R(n572), .S(1'b1), .Q(o_m11[4])
         );
  DFFSR \o_m11_reg[3]  ( .D(n741), .CLK(clk), .R(n568), .S(1'b1), .Q(o_m11[3])
         );
  DFFSR \o_m11_reg[2]  ( .D(n742), .CLK(clk), .R(n568), .S(1'b1), .Q(o_m11[2])
         );
  DFFSR \o_m11_reg[0]  ( .D(n743), .CLK(clk), .R(n568), .S(1'b1), .Q(o_m11[0])
         );
  DFFSR \o_m11_reg[1]  ( .D(n744), .CLK(clk), .R(n568), .S(1'b1), .Q(o_m11[1])
         );
  DFFSR \curr_reg[4]  ( .D(next[4]), .CLK(clk), .R(n568), .S(1'b1), .Q(curr[4]) );
  DFFSR \curr_reg[5]  ( .D(n910), .CLK(clk), .R(n568), .S(1'b1), .Q(curr[5])
         );
  DFFSR \o_m6_reg[7]  ( .D(n777), .CLK(clk), .R(n568), .S(1'b1), .Q(o_m6[7])
         );
  DFFSR \o_m6_reg[5]  ( .D(n778), .CLK(clk), .R(n568), .S(1'b1), .Q(o_m6[5])
         );
  DFFSR \o_m6_reg[4]  ( .D(n779), .CLK(clk), .R(n568), .S(1'b1), .Q(o_m6[4])
         );
  DFFSR \o_m6_reg[3]  ( .D(n780), .CLK(clk), .R(n568), .S(1'b1), .Q(o_m6[3])
         );
  DFFSR \o_m6_reg[2]  ( .D(n781), .CLK(clk), .R(n568), .S(1'b1), .Q(o_m6[2])
         );
  DFFSR \o_m6_reg[1]  ( .D(n782), .CLK(clk), .R(n568), .S(1'b1), .Q(o_m6[1])
         );
  DFFSR \o_m6_reg[0]  ( .D(n783), .CLK(clk), .R(n567), .S(1'b1), .Q(o_m6[0])
         );
  DFFSR \o_m6_reg[6]  ( .D(n784), .CLK(clk), .R(n567), .S(1'b1), .Q(o_m6[6])
         );
  DFFSR \o_m5_reg[7]  ( .D(n785), .CLK(clk), .R(n567), .S(1'b1), .Q(o_m5[7])
         );
  DFFSR \o_m5_reg[5]  ( .D(n786), .CLK(clk), .R(n567), .S(1'b1), .Q(o_m5[5])
         );
  DFFSR \o_m5_reg[4]  ( .D(n787), .CLK(clk), .R(n567), .S(1'b1), .Q(o_m5[4])
         );
  DFFSR \o_m5_reg[3]  ( .D(n788), .CLK(clk), .R(n567), .S(1'b1), .Q(o_m5[3])
         );
  DFFSR \o_m5_reg[2]  ( .D(n789), .CLK(clk), .R(n567), .S(1'b1), .Q(o_m5[2])
         );
  DFFSR \o_m5_reg[1]  ( .D(n790), .CLK(clk), .R(n567), .S(1'b1), .Q(o_m5[1])
         );
  DFFSR \o_m5_reg[0]  ( .D(n791), .CLK(clk), .R(n567), .S(1'b1), .Q(o_m5[0])
         );
  DFFSR \o_m5_reg[6]  ( .D(n792), .CLK(clk), .R(n567), .S(1'b1), .Q(o_m5[6])
         );
  DFFSR o_empty_reg ( .D(next_empty), .CLK(clk), .R(1'b1), .S(n817), .Q(
        o_empty) );
  DFFSR \o_m1_reg[7]  ( .D(n617), .CLK(clk), .R(n567), .S(1'b1), .Q(o_m1[7])
         );
  DFFSR \o_m1_reg[6]  ( .D(n618), .CLK(clk), .R(n562), .S(1'b1), .Q(o_m1[6])
         );
  DFFSR \o_m1_reg[4]  ( .D(n619), .CLK(clk), .R(n562), .S(1'b1), .Q(o_m1[4])
         );
  DFFSR \o_m1_reg[3]  ( .D(n620), .CLK(clk), .R(n562), .S(1'b1), .Q(o_m1[3])
         );
  DFFSR \o_m1_reg[2]  ( .D(n621), .CLK(clk), .R(n562), .S(1'b1), .Q(o_m1[2])
         );
  DFFSR \o_m1_reg[1]  ( .D(n622), .CLK(clk), .R(n562), .S(1'b1), .Q(o_m1[1])
         );
  DFFSR \o_m1_reg[0]  ( .D(n623), .CLK(clk), .R(n562), .S(1'b1), .Q(o_m1[0])
         );
  DFFSR \o_m1_reg[5]  ( .D(n624), .CLK(clk), .R(n562), .S(1'b1), .Q(o_m1[5])
         );
  DFFSR \o_m2_reg[7]  ( .D(n809), .CLK(clk), .R(n562), .S(1'b1), .Q(o_m2[7])
         );
  DFFSR \o_m2_reg[5]  ( .D(n810), .CLK(clk), .R(n562), .S(1'b1), .Q(o_m2[5])
         );
  DFFSR \o_m2_reg[4]  ( .D(n811), .CLK(clk), .R(n562), .S(1'b1), .Q(o_m2[4])
         );
  DFFSR \o_m2_reg[3]  ( .D(n812), .CLK(clk), .R(n562), .S(1'b1), .Q(o_m2[3])
         );
  DFFSR \o_m2_reg[2]  ( .D(n813), .CLK(clk), .R(n562), .S(1'b1), .Q(o_m2[2])
         );
  DFFSR \o_m2_reg[1]  ( .D(n814), .CLK(clk), .R(n559), .S(1'b1), .Q(o_m2[1])
         );
  DFFSR \o_m2_reg[0]  ( .D(n815), .CLK(clk), .R(n559), .S(1'b1), .Q(o_m2[0])
         );
  DFFSR \o_m2_reg[6]  ( .D(n816), .CLK(clk), .R(n559), .S(1'b1), .Q(o_m2[6])
         );
  DFFSR \o_m25_reg[7]  ( .D(n625), .CLK(clk), .R(n559), .S(1'b1), .Q(o_m25[7])
         );
  DFFSR \o_m25_reg[6]  ( .D(n626), .CLK(clk), .R(n559), .S(1'b1), .Q(o_m25[6])
         );
  DFFSR \o_m25_reg[4]  ( .D(n627), .CLK(clk), .R(n559), .S(1'b1), .Q(o_m25[4])
         );
  DFFSR \o_m25_reg[3]  ( .D(n628), .CLK(clk), .R(n559), .S(1'b1), .Q(o_m25[3])
         );
  DFFSR \o_m25_reg[2]  ( .D(n629), .CLK(clk), .R(n559), .S(1'b1), .Q(o_m25[2])
         );
  DFFSR \o_m25_reg[1]  ( .D(n630), .CLK(clk), .R(n559), .S(1'b1), .Q(o_m25[1])
         );
  DFFSR \o_m25_reg[0]  ( .D(n631), .CLK(clk), .R(n559), .S(1'b1), .Q(o_m25[0])
         );
  DFFSR \o_m25_reg[5]  ( .D(n632), .CLK(clk), .R(n559), .S(1'b1), .Q(o_m25[5])
         );
  DFFSR \o_m24_reg[7]  ( .D(n633), .CLK(clk), .R(n559), .S(1'b1), .Q(o_m24[7])
         );
  DFFSR \o_m24_reg[5]  ( .D(n634), .CLK(clk), .R(n558), .S(1'b1), .Q(o_m24[5])
         );
  DFFSR \o_m24_reg[4]  ( .D(n635), .CLK(clk), .R(n558), .S(1'b1), .Q(o_m24[4])
         );
  DFFSR \o_m24_reg[3]  ( .D(n636), .CLK(clk), .R(n558), .S(1'b1), .Q(o_m24[3])
         );
  DFFSR \o_m24_reg[2]  ( .D(n637), .CLK(clk), .R(n558), .S(1'b1), .Q(o_m24[2])
         );
  DFFSR \o_m24_reg[1]  ( .D(n638), .CLK(clk), .R(n558), .S(1'b1), .Q(o_m24[1])
         );
  DFFSR \o_m24_reg[0]  ( .D(n639), .CLK(clk), .R(n558), .S(1'b1), .Q(o_m24[0])
         );
  DFFSR \o_m24_reg[6]  ( .D(n640), .CLK(clk), .R(n558), .S(1'b1), .Q(o_m24[6])
         );
  DFFSR \o_m22_reg[7]  ( .D(n649), .CLK(clk), .R(n558), .S(1'b1), .Q(o_m22[7])
         );
  DFFSR \o_m22_reg[5]  ( .D(n650), .CLK(clk), .R(n558), .S(1'b1), .Q(o_m22[5])
         );
  DFFSR \o_m22_reg[4]  ( .D(n651), .CLK(clk), .R(n558), .S(1'b1), .Q(o_m22[4])
         );
  DFFSR \o_m22_reg[3]  ( .D(n652), .CLK(clk), .R(n558), .S(1'b1), .Q(o_m22[3])
         );
  DFFSR \o_m22_reg[2]  ( .D(n653), .CLK(clk), .R(n558), .S(1'b1), .Q(o_m22[2])
         );
  DFFSR \o_m22_reg[1]  ( .D(n654), .CLK(clk), .R(n553), .S(1'b1), .Q(o_m22[1])
         );
  DFFSR \o_m22_reg[0]  ( .D(n655), .CLK(clk), .R(n553), .S(1'b1), .Q(o_m22[0])
         );
  DFFSR \o_m22_reg[6]  ( .D(n656), .CLK(clk), .R(n553), .S(1'b1), .Q(o_m22[6])
         );
  DFFSR \o_m20_reg[7]  ( .D(n665), .CLK(clk), .R(n553), .S(1'b1), .Q(o_m20[7])
         );
  DFFSR \o_m20_reg[5]  ( .D(n666), .CLK(clk), .R(n553), .S(1'b1), .Q(o_m20[5])
         );
  DFFSR \o_m20_reg[4]  ( .D(n667), .CLK(clk), .R(n553), .S(1'b1), .Q(o_m20[4])
         );
  DFFSR \o_m20_reg[3]  ( .D(n668), .CLK(clk), .R(n553), .S(1'b1), .Q(o_m20[3])
         );
  DFFSR \o_m20_reg[2]  ( .D(n669), .CLK(clk), .R(n553), .S(1'b1), .Q(o_m20[2])
         );
  DFFSR \o_m20_reg[1]  ( .D(n670), .CLK(clk), .R(n553), .S(1'b1), .Q(o_m20[1])
         );
  DFFSR \o_m20_reg[0]  ( .D(n671), .CLK(clk), .R(n553), .S(1'b1), .Q(o_m20[0])
         );
  DFFSR \o_m20_reg[6]  ( .D(n672), .CLK(clk), .R(n553), .S(1'b1), .Q(o_m20[6])
         );
  DFFSR \o_m18_reg[7]  ( .D(n681), .CLK(clk), .R(n567), .S(1'b1), .Q(o_m18[7])
         );
  DFFSR \o_m18_reg[5]  ( .D(n682), .CLK(clk), .R(n817), .S(1'b1), .Q(o_m18[5])
         );
  DFFSR \o_m18_reg[4]  ( .D(n683), .CLK(clk), .R(n817), .S(1'b1), .Q(o_m18[4])
         );
  DFFSR \o_m18_reg[3]  ( .D(n684), .CLK(clk), .R(n817), .S(1'b1), .Q(o_m18[3])
         );
  DFFSR \o_m18_reg[2]  ( .D(n685), .CLK(clk), .R(n615), .S(1'b1), .Q(o_m18[2])
         );
  DFFSR \o_m18_reg[1]  ( .D(n686), .CLK(clk), .R(n615), .S(1'b1), .Q(o_m18[1])
         );
  DFFSR \o_m18_reg[0]  ( .D(n687), .CLK(clk), .R(n615), .S(1'b1), .Q(o_m18[0])
         );
  DFFSR \o_m18_reg[6]  ( .D(n688), .CLK(clk), .R(n615), .S(1'b1), .Q(o_m18[6])
         );
  DFFSR \o_m23_reg[7]  ( .D(n641), .CLK(clk), .R(n615), .S(1'b1), .Q(o_m23[7])
         );
  DFFSR \o_m23_reg[5]  ( .D(n642), .CLK(clk), .R(n615), .S(1'b1), .Q(o_m23[5])
         );
  DFFSR \o_m23_reg[4]  ( .D(n643), .CLK(clk), .R(n615), .S(1'b1), .Q(o_m23[4])
         );
  DFFSR \o_m23_reg[3]  ( .D(n644), .CLK(clk), .R(n615), .S(1'b1), .Q(o_m23[3])
         );
  DFFSR \o_m23_reg[2]  ( .D(n645), .CLK(clk), .R(n615), .S(1'b1), .Q(o_m23[2])
         );
  DFFSR \o_m23_reg[1]  ( .D(n646), .CLK(clk), .R(n615), .S(1'b1), .Q(o_m23[1])
         );
  DFFSR \o_m23_reg[0]  ( .D(n647), .CLK(clk), .R(n615), .S(1'b1), .Q(o_m23[0])
         );
  DFFSR \o_m23_reg[6]  ( .D(n648), .CLK(clk), .R(n615), .S(1'b1), .Q(o_m23[6])
         );
  DFFSR \o_m21_reg[7]  ( .D(n657), .CLK(clk), .R(n609), .S(1'b1), .Q(o_m21[7])
         );
  DFFSR \o_m21_reg[5]  ( .D(n658), .CLK(clk), .R(n609), .S(1'b1), .Q(o_m21[5])
         );
  DFFSR \o_m21_reg[4]  ( .D(n659), .CLK(clk), .R(n609), .S(1'b1), .Q(o_m21[4])
         );
  DFFSR \o_m21_reg[3]  ( .D(n660), .CLK(clk), .R(n609), .S(1'b1), .Q(o_m21[3])
         );
  DFFSR \o_m21_reg[2]  ( .D(n661), .CLK(clk), .R(n609), .S(1'b1), .Q(o_m21[2])
         );
  DFFSR \o_m21_reg[1]  ( .D(n662), .CLK(clk), .R(n609), .S(1'b1), .Q(o_m21[1])
         );
  DFFSR \o_m21_reg[0]  ( .D(n663), .CLK(clk), .R(n609), .S(1'b1), .Q(o_m21[0])
         );
  DFFSR \o_m21_reg[6]  ( .D(n664), .CLK(clk), .R(n609), .S(1'b1), .Q(o_m21[6])
         );
  DFFSR \o_m19_reg[7]  ( .D(n673), .CLK(clk), .R(n609), .S(1'b1), .Q(o_m19[7])
         );
  DFFSR \o_m19_reg[5]  ( .D(n674), .CLK(clk), .R(n609), .S(1'b1), .Q(o_m19[5])
         );
  DFFSR \o_m19_reg[4]  ( .D(n675), .CLK(clk), .R(n609), .S(1'b1), .Q(o_m19[4])
         );
  DFFSR \o_m19_reg[3]  ( .D(n676), .CLK(clk), .R(n609), .S(1'b1), .Q(o_m19[3])
         );
  DFFSR \o_m19_reg[2]  ( .D(n677), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m19[2])
         );
  DFFSR \o_m19_reg[1]  ( .D(n678), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m19[1])
         );
  DFFSR \o_m19_reg[0]  ( .D(n679), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m19[0])
         );
  DFFSR \o_m19_reg[6]  ( .D(n680), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m19[6])
         );
  DFFSR \o_m17_reg[7]  ( .D(n689), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m17[7])
         );
  DFFSR \o_m17_reg[5]  ( .D(n690), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m17[5])
         );
  DFFSR \o_m17_reg[4]  ( .D(n691), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m17[4])
         );
  DFFSR \o_m17_reg[3]  ( .D(n692), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m17[3])
         );
  DFFSR \o_m17_reg[2]  ( .D(n693), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m17[2])
         );
  DFFSR \o_m17_reg[1]  ( .D(n694), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m17[1])
         );
  DFFSR \o_m17_reg[0]  ( .D(n695), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m17[0])
         );
  DFFSR \o_m17_reg[6]  ( .D(n696), .CLK(clk), .R(n606), .S(1'b1), .Q(o_m17[6])
         );
  DFFSR \o_m16_reg[7]  ( .D(n697), .CLK(clk), .R(n605), .S(1'b1), .Q(o_m16[7])
         );
  DFFSR \o_m16_reg[5]  ( .D(n698), .CLK(clk), .R(n605), .S(1'b1), .Q(o_m16[5])
         );
  DFFSR \o_m16_reg[4]  ( .D(n699), .CLK(clk), .R(n605), .S(1'b1), .Q(o_m16[4])
         );
  DFFSR \o_m16_reg[3]  ( .D(n700), .CLK(clk), .R(n605), .S(1'b1), .Q(o_m16[3])
         );
  DFFSR \o_m16_reg[2]  ( .D(n701), .CLK(clk), .R(n605), .S(1'b1), .Q(o_m16[2])
         );
  DFFSR \o_m16_reg[1]  ( .D(n702), .CLK(clk), .R(n605), .S(1'b1), .Q(o_m16[1])
         );
  DFFSR \o_m16_reg[0]  ( .D(n703), .CLK(clk), .R(n605), .S(1'b1), .Q(o_m16[0])
         );
  DFFSR \o_m16_reg[6]  ( .D(n704), .CLK(clk), .R(n605), .S(1'b1), .Q(o_m16[6])
         );
  DFFSR \o_m14_reg[7]  ( .D(n713), .CLK(clk), .R(n605), .S(1'b1), .Q(n953) );
  DFFSR \o_m14_reg[5]  ( .D(n714), .CLK(clk), .R(n605), .S(1'b1), .Q(n955) );
  DFFSR \o_m14_reg[4]  ( .D(n715), .CLK(clk), .R(n605), .S(1'b1), .Q(n956) );
  DFFSR \o_m14_reg[3]  ( .D(n716), .CLK(clk), .R(n605), .S(1'b1), .Q(n957) );
  DFFSR \o_m14_reg[2]  ( .D(n717), .CLK(clk), .R(n600), .S(1'b1), .Q(n958) );
  DFFSR \o_m14_reg[1]  ( .D(n718), .CLK(clk), .R(n600), .S(1'b1), .Q(n959) );
  DFFSR \o_m14_reg[0]  ( .D(n719), .CLK(clk), .R(n600), .S(1'b1), .Q(n960) );
  DFFSR \o_m14_reg[6]  ( .D(n720), .CLK(clk), .R(n600), .S(1'b1), .Q(n954) );
  DFFSR \o_m12_reg[7]  ( .D(n729), .CLK(clk), .R(n600), .S(1'b1), .Q(o_m12[7])
         );
  DFFSR \o_m12_reg[6]  ( .D(n730), .CLK(clk), .R(n600), .S(1'b1), .Q(o_m12[6])
         );
  DFFSR \o_m12_reg[5]  ( .D(n731), .CLK(clk), .R(n600), .S(1'b1), .Q(o_m12[5])
         );
  DFFSR \o_m12_reg[4]  ( .D(n732), .CLK(clk), .R(n600), .S(1'b1), .Q(o_m12[4])
         );
  DFFSR \o_m12_reg[3]  ( .D(n733), .CLK(clk), .R(n600), .S(1'b1), .Q(o_m12[3])
         );
  DFFSR \o_m12_reg[2]  ( .D(n734), .CLK(clk), .R(n600), .S(1'b1), .Q(o_m12[2])
         );
  DFFSR \o_m12_reg[0]  ( .D(n735), .CLK(clk), .R(n600), .S(1'b1), .Q(o_m12[0])
         );
  DFFSR \o_m12_reg[1]  ( .D(n736), .CLK(clk), .R(n597), .S(1'b1), .Q(o_m12[1])
         );
  DFFSR \o_m10_reg[7]  ( .D(n745), .CLK(clk), .R(n597), .S(1'b1), .Q(o_m10[7])
         );
  DFFSR \o_m10_reg[5]  ( .D(n746), .CLK(clk), .R(n597), .S(1'b1), .Q(o_m10[5])
         );
  DFFSR \o_m10_reg[4]  ( .D(n747), .CLK(clk), .R(n597), .S(1'b1), .Q(o_m10[4])
         );
  DFFSR \o_m10_reg[3]  ( .D(n748), .CLK(clk), .R(n597), .S(1'b1), .Q(o_m10[3])
         );
  DFFSR \o_m10_reg[2]  ( .D(n749), .CLK(clk), .R(n597), .S(1'b1), .Q(o_m10[2])
         );
  DFFSR \o_m10_reg[1]  ( .D(n750), .CLK(clk), .R(n597), .S(1'b1), .Q(o_m10[1])
         );
  DFFSR \o_m10_reg[0]  ( .D(n751), .CLK(clk), .R(n597), .S(1'b1), .Q(o_m10[0])
         );
  DFFSR \o_m10_reg[6]  ( .D(n752), .CLK(clk), .R(n597), .S(1'b1), .Q(o_m10[6])
         );
  DFFSR \o_m8_reg[7]  ( .D(n761), .CLK(clk), .R(n597), .S(1'b1), .Q(n938) );
  DFFSR \o_m8_reg[5]  ( .D(n762), .CLK(clk), .R(n597), .S(1'b1), .Q(n940) );
  DFFSR \o_m8_reg[4]  ( .D(n763), .CLK(clk), .R(n597), .S(1'b1), .Q(n941) );
  DFFSR \o_m8_reg[3]  ( .D(n764), .CLK(clk), .R(n591), .S(1'b1), .Q(n942) );
  DFFSR \o_m8_reg[2]  ( .D(n765), .CLK(clk), .R(n591), .S(1'b1), .Q(n943) );
  DFFSR \o_m8_reg[1]  ( .D(n766), .CLK(clk), .R(n591), .S(1'b1), .Q(n944) );
  DFFSR \o_m8_reg[0]  ( .D(n767), .CLK(clk), .R(n591), .S(1'b1), .Q(n945) );
  DFFSR \o_m8_reg[6]  ( .D(n768), .CLK(clk), .R(n591), .S(1'b1), .Q(n939) );
  DFFSR \o_m7_reg[7]  ( .D(n769), .CLK(clk), .R(n591), .S(1'b1), .Q(o_m7[7])
         );
  DFFSR \o_m7_reg[5]  ( .D(n770), .CLK(clk), .R(n591), .S(1'b1), .Q(o_m7[5])
         );
  DFFSR \o_m7_reg[4]  ( .D(n771), .CLK(clk), .R(n591), .S(1'b1), .Q(o_m7[4])
         );
  DFFSR \o_m7_reg[3]  ( .D(n772), .CLK(clk), .R(n591), .S(1'b1), .Q(o_m7[3])
         );
  DFFSR \o_m7_reg[2]  ( .D(n773), .CLK(clk), .R(n591), .S(1'b1), .Q(o_m7[2])
         );
  DFFSR \o_m7_reg[1]  ( .D(n774), .CLK(clk), .R(n591), .S(1'b1), .Q(o_m7[1])
         );
  DFFSR \o_m7_reg[0]  ( .D(n775), .CLK(clk), .R(n591), .S(1'b1), .Q(o_m7[0])
         );
  DFFSR \o_m7_reg[6]  ( .D(n776), .CLK(clk), .R(n587), .S(1'b1), .Q(o_m7[6])
         );
  DFFSR \o_m3_reg[7]  ( .D(n801), .CLK(clk), .R(n587), .S(1'b1), .Q(n931) );
  DFFSR \o_m3_reg[5]  ( .D(n802), .CLK(clk), .R(n587), .S(1'b1), .Q(n933) );
  DFFSR \o_m3_reg[4]  ( .D(n803), .CLK(clk), .R(n587), .S(1'b1), .Q(n934) );
  DFFSR \o_m3_reg[3]  ( .D(n804), .CLK(clk), .R(n587), .S(1'b1), .Q(n935) );
  DFFSR \o_m3_reg[2]  ( .D(n805), .CLK(clk), .R(n587), .S(1'b1), .Q(n936) );
  DFFSR \o_m3_reg[1]  ( .D(n806), .CLK(clk), .R(n587), .S(1'b1), .Q(n937) );
  DFFSR \o_m3_reg[0]  ( .D(n807), .CLK(clk), .R(n587), .S(1'b1), .Q(o_m3[0])
         );
  DFFSR \o_m3_reg[6]  ( .D(n808), .CLK(clk), .R(n587), .S(1'b1), .Q(n932) );
  DFFSR \o_m9_reg[7]  ( .D(n753), .CLK(clk), .R(n587), .S(1'b1), .Q(n946) );
  DFFSR \o_m9_reg[5]  ( .D(n754), .CLK(clk), .R(n587), .S(1'b1), .Q(n948) );
  DFFSR \o_m9_reg[4]  ( .D(n755), .CLK(clk), .R(n587), .S(1'b1), .Q(n949) );
  DFFSR \o_m9_reg[3]  ( .D(n756), .CLK(clk), .R(n581), .S(1'b1), .Q(n950) );
  DFFSR \o_m9_reg[2]  ( .D(n757), .CLK(clk), .R(n581), .S(1'b1), .Q(n951) );
  DFFSR \o_m9_reg[1]  ( .D(n758), .CLK(clk), .R(n581), .S(1'b1), .Q(n952) );
  DFFSR \o_m9_reg[0]  ( .D(n759), .CLK(clk), .R(n581), .S(1'b1), .Q(o_m9[0])
         );
  DFFSR \o_m9_reg[6]  ( .D(n760), .CLK(clk), .R(n600), .S(1'b1), .Q(n947) );
  DFFSR o_full_reg ( .D(next_full), .CLK(clk), .R(n553), .S(1'b1), .Q(o_full)
         );
  AND2X2 U211 ( .A(n252), .B(n253), .Y(n251) );
  AND2X2 U212 ( .A(n505), .B(n241), .Y(next[4]) );
  AND2X2 U213 ( .A(n505), .B(n240), .Y(next[1]) );
  AND2X2 U214 ( .A(n466), .B(n321), .Y(n319) );
  AND2X2 U215 ( .A(n318), .B(n331), .Y(n330) );
  AND2X2 U216 ( .A(n242), .B(n306), .Y(n362) );
  AND2X2 U217 ( .A(n290), .B(n323), .Y(n253) );
  AND2X2 U218 ( .A(n369), .B(n309), .Y(n246) );
  AND2X2 U228 ( .A(n360), .B(n468), .Y(n412) );
  AND2X2 U230 ( .A(n391), .B(n360), .Y(n422) );
  AND2X2 U236 ( .A(n361), .B(n468), .Y(n487) );
  AND2X2 U238 ( .A(n361), .B(n391), .Y(n497) );
  AND2X2 U239 ( .A(curr[4]), .B(n930), .Y(n361) );
  AND2X2 U242 ( .A(n570), .B(curr[3]), .Y(n353) );
  AND2X2 U244 ( .A(n589), .B(n909), .Y(n354) );
  AND2X2 U247 ( .A(n570), .B(n929), .Y(n364) );
  AND2X2 U248 ( .A(n589), .B(curr[2]), .Y(n570) );
  AND2X2 U250 ( .A(n589), .B(n402), .Y(n363) );
  NOR2X1 U280 ( .A(n238), .B(n239), .Y(next_full) );
  NAND3X1 U281 ( .A(n915), .B(n913), .C(n910), .Y(n239) );
  NAND3X1 U282 ( .A(n240), .B(n241), .C(n911), .Y(n238) );
  NAND2X1 U283 ( .A(n505), .B(n242), .Y(next_empty) );
  OAI21X1 U284 ( .A(n244), .B(n245), .C(n505), .Y(n243) );
  NAND3X1 U285 ( .A(n923), .B(n246), .C(n917), .Y(n245) );
  NAND3X1 U286 ( .A(n249), .B(n250), .C(n251), .Y(n244) );
  NAND3X1 U287 ( .A(n254), .B(n255), .C(n256), .Y(n241) );
  NOR2X1 U288 ( .A(n257), .B(n258), .Y(n256) );
  NAND2X1 U289 ( .A(n259), .B(n260), .Y(n258) );
  NAND3X1 U290 ( .A(n249), .B(n250), .C(n261), .Y(n257) );
  NOR2X1 U291 ( .A(n262), .B(n263), .Y(n255) );
  NOR2X1 U292 ( .A(n912), .B(n264), .Y(n254) );
  NOR2X1 U293 ( .A(i_clear), .B(n915), .Y(next[3]) );
  NAND3X1 U294 ( .A(n267), .B(n268), .C(n269), .Y(n266) );
  NOR2X1 U295 ( .A(n270), .B(n271), .Y(n269) );
  OAI21X1 U296 ( .A(n929), .B(n250), .C(n476), .Y(n271) );
  NAND2X1 U297 ( .A(n273), .B(n274), .Y(n270) );
  NOR2X1 U298 ( .A(n275), .B(n276), .Y(n268) );
  NOR2X1 U299 ( .A(n277), .B(n247), .Y(n267) );
  NAND3X1 U300 ( .A(n278), .B(n279), .C(n918), .Y(n247) );
  NOR2X1 U301 ( .A(i_clear), .B(n913), .Y(next[2]) );
  NAND3X1 U302 ( .A(n282), .B(n283), .C(n284), .Y(n281) );
  NOR2X1 U303 ( .A(n285), .B(n286), .Y(n284) );
  NAND3X1 U304 ( .A(n287), .B(n288), .C(n924), .Y(n286) );
  NAND3X1 U305 ( .A(n290), .B(n279), .C(n470), .Y(n285) );
  NOR2X1 U306 ( .A(n489), .B(n292), .Y(n283) );
  OAI21X1 U307 ( .A(n293), .B(n294), .C(n295), .Y(n292) );
  NOR2X1 U308 ( .A(n296), .B(n297), .Y(n282) );
  OAI21X1 U309 ( .A(n928), .B(n250), .C(n265), .Y(n297) );
  NOR2X1 U310 ( .A(n485), .B(n298), .Y(n265) );
  OAI21X1 U311 ( .A(n293), .B(n261), .C(n299), .Y(n298) );
  NAND3X1 U312 ( .A(n300), .B(n301), .C(n302), .Y(n240) );
  NOR2X1 U313 ( .A(n303), .B(n304), .Y(n302) );
  NAND2X1 U314 ( .A(n305), .B(n306), .Y(n304) );
  NAND3X1 U315 ( .A(n465), .B(n308), .C(n309), .Y(n303) );
  AOI21X1 U316 ( .A(n914), .B(curr[1]), .C(n310), .Y(n301) );
  NAND2X1 U317 ( .A(n495), .B(n312), .Y(n310) );
  NOR2X1 U318 ( .A(n264), .B(n296), .Y(n300) );
  NAND3X1 U319 ( .A(n313), .B(n314), .C(n315), .Y(n296) );
  NOR2X1 U320 ( .A(n316), .B(n317), .Y(n315) );
  OAI21X1 U321 ( .A(n293), .B(n318), .C(n319), .Y(n317) );
  NAND3X1 U322 ( .A(n278), .B(n322), .C(n323), .Y(n316) );
  NOR2X1 U323 ( .A(n324), .B(n325), .Y(n314) );
  NAND2X1 U324 ( .A(n326), .B(n327), .Y(n325) );
  NOR2X1 U325 ( .A(n479), .B(n328), .Y(n313) );
  OAI21X1 U326 ( .A(n293), .B(n312), .C(n274), .Y(n328) );
  NAND3X1 U327 ( .A(n329), .B(n252), .C(n330), .Y(n264) );
  NOR2X1 U328 ( .A(i_clear), .B(n911), .Y(next[0]) );
  OAI21X1 U329 ( .A(n920), .B(n250), .C(n333), .Y(n332) );
  NAND2X1 U330 ( .A(i_save), .B(n921), .Y(n333) );
  NAND3X1 U331 ( .A(n335), .B(n336), .C(n337), .Y(n250) );
  NOR2X1 U332 ( .A(n338), .B(n339), .Y(n337) );
  NAND3X1 U333 ( .A(n334), .B(n919), .C(n340), .Y(n339) );
  NOR2X1 U334 ( .A(n275), .B(n263), .Y(n340) );
  NAND2X1 U335 ( .A(n341), .B(n476), .Y(n263) );
  NAND2X1 U336 ( .A(n916), .B(n329), .Y(n275) );
  NAND2X1 U337 ( .A(n470), .B(n466), .Y(n262) );
  NAND2X1 U338 ( .A(n342), .B(n495), .Y(n276) );
  NOR2X1 U339 ( .A(n343), .B(n344), .Y(n334) );
  NAND3X1 U340 ( .A(n318), .B(n261), .C(n345), .Y(n344) );
  NOR2X1 U341 ( .A(n248), .B(n277), .Y(n345) );
  NAND3X1 U342 ( .A(n346), .B(n347), .C(n348), .Y(n277) );
  NOR2X1 U343 ( .A(n349), .B(n350), .Y(n348) );
  NAND2X1 U344 ( .A(n351), .B(n299), .Y(n350) );
  NAND2X1 U345 ( .A(n922), .B(n908), .Y(n299) );
  AOI22X1 U346 ( .A(n922), .B(n909), .C(n925), .D(n909), .Y(n351) );
  NAND3X1 U347 ( .A(n287), .B(n305), .C(n327), .Y(n349) );
  NAND2X1 U348 ( .A(n352), .B(n353), .Y(n327) );
  NAND2X1 U349 ( .A(n352), .B(n354), .Y(n305) );
  NAND2X1 U350 ( .A(n355), .B(n353), .Y(n287) );
  NOR2X1 U351 ( .A(n289), .B(n356), .Y(n347) );
  OAI21X1 U352 ( .A(n357), .B(n312), .C(n326), .Y(n356) );
  NAND2X1 U353 ( .A(n925), .B(n908), .Y(n326) );
  NOR2X1 U354 ( .A(n294), .B(n358), .Y(n289) );
  AOI21X1 U355 ( .A(n355), .B(n354), .C(n359), .Y(n346) );
  OAI21X1 U356 ( .A(n357), .B(n294), .C(n926), .Y(n359) );
  NOR2X1 U357 ( .A(n312), .B(n358), .Y(n324) );
  NAND3X1 U358 ( .A(n294), .B(n312), .C(n260), .Y(n248) );
  NAND2X1 U359 ( .A(n355), .B(n907), .Y(n260) );
  NAND2X1 U360 ( .A(n352), .B(n360), .Y(n312) );
  NAND2X1 U361 ( .A(n355), .B(n360), .Y(n294) );
  NAND2X1 U362 ( .A(n355), .B(n361), .Y(n261) );
  NAND2X1 U363 ( .A(n352), .B(n361), .Y(n318) );
  NAND3X1 U364 ( .A(n321), .B(n288), .C(n362), .Y(n343) );
  NAND2X1 U365 ( .A(n352), .B(n363), .Y(n306) );
  NAND2X1 U366 ( .A(n355), .B(n363), .Y(n242) );
  NAND2X1 U367 ( .A(n355), .B(n364), .Y(n288) );
  NOR2X1 U368 ( .A(curr[0]), .B(curr[1]), .Y(n355) );
  NAND2X1 U369 ( .A(n352), .B(n364), .Y(n321) );
  NOR2X1 U370 ( .A(n927), .B(curr[0]), .Y(n352) );
  NAND3X1 U371 ( .A(n246), .B(n253), .C(n365), .Y(n338) );
  NOR2X1 U372 ( .A(n280), .B(n366), .Y(n365) );
  NAND2X1 U373 ( .A(n367), .B(n331), .Y(n366) );
  NAND2X1 U374 ( .A(n368), .B(n465), .Y(n280) );
  NOR2X1 U375 ( .A(n370), .B(n371), .Y(n336) );
  NAND2X1 U376 ( .A(n279), .B(n322), .Y(n371) );
  NAND3X1 U377 ( .A(n252), .B(n249), .C(n308), .Y(n370) );
  NOR2X1 U378 ( .A(n372), .B(n373), .Y(n335) );
  NAND2X1 U379 ( .A(n259), .B(n273), .Y(n373) );
  NAND3X1 U380 ( .A(n295), .B(n278), .C(n274), .Y(n372) );
  OAI21X1 U381 ( .A(n308), .B(n526), .C(n375), .Y(n617) );
  NAND2X1 U382 ( .A(o_m1[7]), .B(n882), .Y(n375) );
  OAI21X1 U383 ( .A(n308), .B(n524), .C(n378), .Y(n618) );
  NAND2X1 U384 ( .A(o_m1[6]), .B(n882), .Y(n378) );
  OAI21X1 U385 ( .A(n308), .B(n523), .C(n380), .Y(n619) );
  NAND2X1 U386 ( .A(o_m1[4]), .B(n882), .Y(n380) );
  OAI21X1 U387 ( .A(n308), .B(n517), .C(n382), .Y(n620) );
  NAND2X1 U388 ( .A(o_m1[3]), .B(n882), .Y(n382) );
  OAI21X1 U389 ( .A(n308), .B(n514), .C(n384), .Y(n621) );
  NAND2X1 U390 ( .A(o_m1[2]), .B(n882), .Y(n384) );
  OAI21X1 U391 ( .A(n308), .B(n513), .C(n386), .Y(n622) );
  NAND2X1 U392 ( .A(o_m1[1]), .B(n882), .Y(n386) );
  OAI21X1 U395 ( .A(n308), .B(n508), .C(n390), .Y(n624) );
  NAND2X1 U396 ( .A(o_m1[5]), .B(n882), .Y(n390) );
  OAI21X1 U398 ( .A(n526), .B(n252), .C(n392), .Y(n625) );
  NAND2X1 U399 ( .A(o_m25[7]), .B(n906), .Y(n392) );
  OAI21X1 U400 ( .A(n524), .B(n252), .C(n394), .Y(n626) );
  NAND2X1 U401 ( .A(o_m25[6]), .B(n906), .Y(n394) );
  OAI21X1 U402 ( .A(n523), .B(n252), .C(n395), .Y(n627) );
  NAND2X1 U403 ( .A(o_m25[4]), .B(n906), .Y(n395) );
  OAI21X1 U404 ( .A(n517), .B(n252), .C(n396), .Y(n628) );
  NAND2X1 U405 ( .A(o_m25[3]), .B(n906), .Y(n396) );
  OAI21X1 U406 ( .A(n514), .B(n252), .C(n397), .Y(n629) );
  NAND2X1 U407 ( .A(o_m25[2]), .B(n906), .Y(n397) );
  OAI21X1 U408 ( .A(n513), .B(n252), .C(n398), .Y(n630) );
  NAND2X1 U409 ( .A(o_m25[1]), .B(n906), .Y(n398) );
  OAI21X1 U412 ( .A(n508), .B(n252), .C(n400), .Y(n632) );
  NAND2X1 U413 ( .A(o_m25[5]), .B(n906), .Y(n400) );
  NAND3X1 U415 ( .A(n402), .B(curr[5]), .C(curr[4]), .Y(n401) );
  OAI21X1 U416 ( .A(n526), .B(n249), .C(n403), .Y(n633) );
  NAND2X1 U417 ( .A(o_m24[7]), .B(n905), .Y(n403) );
  OAI21X1 U418 ( .A(n508), .B(n249), .C(n405), .Y(n634) );
  NAND2X1 U419 ( .A(o_m24[5]), .B(n905), .Y(n405) );
  OAI21X1 U420 ( .A(n523), .B(n249), .C(n406), .Y(n635) );
  NAND2X1 U421 ( .A(o_m24[4]), .B(n905), .Y(n406) );
  OAI21X1 U422 ( .A(n517), .B(n249), .C(n407), .Y(n636) );
  NAND2X1 U423 ( .A(o_m24[3]), .B(n905), .Y(n407) );
  OAI21X1 U424 ( .A(n514), .B(n249), .C(n408), .Y(n637) );
  NAND2X1 U425 ( .A(o_m24[2]), .B(n905), .Y(n408) );
  OAI21X1 U426 ( .A(n513), .B(n249), .C(n409), .Y(n638) );
  NAND2X1 U427 ( .A(o_m24[1]), .B(n905), .Y(n409) );
  OAI21X1 U430 ( .A(n524), .B(n249), .C(n411), .Y(n640) );
  NAND2X1 U431 ( .A(o_m24[6]), .B(n905), .Y(n411) );
  OAI21X1 U433 ( .A(n526), .B(n278), .C(n413), .Y(n641) );
  NAND2X1 U434 ( .A(o_m23[7]), .B(n904), .Y(n413) );
  OAI21X1 U435 ( .A(n508), .B(n278), .C(n415), .Y(n642) );
  NAND2X1 U436 ( .A(o_m23[5]), .B(n904), .Y(n415) );
  OAI21X1 U437 ( .A(n523), .B(n278), .C(n416), .Y(n643) );
  NAND2X1 U438 ( .A(o_m23[4]), .B(n904), .Y(n416) );
  OAI21X1 U439 ( .A(n517), .B(n278), .C(n417), .Y(n644) );
  NAND2X1 U440 ( .A(o_m23[3]), .B(n904), .Y(n417) );
  OAI21X1 U441 ( .A(n514), .B(n278), .C(n418), .Y(n645) );
  NAND2X1 U442 ( .A(o_m23[2]), .B(n904), .Y(n418) );
  OAI21X1 U447 ( .A(n524), .B(n278), .C(n421), .Y(n648) );
  NAND2X1 U448 ( .A(o_m23[6]), .B(n904), .Y(n421) );
  OAI21X1 U450 ( .A(n526), .B(n279), .C(n423), .Y(n649) );
  NAND2X1 U451 ( .A(o_m22[7]), .B(n903), .Y(n423) );
  OAI21X1 U452 ( .A(n508), .B(n279), .C(n425), .Y(n650) );
  NAND2X1 U453 ( .A(o_m22[5]), .B(n903), .Y(n425) );
  OAI21X1 U454 ( .A(n523), .B(n279), .C(n426), .Y(n651) );
  NAND2X1 U455 ( .A(o_m22[4]), .B(n903), .Y(n426) );
  OAI21X1 U456 ( .A(n517), .B(n279), .C(n427), .Y(n652) );
  NAND2X1 U457 ( .A(o_m22[3]), .B(n903), .Y(n427) );
  OAI21X1 U458 ( .A(n514), .B(n279), .C(n428), .Y(n653) );
  NAND2X1 U459 ( .A(o_m22[2]), .B(n903), .Y(n428) );
  OAI21X1 U460 ( .A(n513), .B(n279), .C(n429), .Y(n654) );
  NAND2X1 U461 ( .A(o_m22[1]), .B(n903), .Y(n429) );
  OAI21X1 U464 ( .A(n524), .B(n279), .C(n431), .Y(n656) );
  NAND2X1 U465 ( .A(o_m22[6]), .B(n903), .Y(n431) );
  OAI21X1 U467 ( .A(n526), .B(n465), .C(n432), .Y(n657) );
  NAND2X1 U468 ( .A(o_m21[7]), .B(n902), .Y(n432) );
  OAI21X1 U469 ( .A(n508), .B(n465), .C(n434), .Y(n658) );
  NAND2X1 U470 ( .A(o_m21[5]), .B(n902), .Y(n434) );
  OAI21X1 U471 ( .A(n523), .B(n465), .C(n435), .Y(n659) );
  NAND2X1 U472 ( .A(o_m21[4]), .B(n902), .Y(n435) );
  OAI21X1 U473 ( .A(n517), .B(n465), .C(n436), .Y(n660) );
  NAND2X1 U474 ( .A(o_m21[3]), .B(n902), .Y(n436) );
  OAI21X1 U475 ( .A(n514), .B(n465), .C(n437), .Y(n661) );
  NAND2X1 U476 ( .A(o_m21[2]), .B(n902), .Y(n437) );
  OAI21X1 U477 ( .A(n513), .B(n465), .C(n438), .Y(n662) );
  NAND2X1 U478 ( .A(o_m21[1]), .B(n902), .Y(n438) );
  OAI21X1 U481 ( .A(n524), .B(n465), .C(n440), .Y(n664) );
  NAND2X1 U482 ( .A(o_m21[6]), .B(n902), .Y(n440) );
  OAI21X1 U484 ( .A(n526), .B(n368), .C(n441), .Y(n665) );
  NAND2X1 U485 ( .A(o_m20[7]), .B(n901), .Y(n441) );
  OAI21X1 U486 ( .A(n508), .B(n368), .C(n443), .Y(n666) );
  NAND2X1 U487 ( .A(o_m20[5]), .B(n901), .Y(n443) );
  OAI21X1 U488 ( .A(n523), .B(n368), .C(n444), .Y(n667) );
  NAND2X1 U489 ( .A(o_m20[4]), .B(n901), .Y(n444) );
  OAI21X1 U490 ( .A(n517), .B(n368), .C(n445), .Y(n668) );
  NAND2X1 U491 ( .A(o_m20[3]), .B(n901), .Y(n445) );
  OAI21X1 U492 ( .A(n514), .B(n368), .C(n446), .Y(n669) );
  NAND2X1 U493 ( .A(o_m20[2]), .B(n901), .Y(n446) );
  OAI21X1 U494 ( .A(n513), .B(n368), .C(n447), .Y(n670) );
  NAND2X1 U495 ( .A(o_m20[1]), .B(n901), .Y(n447) );
  OAI21X1 U498 ( .A(n524), .B(n368), .C(n449), .Y(n672) );
  NAND2X1 U499 ( .A(o_m20[6]), .B(n901), .Y(n449) );
  OAI21X1 U501 ( .A(n526), .B(n323), .C(n450), .Y(n673) );
  NAND2X1 U502 ( .A(o_m19[7]), .B(n900), .Y(n450) );
  OAI21X1 U503 ( .A(n508), .B(n323), .C(n452), .Y(n674) );
  NAND2X1 U504 ( .A(o_m19[5]), .B(n900), .Y(n452) );
  OAI21X1 U505 ( .A(n523), .B(n323), .C(n453), .Y(n675) );
  NAND2X1 U506 ( .A(o_m19[4]), .B(n900), .Y(n453) );
  OAI21X1 U507 ( .A(n517), .B(n323), .C(n454), .Y(n676) );
  NAND2X1 U508 ( .A(o_m19[3]), .B(n900), .Y(n454) );
  OAI21X1 U509 ( .A(n514), .B(n323), .C(n455), .Y(n677) );
  NAND2X1 U510 ( .A(o_m19[2]), .B(n900), .Y(n455) );
  OAI21X1 U515 ( .A(n524), .B(n323), .C(n458), .Y(n680) );
  NAND2X1 U516 ( .A(o_m19[6]), .B(n900), .Y(n458) );
  OAI21X1 U518 ( .A(n526), .B(n290), .C(n459), .Y(n681) );
  NAND2X1 U519 ( .A(o_m18[7]), .B(n899), .Y(n459) );
  OAI21X1 U520 ( .A(n508), .B(n290), .C(n461), .Y(n682) );
  NAND2X1 U521 ( .A(o_m18[5]), .B(n899), .Y(n461) );
  OAI21X1 U522 ( .A(n523), .B(n290), .C(n462), .Y(n683) );
  NAND2X1 U523 ( .A(o_m18[4]), .B(n899), .Y(n462) );
  OAI21X1 U524 ( .A(n517), .B(n290), .C(n463), .Y(n684) );
  NAND2X1 U525 ( .A(o_m18[3]), .B(n899), .Y(n463) );
  OAI21X1 U526 ( .A(n514), .B(n290), .C(n464), .Y(n685) );
  NAND2X1 U527 ( .A(o_m18[2]), .B(n899), .Y(n464) );
  OAI21X1 U532 ( .A(n524), .B(n290), .C(n467), .Y(n688) );
  NAND2X1 U533 ( .A(o_m18[6]), .B(n899), .Y(n467) );
  OAI21X1 U535 ( .A(n526), .B(n309), .C(n469), .Y(n689) );
  NAND2X1 U536 ( .A(o_m17[7]), .B(n898), .Y(n469) );
  OAI21X1 U537 ( .A(n508), .B(n309), .C(n471), .Y(n690) );
  NAND2X1 U538 ( .A(o_m17[5]), .B(n898), .Y(n471) );
  OAI21X1 U539 ( .A(n523), .B(n309), .C(n472), .Y(n691) );
  NAND2X1 U540 ( .A(o_m17[4]), .B(n898), .Y(n472) );
  OAI21X1 U541 ( .A(n517), .B(n309), .C(n473), .Y(n692) );
  NAND2X1 U542 ( .A(o_m17[3]), .B(n898), .Y(n473) );
  OAI21X1 U543 ( .A(n514), .B(n309), .C(n474), .Y(n693) );
  NAND2X1 U544 ( .A(o_m17[2]), .B(n898), .Y(n474) );
  OAI21X1 U549 ( .A(n524), .B(n309), .C(n477), .Y(n696) );
  NAND2X1 U550 ( .A(o_m17[6]), .B(n898), .Y(n477) );
  NOR2X1 U552 ( .A(n930), .B(curr[4]), .Y(n360) );
  OAI21X1 U553 ( .A(n526), .B(n369), .C(n478), .Y(n697) );
  NAND2X1 U554 ( .A(o_m16[7]), .B(n897), .Y(n478) );
  OAI21X1 U555 ( .A(n508), .B(n369), .C(n480), .Y(n698) );
  NAND2X1 U556 ( .A(o_m16[5]), .B(n897), .Y(n480) );
  OAI21X1 U557 ( .A(n523), .B(n369), .C(n481), .Y(n699) );
  NAND2X1 U558 ( .A(o_m16[4]), .B(n897), .Y(n481) );
  OAI21X1 U559 ( .A(n517), .B(n369), .C(n482), .Y(n700) );
  NAND2X1 U560 ( .A(o_m16[3]), .B(n897), .Y(n482) );
  OAI21X1 U561 ( .A(n514), .B(n369), .C(n483), .Y(n701) );
  NAND2X1 U562 ( .A(o_m16[2]), .B(n897), .Y(n483) );
  OAI21X1 U563 ( .A(n513), .B(n369), .C(n484), .Y(n702) );
  NAND2X1 U564 ( .A(o_m16[1]), .B(n897), .Y(n484) );
  OAI21X1 U567 ( .A(n524), .B(n369), .C(n486), .Y(n704) );
  NAND2X1 U568 ( .A(o_m16[6]), .B(n897), .Y(n486) );
  OAI21X1 U570 ( .A(n526), .B(n466), .C(n488), .Y(n705) );
  NAND2X1 U571 ( .A(o_m15[7]), .B(n896), .Y(n488) );
  OAI21X1 U572 ( .A(n508), .B(n466), .C(n490), .Y(n706) );
  NAND2X1 U573 ( .A(o_m15[5]), .B(n896), .Y(n490) );
  OAI21X1 U574 ( .A(n523), .B(n466), .C(n491), .Y(n707) );
  NAND2X1 U575 ( .A(o_m15[4]), .B(n896), .Y(n491) );
  OAI21X1 U576 ( .A(n517), .B(n466), .C(n492), .Y(n708) );
  NAND2X1 U577 ( .A(o_m15[3]), .B(n896), .Y(n492) );
  OAI21X1 U578 ( .A(n514), .B(n466), .C(n493), .Y(n709) );
  NAND2X1 U579 ( .A(o_m15[2]), .B(n896), .Y(n493) );
  OAI21X1 U584 ( .A(n524), .B(n466), .C(n496), .Y(n712) );
  NAND2X1 U585 ( .A(o_m15[6]), .B(n896), .Y(n496) );
  NAND2X1 U587 ( .A(curr[2]), .B(curr[3]), .Y(n358) );
  OAI21X1 U588 ( .A(n526), .B(n470), .C(n498), .Y(n713) );
  NAND2X1 U589 ( .A(o_m14[7]), .B(n895), .Y(n498) );
  OAI21X1 U590 ( .A(n508), .B(n470), .C(n500), .Y(n714) );
  NAND2X1 U591 ( .A(o_m14[5]), .B(n895), .Y(n500) );
  OAI21X1 U592 ( .A(n523), .B(n470), .C(n501), .Y(n715) );
  NAND2X1 U593 ( .A(o_m14[4]), .B(n895), .Y(n501) );
  OAI21X1 U594 ( .A(n517), .B(n470), .C(n502), .Y(n716) );
  NAND2X1 U595 ( .A(o_m14[3]), .B(n895), .Y(n502) );
  OAI21X1 U596 ( .A(n514), .B(n470), .C(n503), .Y(n717) );
  NAND2X1 U597 ( .A(o_m14[2]), .B(n895), .Y(n503) );
  OAI21X1 U602 ( .A(n524), .B(n470), .C(n506), .Y(n720) );
  NAND2X1 U603 ( .A(o_m14[6]), .B(n895), .Y(n506) );
  OAI21X1 U605 ( .A(n526), .B(n329), .C(n507), .Y(n721) );
  NAND2X1 U606 ( .A(o_m13[7]), .B(n894), .Y(n507) );
  OAI21X1 U607 ( .A(n508), .B(n329), .C(n509), .Y(n722) );
  NAND2X1 U608 ( .A(o_m13[5]), .B(n894), .Y(n509) );
  OAI21X1 U609 ( .A(n523), .B(n329), .C(n510), .Y(n723) );
  NAND2X1 U610 ( .A(o_m13[4]), .B(n894), .Y(n510) );
  OAI21X1 U611 ( .A(n517), .B(n329), .C(n511), .Y(n724) );
  NAND2X1 U612 ( .A(o_m13[3]), .B(n894), .Y(n511) );
  OAI21X1 U613 ( .A(n514), .B(n329), .C(n512), .Y(n725) );
  NAND2X1 U614 ( .A(o_m13[2]), .B(n894), .Y(n512) );
  OAI21X1 U619 ( .A(n524), .B(n329), .C(n515), .Y(n728) );
  NAND2X1 U620 ( .A(o_m13[6]), .B(n894), .Y(n515) );
  OAI21X1 U622 ( .A(n526), .B(n476), .C(n516), .Y(n729) );
  NAND2X1 U623 ( .A(o_m12[7]), .B(n893), .Y(n516) );
  OAI21X1 U624 ( .A(n524), .B(n476), .C(n518), .Y(n730) );
  NAND2X1 U625 ( .A(o_m12[6]), .B(n893), .Y(n518) );
  OAI21X1 U626 ( .A(n508), .B(n476), .C(n519), .Y(n731) );
  NAND2X1 U627 ( .A(o_m12[5]), .B(n893), .Y(n519) );
  OAI21X1 U628 ( .A(n523), .B(n476), .C(n520), .Y(n732) );
  NAND2X1 U629 ( .A(o_m12[4]), .B(n893), .Y(n520) );
  OAI21X1 U630 ( .A(n517), .B(n476), .C(n521), .Y(n733) );
  NAND2X1 U631 ( .A(o_m12[3]), .B(n893), .Y(n521) );
  OAI21X1 U632 ( .A(n514), .B(n476), .C(n522), .Y(n734) );
  NAND2X1 U633 ( .A(o_m12[2]), .B(n893), .Y(n522) );
  OAI21X1 U639 ( .A(n526), .B(n341), .C(n525), .Y(n737) );
  NAND2X1 U640 ( .A(o_m11[7]), .B(n892), .Y(n525) );
  OAI21X1 U641 ( .A(n524), .B(n341), .C(n527), .Y(n738) );
  NAND2X1 U642 ( .A(o_m11[6]), .B(n892), .Y(n527) );
  OAI21X1 U643 ( .A(n508), .B(n341), .C(n528), .Y(n739) );
  NAND2X1 U644 ( .A(o_m11[5]), .B(n892), .Y(n528) );
  OAI21X1 U645 ( .A(n523), .B(n341), .C(n529), .Y(n740) );
  NAND2X1 U646 ( .A(o_m11[4]), .B(n892), .Y(n529) );
  OAI21X1 U647 ( .A(n517), .B(n341), .C(n530), .Y(n741) );
  NAND2X1 U648 ( .A(o_m11[3]), .B(n892), .Y(n530) );
  OAI21X1 U649 ( .A(n514), .B(n341), .C(n531), .Y(n742) );
  NAND2X1 U650 ( .A(o_m11[2]), .B(n892), .Y(n531) );
  NAND2X1 U657 ( .A(curr[2]), .B(n929), .Y(n293) );
  OAI21X1 U658 ( .A(n526), .B(n367), .C(n534), .Y(n745) );
  NAND2X1 U659 ( .A(o_m10[7]), .B(n891), .Y(n534) );
  OAI21X1 U660 ( .A(n508), .B(n367), .C(n536), .Y(n746) );
  NAND2X1 U661 ( .A(o_m10[5]), .B(n891), .Y(n536) );
  OAI21X1 U662 ( .A(n523), .B(n367), .C(n537), .Y(n747) );
  NAND2X1 U663 ( .A(o_m10[4]), .B(n891), .Y(n537) );
  OAI21X1 U664 ( .A(n517), .B(n367), .C(n538), .Y(n748) );
  NAND2X1 U665 ( .A(o_m10[3]), .B(n891), .Y(n538) );
  OAI21X1 U666 ( .A(n514), .B(n367), .C(n539), .Y(n749) );
  NAND2X1 U667 ( .A(o_m10[2]), .B(n891), .Y(n539) );
  OAI21X1 U668 ( .A(n513), .B(n367), .C(n540), .Y(n750) );
  NAND2X1 U669 ( .A(o_m10[1]), .B(n891), .Y(n540) );
  OAI21X1 U672 ( .A(n524), .B(n367), .C(n542), .Y(n752) );
  NAND2X1 U673 ( .A(o_m10[6]), .B(n891), .Y(n542) );
  OAI21X1 U676 ( .A(n526), .B(n331), .C(n543), .Y(n753) );
  NAND2X1 U677 ( .A(o_m9[7]), .B(n890), .Y(n543) );
  OAI21X1 U678 ( .A(n508), .B(n331), .C(n545), .Y(n754) );
  NAND2X1 U679 ( .A(o_m9[5]), .B(n890), .Y(n545) );
  OAI21X1 U680 ( .A(n523), .B(n331), .C(n546), .Y(n755) );
  NAND2X1 U681 ( .A(o_m9[4]), .B(n890), .Y(n546) );
  OAI21X1 U682 ( .A(n517), .B(n331), .C(n547), .Y(n756) );
  NAND2X1 U683 ( .A(o_m9[3]), .B(n890), .Y(n547) );
  OAI21X1 U684 ( .A(n514), .B(n331), .C(n548), .Y(n757) );
  NAND2X1 U685 ( .A(o_m9[2]), .B(n890), .Y(n548) );
  OAI21X1 U686 ( .A(n513), .B(n331), .C(n549), .Y(n758) );
  NAND2X1 U687 ( .A(o_m9[1]), .B(n890), .Y(n549) );
  OAI21X1 U690 ( .A(n524), .B(n331), .C(n551), .Y(n760) );
  NAND2X1 U691 ( .A(o_m9[6]), .B(n890), .Y(n551) );
  OAI21X1 U693 ( .A(n526), .B(n259), .C(n552), .Y(n761) );
  NAND2X1 U694 ( .A(o_m8[7]), .B(n889), .Y(n552) );
  OAI21X1 U695 ( .A(n508), .B(n259), .C(n554), .Y(n762) );
  NAND2X1 U696 ( .A(o_m8[5]), .B(n889), .Y(n554) );
  OAI21X1 U697 ( .A(n523), .B(n259), .C(n555), .Y(n763) );
  NAND2X1 U698 ( .A(o_m8[4]), .B(n889), .Y(n555) );
  OAI21X1 U699 ( .A(n517), .B(n259), .C(n556), .Y(n764) );
  NAND2X1 U700 ( .A(o_m8[3]), .B(n889), .Y(n556) );
  OAI21X1 U701 ( .A(n514), .B(n259), .C(n557), .Y(n765) );
  NAND2X1 U702 ( .A(o_m8[2]), .B(n889), .Y(n557) );
  OAI21X1 U707 ( .A(n524), .B(n259), .C(n560), .Y(n768) );
  NAND2X1 U708 ( .A(o_m8[6]), .B(n889), .Y(n560) );
  OAI21X1 U710 ( .A(n526), .B(n274), .C(n561), .Y(n769) );
  NAND2X1 U711 ( .A(o_m7[7]), .B(n888), .Y(n561) );
  OAI21X1 U712 ( .A(n508), .B(n274), .C(n563), .Y(n770) );
  NAND2X1 U713 ( .A(o_m7[5]), .B(n888), .Y(n563) );
  OAI21X1 U714 ( .A(n523), .B(n274), .C(n564), .Y(n771) );
  NAND2X1 U715 ( .A(o_m7[4]), .B(n888), .Y(n564) );
  OAI21X1 U716 ( .A(n517), .B(n274), .C(n565), .Y(n772) );
  NAND2X1 U717 ( .A(o_m7[3]), .B(n888), .Y(n565) );
  OAI21X1 U718 ( .A(n514), .B(n274), .C(n566), .Y(n773) );
  NAND2X1 U719 ( .A(o_m7[2]), .B(n888), .Y(n566) );
  OAI21X1 U724 ( .A(n524), .B(n274), .C(n569), .Y(n776) );
  NAND2X1 U725 ( .A(o_m7[6]), .B(n888), .Y(n569) );
  OAI21X1 U727 ( .A(n526), .B(n273), .C(n571), .Y(n777) );
  NAND2X1 U728 ( .A(o_m6[7]), .B(n887), .Y(n571) );
  OAI21X1 U729 ( .A(n508), .B(n273), .C(n573), .Y(n778) );
  NAND2X1 U730 ( .A(o_m6[5]), .B(n887), .Y(n573) );
  OAI21X1 U731 ( .A(n523), .B(n273), .C(n574), .Y(n779) );
  NAND2X1 U732 ( .A(o_m6[4]), .B(n887), .Y(n574) );
  OAI21X1 U733 ( .A(n517), .B(n273), .C(n575), .Y(n780) );
  NAND2X1 U734 ( .A(o_m6[3]), .B(n887), .Y(n575) );
  OAI21X1 U735 ( .A(n514), .B(n273), .C(n576), .Y(n781) );
  NAND2X1 U736 ( .A(o_m6[2]), .B(n887), .Y(n576) );
  OAI21X1 U737 ( .A(n513), .B(n273), .C(n577), .Y(n782) );
  NAND2X1 U738 ( .A(o_m6[1]), .B(n887), .Y(n577) );
  OAI21X1 U741 ( .A(n524), .B(n273), .C(n579), .Y(n784) );
  NAND2X1 U742 ( .A(o_m6[6]), .B(n887), .Y(n579) );
  OAI21X1 U745 ( .A(n526), .B(n495), .C(n580), .Y(n785) );
  NAND2X1 U746 ( .A(o_m5[7]), .B(n886), .Y(n580) );
  OAI21X1 U747 ( .A(n508), .B(n495), .C(n582), .Y(n786) );
  NAND2X1 U748 ( .A(o_m5[5]), .B(n886), .Y(n582) );
  OAI21X1 U749 ( .A(n523), .B(n495), .C(n583), .Y(n787) );
  NAND2X1 U750 ( .A(o_m5[4]), .B(n886), .Y(n583) );
  OAI21X1 U751 ( .A(n517), .B(n495), .C(n584), .Y(n788) );
  NAND2X1 U752 ( .A(o_m5[3]), .B(n886), .Y(n584) );
  OAI21X1 U753 ( .A(n514), .B(n495), .C(n585), .Y(n789) );
  NAND2X1 U754 ( .A(o_m5[2]), .B(n886), .Y(n585) );
  OAI21X1 U755 ( .A(n513), .B(n495), .C(n586), .Y(n790) );
  NAND2X1 U756 ( .A(o_m5[1]), .B(n886), .Y(n586) );
  OAI21X1 U759 ( .A(n524), .B(n495), .C(n588), .Y(n792) );
  NAND2X1 U760 ( .A(o_m5[6]), .B(n886), .Y(n588) );
  NAND2X1 U762 ( .A(curr[3]), .B(n928), .Y(n357) );
  OAI21X1 U763 ( .A(n526), .B(n342), .C(n590), .Y(n793) );
  NAND2X1 U764 ( .A(o_m4[7]), .B(n885), .Y(n590) );
  OAI21X1 U765 ( .A(n508), .B(n342), .C(n592), .Y(n794) );
  NAND2X1 U766 ( .A(o_m4[5]), .B(n885), .Y(n592) );
  OAI21X1 U767 ( .A(n523), .B(n342), .C(n593), .Y(n795) );
  NAND2X1 U768 ( .A(o_m4[4]), .B(n885), .Y(n593) );
  OAI21X1 U769 ( .A(n517), .B(n342), .C(n594), .Y(n796) );
  NAND2X1 U770 ( .A(o_m4[3]), .B(n885), .Y(n594) );
  OAI21X1 U771 ( .A(n514), .B(n342), .C(n595), .Y(n797) );
  NAND2X1 U772 ( .A(o_m4[2]), .B(n885), .Y(n595) );
  OAI21X1 U773 ( .A(n513), .B(n342), .C(n596), .Y(n798) );
  NAND2X1 U774 ( .A(o_m4[1]), .B(n885), .Y(n596) );
  OAI21X1 U777 ( .A(n524), .B(n342), .C(n598), .Y(n800) );
  NAND2X1 U778 ( .A(o_m4[6]), .B(n885), .Y(n598) );
  OAI21X1 U780 ( .A(n526), .B(n322), .C(n599), .Y(n801) );
  NAND2X1 U781 ( .A(o_m3[7]), .B(n884), .Y(n599) );
  OAI21X1 U782 ( .A(n508), .B(n322), .C(n601), .Y(n802) );
  NAND2X1 U783 ( .A(o_m3[5]), .B(n884), .Y(n601) );
  OAI21X1 U784 ( .A(n523), .B(n322), .C(n602), .Y(n803) );
  NAND2X1 U785 ( .A(o_m3[4]), .B(n884), .Y(n602) );
  OAI21X1 U786 ( .A(n517), .B(n322), .C(n603), .Y(n804) );
  NAND2X1 U787 ( .A(o_m3[3]), .B(n884), .Y(n603) );
  OAI21X1 U788 ( .A(n514), .B(n322), .C(n604), .Y(n805) );
  NAND2X1 U789 ( .A(o_m3[2]), .B(n884), .Y(n604) );
  OAI21X1 U794 ( .A(n524), .B(n322), .C(n607), .Y(n808) );
  NAND2X1 U795 ( .A(o_m3[6]), .B(n884), .Y(n607) );
  NOR2X1 U797 ( .A(n920), .B(curr[1]), .Y(n391) );
  OAI21X1 U798 ( .A(n526), .B(n295), .C(n608), .Y(n809) );
  NAND2X1 U799 ( .A(o_m2[7]), .B(n883), .Y(n608) );
  OAI21X1 U801 ( .A(n508), .B(n295), .C(n610), .Y(n810) );
  NAND2X1 U802 ( .A(o_m2[5]), .B(n883), .Y(n610) );
  OAI21X1 U804 ( .A(n523), .B(n295), .C(n611), .Y(n811) );
  NAND2X1 U805 ( .A(o_m2[4]), .B(n883), .Y(n611) );
  OAI21X1 U807 ( .A(n517), .B(n295), .C(n612), .Y(n812) );
  NAND2X1 U808 ( .A(o_m2[3]), .B(n883), .Y(n612) );
  OAI21X1 U810 ( .A(n514), .B(n295), .C(n613), .Y(n813) );
  NAND2X1 U811 ( .A(o_m2[2]), .B(n883), .Y(n613) );
  OAI21X1 U813 ( .A(n513), .B(n295), .C(n614), .Y(n814) );
  NAND2X1 U814 ( .A(o_m2[1]), .B(n883), .Y(n614) );
  OAI21X1 U819 ( .A(n524), .B(n295), .C(n616), .Y(n816) );
  NAND2X1 U820 ( .A(o_m2[6]), .B(n883), .Y(n616) );
  NOR2X1 U822 ( .A(n927), .B(n920), .Y(n468) );
  NOR2X1 U823 ( .A(curr[3]), .B(curr[2]), .Y(n402) );
  NOR2X1 U824 ( .A(curr[5]), .B(curr[4]), .Y(n589) );
  AND2X2 U219 ( .A(n422), .B(n909), .Y(n209) );
  AND2X2 U220 ( .A(n487), .B(n909), .Y(n210) );
  AND2X2 U221 ( .A(n497), .B(n908), .Y(n211) );
  INVX1 U222 ( .A(o_m15[0]), .Y(n832) );
  INVX1 U223 ( .A(o_m3[0]), .Y(n852) );
  INVX1 U224 ( .A(o_m18[1]), .Y(n828) );
  INVX1 U225 ( .A(o_m12[1]), .Y(n839) );
  INVX4 U226 ( .A(n960), .Y(n212) );
  INVX8 U227 ( .A(n212), .Y(o_m14[0]) );
  INVX1 U229 ( .A(o_m14[0]), .Y(n834) );
  INVX4 U231 ( .A(n945), .Y(n214) );
  INVX8 U232 ( .A(n214), .Y(o_m8[0]) );
  INVX1 U233 ( .A(o_m8[0]), .Y(n845) );
  BUFX2 U234 ( .A(n946), .Y(o_m9[7]) );
  BUFX2 U235 ( .A(n948), .Y(o_m9[5]) );
  BUFX2 U237 ( .A(n947), .Y(o_m9[6]) );
  BUFX2 U240 ( .A(n949), .Y(o_m9[4]) );
  BUFX2 U241 ( .A(n950), .Y(o_m9[3]) );
  BUFX4 U243 ( .A(n951), .Y(o_m9[2]) );
  BUFX4 U245 ( .A(n952), .Y(o_m9[1]) );
  BUFX2 U246 ( .A(n961), .Y(o_m15[7]) );
  BUFX2 U249 ( .A(n963), .Y(o_m15[5]) );
  BUFX2 U251 ( .A(n962), .Y(o_m15[6]) );
  BUFX2 U252 ( .A(n931), .Y(o_m3[7]) );
  BUFX2 U253 ( .A(n933), .Y(o_m3[5]) );
  BUFX2 U254 ( .A(n932), .Y(o_m3[6]) );
  BUFX2 U255 ( .A(n964), .Y(o_m15[4]) );
  BUFX2 U256 ( .A(n934), .Y(o_m3[4]) );
  BUFX4 U257 ( .A(n965), .Y(o_m15[3]) );
  BUFX4 U258 ( .A(n935), .Y(o_m3[3]) );
  INVX4 U259 ( .A(n966), .Y(n233) );
  INVX8 U260 ( .A(n233), .Y(o_m15[2]) );
  INVX4 U261 ( .A(n936), .Y(n235) );
  INVX8 U262 ( .A(n235), .Y(o_m3[2]) );
  INVX4 U263 ( .A(n967), .Y(n237) );
  INVX8 U264 ( .A(n237), .Y(o_m15[1]) );
  INVX1 U265 ( .A(o_m15[1]), .Y(n833) );
  INVX4 U266 ( .A(n937), .Y(n307) );
  INVX8 U267 ( .A(n307), .Y(o_m3[1]) );
  INVX1 U268 ( .A(o_m3[1]), .Y(n853) );
  BUFX2 U269 ( .A(n953), .Y(o_m14[7]) );
  BUFX2 U270 ( .A(n954), .Y(o_m14[6]) );
  BUFX2 U271 ( .A(n938), .Y(o_m8[7]) );
  BUFX2 U272 ( .A(n939), .Y(o_m8[6]) );
  BUFX2 U273 ( .A(n955), .Y(o_m14[5]) );
  BUFX2 U274 ( .A(n940), .Y(o_m8[5]) );
  BUFX2 U275 ( .A(n941), .Y(o_m8[4]) );
  BUFX2 U276 ( .A(n956), .Y(o_m14[4]) );
  INVX4 U277 ( .A(n958), .Y(n388) );
  INVX8 U278 ( .A(n388), .Y(o_m14[2]) );
  INVX4 U279 ( .A(n943), .Y(n393) );
  INVX8 U393 ( .A(n393), .Y(o_m8[2]) );
  INVX2 U394 ( .A(n957), .Y(n404) );
  INVX4 U397 ( .A(n404), .Y(o_m14[3]) );
  INVX2 U410 ( .A(n942), .Y(n414) );
  INVX4 U411 ( .A(n414), .Y(o_m8[3]) );
  INVX4 U414 ( .A(n959), .Y(n420) );
  INVX8 U428 ( .A(n420), .Y(o_m14[1]) );
  INVX1 U429 ( .A(o_m14[1]), .Y(n835) );
  INVX4 U432 ( .A(n944), .Y(n430) );
  INVX8 U443 ( .A(n430), .Y(o_m8[1]) );
  INVX1 U444 ( .A(o_m8[1]), .Y(n846) );
  INVX1 U445 ( .A(o_m1[0]), .Y(n855) );
  INVX2 U446 ( .A(n273), .Y(n489) );
  INVX2 U449 ( .A(n341), .Y(n479) );
  INVX2 U462 ( .A(n209), .Y(n465) );
  INVX2 U463 ( .A(n210), .Y(n470) );
  INVX2 U466 ( .A(n211), .Y(n466) );
  INVX2 U479 ( .A(n475), .Y(n476) );
  INVX2 U480 ( .A(n272), .Y(n475) );
  INVX2 U483 ( .A(n494), .Y(n495) );
  INVX2 U496 ( .A(n311), .Y(n494) );
  INVX2 U497 ( .A(n367), .Y(n485) );
  BUFX2 U500 ( .A(n856), .Y(n499) );
  BUFX2 U511 ( .A(n856), .Y(n504) );
  INVX2 U512 ( .A(n442), .Y(n513) );
  INVX2 U513 ( .A(n439), .Y(n524) );
  INVX2 U514 ( .A(n448), .Y(n514) );
  INVX2 U517 ( .A(n451), .Y(n517) );
  INVX2 U528 ( .A(n456), .Y(n523) );
  INVX2 U529 ( .A(n457), .Y(n508) );
  INVX2 U530 ( .A(n460), .Y(n526) );
  INVX2 U531 ( .A(i_clear), .Y(n505) );
  BUFX2 U534 ( .A(n541), .Y(n587) );
  BUFX2 U545 ( .A(n541), .Y(n591) );
  BUFX2 U546 ( .A(n541), .Y(n597) );
  BUFX2 U547 ( .A(n544), .Y(n600) );
  BUFX2 U548 ( .A(n544), .Y(n605) );
  BUFX2 U551 ( .A(n544), .Y(n606) );
  BUFX2 U565 ( .A(n550), .Y(n609) );
  BUFX2 U566 ( .A(n550), .Y(n615) );
  BUFX2 U569 ( .A(n532), .Y(n553) );
  BUFX2 U580 ( .A(n532), .Y(n558) );
  BUFX2 U581 ( .A(n532), .Y(n559) );
  BUFX2 U582 ( .A(n533), .Y(n562) );
  BUFX2 U583 ( .A(n533), .Y(n567) );
  BUFX2 U586 ( .A(n533), .Y(n568) );
  BUFX2 U598 ( .A(n535), .Y(n572) );
  BUFX2 U599 ( .A(n535), .Y(n578) );
  BUFX2 U600 ( .A(n535), .Y(n581) );
  BUFX2 U601 ( .A(n550), .Y(n817) );
  AND2X2 U604 ( .A(i_data_in[6]), .B(n505), .Y(n439) );
  AND2X2 U615 ( .A(i_data_in[1]), .B(n505), .Y(n442) );
  AND2X2 U616 ( .A(i_data_in[2]), .B(n505), .Y(n448) );
  AND2X2 U617 ( .A(i_data_in[3]), .B(n505), .Y(n451) );
  AND2X2 U618 ( .A(i_data_in[4]), .B(n505), .Y(n456) );
  AND2X2 U621 ( .A(i_data_in[5]), .B(n505), .Y(n457) );
  AND2X2 U634 ( .A(i_data_in[7]), .B(n505), .Y(n460) );
  BUFX2 U635 ( .A(n_rst), .Y(n541) );
  BUFX2 U636 ( .A(n_rst), .Y(n544) );
  BUFX2 U637 ( .A(n_rst), .Y(n532) );
  BUFX2 U638 ( .A(n_rst), .Y(n550) );
  BUFX2 U651 ( .A(n_rst), .Y(n533) );
  BUFX2 U652 ( .A(n_rst), .Y(n535) );
  INVX2 U653 ( .A(n401), .Y(n907) );
  NAND2X1 U654 ( .A(n391), .B(n907), .Y(n252) );
  NAND2X1 U655 ( .A(i_data_in[0]), .B(n505), .Y(n856) );
  NAND2X1 U656 ( .A(n252), .B(n505), .Y(n880) );
  INVX2 U670 ( .A(o_m25[0]), .Y(n818) );
  OAI22X1 U671 ( .A(n252), .B(n499), .C(n880), .D(n818), .Y(n631) );
  INVX2 U674 ( .A(n358), .Y(n908) );
  NAND2X1 U675 ( .A(n412), .B(n908), .Y(n249) );
  NAND2X1 U688 ( .A(n249), .B(n505), .Y(n879) );
  INVX2 U689 ( .A(o_m24[0]), .Y(n819) );
  OAI22X1 U692 ( .A(n249), .B(n499), .C(n879), .D(n819), .Y(n639) );
  NAND2X1 U703 ( .A(n422), .B(n908), .Y(n278) );
  NAND2X1 U704 ( .A(n278), .B(n505), .Y(n878) );
  INVX2 U705 ( .A(o_m23[0]), .Y(n820) );
  OAI22X1 U706 ( .A(n278), .B(n499), .C(n878), .D(n820), .Y(n647) );
  INVX2 U709 ( .A(o_m23[1]), .Y(n821) );
  OAI22X1 U720 ( .A(n878), .B(n821), .C(n513), .D(n278), .Y(n646) );
  INVX2 U721 ( .A(n357), .Y(n909) );
  NAND2X1 U722 ( .A(n412), .B(n909), .Y(n279) );
  NAND2X1 U723 ( .A(n279), .B(n505), .Y(n877) );
  INVX2 U726 ( .A(o_m22[0]), .Y(n822) );
  OAI22X1 U739 ( .A(n279), .B(n499), .C(n877), .D(n822), .Y(n655) );
  NAND2X1 U740 ( .A(n465), .B(n505), .Y(n876) );
  INVX2 U743 ( .A(o_m21[0]), .Y(n823) );
  OAI22X1 U744 ( .A(n465), .B(n499), .C(n876), .D(n823), .Y(n663) );
  INVX2 U757 ( .A(n293), .Y(n840) );
  NAND2X1 U758 ( .A(n412), .B(n840), .Y(n368) );
  NAND2X1 U761 ( .A(n368), .B(n505), .Y(n875) );
  INVX2 U775 ( .A(o_m20[0]), .Y(n824) );
  OAI22X1 U776 ( .A(n368), .B(n499), .C(n875), .D(n824), .Y(n671) );
  NAND2X1 U779 ( .A(n422), .B(n840), .Y(n323) );
  NAND2X1 U790 ( .A(n323), .B(n505), .Y(n874) );
  INVX2 U791 ( .A(o_m19[0]), .Y(n825) );
  OAI22X1 U792 ( .A(n323), .B(n499), .C(n874), .D(n825), .Y(n679) );
  INVX2 U793 ( .A(o_m19[1]), .Y(n826) );
  OAI22X1 U796 ( .A(n874), .B(n826), .C(n323), .D(n513), .Y(n678) );
  NAND2X1 U800 ( .A(n412), .B(n402), .Y(n290) );
  NAND2X1 U803 ( .A(n290), .B(n505), .Y(n873) );
  INVX2 U806 ( .A(o_m18[0]), .Y(n827) );
  OAI22X1 U809 ( .A(n290), .B(n499), .C(n873), .D(n827), .Y(n687) );
  OAI22X1 U812 ( .A(n873), .B(n828), .C(n290), .D(n513), .Y(n686) );
  NAND2X1 U815 ( .A(n422), .B(n402), .Y(n309) );
  NAND2X1 U816 ( .A(n309), .B(n505), .Y(n872) );
  INVX2 U817 ( .A(o_m17[0]), .Y(n829) );
  OAI22X1 U818 ( .A(n309), .B(n499), .C(n872), .D(n829), .Y(n695) );
  INVX2 U821 ( .A(o_m17[1]), .Y(n830) );
  OAI22X1 U825 ( .A(n872), .B(n830), .C(n309), .D(n513), .Y(n694) );
  NAND2X1 U826 ( .A(n487), .B(n908), .Y(n369) );
  NAND2X1 U827 ( .A(n369), .B(n505), .Y(n871) );
  INVX2 U828 ( .A(o_m16[0]), .Y(n831) );
  OAI22X1 U829 ( .A(n369), .B(n499), .C(n871), .D(n831), .Y(n703) );
  NAND2X1 U830 ( .A(n466), .B(n505), .Y(n870) );
  OAI22X1 U831 ( .A(n466), .B(n499), .C(n870), .D(n832), .Y(n711) );
  OAI22X1 U832 ( .A(n870), .B(n833), .C(n466), .D(n513), .Y(n710) );
  NAND2X1 U833 ( .A(n470), .B(n505), .Y(n869) );
  OAI22X1 U834 ( .A(n470), .B(n499), .C(n869), .D(n834), .Y(n719) );
  OAI22X1 U835 ( .A(n869), .B(n835), .C(n470), .D(n513), .Y(n718) );
  NAND2X1 U836 ( .A(n497), .B(n909), .Y(n329) );
  NAND2X1 U837 ( .A(n329), .B(n505), .Y(n868) );
  INVX2 U838 ( .A(o_m13[0]), .Y(n836) );
  OAI22X1 U839 ( .A(n329), .B(n504), .C(n868), .D(n836), .Y(n727) );
  INVX2 U840 ( .A(o_m13[1]), .Y(n837) );
  OAI22X1 U841 ( .A(n868), .B(n837), .C(n329), .D(n513), .Y(n726) );
  NAND2X1 U842 ( .A(n487), .B(n840), .Y(n272) );
  NAND2X1 U843 ( .A(n476), .B(n505), .Y(n867) );
  INVX2 U844 ( .A(o_m12[0]), .Y(n838) );
  OAI22X1 U845 ( .A(n476), .B(n504), .C(n867), .D(n838), .Y(n735) );
  OAI22X1 U846 ( .A(n867), .B(n839), .C(n476), .D(n513), .Y(n736) );
  NAND2X1 U847 ( .A(n497), .B(n840), .Y(n341) );
  NAND2X1 U848 ( .A(n341), .B(n505), .Y(n866) );
  INVX2 U849 ( .A(o_m11[0]), .Y(n841) );
  OAI22X1 U850 ( .A(n341), .B(n504), .C(n866), .D(n841), .Y(n743) );
  INVX2 U851 ( .A(o_m11[1]), .Y(n842) );
  OAI22X1 U852 ( .A(n866), .B(n842), .C(n341), .D(n513), .Y(n744) );
  NAND2X1 U853 ( .A(n487), .B(n402), .Y(n367) );
  NAND2X1 U854 ( .A(n367), .B(n505), .Y(n865) );
  INVX2 U855 ( .A(o_m10[0]), .Y(n843) );
  OAI22X1 U856 ( .A(n367), .B(n504), .C(n865), .D(n843), .Y(n751) );
  NAND2X1 U857 ( .A(n497), .B(n402), .Y(n331) );
  NAND2X1 U858 ( .A(n331), .B(n505), .Y(n864) );
  INVX2 U859 ( .A(o_m9[0]), .Y(n844) );
  OAI22X1 U860 ( .A(n331), .B(n504), .C(n864), .D(n844), .Y(n759) );
  NAND2X1 U861 ( .A(n353), .B(n468), .Y(n259) );
  NAND2X1 U862 ( .A(n259), .B(n505), .Y(n863) );
  OAI22X1 U863 ( .A(n259), .B(n504), .C(n863), .D(n845), .Y(n767) );
  OAI22X1 U864 ( .A(n863), .B(n846), .C(n259), .D(n513), .Y(n766) );
  NAND2X1 U865 ( .A(n353), .B(n391), .Y(n274) );
  NAND2X1 U866 ( .A(n274), .B(n505), .Y(n862) );
  INVX2 U867 ( .A(o_m7[0]), .Y(n847) );
  OAI22X1 U868 ( .A(n274), .B(n504), .C(n862), .D(n847), .Y(n775) );
  INVX2 U869 ( .A(o_m7[1]), .Y(n848) );
  OAI22X1 U870 ( .A(n862), .B(n848), .C(n274), .D(n513), .Y(n774) );
  NAND2X1 U871 ( .A(n354), .B(n468), .Y(n273) );
  NAND2X1 U872 ( .A(n273), .B(n505), .Y(n861) );
  INVX2 U873 ( .A(o_m6[0]), .Y(n849) );
  OAI22X1 U874 ( .A(n273), .B(n504), .C(n861), .D(n849), .Y(n783) );
  NAND2X1 U875 ( .A(n391), .B(n354), .Y(n311) );
  NAND2X1 U876 ( .A(n495), .B(n505), .Y(n860) );
  INVX2 U877 ( .A(o_m5[0]), .Y(n850) );
  OAI22X1 U878 ( .A(n495), .B(n504), .C(n860), .D(n850), .Y(n791) );
  NAND2X1 U879 ( .A(n364), .B(n468), .Y(n342) );
  NAND2X1 U880 ( .A(n342), .B(n505), .Y(n859) );
  INVX2 U881 ( .A(o_m4[0]), .Y(n851) );
  OAI22X1 U882 ( .A(n342), .B(n504), .C(n859), .D(n851), .Y(n799) );
  NAND2X1 U883 ( .A(n364), .B(n391), .Y(n322) );
  NAND2X1 U884 ( .A(n322), .B(n505), .Y(n858) );
  OAI22X1 U885 ( .A(n322), .B(n504), .C(n858), .D(n852), .Y(n807) );
  OAI22X1 U886 ( .A(n858), .B(n853), .C(n322), .D(n513), .Y(n806) );
  NAND2X1 U887 ( .A(n363), .B(n468), .Y(n295) );
  NAND2X1 U888 ( .A(n295), .B(n505), .Y(n857) );
  INVX2 U889 ( .A(o_m2[0]), .Y(n854) );
  OAI22X1 U890 ( .A(n295), .B(n504), .C(n857), .D(n854), .Y(n815) );
  NAND2X1 U891 ( .A(n363), .B(n391), .Y(n308) );
  NAND2X1 U892 ( .A(n308), .B(n505), .Y(n881) );
  OAI22X1 U893 ( .A(n308), .B(n499), .C(n881), .D(n855), .Y(n623) );
  INVX2 U894 ( .A(n857), .Y(n883) );
  INVX2 U895 ( .A(n858), .Y(n884) );
  INVX2 U896 ( .A(n859), .Y(n885) );
  INVX2 U897 ( .A(n860), .Y(n886) );
  INVX2 U898 ( .A(n861), .Y(n887) );
  INVX2 U899 ( .A(n862), .Y(n888) );
  INVX2 U900 ( .A(n863), .Y(n889) );
  INVX2 U901 ( .A(n864), .Y(n890) );
  INVX2 U902 ( .A(n865), .Y(n891) );
  INVX2 U903 ( .A(n866), .Y(n892) );
  INVX2 U904 ( .A(n867), .Y(n893) );
  INVX2 U905 ( .A(n868), .Y(n894) );
  INVX2 U906 ( .A(n869), .Y(n895) );
  INVX2 U907 ( .A(n870), .Y(n896) );
  INVX2 U908 ( .A(n871), .Y(n897) );
  INVX2 U909 ( .A(n872), .Y(n898) );
  INVX2 U910 ( .A(n873), .Y(n899) );
  INVX2 U911 ( .A(n874), .Y(n900) );
  INVX2 U912 ( .A(n875), .Y(n901) );
  INVX2 U913 ( .A(n876), .Y(n902) );
  INVX2 U914 ( .A(n877), .Y(n903) );
  INVX2 U915 ( .A(n878), .Y(n904) );
  INVX2 U916 ( .A(n879), .Y(n905) );
  INVX2 U917 ( .A(n880), .Y(n906) );
  INVX2 U918 ( .A(n881), .Y(n882) );
  INVX2 U919 ( .A(n243), .Y(n910) );
  INVX2 U920 ( .A(n332), .Y(n911) );
  INVX2 U921 ( .A(n265), .Y(n912) );
  INVX2 U922 ( .A(n281), .Y(n913) );
  INVX2 U923 ( .A(n250), .Y(n914) );
  INVX2 U924 ( .A(n266), .Y(n915) );
  INVX2 U925 ( .A(n262), .Y(n916) );
  INVX2 U926 ( .A(n247), .Y(n917) );
  INVX2 U927 ( .A(n280), .Y(n918) );
  INVX2 U928 ( .A(n276), .Y(n919) );
  INVX2 U929 ( .A(curr[0]), .Y(n920) );
  INVX2 U930 ( .A(n334), .Y(n921) );
  INVX2 U931 ( .A(n261), .Y(n922) );
  INVX2 U932 ( .A(n248), .Y(n923) );
  INVX2 U933 ( .A(n289), .Y(n924) );
  INVX2 U934 ( .A(n318), .Y(n925) );
  INVX2 U935 ( .A(n324), .Y(n926) );
  INVX2 U936 ( .A(curr[1]), .Y(n927) );
  INVX2 U937 ( .A(curr[2]), .Y(n928) );
  INVX2 U938 ( .A(curr[3]), .Y(n929) );
  INVX2 U939 ( .A(curr[5]), .Y(n930) );
endmodule


module edge_detection_8_DW01_add_0 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [10:1] carry;

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_8_DW01_add_1 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1;
  wire   [10:1] carry;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  XOR2X1 U1 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  NAND2X1 U2 ( .A(B[1]), .B(A[1]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(carry[2]) );
endmodule


module edge_detection_8_DW01_add_2 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1;
  wire   [10:1] carry;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  XOR2X1 U1 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  NAND2X1 U2 ( .A(B[1]), .B(A[1]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(carry[2]) );
endmodule


module edge_detection_8_DW01_add_3 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;

  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_8_DW01_add_4 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;

  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_8_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X2 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_8_DW01_sub_3 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n3), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n4), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n5), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n6), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n7), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n9), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[6]), .Y(n3) );
  INVX2 U6 ( .A(B[5]), .Y(n4) );
  INVX2 U7 ( .A(B[4]), .Y(n5) );
  INVX2 U8 ( .A(B[3]), .Y(n6) );
  INVX2 U9 ( .A(B[2]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[1]), .Y(n9) );
endmodule


module edge_detection_8_DW01_sub_4 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n3), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n4), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n5), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n6), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n7), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n9), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  INVX1 U1 ( .A(B[7]), .Y(n2) );
  INVX1 U2 ( .A(B[6]), .Y(n3) );
  INVX1 U3 ( .A(B[5]), .Y(n4) );
  INVX1 U4 ( .A(B[3]), .Y(n6) );
  INVX1 U5 ( .A(B[4]), .Y(n5) );
  INVX1 U6 ( .A(B[2]), .Y(n7) );
  INVX1 U7 ( .A(B[1]), .Y(n9) );
  OR2X1 U8 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U9 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U10 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U11 ( .A(B[0]), .Y(n8) );
endmodule


module edge_detection_8_DW01_sub_5 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X2 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_8_DW01_sub_6 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n3), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n4), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n5), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n6), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n7), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n9), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[6]), .Y(n3) );
  INVX2 U6 ( .A(B[5]), .Y(n4) );
  INVX2 U7 ( .A(B[4]), .Y(n5) );
  INVX2 U8 ( .A(B[3]), .Y(n6) );
  INVX2 U9 ( .A(B[2]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[1]), .Y(n9) );
endmodule


module edge_detection_8_DW01_sub_7 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n3), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n9), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X2 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[6]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[5]), .Y(n9) );
endmodule


module edge_detection_8 ( clk, n_rst, i_gradient_start, P0, P1, P2, P3, P4, P5, 
        P6, P7, P8, o_gradient_data_ready, o_processed_sum );
  input [7:0] P0;
  input [7:0] P1;
  input [7:0] P2;
  input [7:0] P3;
  input [7:0] P4;
  input [7:0] P5;
  input [7:0] P6;
  input [7:0] P7;
  input [7:0] P8;
  output [7:0] o_processed_sum;
  input clk, n_rst, i_gradient_start;
  output o_gradient_data_ready;
  wire   N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152,
         N153, N154, N155, N156, N157, N158, N159, N160, N161, N162, N163,
         N164, N165, N166, N167, N168, N169, N170, N171, N172, N173, N174,
         N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N187, N188, N189, N190, N191, N192, N193, N194, N195, N197,
         N198, N199, N200, N201, N202, N203, N204, N205, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N269, N280, N281, N282, N283, N284,
         N285, N286, N287, N288, N289, N290, n303, n315, n341, n364, n386,
         n442, n445, n446, n447, n448, n449, n450, n453, n454, n455, n456,
         n457, n458, n459, n460, n462, n463, n464, n465, n467, n468, n470,
         n471, n472, n473, n474, n475, n476, n481, n484, n485, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n519, n521, n522, n1, n2, n8, n9, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n65,
         n141, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n443, n444, n451, n452, n461,
         n466, n469, n477, n478, n479, n480, n482, n483, n486, n487, n488,
         n517, n518, n520, n523, n524, n525, n526, n527, n528, n529, n530,
         n531, n532, n533, n534, n535, n536, n537, n538, n539, n540, n541,
         n542, n543, n544, n545, n546, n547, n548, n549, n550, n551, n552,
         n553, n554, n555, n556, n557, n558, n559, n560, n561, n562, n563,
         n564, n565, n566;
  wire   [5:0] state;
  wire   [8:0] A1;
  wire   [9:0] C1;
  wire   [8:0] D1;
  wire   [9:0] E1;
  wire   [8:0] A2;
  wire   [9:0] C2;
  wire   [8:0] D2;
  wire   [9:0] E2;
  wire   [10:0] Gx;
  wire   [10:0] Gy;
  wire   [7:0] temp_sum;

  DFFSR \Gy_reg[0]  ( .D(n522), .CLK(clk), .R(n177), .S(1'b1), .Q(N269) );
  DFFSR \Gy_reg[10]  ( .D(n521), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[10]) );
  DFFSR \state_reg[0]  ( .D(n19), .CLK(clk), .R(n177), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n519), .CLK(clk), .R(n177), .S(1'b1), .Q(state[1])
         );
  DFFSR \C1_reg[9]  ( .D(n526), .CLK(clk), .R(n177), .S(1'b1), .Q(C1[9]) );
  DFFSR \Gx_reg[10]  ( .D(n506), .CLK(clk), .R(n176), .S(1'b1), .Q(Gx[10]) );
  DFFSR \state_reg[3]  ( .D(n21), .CLK(clk), .R(n176), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(n20), .CLK(clk), .R(n176), .S(1'b1), .Q(state[2])
         );
  DFFSR \A1_reg[0]  ( .D(n418), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[0]) );
  DFFSR \A1_reg[1]  ( .D(n417), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[1]) );
  DFFSR \A1_reg[2]  ( .D(n416), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[2]) );
  DFFSR \A1_reg[3]  ( .D(n415), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[3]) );
  DFFSR \A1_reg[4]  ( .D(n414), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[4]) );
  DFFSR \A1_reg[5]  ( .D(n413), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[5]) );
  DFFSR \A1_reg[6]  ( .D(n412), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[6]) );
  DFFSR \A1_reg[7]  ( .D(n411), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[7]) );
  DFFSR \A1_reg[8]  ( .D(n410), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[8]) );
  DFFSR \B1_reg[0]  ( .D(n436), .CLK(clk), .R(n175), .S(1'b1), .Q(N197) );
  DFFSR \B1_reg[1]  ( .D(n435), .CLK(clk), .R(n175), .S(1'b1), .Q(N198) );
  DFFSR \B1_reg[2]  ( .D(n434), .CLK(clk), .R(n175), .S(1'b1), .Q(N199) );
  DFFSR \B1_reg[3]  ( .D(n433), .CLK(clk), .R(n175), .S(1'b1), .Q(N200) );
  DFFSR \B1_reg[4]  ( .D(n432), .CLK(clk), .R(n175), .S(1'b1), .Q(N201) );
  DFFSR \B1_reg[5]  ( .D(n431), .CLK(clk), .R(n175), .S(1'b1), .Q(N202) );
  DFFSR \B1_reg[6]  ( .D(n430), .CLK(clk), .R(n175), .S(1'b1), .Q(N203) );
  DFFSR \B1_reg[7]  ( .D(n429), .CLK(clk), .R(n175), .S(1'b1), .Q(N204) );
  DFFSR \B1_reg[8]  ( .D(n428), .CLK(clk), .R(n175), .S(1'b1), .Q(N205) );
  DFFSR \C1_reg[1]  ( .D(n534), .CLK(clk), .R(n175), .S(1'b1), .Q(C1[1]) );
  DFFSR \C1_reg[2]  ( .D(n533), .CLK(clk), .R(n175), .S(1'b1), .Q(C1[2]) );
  DFFSR \C1_reg[3]  ( .D(n532), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[3]) );
  DFFSR \C1_reg[4]  ( .D(n531), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[4]) );
  DFFSR \C1_reg[5]  ( .D(n530), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[5]) );
  DFFSR \C1_reg[6]  ( .D(n529), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[6]) );
  DFFSR \C1_reg[7]  ( .D(n528), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[7]) );
  DFFSR \C1_reg[8]  ( .D(n527), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[8]) );
  DFFSR \D1_reg[0]  ( .D(n483), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[0]) );
  DFFSR \D1_reg[1]  ( .D(n482), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[1]) );
  DFFSR \D1_reg[2]  ( .D(n480), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[2]) );
  DFFSR \D1_reg[3]  ( .D(n479), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[3]) );
  DFFSR \D1_reg[4]  ( .D(n478), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[4]) );
  DFFSR \D1_reg[5]  ( .D(n477), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[5]) );
  DFFSR \D1_reg[6]  ( .D(n469), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[6]) );
  DFFSR \D1_reg[7]  ( .D(n466), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[7]) );
  DFFSR \D1_reg[8]  ( .D(n461), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[8]) );
  DFFSR \E1_reg[0]  ( .D(n553), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[0]) );
  DFFSR \E1_reg[1]  ( .D(n552), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[1]) );
  DFFSR \E1_reg[2]  ( .D(n551), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[2]) );
  DFFSR \E1_reg[3]  ( .D(n550), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[3]) );
  DFFSR \E1_reg[4]  ( .D(n549), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[4]) );
  DFFSR \E1_reg[5]  ( .D(n548), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[5]) );
  DFFSR \E1_reg[6]  ( .D(n547), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[6]) );
  DFFSR \E1_reg[7]  ( .D(n546), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[7]) );
  DFFSR \E1_reg[8]  ( .D(n545), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[8]) );
  DFFSR \E1_reg[9]  ( .D(n544), .CLK(clk), .R(n172), .S(1'b1), .Q(E1[9]) );
  DFFSR \A2_reg[0]  ( .D(n427), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[0]) );
  DFFSR \A2_reg[1]  ( .D(n426), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[1]) );
  DFFSR \A2_reg[2]  ( .D(n425), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[2]) );
  DFFSR \A2_reg[3]  ( .D(n424), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[3]) );
  DFFSR \A2_reg[4]  ( .D(n423), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[4]) );
  DFFSR \A2_reg[5]  ( .D(n422), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[5]) );
  DFFSR \A2_reg[6]  ( .D(n421), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[6]) );
  DFFSR \A2_reg[7]  ( .D(n420), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[7]) );
  DFFSR \A2_reg[8]  ( .D(n419), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[8]) );
  DFFSR \B2_reg[0]  ( .D(n452), .CLK(clk), .R(n172), .S(1'b1), .Q(N207) );
  DFFSR \B2_reg[1]  ( .D(n451), .CLK(clk), .R(n172), .S(1'b1), .Q(N208) );
  DFFSR \B2_reg[2]  ( .D(n444), .CLK(clk), .R(n171), .S(1'b1), .Q(N209) );
  DFFSR \B2_reg[3]  ( .D(n443), .CLK(clk), .R(n171), .S(1'b1), .Q(N210) );
  DFFSR \B2_reg[4]  ( .D(n441), .CLK(clk), .R(n171), .S(1'b1), .Q(N211) );
  DFFSR \B2_reg[5]  ( .D(n440), .CLK(clk), .R(n171), .S(1'b1), .Q(N212) );
  DFFSR \B2_reg[6]  ( .D(n439), .CLK(clk), .R(n171), .S(1'b1), .Q(N213) );
  DFFSR \B2_reg[7]  ( .D(n438), .CLK(clk), .R(n171), .S(1'b1), .Q(N214) );
  DFFSR \B2_reg[8]  ( .D(n437), .CLK(clk), .R(n171), .S(1'b1), .Q(N215) );
  DFFSR \D2_reg[0]  ( .D(n525), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[0]) );
  DFFSR \D2_reg[1]  ( .D(n524), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[1]) );
  DFFSR \D2_reg[2]  ( .D(n523), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[2]) );
  DFFSR \D2_reg[3]  ( .D(n520), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[3]) );
  DFFSR \D2_reg[4]  ( .D(n518), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[4]) );
  DFFSR \D2_reg[5]  ( .D(n517), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[5]) );
  DFFSR \D2_reg[6]  ( .D(n488), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[6]) );
  DFFSR \D2_reg[7]  ( .D(n487), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[7]) );
  DFFSR \D2_reg[8]  ( .D(n486), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[8]) );
  DFFSR \E2_reg[0]  ( .D(n563), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[0]) );
  DFFSR \E2_reg[1]  ( .D(n562), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[1]) );
  DFFSR \E2_reg[2]  ( .D(n561), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[2]) );
  DFFSR \E2_reg[3]  ( .D(n560), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[3]) );
  DFFSR \E2_reg[4]  ( .D(n559), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[4]) );
  DFFSR \E2_reg[5]  ( .D(n558), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[5]) );
  DFFSR \E2_reg[6]  ( .D(n557), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[6]) );
  DFFSR \E2_reg[7]  ( .D(n556), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[7]) );
  DFFSR \E2_reg[8]  ( .D(n555), .CLK(clk), .R(n169), .S(1'b1), .Q(E2[8]) );
  DFFSR \E2_reg[9]  ( .D(n554), .CLK(clk), .R(n169), .S(1'b1), .Q(E2[9]) );
  DFFSR o_gradient_data_ready_reg ( .D(n565), .CLK(clk), .R(n169), .S(1'b1), 
        .Q(o_gradient_data_ready) );
  DFFSR \Gx_reg[0]  ( .D(n516), .CLK(clk), .R(n169), .S(1'b1), .Q(N258) );
  DFFSR \Gx_reg[1]  ( .D(n515), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[1]) );
  DFFSR \Gx_reg[2]  ( .D(n514), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[2]) );
  DFFSR \Gx_reg[3]  ( .D(n513), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[3]) );
  DFFSR \Gx_reg[4]  ( .D(n512), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[4]) );
  DFFSR \Gx_reg[5]  ( .D(n511), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[5]) );
  DFFSR \Gx_reg[6]  ( .D(n510), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[6]) );
  DFFSR \Gx_reg[7]  ( .D(n509), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[7]) );
  DFFSR \Gx_reg[8]  ( .D(n508), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[8]) );
  DFFSR \Gx_reg[9]  ( .D(n507), .CLK(clk), .R(n168), .S(1'b1), .Q(Gx[9]) );
  DFFSR \C2_reg[1]  ( .D(n543), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[1]) );
  DFFSR \C2_reg[2]  ( .D(n542), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[2]) );
  DFFSR \C2_reg[3]  ( .D(n541), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[3]) );
  DFFSR \C2_reg[4]  ( .D(n540), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[4]) );
  DFFSR \C2_reg[5]  ( .D(n539), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[5]) );
  DFFSR \C2_reg[6]  ( .D(n538), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[6]) );
  DFFSR \C2_reg[7]  ( .D(n537), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[7]) );
  DFFSR \C2_reg[8]  ( .D(n536), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[8]) );
  DFFSR \C2_reg[9]  ( .D(n535), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[9]) );
  DFFSR \Gy_reg[1]  ( .D(n497), .CLK(clk), .R(n168), .S(1'b1), .Q(Gy[1]) );
  DFFSR \Gy_reg[2]  ( .D(n498), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[2]) );
  DFFSR \Gy_reg[3]  ( .D(n499), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[3]) );
  DFFSR \Gy_reg[4]  ( .D(n500), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[4]) );
  DFFSR \Gy_reg[5]  ( .D(n501), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[5]) );
  DFFSR \Gy_reg[6]  ( .D(n502), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[6]) );
  DFFSR \Gy_reg[7]  ( .D(n503), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[7]) );
  DFFSR \Gy_reg[8]  ( .D(n504), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[8]) );
  DFFSR \Gy_reg[9]  ( .D(n505), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[9]) );
  DFFSR \temp_sum_reg[0]  ( .D(n496), .CLK(clk), .R(n141), .S(1'b1), .Q(
        temp_sum[0]) );
  DFFSR \o_processed_sum_reg[0]  ( .D(temp_sum[0]), .CLK(clk), .R(n141), .S(
        1'b1), .Q(o_processed_sum[0]) );
  DFFSR \temp_sum_reg[1]  ( .D(n495), .CLK(clk), .R(n141), .S(1'b1), .Q(
        temp_sum[1]) );
  DFFSR \o_processed_sum_reg[1]  ( .D(temp_sum[1]), .CLK(clk), .R(n141), .S(
        1'b1), .Q(o_processed_sum[1]) );
  DFFSR \temp_sum_reg[2]  ( .D(n494), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[2]) );
  DFFSR \o_processed_sum_reg[2]  ( .D(temp_sum[2]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[2]) );
  DFFSR \temp_sum_reg[3]  ( .D(n493), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[3]) );
  DFFSR \o_processed_sum_reg[3]  ( .D(temp_sum[3]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[3]) );
  DFFSR \temp_sum_reg[4]  ( .D(n492), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[4]) );
  DFFSR \o_processed_sum_reg[4]  ( .D(temp_sum[4]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[4]) );
  DFFSR \temp_sum_reg[5]  ( .D(n491), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[5]) );
  DFFSR \o_processed_sum_reg[5]  ( .D(temp_sum[5]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[5]) );
  DFFSR \temp_sum_reg[6]  ( .D(n490), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[6]) );
  DFFSR \o_processed_sum_reg[6]  ( .D(temp_sum[6]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[6]) );
  DFFSR \temp_sum_reg[7]  ( .D(n489), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[7]) );
  DFFSR \o_processed_sum_reg[7]  ( .D(temp_sum[7]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[7]) );
  AND2X2 U157 ( .A(n364), .B(n449), .Y(n460) );
  AND2X2 U160 ( .A(n303), .B(n315), .Y(n481) );
  OR2X1 U458 ( .A(n447), .B(n448), .Y(n446) );
  NAND3X1 U459 ( .A(n449), .B(n450), .C(n408), .Y(n445) );
  OR2X1 U462 ( .A(n455), .B(n456), .Y(n454) );
  NAND3X1 U464 ( .A(n459), .B(n450), .C(n460), .Y(n453) );
  OAI21X1 U465 ( .A(n450), .B(n409), .C(n462), .Y(n519) );
  NAND2X1 U467 ( .A(n564), .B(n457), .Y(n464) );
  NAND3X1 U469 ( .A(n442), .B(n315), .C(n386), .Y(n463) );
  OR2X1 U472 ( .A(n455), .B(n447), .Y(n468) );
  NAND3X1 U475 ( .A(n386), .B(n450), .C(n471), .Y(n467) );
  NAND2X1 U476 ( .A(i_gradient_start), .B(n566), .Y(n471) );
  NAND2X1 U477 ( .A(n473), .B(n474), .Y(n450) );
  NOR2X1 U478 ( .A(n475), .B(n476), .Y(n474) );
  NAND3X1 U479 ( .A(n364), .B(n386), .C(n465), .Y(n476) );
  NAND3X1 U482 ( .A(n341), .B(n442), .C(n481), .Y(n475) );
  NAND3X1 U484 ( .A(state[2]), .B(n17), .C(state[3]), .Y(n303) );
  NOR2X1 U487 ( .A(n484), .B(n485), .Y(n473) );
  NAND3X1 U488 ( .A(n472), .B(n458), .C(n408), .Y(n485) );
  NAND2X1 U490 ( .A(n16), .B(n2), .Y(n472) );
  NAND3X1 U491 ( .A(n457), .B(n470), .C(n449), .Y(n484) );
  NAND2X1 U492 ( .A(n9), .B(n17), .Y(n449) );
  NAND2X1 U493 ( .A(n22), .B(n9), .Y(n470) );
  edge_detection_8_DW01_add_0 add_231 ( .A({Gx[10:1], N258}), .B({Gy[10:1], 
        N269}), .CI(1'b0), .SUM({N290, N289, N288, N287, N286, N285, N284, 
        N283, N282, N281, N280}) );
  edge_detection_8_DW01_add_1 add_219 ( .A({C2[9], C2[9:1], 1'b0}), .B({E2[9], 
        E2}), .CI(1'b0), .SUM({N257, N256, N255, N254, N253, N252, N251, N250, 
        N249, N248, N247}) );
  edge_detection_8_DW01_add_2 add_218 ( .A({C1[9], C1[9:1], 1'b0}), .B({E1[9], 
        E1}), .CI(1'b0), .SUM({N246, N245, N244, N243, N242, N241, N240, N239, 
        N238, N237, N236}) );
  edge_detection_8_DW01_add_3 add_214 ( .A({A2[8], A2}), .B({D2[8], D2}), .CI(
        1'b0), .SUM({N235, N234, N233, N232, N231, N230, N229, N228, N227, 
        N226}) );
  edge_detection_8_DW01_add_4 add_213 ( .A({A1[8], A1}), .B({D1[8], D1}), .CI(
        1'b0), .SUM({N225, N224, N223, N222, N221, N220, N219, N218, N217, 
        N216}) );
  edge_detection_8_DW01_sub_2 sub_204 ( .A({1'b0, P2}), .B({1'b0, P8}), .CI(
        1'b0), .DIFF({N195, N194, N193, N192, N191, N190, N189, N188, N187})
         );
  edge_detection_8_DW01_sub_3 sub_203 ( .A({1'b0, P8}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N186, N185, N184, N183, N182, N181, N180, N179, N178})
         );
  edge_detection_8_DW01_sub_4 sub_202 ( .A({1'b0, P1}), .B({1'b0, P7}), .CI(
        1'b0), .DIFF({N177, N176, N175, N174, N173, N172, N171, N170, N169})
         );
  edge_detection_8_DW01_sub_5 sub_201 ( .A({1'b0, P5}), .B({1'b0, P3}), .CI(
        1'b0), .DIFF({N168, N167, N166, N165, N164, N163, N162, N161, N160})
         );
  edge_detection_8_DW01_sub_6 sub_200 ( .A({1'b0, P0}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N159, N158, N157, N156, N155, N154, N153, N152, N151})
         );
  edge_detection_8_DW01_sub_7 sub_199 ( .A({1'b0, P2}), .B({1'b0, P0}), .CI(
        1'b0), .DIFF({N150, N149, N148, N147, N146, N145, N144, N143, N142})
         );
  NAND2X1 U5 ( .A(n2), .B(n9), .Y(n1) );
  AND2X2 U6 ( .A(n409), .B(n178), .Y(n2) );
  AND2X2 U12 ( .A(state[3]), .B(n179), .Y(n8) );
  AND2X2 U13 ( .A(state[2]), .B(n235), .Y(n9) );
  AND2X2 U52 ( .A(n235), .B(n179), .Y(n16) );
  AND2X2 U128 ( .A(state[1]), .B(n178), .Y(n17) );
  AND2X2 U155 ( .A(state[0]), .B(state[1]), .Y(n18) );
  OR2X2 U156 ( .A(n467), .B(n468), .Y(n19) );
  OR2X2 U158 ( .A(n453), .B(n454), .Y(n20) );
  OR2X2 U159 ( .A(n445), .B(n446), .Y(n21) );
  AND2X2 U161 ( .A(state[0]), .B(n409), .Y(n22) );
  OR2X2 U162 ( .A(n260), .B(Gx[6]), .Y(n264) );
  OR2X2 U163 ( .A(n268), .B(Gx[8]), .Y(n272) );
  OR2X2 U164 ( .A(N258), .B(Gx[1]), .Y(n244) );
  BUFX2 U165 ( .A(n323), .Y(n29) );
  BUFX2 U166 ( .A(n323), .Y(n28) );
  BUFX2 U167 ( .A(n323), .Y(n26) );
  BUFX2 U168 ( .A(n323), .Y(n27) );
  INVX2 U169 ( .A(n364), .Y(n25) );
  INVX2 U170 ( .A(n1), .Y(n384) );
  INVX2 U171 ( .A(n386), .Y(n24) );
  BUFX2 U172 ( .A(n323), .Y(n30) );
  INVX2 U173 ( .A(n341), .Y(n404) );
  AND2X2 U174 ( .A(n341), .B(n1), .Y(n23) );
  INVX2 U175 ( .A(n459), .Y(n385) );
  BUFX2 U176 ( .A(n_rst), .Y(n65) );
  BUFX2 U177 ( .A(n_rst), .Y(n141) );
  BUFX2 U178 ( .A(n_rst), .Y(n169) );
  BUFX2 U179 ( .A(n_rst), .Y(n170) );
  BUFX2 U180 ( .A(n_rst), .Y(n171) );
  BUFX2 U181 ( .A(n_rst), .Y(n172) );
  BUFX2 U182 ( .A(n_rst), .Y(n173) );
  BUFX2 U183 ( .A(n_rst), .Y(n174) );
  BUFX2 U184 ( .A(n_rst), .Y(n176) );
  BUFX2 U185 ( .A(n_rst), .Y(n168) );
  BUFX2 U186 ( .A(n_rst), .Y(n175) );
  BUFX2 U187 ( .A(n_rst), .Y(n177) );
  OR2X1 U188 ( .A(n244), .B(Gx[2]), .Y(n248) );
  OR2X1 U189 ( .A(n264), .B(Gx[7]), .Y(n268) );
  OR2X1 U190 ( .A(n256), .B(Gx[5]), .Y(n260) );
  OR2X1 U191 ( .A(n252), .B(Gx[4]), .Y(n256) );
  OR2X1 U192 ( .A(n248), .B(Gx[3]), .Y(n252) );
  INVX2 U195 ( .A(state[1]), .Y(n409) );
  INVX2 U196 ( .A(state[0]), .Y(n178) );
  NAND3X1 U197 ( .A(state[2]), .B(state[3]), .C(n2), .Y(n315) );
  INVX2 U198 ( .A(state[2]), .Y(n179) );
  NAND2X1 U199 ( .A(n17), .B(n8), .Y(n341) );
  INVX2 U200 ( .A(state[3]), .Y(n235) );
  NAND2X1 U201 ( .A(n16), .B(n22), .Y(n442) );
  INVX2 U202 ( .A(n442), .Y(n323) );
  MUX2X1 U203 ( .B(N205), .A(N168), .S(n26), .Y(n180) );
  INVX2 U204 ( .A(n180), .Y(n428) );
  NAND2X1 U205 ( .A(n16), .B(n17), .Y(n386) );
  INVX2 U206 ( .A(C1[9]), .Y(n182) );
  INVX2 U207 ( .A(N205), .Y(n181) );
  MUX2X1 U208 ( .B(n182), .A(n181), .S(n24), .Y(n526) );
  MUX2X1 U209 ( .B(N204), .A(N167), .S(n26), .Y(n183) );
  INVX2 U210 ( .A(n183), .Y(n429) );
  INVX2 U211 ( .A(C1[8]), .Y(n185) );
  INVX2 U212 ( .A(N204), .Y(n184) );
  MUX2X1 U213 ( .B(n185), .A(n184), .S(n24), .Y(n527) );
  MUX2X1 U214 ( .B(N203), .A(N166), .S(n26), .Y(n186) );
  INVX2 U215 ( .A(n186), .Y(n430) );
  INVX2 U216 ( .A(C1[7]), .Y(n188) );
  INVX2 U217 ( .A(N203), .Y(n187) );
  MUX2X1 U218 ( .B(n188), .A(n187), .S(n24), .Y(n528) );
  MUX2X1 U219 ( .B(N202), .A(N165), .S(n26), .Y(n189) );
  INVX2 U220 ( .A(n189), .Y(n431) );
  INVX2 U221 ( .A(C1[6]), .Y(n191) );
  INVX2 U222 ( .A(N202), .Y(n190) );
  MUX2X1 U223 ( .B(n191), .A(n190), .S(n24), .Y(n529) );
  MUX2X1 U224 ( .B(N201), .A(N164), .S(n26), .Y(n192) );
  INVX2 U225 ( .A(n192), .Y(n432) );
  INVX2 U226 ( .A(C1[5]), .Y(n194) );
  INVX2 U227 ( .A(N201), .Y(n193) );
  MUX2X1 U228 ( .B(n194), .A(n193), .S(n24), .Y(n530) );
  MUX2X1 U229 ( .B(N200), .A(N163), .S(n26), .Y(n195) );
  INVX2 U230 ( .A(n195), .Y(n433) );
  INVX2 U231 ( .A(C1[4]), .Y(n197) );
  INVX2 U232 ( .A(N200), .Y(n196) );
  MUX2X1 U233 ( .B(n197), .A(n196), .S(n24), .Y(n531) );
  MUX2X1 U234 ( .B(N199), .A(N162), .S(n26), .Y(n198) );
  INVX2 U235 ( .A(n198), .Y(n434) );
  INVX2 U236 ( .A(C1[3]), .Y(n200) );
  INVX2 U237 ( .A(N199), .Y(n199) );
  MUX2X1 U238 ( .B(n200), .A(n199), .S(n24), .Y(n532) );
  MUX2X1 U239 ( .B(N198), .A(N161), .S(n26), .Y(n201) );
  INVX2 U240 ( .A(n201), .Y(n435) );
  INVX2 U241 ( .A(C1[2]), .Y(n203) );
  INVX2 U242 ( .A(N198), .Y(n202) );
  MUX2X1 U243 ( .B(n203), .A(n202), .S(n24), .Y(n533) );
  MUX2X1 U244 ( .B(N197), .A(N160), .S(n26), .Y(n204) );
  INVX2 U245 ( .A(n204), .Y(n436) );
  INVX2 U246 ( .A(C1[1]), .Y(n206) );
  INVX2 U247 ( .A(N197), .Y(n205) );
  MUX2X1 U248 ( .B(n206), .A(n205), .S(n24), .Y(n534) );
  MUX2X1 U249 ( .B(A1[8]), .A(N150), .S(n26), .Y(n207) );
  INVX2 U250 ( .A(n207), .Y(n410) );
  MUX2X1 U251 ( .B(A1[7]), .A(N149), .S(n26), .Y(n208) );
  INVX2 U252 ( .A(n208), .Y(n411) );
  MUX2X1 U253 ( .B(A1[6]), .A(N148), .S(n26), .Y(n209) );
  INVX2 U254 ( .A(n209), .Y(n412) );
  MUX2X1 U255 ( .B(A1[5]), .A(N147), .S(n26), .Y(n210) );
  INVX2 U256 ( .A(n210), .Y(n413) );
  MUX2X1 U257 ( .B(A1[4]), .A(N146), .S(n27), .Y(n211) );
  INVX2 U258 ( .A(n211), .Y(n414) );
  MUX2X1 U259 ( .B(A1[3]), .A(N145), .S(n27), .Y(n212) );
  INVX2 U260 ( .A(n212), .Y(n415) );
  MUX2X1 U261 ( .B(A1[2]), .A(N144), .S(n27), .Y(n213) );
  INVX2 U262 ( .A(n213), .Y(n416) );
  MUX2X1 U263 ( .B(A1[1]), .A(N143), .S(n27), .Y(n214) );
  INVX2 U264 ( .A(n214), .Y(n417) );
  MUX2X1 U265 ( .B(A1[0]), .A(N142), .S(n27), .Y(n215) );
  INVX2 U266 ( .A(n215), .Y(n418) );
  MUX2X1 U267 ( .B(D1[8]), .A(N186), .S(n27), .Y(n216) );
  INVX2 U268 ( .A(n216), .Y(n461) );
  MUX2X1 U269 ( .B(D1[7]), .A(N185), .S(n27), .Y(n217) );
  INVX2 U270 ( .A(n217), .Y(n466) );
  MUX2X1 U271 ( .B(D1[6]), .A(N184), .S(n27), .Y(n218) );
  INVX2 U272 ( .A(n218), .Y(n469) );
  MUX2X1 U273 ( .B(D1[5]), .A(N183), .S(n27), .Y(n219) );
  INVX2 U274 ( .A(n219), .Y(n477) );
  MUX2X1 U275 ( .B(D1[4]), .A(N182), .S(n27), .Y(n220) );
  INVX2 U276 ( .A(n220), .Y(n478) );
  MUX2X1 U277 ( .B(D1[3]), .A(N181), .S(n27), .Y(n221) );
  INVX2 U278 ( .A(n221), .Y(n479) );
  MUX2X1 U279 ( .B(D1[2]), .A(N180), .S(n27), .Y(n222) );
  INVX2 U280 ( .A(n222), .Y(n480) );
  MUX2X1 U281 ( .B(D1[1]), .A(N179), .S(n27), .Y(n223) );
  INVX2 U282 ( .A(n223), .Y(n482) );
  MUX2X1 U283 ( .B(D1[0]), .A(N178), .S(n28), .Y(n224) );
  INVX2 U284 ( .A(n224), .Y(n483) );
  NAND2X1 U285 ( .A(n16), .B(n18), .Y(n364) );
  MUX2X1 U286 ( .B(E1[9]), .A(N225), .S(n25), .Y(n225) );
  INVX2 U287 ( .A(n225), .Y(n544) );
  MUX2X1 U288 ( .B(E1[8]), .A(N224), .S(n25), .Y(n226) );
  INVX2 U289 ( .A(n226), .Y(n545) );
  MUX2X1 U290 ( .B(E1[7]), .A(N223), .S(n25), .Y(n227) );
  INVX2 U291 ( .A(n227), .Y(n546) );
  MUX2X1 U292 ( .B(E1[6]), .A(N222), .S(n25), .Y(n228) );
  INVX2 U293 ( .A(n228), .Y(n547) );
  MUX2X1 U294 ( .B(E1[5]), .A(N221), .S(n25), .Y(n229) );
  INVX2 U295 ( .A(n229), .Y(n548) );
  MUX2X1 U296 ( .B(E1[4]), .A(N220), .S(n25), .Y(n230) );
  INVX2 U297 ( .A(n230), .Y(n549) );
  MUX2X1 U298 ( .B(E1[3]), .A(N219), .S(n25), .Y(n231) );
  INVX2 U299 ( .A(n231), .Y(n550) );
  MUX2X1 U300 ( .B(E1[2]), .A(N218), .S(n25), .Y(n232) );
  INVX2 U301 ( .A(n232), .Y(n551) );
  MUX2X1 U302 ( .B(E1[1]), .A(N217), .S(n25), .Y(n233) );
  INVX2 U303 ( .A(n233), .Y(n552) );
  MUX2X1 U304 ( .B(E1[0]), .A(N216), .S(n25), .Y(n234) );
  INVX2 U305 ( .A(n234), .Y(n553) );
  INVX2 U306 ( .A(N236), .Y(n237) );
  OAI21X1 U307 ( .A(n404), .B(n23), .C(N258), .Y(n236) );
  OAI21X1 U308 ( .A(n1), .B(n237), .C(n236), .Y(n516) );
  INVX2 U309 ( .A(N237), .Y(n240) );
  XOR2X1 U310 ( .A(Gx[1]), .B(N258), .Y(n238) );
  AOI22X1 U311 ( .A(n238), .B(n404), .C(Gx[1]), .D(n23), .Y(n239) );
  OAI21X1 U312 ( .A(n1), .B(n240), .C(n239), .Y(n515) );
  INVX2 U313 ( .A(N238), .Y(n243) );
  XOR2X1 U314 ( .A(n244), .B(Gx[2]), .Y(n241) );
  AOI22X1 U315 ( .A(n241), .B(n404), .C(Gx[2]), .D(n23), .Y(n242) );
  OAI21X1 U316 ( .A(n1), .B(n243), .C(n242), .Y(n514) );
  INVX2 U317 ( .A(N239), .Y(n247) );
  XOR2X1 U318 ( .A(n248), .B(Gx[3]), .Y(n245) );
  AOI22X1 U319 ( .A(n245), .B(n404), .C(Gx[3]), .D(n23), .Y(n246) );
  OAI21X1 U320 ( .A(n1), .B(n247), .C(n246), .Y(n513) );
  INVX2 U321 ( .A(N240), .Y(n251) );
  XOR2X1 U322 ( .A(n252), .B(Gx[4]), .Y(n249) );
  AOI22X1 U323 ( .A(n249), .B(n404), .C(Gx[4]), .D(n23), .Y(n250) );
  OAI21X1 U324 ( .A(n1), .B(n251), .C(n250), .Y(n512) );
  INVX2 U325 ( .A(N241), .Y(n255) );
  XOR2X1 U326 ( .A(n256), .B(Gx[5]), .Y(n253) );
  AOI22X1 U327 ( .A(n253), .B(n404), .C(Gx[5]), .D(n23), .Y(n254) );
  OAI21X1 U328 ( .A(n1), .B(n255), .C(n254), .Y(n511) );
  INVX2 U329 ( .A(N242), .Y(n259) );
  XOR2X1 U330 ( .A(n260), .B(Gx[6]), .Y(n257) );
  AOI22X1 U331 ( .A(n257), .B(n404), .C(Gx[6]), .D(n23), .Y(n258) );
  OAI21X1 U332 ( .A(n1), .B(n259), .C(n258), .Y(n510) );
  INVX2 U333 ( .A(N243), .Y(n263) );
  XOR2X1 U334 ( .A(n264), .B(Gx[7]), .Y(n261) );
  AOI22X1 U335 ( .A(n261), .B(n404), .C(Gx[7]), .D(n23), .Y(n262) );
  OAI21X1 U336 ( .A(n1), .B(n263), .C(n262), .Y(n509) );
  INVX2 U337 ( .A(N244), .Y(n267) );
  XOR2X1 U338 ( .A(n268), .B(Gx[8]), .Y(n265) );
  AOI22X1 U339 ( .A(n265), .B(n404), .C(Gx[8]), .D(n23), .Y(n266) );
  OAI21X1 U340 ( .A(n1), .B(n267), .C(n266), .Y(n508) );
  INVX2 U341 ( .A(N245), .Y(n271) );
  XOR2X1 U342 ( .A(n272), .B(Gx[9]), .Y(n269) );
  AOI22X1 U343 ( .A(n269), .B(n404), .C(Gx[9]), .D(n23), .Y(n270) );
  OAI21X1 U344 ( .A(n1), .B(n271), .C(n270), .Y(n507) );
  NOR2X1 U345 ( .A(Gx[9]), .B(n272), .Y(n273) );
  XNOR2X1 U346 ( .A(n273), .B(Gx[10]), .Y(n274) );
  AOI22X1 U347 ( .A(n23), .B(Gx[10]), .C(n274), .D(n404), .Y(n276) );
  NAND2X1 U348 ( .A(N246), .B(n384), .Y(n275) );
  NAND2X1 U349 ( .A(n276), .B(n275), .Y(n506) );
  NAND2X1 U350 ( .A(n8), .B(n18), .Y(n459) );
  MUX2X1 U351 ( .B(N215), .A(N177), .S(n28), .Y(n277) );
  INVX2 U352 ( .A(n277), .Y(n437) );
  INVX2 U353 ( .A(C2[9]), .Y(n279) );
  INVX2 U354 ( .A(N215), .Y(n278) );
  MUX2X1 U355 ( .B(n279), .A(n278), .S(n24), .Y(n535) );
  MUX2X1 U356 ( .B(N214), .A(N176), .S(n28), .Y(n280) );
  INVX2 U357 ( .A(n280), .Y(n438) );
  INVX2 U358 ( .A(C2[8]), .Y(n282) );
  INVX2 U359 ( .A(N214), .Y(n281) );
  MUX2X1 U360 ( .B(n282), .A(n281), .S(n24), .Y(n536) );
  MUX2X1 U361 ( .B(N213), .A(N175), .S(n28), .Y(n283) );
  INVX2 U362 ( .A(n283), .Y(n439) );
  INVX2 U363 ( .A(C2[7]), .Y(n285) );
  INVX2 U364 ( .A(N213), .Y(n284) );
  MUX2X1 U365 ( .B(n285), .A(n284), .S(n24), .Y(n537) );
  MUX2X1 U366 ( .B(N212), .A(N174), .S(n28), .Y(n286) );
  INVX2 U367 ( .A(n286), .Y(n440) );
  INVX2 U368 ( .A(C2[6]), .Y(n288) );
  INVX2 U369 ( .A(N212), .Y(n287) );
  MUX2X1 U370 ( .B(n288), .A(n287), .S(n24), .Y(n538) );
  MUX2X1 U371 ( .B(N211), .A(N173), .S(n28), .Y(n289) );
  INVX2 U372 ( .A(n289), .Y(n441) );
  INVX2 U373 ( .A(C2[5]), .Y(n291) );
  INVX2 U374 ( .A(N211), .Y(n290) );
  MUX2X1 U375 ( .B(n291), .A(n290), .S(n24), .Y(n539) );
  MUX2X1 U376 ( .B(N210), .A(N172), .S(n28), .Y(n292) );
  INVX2 U377 ( .A(n292), .Y(n443) );
  INVX2 U378 ( .A(C2[4]), .Y(n294) );
  INVX2 U379 ( .A(N210), .Y(n293) );
  MUX2X1 U380 ( .B(n294), .A(n293), .S(n24), .Y(n540) );
  MUX2X1 U381 ( .B(N209), .A(N171), .S(n28), .Y(n295) );
  INVX2 U382 ( .A(n295), .Y(n444) );
  INVX2 U383 ( .A(C2[3]), .Y(n297) );
  INVX2 U384 ( .A(N209), .Y(n296) );
  MUX2X1 U385 ( .B(n297), .A(n296), .S(n24), .Y(n541) );
  MUX2X1 U386 ( .B(N208), .A(N170), .S(n28), .Y(n298) );
  INVX2 U387 ( .A(n298), .Y(n451) );
  INVX2 U388 ( .A(C2[2]), .Y(n300) );
  INVX2 U389 ( .A(N208), .Y(n299) );
  MUX2X1 U390 ( .B(n300), .A(n299), .S(n24), .Y(n542) );
  MUX2X1 U391 ( .B(N207), .A(N169), .S(n28), .Y(n301) );
  INVX2 U392 ( .A(n301), .Y(n452) );
  INVX2 U393 ( .A(C2[1]), .Y(n304) );
  INVX2 U394 ( .A(N207), .Y(n302) );
  MUX2X1 U395 ( .B(n304), .A(n302), .S(n24), .Y(n543) );
  MUX2X1 U396 ( .B(A2[8]), .A(N159), .S(n28), .Y(n305) );
  INVX2 U397 ( .A(n305), .Y(n419) );
  MUX2X1 U398 ( .B(A2[7]), .A(N158), .S(n28), .Y(n306) );
  INVX2 U399 ( .A(n306), .Y(n420) );
  MUX2X1 U400 ( .B(A2[6]), .A(N157), .S(n28), .Y(n307) );
  INVX2 U401 ( .A(n307), .Y(n421) );
  MUX2X1 U402 ( .B(A2[5]), .A(N156), .S(n29), .Y(n308) );
  INVX2 U403 ( .A(n308), .Y(n422) );
  MUX2X1 U404 ( .B(A2[4]), .A(N155), .S(n29), .Y(n309) );
  INVX2 U405 ( .A(n309), .Y(n423) );
  MUX2X1 U406 ( .B(A2[3]), .A(N154), .S(n29), .Y(n310) );
  INVX2 U407 ( .A(n310), .Y(n424) );
  MUX2X1 U408 ( .B(A2[2]), .A(N153), .S(n29), .Y(n311) );
  INVX2 U409 ( .A(n311), .Y(n425) );
  MUX2X1 U410 ( .B(A2[1]), .A(N152), .S(n29), .Y(n312) );
  INVX2 U411 ( .A(n312), .Y(n426) );
  MUX2X1 U412 ( .B(A2[0]), .A(N151), .S(n29), .Y(n313) );
  INVX2 U413 ( .A(n313), .Y(n427) );
  MUX2X1 U414 ( .B(D2[8]), .A(N195), .S(n29), .Y(n314) );
  INVX2 U415 ( .A(n314), .Y(n486) );
  MUX2X1 U416 ( .B(D2[7]), .A(N194), .S(n29), .Y(n316) );
  INVX2 U417 ( .A(n316), .Y(n487) );
  MUX2X1 U418 ( .B(D2[6]), .A(N193), .S(n29), .Y(n317) );
  INVX2 U419 ( .A(n317), .Y(n488) );
  MUX2X1 U420 ( .B(D2[5]), .A(N192), .S(n29), .Y(n318) );
  INVX2 U421 ( .A(n318), .Y(n517) );
  MUX2X1 U422 ( .B(D2[4]), .A(N191), .S(n29), .Y(n319) );
  INVX2 U423 ( .A(n319), .Y(n518) );
  MUX2X1 U424 ( .B(D2[3]), .A(N190), .S(n29), .Y(n320) );
  INVX2 U425 ( .A(n320), .Y(n520) );
  MUX2X1 U426 ( .B(D2[2]), .A(N189), .S(n29), .Y(n321) );
  INVX2 U427 ( .A(n321), .Y(n523) );
  MUX2X1 U428 ( .B(D2[1]), .A(N188), .S(n30), .Y(n322) );
  INVX2 U429 ( .A(n322), .Y(n524) );
  MUX2X1 U430 ( .B(D2[0]), .A(N187), .S(n30), .Y(n324) );
  INVX2 U431 ( .A(n324), .Y(n525) );
  MUX2X1 U432 ( .B(E2[9]), .A(N235), .S(n25), .Y(n325) );
  INVX2 U433 ( .A(n325), .Y(n554) );
  MUX2X1 U434 ( .B(E2[8]), .A(N234), .S(n25), .Y(n326) );
  INVX2 U435 ( .A(n326), .Y(n555) );
  MUX2X1 U436 ( .B(E2[7]), .A(N233), .S(n25), .Y(n327) );
  INVX2 U437 ( .A(n327), .Y(n556) );
  MUX2X1 U438 ( .B(E2[6]), .A(N232), .S(n25), .Y(n328) );
  INVX2 U439 ( .A(n328), .Y(n557) );
  MUX2X1 U440 ( .B(E2[5]), .A(N231), .S(n25), .Y(n329) );
  INVX2 U441 ( .A(n329), .Y(n558) );
  MUX2X1 U442 ( .B(E2[4]), .A(N230), .S(n25), .Y(n330) );
  INVX2 U443 ( .A(n330), .Y(n559) );
  MUX2X1 U444 ( .B(E2[3]), .A(N229), .S(n25), .Y(n331) );
  INVX2 U445 ( .A(n331), .Y(n560) );
  MUX2X1 U446 ( .B(E2[2]), .A(N228), .S(n25), .Y(n332) );
  INVX2 U447 ( .A(n332), .Y(n561) );
  MUX2X1 U448 ( .B(E2[1]), .A(N227), .S(n25), .Y(n333) );
  INVX2 U449 ( .A(n333), .Y(n562) );
  MUX2X1 U450 ( .B(E2[0]), .A(N226), .S(n25), .Y(n334) );
  INVX2 U451 ( .A(n334), .Y(n563) );
  INVX2 U452 ( .A(N247), .Y(n336) );
  NAND2X1 U453 ( .A(n1), .B(n459), .Y(n389) );
  INVX2 U454 ( .A(n389), .Y(n408) );
  OAI21X1 U455 ( .A(n385), .B(n408), .C(N269), .Y(n335) );
  OAI21X1 U456 ( .A(n1), .B(n336), .C(n335), .Y(n522) );
  INVX2 U457 ( .A(Gy[1]), .Y(n339) );
  XOR2X1 U460 ( .A(Gy[1]), .B(N269), .Y(n337) );
  AOI22X1 U461 ( .A(n337), .B(n385), .C(N248), .D(n384), .Y(n338) );
  OAI21X1 U463 ( .A(n389), .B(n339), .C(n338), .Y(n497) );
  INVX2 U466 ( .A(Gy[2]), .Y(n345) );
  INVX2 U468 ( .A(N269), .Y(n340) );
  NAND2X1 U470 ( .A(n340), .B(n339), .Y(n344) );
  XOR2X1 U471 ( .A(n344), .B(Gy[2]), .Y(n342) );
  AOI22X1 U473 ( .A(n342), .B(n385), .C(N249), .D(n384), .Y(n343) );
  OAI21X1 U474 ( .A(n389), .B(n345), .C(n343), .Y(n498) );
  INVX2 U480 ( .A(Gy[3]), .Y(n350) );
  INVX2 U481 ( .A(n344), .Y(n346) );
  NAND2X1 U483 ( .A(n346), .B(n345), .Y(n349) );
  XOR2X1 U485 ( .A(n349), .B(Gy[3]), .Y(n347) );
  AOI22X1 U486 ( .A(n347), .B(n385), .C(N250), .D(n384), .Y(n348) );
  OAI21X1 U489 ( .A(n389), .B(n350), .C(n348), .Y(n499) );
  INVX2 U494 ( .A(Gy[4]), .Y(n355) );
  INVX2 U495 ( .A(n349), .Y(n351) );
  NAND2X1 U496 ( .A(n351), .B(n350), .Y(n354) );
  XOR2X1 U497 ( .A(n354), .B(Gy[4]), .Y(n352) );
  AOI22X1 U498 ( .A(n352), .B(n385), .C(N251), .D(n384), .Y(n353) );
  OAI21X1 U499 ( .A(n389), .B(n355), .C(n353), .Y(n500) );
  INVX2 U500 ( .A(Gy[5]), .Y(n360) );
  INVX2 U501 ( .A(n354), .Y(n356) );
  NAND2X1 U502 ( .A(n356), .B(n355), .Y(n359) );
  XOR2X1 U503 ( .A(n359), .B(Gy[5]), .Y(n357) );
  AOI22X1 U504 ( .A(n357), .B(n385), .C(N252), .D(n384), .Y(n358) );
  OAI21X1 U505 ( .A(n389), .B(n360), .C(n358), .Y(n501) );
  INVX2 U506 ( .A(Gy[6]), .Y(n366) );
  INVX2 U507 ( .A(n359), .Y(n361) );
  NAND2X1 U508 ( .A(n361), .B(n360), .Y(n365) );
  XOR2X1 U509 ( .A(n365), .B(Gy[6]), .Y(n362) );
  AOI22X1 U510 ( .A(n362), .B(n385), .C(N253), .D(n384), .Y(n363) );
  OAI21X1 U511 ( .A(n389), .B(n366), .C(n363), .Y(n502) );
  INVX2 U512 ( .A(Gy[7]), .Y(n371) );
  INVX2 U513 ( .A(n365), .Y(n367) );
  NAND2X1 U514 ( .A(n367), .B(n366), .Y(n370) );
  XOR2X1 U515 ( .A(n370), .B(Gy[7]), .Y(n368) );
  AOI22X1 U516 ( .A(n368), .B(n385), .C(N254), .D(n384), .Y(n369) );
  OAI21X1 U517 ( .A(n389), .B(n371), .C(n369), .Y(n503) );
  INVX2 U518 ( .A(Gy[8]), .Y(n376) );
  INVX2 U519 ( .A(n370), .Y(n372) );
  NAND2X1 U520 ( .A(n372), .B(n371), .Y(n375) );
  XOR2X1 U521 ( .A(n375), .B(Gy[8]), .Y(n373) );
  AOI22X1 U522 ( .A(n373), .B(n385), .C(N255), .D(n384), .Y(n374) );
  OAI21X1 U523 ( .A(n389), .B(n376), .C(n374), .Y(n504) );
  INVX2 U524 ( .A(Gy[9]), .Y(n381) );
  INVX2 U525 ( .A(n375), .Y(n377) );
  NAND2X1 U526 ( .A(n377), .B(n376), .Y(n380) );
  XOR2X1 U527 ( .A(n380), .B(Gy[9]), .Y(n378) );
  AOI22X1 U528 ( .A(n378), .B(n385), .C(N256), .D(n384), .Y(n379) );
  OAI21X1 U529 ( .A(n389), .B(n381), .C(n379), .Y(n505) );
  INVX2 U530 ( .A(Gy[10]), .Y(n406) );
  INVX2 U531 ( .A(n380), .Y(n382) );
  NAND2X1 U532 ( .A(n382), .B(n381), .Y(n383) );
  XOR2X1 U533 ( .A(n383), .B(Gy[10]), .Y(n387) );
  AOI22X1 U534 ( .A(n387), .B(n385), .C(N257), .D(n384), .Y(n388) );
  OAI21X1 U535 ( .A(n406), .B(n389), .C(n388), .Y(n521) );
  NOR2X1 U536 ( .A(N290), .B(N289), .Y(n391) );
  INVX2 U537 ( .A(N288), .Y(n390) );
  AOI21X1 U538 ( .A(n391), .B(n390), .C(n315), .Y(n392) );
  INVX2 U539 ( .A(n392), .Y(n402) );
  INVX2 U540 ( .A(n315), .Y(n400) );
  MUX2X1 U541 ( .B(temp_sum[0]), .A(N280), .S(n400), .Y(n393) );
  NAND2X1 U542 ( .A(n402), .B(n393), .Y(n496) );
  MUX2X1 U543 ( .B(temp_sum[1]), .A(N281), .S(n400), .Y(n394) );
  NAND2X1 U544 ( .A(n402), .B(n394), .Y(n495) );
  MUX2X1 U545 ( .B(temp_sum[2]), .A(N282), .S(n400), .Y(n395) );
  NAND2X1 U546 ( .A(n402), .B(n395), .Y(n494) );
  MUX2X1 U547 ( .B(temp_sum[3]), .A(N283), .S(n400), .Y(n396) );
  NAND2X1 U548 ( .A(n402), .B(n396), .Y(n493) );
  MUX2X1 U549 ( .B(temp_sum[4]), .A(N284), .S(n400), .Y(n397) );
  NAND2X1 U550 ( .A(n402), .B(n397), .Y(n492) );
  MUX2X1 U551 ( .B(temp_sum[5]), .A(N285), .S(n400), .Y(n398) );
  NAND2X1 U552 ( .A(n402), .B(n398), .Y(n491) );
  MUX2X1 U553 ( .B(temp_sum[6]), .A(N286), .S(n400), .Y(n399) );
  NAND2X1 U554 ( .A(n402), .B(n399), .Y(n490) );
  MUX2X1 U555 ( .B(temp_sum[7]), .A(N287), .S(n400), .Y(n401) );
  NAND2X1 U556 ( .A(n402), .B(n401), .Y(n489) );
  NAND2X1 U557 ( .A(n22), .B(n8), .Y(n457) );
  NAND2X1 U558 ( .A(n9), .B(n18), .Y(n458) );
  NAND2X1 U559 ( .A(n2), .B(n8), .Y(n465) );
  OAI21X1 U560 ( .A(Gx[10]), .B(n465), .C(n315), .Y(n455) );
  INVX2 U561 ( .A(n470), .Y(n403) );
  NOR2X1 U562 ( .A(n404), .B(n403), .Y(n405) );
  OAI21X1 U563 ( .A(n457), .B(n406), .C(n405), .Y(n447) );
  INVX2 U564 ( .A(Gx[10]), .Y(n407) );
  OAI21X1 U565 ( .A(n465), .B(n407), .C(n458), .Y(n448) );
  INVX2 U566 ( .A(n448), .Y(n564) );
  OAI21X1 U567 ( .A(Gy[10]), .B(n457), .C(n458), .Y(n456) );
  INVX2 U568 ( .A(n303), .Y(n565) );
  INVX2 U569 ( .A(n472), .Y(n566) );
  NOR2X1 U570 ( .A(n463), .B(n464), .Y(n462) );
endmodule


module edge_detection_7_DW01_add_0 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [10:1] carry;

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_7_DW01_add_1 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1;
  wire   [10:1] carry;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  XOR2X1 U1 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  NAND2X1 U2 ( .A(B[1]), .B(A[1]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(carry[2]) );
endmodule


module edge_detection_7_DW01_add_2 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1;
  wire   [10:1] carry;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  XOR2X1 U1 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  NAND2X1 U2 ( .A(B[1]), .B(A[1]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(carry[2]) );
endmodule


module edge_detection_7_DW01_add_3 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;

  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_7_DW01_add_4 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;

  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_7_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  INVX1 U1 ( .A(B[0]), .Y(n8) );
  INVX1 U2 ( .A(B[7]), .Y(n2) );
  INVX1 U3 ( .A(B[6]), .Y(n9) );
  INVX1 U4 ( .A(B[5]), .Y(n3) );
  INVX1 U5 ( .A(B[4]), .Y(n4) );
  INVX1 U6 ( .A(B[2]), .Y(n6) );
  INVX1 U7 ( .A(B[3]), .Y(n5) );
  INVX1 U8 ( .A(B[1]), .Y(n7) );
  OR2X1 U9 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U10 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U11 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module edge_detection_7_DW01_sub_3 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n3), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n4), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n5), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n6), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n7), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n9), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  INVX1 U1 ( .A(B[3]), .Y(n6) );
  INVX1 U2 ( .A(B[2]), .Y(n7) );
  INVX1 U3 ( .A(B[1]), .Y(n9) );
  OR2X2 U4 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U5 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U6 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U7 ( .A(B[7]), .Y(n2) );
  INVX2 U8 ( .A(B[6]), .Y(n3) );
  INVX2 U9 ( .A(B[5]), .Y(n4) );
  INVX2 U10 ( .A(B[4]), .Y(n5) );
  INVX2 U11 ( .A(B[0]), .Y(n8) );
endmodule


module edge_detection_7_DW01_sub_4 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X2 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_7_DW01_sub_5 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_7_DW01_sub_6 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n3), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n4), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n5), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n6), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n7), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n9), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  INVX1 U1 ( .A(B[3]), .Y(n6) );
  INVX1 U2 ( .A(B[2]), .Y(n7) );
  INVX1 U3 ( .A(B[1]), .Y(n9) );
  OR2X1 U4 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U5 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U6 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U7 ( .A(B[7]), .Y(n2) );
  INVX2 U8 ( .A(B[6]), .Y(n3) );
  INVX2 U9 ( .A(B[5]), .Y(n4) );
  INVX2 U10 ( .A(B[4]), .Y(n5) );
  INVX2 U11 ( .A(B[0]), .Y(n8) );
endmodule


module edge_detection_7_DW01_sub_7 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_7 ( clk, n_rst, i_gradient_start, P0, P1, P2, P3, P4, P5, 
        P6, P7, P8, o_gradient_data_ready, o_processed_sum );
  input [7:0] P0;
  input [7:0] P1;
  input [7:0] P2;
  input [7:0] P3;
  input [7:0] P4;
  input [7:0] P5;
  input [7:0] P6;
  input [7:0] P7;
  input [7:0] P8;
  output [7:0] o_processed_sum;
  input clk, n_rst, i_gradient_start;
  output o_gradient_data_ready;
  wire   N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152,
         N153, N154, N155, N156, N157, N158, N159, N160, N161, N162, N163,
         N164, N165, N166, N167, N168, N169, N170, N171, N172, N173, N174,
         N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N187, N188, N189, N190, N191, N192, N193, N194, N195, N197,
         N198, N199, N200, N201, N202, N203, N204, N205, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N269, N280, N281, N282, N283, N284,
         N285, N286, N287, N288, N289, N290, n1, n2, n8, n9, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n65, n141,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n443, n444, n451, n452, n461, n466,
         n469, n477, n478, n479, n480, n482, n483, n486, n487, n488, n517,
         n518, n520, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633;
  wire   [5:0] state;
  wire   [8:0] A1;
  wire   [9:0] C1;
  wire   [8:0] D1;
  wire   [9:0] E1;
  wire   [8:0] A2;
  wire   [9:0] C2;
  wire   [8:0] D2;
  wire   [9:0] E2;
  wire   [10:0] Gx;
  wire   [10:0] Gy;
  wire   [7:0] temp_sum;

  DFFSR \Gy_reg[0]  ( .D(n567), .CLK(clk), .R(n177), .S(1'b1), .Q(N269) );
  DFFSR \Gy_reg[10]  ( .D(n568), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[10]) );
  DFFSR \state_reg[0]  ( .D(n19), .CLK(clk), .R(n177), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n569), .CLK(clk), .R(n177), .S(1'b1), .Q(state[1])
         );
  DFFSR \C1_reg[9]  ( .D(n526), .CLK(clk), .R(n177), .S(1'b1), .Q(C1[9]) );
  DFFSR \Gx_reg[10]  ( .D(n580), .CLK(clk), .R(n176), .S(1'b1), .Q(Gx[10]) );
  DFFSR \state_reg[3]  ( .D(n21), .CLK(clk), .R(n176), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(n20), .CLK(clk), .R(n176), .S(1'b1), .Q(state[2])
         );
  DFFSR \A1_reg[0]  ( .D(n418), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[0]) );
  DFFSR \A1_reg[1]  ( .D(n417), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[1]) );
  DFFSR \A1_reg[2]  ( .D(n416), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[2]) );
  DFFSR \A1_reg[3]  ( .D(n415), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[3]) );
  DFFSR \A1_reg[4]  ( .D(n414), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[4]) );
  DFFSR \A1_reg[5]  ( .D(n413), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[5]) );
  DFFSR \A1_reg[6]  ( .D(n412), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[6]) );
  DFFSR \A1_reg[7]  ( .D(n411), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[7]) );
  DFFSR \A1_reg[8]  ( .D(n410), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[8]) );
  DFFSR \B1_reg[0]  ( .D(n436), .CLK(clk), .R(n175), .S(1'b1), .Q(N197) );
  DFFSR \B1_reg[1]  ( .D(n435), .CLK(clk), .R(n175), .S(1'b1), .Q(N198) );
  DFFSR \B1_reg[2]  ( .D(n434), .CLK(clk), .R(n175), .S(1'b1), .Q(N199) );
  DFFSR \B1_reg[3]  ( .D(n433), .CLK(clk), .R(n175), .S(1'b1), .Q(N200) );
  DFFSR \B1_reg[4]  ( .D(n432), .CLK(clk), .R(n175), .S(1'b1), .Q(N201) );
  DFFSR \B1_reg[5]  ( .D(n431), .CLK(clk), .R(n175), .S(1'b1), .Q(N202) );
  DFFSR \B1_reg[6]  ( .D(n430), .CLK(clk), .R(n175), .S(1'b1), .Q(N203) );
  DFFSR \B1_reg[7]  ( .D(n429), .CLK(clk), .R(n175), .S(1'b1), .Q(N204) );
  DFFSR \B1_reg[8]  ( .D(n428), .CLK(clk), .R(n175), .S(1'b1), .Q(N205) );
  DFFSR \C1_reg[1]  ( .D(n534), .CLK(clk), .R(n175), .S(1'b1), .Q(C1[1]) );
  DFFSR \C1_reg[2]  ( .D(n533), .CLK(clk), .R(n175), .S(1'b1), .Q(C1[2]) );
  DFFSR \C1_reg[3]  ( .D(n532), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[3]) );
  DFFSR \C1_reg[4]  ( .D(n531), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[4]) );
  DFFSR \C1_reg[5]  ( .D(n530), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[5]) );
  DFFSR \C1_reg[6]  ( .D(n529), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[6]) );
  DFFSR \C1_reg[7]  ( .D(n528), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[7]) );
  DFFSR \C1_reg[8]  ( .D(n527), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[8]) );
  DFFSR \D1_reg[0]  ( .D(n483), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[0]) );
  DFFSR \D1_reg[1]  ( .D(n482), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[1]) );
  DFFSR \D1_reg[2]  ( .D(n480), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[2]) );
  DFFSR \D1_reg[3]  ( .D(n479), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[3]) );
  DFFSR \D1_reg[4]  ( .D(n478), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[4]) );
  DFFSR \D1_reg[5]  ( .D(n477), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[5]) );
  DFFSR \D1_reg[6]  ( .D(n469), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[6]) );
  DFFSR \D1_reg[7]  ( .D(n466), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[7]) );
  DFFSR \D1_reg[8]  ( .D(n461), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[8]) );
  DFFSR \E1_reg[0]  ( .D(n553), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[0]) );
  DFFSR \E1_reg[1]  ( .D(n552), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[1]) );
  DFFSR \E1_reg[2]  ( .D(n551), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[2]) );
  DFFSR \E1_reg[3]  ( .D(n550), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[3]) );
  DFFSR \E1_reg[4]  ( .D(n549), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[4]) );
  DFFSR \E1_reg[5]  ( .D(n548), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[5]) );
  DFFSR \E1_reg[6]  ( .D(n547), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[6]) );
  DFFSR \E1_reg[7]  ( .D(n546), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[7]) );
  DFFSR \E1_reg[8]  ( .D(n545), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[8]) );
  DFFSR \E1_reg[9]  ( .D(n544), .CLK(clk), .R(n172), .S(1'b1), .Q(E1[9]) );
  DFFSR \A2_reg[0]  ( .D(n427), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[0]) );
  DFFSR \A2_reg[1]  ( .D(n426), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[1]) );
  DFFSR \A2_reg[2]  ( .D(n425), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[2]) );
  DFFSR \A2_reg[3]  ( .D(n424), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[3]) );
  DFFSR \A2_reg[4]  ( .D(n423), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[4]) );
  DFFSR \A2_reg[5]  ( .D(n422), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[5]) );
  DFFSR \A2_reg[6]  ( .D(n421), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[6]) );
  DFFSR \A2_reg[7]  ( .D(n420), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[7]) );
  DFFSR \A2_reg[8]  ( .D(n419), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[8]) );
  DFFSR \B2_reg[0]  ( .D(n452), .CLK(clk), .R(n172), .S(1'b1), .Q(N207) );
  DFFSR \B2_reg[1]  ( .D(n451), .CLK(clk), .R(n172), .S(1'b1), .Q(N208) );
  DFFSR \B2_reg[2]  ( .D(n444), .CLK(clk), .R(n171), .S(1'b1), .Q(N209) );
  DFFSR \B2_reg[3]  ( .D(n443), .CLK(clk), .R(n171), .S(1'b1), .Q(N210) );
  DFFSR \B2_reg[4]  ( .D(n441), .CLK(clk), .R(n171), .S(1'b1), .Q(N211) );
  DFFSR \B2_reg[5]  ( .D(n440), .CLK(clk), .R(n171), .S(1'b1), .Q(N212) );
  DFFSR \B2_reg[6]  ( .D(n439), .CLK(clk), .R(n171), .S(1'b1), .Q(N213) );
  DFFSR \B2_reg[7]  ( .D(n438), .CLK(clk), .R(n171), .S(1'b1), .Q(N214) );
  DFFSR \B2_reg[8]  ( .D(n437), .CLK(clk), .R(n171), .S(1'b1), .Q(N215) );
  DFFSR \D2_reg[0]  ( .D(n525), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[0]) );
  DFFSR \D2_reg[1]  ( .D(n524), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[1]) );
  DFFSR \D2_reg[2]  ( .D(n523), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[2]) );
  DFFSR \D2_reg[3]  ( .D(n520), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[3]) );
  DFFSR \D2_reg[4]  ( .D(n518), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[4]) );
  DFFSR \D2_reg[5]  ( .D(n517), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[5]) );
  DFFSR \D2_reg[6]  ( .D(n488), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[6]) );
  DFFSR \D2_reg[7]  ( .D(n487), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[7]) );
  DFFSR \D2_reg[8]  ( .D(n486), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[8]) );
  DFFSR \E2_reg[0]  ( .D(n563), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[0]) );
  DFFSR \E2_reg[1]  ( .D(n562), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[1]) );
  DFFSR \E2_reg[2]  ( .D(n561), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[2]) );
  DFFSR \E2_reg[3]  ( .D(n560), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[3]) );
  DFFSR \E2_reg[4]  ( .D(n559), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[4]) );
  DFFSR \E2_reg[5]  ( .D(n558), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[5]) );
  DFFSR \E2_reg[6]  ( .D(n557), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[6]) );
  DFFSR \E2_reg[7]  ( .D(n556), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[7]) );
  DFFSR \E2_reg[8]  ( .D(n555), .CLK(clk), .R(n169), .S(1'b1), .Q(E2[8]) );
  DFFSR \E2_reg[9]  ( .D(n554), .CLK(clk), .R(n169), .S(1'b1), .Q(E2[9]) );
  DFFSR o_gradient_data_ready_reg ( .D(n565), .CLK(clk), .R(n169), .S(1'b1), 
        .Q(o_gradient_data_ready) );
  DFFSR \Gx_reg[0]  ( .D(n570), .CLK(clk), .R(n169), .S(1'b1), .Q(N258) );
  DFFSR \Gx_reg[1]  ( .D(n571), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[1]) );
  DFFSR \Gx_reg[2]  ( .D(n572), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[2]) );
  DFFSR \Gx_reg[3]  ( .D(n573), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[3]) );
  DFFSR \Gx_reg[4]  ( .D(n574), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[4]) );
  DFFSR \Gx_reg[5]  ( .D(n575), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[5]) );
  DFFSR \Gx_reg[6]  ( .D(n576), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[6]) );
  DFFSR \Gx_reg[7]  ( .D(n577), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[7]) );
  DFFSR \Gx_reg[8]  ( .D(n578), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[8]) );
  DFFSR \Gx_reg[9]  ( .D(n579), .CLK(clk), .R(n168), .S(1'b1), .Q(Gx[9]) );
  DFFSR \C2_reg[1]  ( .D(n543), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[1]) );
  DFFSR \C2_reg[2]  ( .D(n542), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[2]) );
  DFFSR \C2_reg[3]  ( .D(n541), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[3]) );
  DFFSR \C2_reg[4]  ( .D(n540), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[4]) );
  DFFSR \C2_reg[5]  ( .D(n539), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[5]) );
  DFFSR \C2_reg[6]  ( .D(n538), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[6]) );
  DFFSR \C2_reg[7]  ( .D(n537), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[7]) );
  DFFSR \C2_reg[8]  ( .D(n536), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[8]) );
  DFFSR \C2_reg[9]  ( .D(n535), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[9]) );
  DFFSR \Gy_reg[1]  ( .D(n589), .CLK(clk), .R(n168), .S(1'b1), .Q(Gy[1]) );
  DFFSR \Gy_reg[2]  ( .D(n588), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[2]) );
  DFFSR \Gy_reg[3]  ( .D(n587), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[3]) );
  DFFSR \Gy_reg[4]  ( .D(n586), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[4]) );
  DFFSR \Gy_reg[5]  ( .D(n585), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[5]) );
  DFFSR \Gy_reg[6]  ( .D(n584), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[6]) );
  DFFSR \Gy_reg[7]  ( .D(n583), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[7]) );
  DFFSR \Gy_reg[8]  ( .D(n582), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[8]) );
  DFFSR \Gy_reg[9]  ( .D(n581), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[9]) );
  DFFSR \temp_sum_reg[0]  ( .D(n590), .CLK(clk), .R(n141), .S(1'b1), .Q(
        temp_sum[0]) );
  DFFSR \o_processed_sum_reg[0]  ( .D(temp_sum[0]), .CLK(clk), .R(n141), .S(
        1'b1), .Q(o_processed_sum[0]) );
  DFFSR \temp_sum_reg[1]  ( .D(n591), .CLK(clk), .R(n141), .S(1'b1), .Q(
        temp_sum[1]) );
  DFFSR \o_processed_sum_reg[1]  ( .D(temp_sum[1]), .CLK(clk), .R(n141), .S(
        1'b1), .Q(o_processed_sum[1]) );
  DFFSR \temp_sum_reg[2]  ( .D(n592), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[2]) );
  DFFSR \o_processed_sum_reg[2]  ( .D(temp_sum[2]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[2]) );
  DFFSR \temp_sum_reg[3]  ( .D(n593), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[3]) );
  DFFSR \o_processed_sum_reg[3]  ( .D(temp_sum[3]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[3]) );
  DFFSR \temp_sum_reg[4]  ( .D(n594), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[4]) );
  DFFSR \o_processed_sum_reg[4]  ( .D(temp_sum[4]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[4]) );
  DFFSR \temp_sum_reg[5]  ( .D(n595), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[5]) );
  DFFSR \o_processed_sum_reg[5]  ( .D(temp_sum[5]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[5]) );
  DFFSR \temp_sum_reg[6]  ( .D(n596), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[6]) );
  DFFSR \o_processed_sum_reg[6]  ( .D(temp_sum[6]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[6]) );
  DFFSR \temp_sum_reg[7]  ( .D(n597), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[7]) );
  DFFSR \o_processed_sum_reg[7]  ( .D(temp_sum[7]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[7]) );
  AND2X2 U157 ( .A(n630), .B(n623), .Y(n614) );
  AND2X2 U160 ( .A(n633), .B(n632), .Y(n600) );
  OR2X1 U458 ( .A(n625), .B(n624), .Y(n626) );
  NAND3X1 U459 ( .A(n623), .B(n622), .C(n408), .Y(n627) );
  OR2X1 U462 ( .A(n619), .B(n618), .Y(n620) );
  NAND3X1 U464 ( .A(n615), .B(n622), .C(n614), .Y(n621) );
  OAI21X1 U465 ( .A(n622), .B(n409), .C(n613), .Y(n569) );
  NAND2X1 U467 ( .A(n564), .B(n617), .Y(n611) );
  NAND3X1 U469 ( .A(n628), .B(n632), .C(n629), .Y(n612) );
  OR2X1 U472 ( .A(n619), .B(n625), .Y(n608) );
  NAND3X1 U475 ( .A(n629), .B(n622), .C(n606), .Y(n609) );
  NAND2X1 U476 ( .A(i_gradient_start), .B(n566), .Y(n606) );
  NAND2X1 U477 ( .A(n604), .B(n603), .Y(n622) );
  NOR2X1 U478 ( .A(n602), .B(n601), .Y(n603) );
  NAND3X1 U479 ( .A(n630), .B(n629), .C(n610), .Y(n601) );
  NAND3X1 U482 ( .A(n631), .B(n628), .C(n600), .Y(n602) );
  NAND3X1 U484 ( .A(state[2]), .B(n17), .C(state[3]), .Y(n633) );
  NOR2X1 U487 ( .A(n599), .B(n598), .Y(n604) );
  NAND3X1 U488 ( .A(n605), .B(n616), .C(n408), .Y(n598) );
  NAND2X1 U490 ( .A(n16), .B(n2), .Y(n605) );
  NAND3X1 U491 ( .A(n617), .B(n607), .C(n623), .Y(n599) );
  NAND2X1 U492 ( .A(n9), .B(n17), .Y(n623) );
  NAND2X1 U493 ( .A(n22), .B(n9), .Y(n607) );
  edge_detection_7_DW01_add_0 add_231 ( .A({Gx[10:1], N258}), .B({Gy[10:1], 
        N269}), .CI(1'b0), .SUM({N290, N289, N288, N287, N286, N285, N284, 
        N283, N282, N281, N280}) );
  edge_detection_7_DW01_add_1 add_219 ( .A({C2[9], C2[9:1], 1'b0}), .B({E2[9], 
        E2}), .CI(1'b0), .SUM({N257, N256, N255, N254, N253, N252, N251, N250, 
        N249, N248, N247}) );
  edge_detection_7_DW01_add_2 add_218 ( .A({C1[9], C1[9:1], 1'b0}), .B({E1[9], 
        E1}), .CI(1'b0), .SUM({N246, N245, N244, N243, N242, N241, N240, N239, 
        N238, N237, N236}) );
  edge_detection_7_DW01_add_3 add_214 ( .A({A2[8], A2}), .B({D2[8], D2}), .CI(
        1'b0), .SUM({N235, N234, N233, N232, N231, N230, N229, N228, N227, 
        N226}) );
  edge_detection_7_DW01_add_4 add_213 ( .A({A1[8], A1}), .B({D1[8], D1}), .CI(
        1'b0), .SUM({N225, N224, N223, N222, N221, N220, N219, N218, N217, 
        N216}) );
  edge_detection_7_DW01_sub_2 sub_204 ( .A({1'b0, P2}), .B({1'b0, P8}), .CI(
        1'b0), .DIFF({N195, N194, N193, N192, N191, N190, N189, N188, N187})
         );
  edge_detection_7_DW01_sub_3 sub_203 ( .A({1'b0, P8}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N186, N185, N184, N183, N182, N181, N180, N179, N178})
         );
  edge_detection_7_DW01_sub_4 sub_202 ( .A({1'b0, P1}), .B({1'b0, P7}), .CI(
        1'b0), .DIFF({N177, N176, N175, N174, N173, N172, N171, N170, N169})
         );
  edge_detection_7_DW01_sub_5 sub_201 ( .A({1'b0, P5}), .B({1'b0, P3}), .CI(
        1'b0), .DIFF({N168, N167, N166, N165, N164, N163, N162, N161, N160})
         );
  edge_detection_7_DW01_sub_6 sub_200 ( .A({1'b0, P0}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N159, N158, N157, N156, N155, N154, N153, N152, N151})
         );
  edge_detection_7_DW01_sub_7 sub_199 ( .A({1'b0, P2}), .B({1'b0, P0}), .CI(
        1'b0), .DIFF({N150, N149, N148, N147, N146, N145, N144, N143, N142})
         );
  NAND2X1 U5 ( .A(n2), .B(n9), .Y(n1) );
  AND2X2 U6 ( .A(n409), .B(n178), .Y(n2) );
  AND2X2 U12 ( .A(state[3]), .B(n179), .Y(n8) );
  AND2X2 U13 ( .A(state[2]), .B(n235), .Y(n9) );
  AND2X2 U52 ( .A(n235), .B(n179), .Y(n16) );
  AND2X2 U128 ( .A(state[1]), .B(n178), .Y(n17) );
  AND2X2 U155 ( .A(state[0]), .B(state[1]), .Y(n18) );
  OR2X2 U156 ( .A(n609), .B(n608), .Y(n19) );
  OR2X2 U158 ( .A(n621), .B(n620), .Y(n20) );
  OR2X2 U159 ( .A(n627), .B(n626), .Y(n21) );
  AND2X2 U161 ( .A(state[0]), .B(n409), .Y(n22) );
  OR2X2 U162 ( .A(n260), .B(Gx[6]), .Y(n264) );
  OR2X2 U163 ( .A(n268), .B(Gx[8]), .Y(n272) );
  OR2X2 U164 ( .A(N258), .B(Gx[1]), .Y(n244) );
  BUFX2 U165 ( .A(n323), .Y(n29) );
  BUFX2 U166 ( .A(n323), .Y(n28) );
  BUFX2 U167 ( .A(n323), .Y(n26) );
  BUFX2 U168 ( .A(n323), .Y(n27) );
  INVX2 U169 ( .A(n630), .Y(n25) );
  INVX2 U170 ( .A(n1), .Y(n384) );
  INVX2 U171 ( .A(n629), .Y(n24) );
  BUFX2 U172 ( .A(n323), .Y(n30) );
  INVX2 U173 ( .A(n631), .Y(n404) );
  AND2X2 U174 ( .A(n631), .B(n1), .Y(n23) );
  INVX2 U175 ( .A(n615), .Y(n385) );
  BUFX2 U176 ( .A(n_rst), .Y(n65) );
  BUFX2 U177 ( .A(n_rst), .Y(n141) );
  BUFX2 U178 ( .A(n_rst), .Y(n169) );
  BUFX2 U179 ( .A(n_rst), .Y(n170) );
  BUFX2 U180 ( .A(n_rst), .Y(n171) );
  BUFX2 U181 ( .A(n_rst), .Y(n172) );
  BUFX2 U182 ( .A(n_rst), .Y(n173) );
  BUFX2 U183 ( .A(n_rst), .Y(n174) );
  BUFX2 U184 ( .A(n_rst), .Y(n176) );
  BUFX2 U185 ( .A(n_rst), .Y(n168) );
  BUFX2 U186 ( .A(n_rst), .Y(n175) );
  BUFX2 U187 ( .A(n_rst), .Y(n177) );
  OR2X1 U188 ( .A(n244), .B(Gx[2]), .Y(n248) );
  OR2X1 U189 ( .A(n264), .B(Gx[7]), .Y(n268) );
  OR2X1 U190 ( .A(n256), .B(Gx[5]), .Y(n260) );
  OR2X1 U191 ( .A(n252), .B(Gx[4]), .Y(n256) );
  OR2X1 U192 ( .A(n248), .B(Gx[3]), .Y(n252) );
  INVX2 U195 ( .A(state[1]), .Y(n409) );
  INVX2 U196 ( .A(state[0]), .Y(n178) );
  NAND3X1 U197 ( .A(state[2]), .B(state[3]), .C(n2), .Y(n632) );
  INVX2 U198 ( .A(state[2]), .Y(n179) );
  NAND2X1 U199 ( .A(n17), .B(n8), .Y(n631) );
  INVX2 U200 ( .A(state[3]), .Y(n235) );
  NAND2X1 U201 ( .A(n16), .B(n22), .Y(n628) );
  INVX2 U202 ( .A(n628), .Y(n323) );
  MUX2X1 U203 ( .B(N205), .A(N168), .S(n26), .Y(n180) );
  INVX2 U204 ( .A(n180), .Y(n428) );
  NAND2X1 U205 ( .A(n16), .B(n17), .Y(n629) );
  INVX2 U206 ( .A(C1[9]), .Y(n182) );
  INVX2 U207 ( .A(N205), .Y(n181) );
  MUX2X1 U208 ( .B(n182), .A(n181), .S(n24), .Y(n526) );
  MUX2X1 U209 ( .B(N204), .A(N167), .S(n26), .Y(n183) );
  INVX2 U210 ( .A(n183), .Y(n429) );
  INVX2 U211 ( .A(C1[8]), .Y(n185) );
  INVX2 U212 ( .A(N204), .Y(n184) );
  MUX2X1 U213 ( .B(n185), .A(n184), .S(n24), .Y(n527) );
  MUX2X1 U214 ( .B(N203), .A(N166), .S(n26), .Y(n186) );
  INVX2 U215 ( .A(n186), .Y(n430) );
  INVX2 U216 ( .A(C1[7]), .Y(n188) );
  INVX2 U217 ( .A(N203), .Y(n187) );
  MUX2X1 U218 ( .B(n188), .A(n187), .S(n24), .Y(n528) );
  MUX2X1 U219 ( .B(N202), .A(N165), .S(n26), .Y(n189) );
  INVX2 U220 ( .A(n189), .Y(n431) );
  INVX2 U221 ( .A(C1[6]), .Y(n191) );
  INVX2 U222 ( .A(N202), .Y(n190) );
  MUX2X1 U223 ( .B(n191), .A(n190), .S(n24), .Y(n529) );
  MUX2X1 U224 ( .B(N201), .A(N164), .S(n26), .Y(n192) );
  INVX2 U225 ( .A(n192), .Y(n432) );
  INVX2 U226 ( .A(C1[5]), .Y(n194) );
  INVX2 U227 ( .A(N201), .Y(n193) );
  MUX2X1 U228 ( .B(n194), .A(n193), .S(n24), .Y(n530) );
  MUX2X1 U229 ( .B(N200), .A(N163), .S(n26), .Y(n195) );
  INVX2 U230 ( .A(n195), .Y(n433) );
  INVX2 U231 ( .A(C1[4]), .Y(n197) );
  INVX2 U232 ( .A(N200), .Y(n196) );
  MUX2X1 U233 ( .B(n197), .A(n196), .S(n24), .Y(n531) );
  MUX2X1 U234 ( .B(N199), .A(N162), .S(n26), .Y(n198) );
  INVX2 U235 ( .A(n198), .Y(n434) );
  INVX2 U236 ( .A(C1[3]), .Y(n200) );
  INVX2 U237 ( .A(N199), .Y(n199) );
  MUX2X1 U238 ( .B(n200), .A(n199), .S(n24), .Y(n532) );
  MUX2X1 U239 ( .B(N198), .A(N161), .S(n26), .Y(n201) );
  INVX2 U240 ( .A(n201), .Y(n435) );
  INVX2 U241 ( .A(C1[2]), .Y(n203) );
  INVX2 U242 ( .A(N198), .Y(n202) );
  MUX2X1 U243 ( .B(n203), .A(n202), .S(n24), .Y(n533) );
  MUX2X1 U244 ( .B(N197), .A(N160), .S(n26), .Y(n204) );
  INVX2 U245 ( .A(n204), .Y(n436) );
  INVX2 U246 ( .A(C1[1]), .Y(n206) );
  INVX2 U247 ( .A(N197), .Y(n205) );
  MUX2X1 U248 ( .B(n206), .A(n205), .S(n24), .Y(n534) );
  MUX2X1 U249 ( .B(A1[8]), .A(N150), .S(n26), .Y(n207) );
  INVX2 U250 ( .A(n207), .Y(n410) );
  MUX2X1 U251 ( .B(A1[7]), .A(N149), .S(n26), .Y(n208) );
  INVX2 U252 ( .A(n208), .Y(n411) );
  MUX2X1 U253 ( .B(A1[6]), .A(N148), .S(n26), .Y(n209) );
  INVX2 U254 ( .A(n209), .Y(n412) );
  MUX2X1 U255 ( .B(A1[5]), .A(N147), .S(n26), .Y(n210) );
  INVX2 U256 ( .A(n210), .Y(n413) );
  MUX2X1 U257 ( .B(A1[4]), .A(N146), .S(n27), .Y(n211) );
  INVX2 U258 ( .A(n211), .Y(n414) );
  MUX2X1 U259 ( .B(A1[3]), .A(N145), .S(n27), .Y(n212) );
  INVX2 U260 ( .A(n212), .Y(n415) );
  MUX2X1 U261 ( .B(A1[2]), .A(N144), .S(n27), .Y(n213) );
  INVX2 U262 ( .A(n213), .Y(n416) );
  MUX2X1 U263 ( .B(A1[1]), .A(N143), .S(n27), .Y(n214) );
  INVX2 U264 ( .A(n214), .Y(n417) );
  MUX2X1 U265 ( .B(A1[0]), .A(N142), .S(n27), .Y(n215) );
  INVX2 U266 ( .A(n215), .Y(n418) );
  MUX2X1 U267 ( .B(D1[8]), .A(N186), .S(n27), .Y(n216) );
  INVX2 U268 ( .A(n216), .Y(n461) );
  MUX2X1 U269 ( .B(D1[7]), .A(N185), .S(n27), .Y(n217) );
  INVX2 U270 ( .A(n217), .Y(n466) );
  MUX2X1 U271 ( .B(D1[6]), .A(N184), .S(n27), .Y(n218) );
  INVX2 U272 ( .A(n218), .Y(n469) );
  MUX2X1 U273 ( .B(D1[5]), .A(N183), .S(n27), .Y(n219) );
  INVX2 U274 ( .A(n219), .Y(n477) );
  MUX2X1 U275 ( .B(D1[4]), .A(N182), .S(n27), .Y(n220) );
  INVX2 U276 ( .A(n220), .Y(n478) );
  MUX2X1 U277 ( .B(D1[3]), .A(N181), .S(n27), .Y(n221) );
  INVX2 U278 ( .A(n221), .Y(n479) );
  MUX2X1 U279 ( .B(D1[2]), .A(N180), .S(n27), .Y(n222) );
  INVX2 U280 ( .A(n222), .Y(n480) );
  MUX2X1 U281 ( .B(D1[1]), .A(N179), .S(n27), .Y(n223) );
  INVX2 U282 ( .A(n223), .Y(n482) );
  MUX2X1 U283 ( .B(D1[0]), .A(N178), .S(n28), .Y(n224) );
  INVX2 U284 ( .A(n224), .Y(n483) );
  NAND2X1 U285 ( .A(n16), .B(n18), .Y(n630) );
  MUX2X1 U286 ( .B(E1[9]), .A(N225), .S(n25), .Y(n225) );
  INVX2 U287 ( .A(n225), .Y(n544) );
  MUX2X1 U288 ( .B(E1[8]), .A(N224), .S(n25), .Y(n226) );
  INVX2 U289 ( .A(n226), .Y(n545) );
  MUX2X1 U290 ( .B(E1[7]), .A(N223), .S(n25), .Y(n227) );
  INVX2 U291 ( .A(n227), .Y(n546) );
  MUX2X1 U292 ( .B(E1[6]), .A(N222), .S(n25), .Y(n228) );
  INVX2 U293 ( .A(n228), .Y(n547) );
  MUX2X1 U294 ( .B(E1[5]), .A(N221), .S(n25), .Y(n229) );
  INVX2 U295 ( .A(n229), .Y(n548) );
  MUX2X1 U296 ( .B(E1[4]), .A(N220), .S(n25), .Y(n230) );
  INVX2 U297 ( .A(n230), .Y(n549) );
  MUX2X1 U298 ( .B(E1[3]), .A(N219), .S(n25), .Y(n231) );
  INVX2 U299 ( .A(n231), .Y(n550) );
  MUX2X1 U300 ( .B(E1[2]), .A(N218), .S(n25), .Y(n232) );
  INVX2 U301 ( .A(n232), .Y(n551) );
  MUX2X1 U302 ( .B(E1[1]), .A(N217), .S(n25), .Y(n233) );
  INVX2 U303 ( .A(n233), .Y(n552) );
  MUX2X1 U304 ( .B(E1[0]), .A(N216), .S(n25), .Y(n234) );
  INVX2 U305 ( .A(n234), .Y(n553) );
  INVX2 U306 ( .A(N236), .Y(n237) );
  OAI21X1 U307 ( .A(n404), .B(n23), .C(N258), .Y(n236) );
  OAI21X1 U308 ( .A(n1), .B(n237), .C(n236), .Y(n570) );
  INVX2 U309 ( .A(N237), .Y(n240) );
  XOR2X1 U310 ( .A(Gx[1]), .B(N258), .Y(n238) );
  AOI22X1 U311 ( .A(n238), .B(n404), .C(Gx[1]), .D(n23), .Y(n239) );
  OAI21X1 U312 ( .A(n1), .B(n240), .C(n239), .Y(n571) );
  INVX2 U313 ( .A(N238), .Y(n243) );
  XOR2X1 U314 ( .A(n244), .B(Gx[2]), .Y(n241) );
  AOI22X1 U315 ( .A(n241), .B(n404), .C(Gx[2]), .D(n23), .Y(n242) );
  OAI21X1 U316 ( .A(n1), .B(n243), .C(n242), .Y(n572) );
  INVX2 U317 ( .A(N239), .Y(n247) );
  XOR2X1 U318 ( .A(n248), .B(Gx[3]), .Y(n245) );
  AOI22X1 U319 ( .A(n245), .B(n404), .C(Gx[3]), .D(n23), .Y(n246) );
  OAI21X1 U320 ( .A(n1), .B(n247), .C(n246), .Y(n573) );
  INVX2 U321 ( .A(N240), .Y(n251) );
  XOR2X1 U322 ( .A(n252), .B(Gx[4]), .Y(n249) );
  AOI22X1 U323 ( .A(n249), .B(n404), .C(Gx[4]), .D(n23), .Y(n250) );
  OAI21X1 U324 ( .A(n1), .B(n251), .C(n250), .Y(n574) );
  INVX2 U325 ( .A(N241), .Y(n255) );
  XOR2X1 U326 ( .A(n256), .B(Gx[5]), .Y(n253) );
  AOI22X1 U327 ( .A(n253), .B(n404), .C(Gx[5]), .D(n23), .Y(n254) );
  OAI21X1 U328 ( .A(n1), .B(n255), .C(n254), .Y(n575) );
  INVX2 U329 ( .A(N242), .Y(n259) );
  XOR2X1 U330 ( .A(n260), .B(Gx[6]), .Y(n257) );
  AOI22X1 U331 ( .A(n257), .B(n404), .C(Gx[6]), .D(n23), .Y(n258) );
  OAI21X1 U332 ( .A(n1), .B(n259), .C(n258), .Y(n576) );
  INVX2 U333 ( .A(N243), .Y(n263) );
  XOR2X1 U334 ( .A(n264), .B(Gx[7]), .Y(n261) );
  AOI22X1 U335 ( .A(n261), .B(n404), .C(Gx[7]), .D(n23), .Y(n262) );
  OAI21X1 U336 ( .A(n1), .B(n263), .C(n262), .Y(n577) );
  INVX2 U337 ( .A(N244), .Y(n267) );
  XOR2X1 U338 ( .A(n268), .B(Gx[8]), .Y(n265) );
  AOI22X1 U339 ( .A(n265), .B(n404), .C(Gx[8]), .D(n23), .Y(n266) );
  OAI21X1 U340 ( .A(n1), .B(n267), .C(n266), .Y(n578) );
  INVX2 U341 ( .A(N245), .Y(n271) );
  XOR2X1 U342 ( .A(n272), .B(Gx[9]), .Y(n269) );
  AOI22X1 U343 ( .A(n269), .B(n404), .C(Gx[9]), .D(n23), .Y(n270) );
  OAI21X1 U344 ( .A(n1), .B(n271), .C(n270), .Y(n579) );
  NOR2X1 U345 ( .A(Gx[9]), .B(n272), .Y(n273) );
  XNOR2X1 U346 ( .A(n273), .B(Gx[10]), .Y(n274) );
  AOI22X1 U347 ( .A(n23), .B(Gx[10]), .C(n274), .D(n404), .Y(n276) );
  NAND2X1 U348 ( .A(N246), .B(n384), .Y(n275) );
  NAND2X1 U349 ( .A(n276), .B(n275), .Y(n580) );
  NAND2X1 U350 ( .A(n8), .B(n18), .Y(n615) );
  MUX2X1 U351 ( .B(N215), .A(N177), .S(n28), .Y(n277) );
  INVX2 U352 ( .A(n277), .Y(n437) );
  INVX2 U353 ( .A(C2[9]), .Y(n279) );
  INVX2 U354 ( .A(N215), .Y(n278) );
  MUX2X1 U355 ( .B(n279), .A(n278), .S(n24), .Y(n535) );
  MUX2X1 U356 ( .B(N214), .A(N176), .S(n28), .Y(n280) );
  INVX2 U357 ( .A(n280), .Y(n438) );
  INVX2 U358 ( .A(C2[8]), .Y(n282) );
  INVX2 U359 ( .A(N214), .Y(n281) );
  MUX2X1 U360 ( .B(n282), .A(n281), .S(n24), .Y(n536) );
  MUX2X1 U361 ( .B(N213), .A(N175), .S(n28), .Y(n283) );
  INVX2 U362 ( .A(n283), .Y(n439) );
  INVX2 U363 ( .A(C2[7]), .Y(n285) );
  INVX2 U364 ( .A(N213), .Y(n284) );
  MUX2X1 U365 ( .B(n285), .A(n284), .S(n24), .Y(n537) );
  MUX2X1 U366 ( .B(N212), .A(N174), .S(n28), .Y(n286) );
  INVX2 U367 ( .A(n286), .Y(n440) );
  INVX2 U368 ( .A(C2[6]), .Y(n288) );
  INVX2 U369 ( .A(N212), .Y(n287) );
  MUX2X1 U370 ( .B(n288), .A(n287), .S(n24), .Y(n538) );
  MUX2X1 U371 ( .B(N211), .A(N173), .S(n28), .Y(n289) );
  INVX2 U372 ( .A(n289), .Y(n441) );
  INVX2 U373 ( .A(C2[5]), .Y(n291) );
  INVX2 U374 ( .A(N211), .Y(n290) );
  MUX2X1 U375 ( .B(n291), .A(n290), .S(n24), .Y(n539) );
  MUX2X1 U376 ( .B(N210), .A(N172), .S(n28), .Y(n292) );
  INVX2 U377 ( .A(n292), .Y(n443) );
  INVX2 U378 ( .A(C2[4]), .Y(n294) );
  INVX2 U379 ( .A(N210), .Y(n293) );
  MUX2X1 U380 ( .B(n294), .A(n293), .S(n24), .Y(n540) );
  MUX2X1 U381 ( .B(N209), .A(N171), .S(n28), .Y(n295) );
  INVX2 U382 ( .A(n295), .Y(n444) );
  INVX2 U383 ( .A(C2[3]), .Y(n297) );
  INVX2 U384 ( .A(N209), .Y(n296) );
  MUX2X1 U385 ( .B(n297), .A(n296), .S(n24), .Y(n541) );
  MUX2X1 U386 ( .B(N208), .A(N170), .S(n28), .Y(n298) );
  INVX2 U387 ( .A(n298), .Y(n451) );
  INVX2 U388 ( .A(C2[2]), .Y(n300) );
  INVX2 U389 ( .A(N208), .Y(n299) );
  MUX2X1 U390 ( .B(n300), .A(n299), .S(n24), .Y(n542) );
  MUX2X1 U391 ( .B(N207), .A(N169), .S(n28), .Y(n301) );
  INVX2 U392 ( .A(n301), .Y(n452) );
  INVX2 U393 ( .A(C2[1]), .Y(n304) );
  INVX2 U394 ( .A(N207), .Y(n302) );
  MUX2X1 U395 ( .B(n304), .A(n302), .S(n24), .Y(n543) );
  MUX2X1 U396 ( .B(A2[8]), .A(N159), .S(n28), .Y(n305) );
  INVX2 U397 ( .A(n305), .Y(n419) );
  MUX2X1 U398 ( .B(A2[7]), .A(N158), .S(n28), .Y(n306) );
  INVX2 U399 ( .A(n306), .Y(n420) );
  MUX2X1 U400 ( .B(A2[6]), .A(N157), .S(n28), .Y(n307) );
  INVX2 U401 ( .A(n307), .Y(n421) );
  MUX2X1 U402 ( .B(A2[5]), .A(N156), .S(n29), .Y(n308) );
  INVX2 U403 ( .A(n308), .Y(n422) );
  MUX2X1 U404 ( .B(A2[4]), .A(N155), .S(n29), .Y(n309) );
  INVX2 U405 ( .A(n309), .Y(n423) );
  MUX2X1 U406 ( .B(A2[3]), .A(N154), .S(n29), .Y(n310) );
  INVX2 U407 ( .A(n310), .Y(n424) );
  MUX2X1 U408 ( .B(A2[2]), .A(N153), .S(n29), .Y(n311) );
  INVX2 U409 ( .A(n311), .Y(n425) );
  MUX2X1 U410 ( .B(A2[1]), .A(N152), .S(n29), .Y(n312) );
  INVX2 U411 ( .A(n312), .Y(n426) );
  MUX2X1 U412 ( .B(A2[0]), .A(N151), .S(n29), .Y(n313) );
  INVX2 U413 ( .A(n313), .Y(n427) );
  MUX2X1 U414 ( .B(D2[8]), .A(N195), .S(n29), .Y(n314) );
  INVX2 U415 ( .A(n314), .Y(n486) );
  MUX2X1 U416 ( .B(D2[7]), .A(N194), .S(n29), .Y(n316) );
  INVX2 U417 ( .A(n316), .Y(n487) );
  MUX2X1 U418 ( .B(D2[6]), .A(N193), .S(n29), .Y(n317) );
  INVX2 U419 ( .A(n317), .Y(n488) );
  MUX2X1 U420 ( .B(D2[5]), .A(N192), .S(n29), .Y(n318) );
  INVX2 U421 ( .A(n318), .Y(n517) );
  MUX2X1 U422 ( .B(D2[4]), .A(N191), .S(n29), .Y(n319) );
  INVX2 U423 ( .A(n319), .Y(n518) );
  MUX2X1 U424 ( .B(D2[3]), .A(N190), .S(n29), .Y(n320) );
  INVX2 U425 ( .A(n320), .Y(n520) );
  MUX2X1 U426 ( .B(D2[2]), .A(N189), .S(n29), .Y(n321) );
  INVX2 U427 ( .A(n321), .Y(n523) );
  MUX2X1 U428 ( .B(D2[1]), .A(N188), .S(n30), .Y(n322) );
  INVX2 U429 ( .A(n322), .Y(n524) );
  MUX2X1 U430 ( .B(D2[0]), .A(N187), .S(n30), .Y(n324) );
  INVX2 U431 ( .A(n324), .Y(n525) );
  MUX2X1 U432 ( .B(E2[9]), .A(N235), .S(n25), .Y(n325) );
  INVX2 U433 ( .A(n325), .Y(n554) );
  MUX2X1 U434 ( .B(E2[8]), .A(N234), .S(n25), .Y(n326) );
  INVX2 U435 ( .A(n326), .Y(n555) );
  MUX2X1 U436 ( .B(E2[7]), .A(N233), .S(n25), .Y(n327) );
  INVX2 U437 ( .A(n327), .Y(n556) );
  MUX2X1 U438 ( .B(E2[6]), .A(N232), .S(n25), .Y(n328) );
  INVX2 U439 ( .A(n328), .Y(n557) );
  MUX2X1 U440 ( .B(E2[5]), .A(N231), .S(n25), .Y(n329) );
  INVX2 U441 ( .A(n329), .Y(n558) );
  MUX2X1 U442 ( .B(E2[4]), .A(N230), .S(n25), .Y(n330) );
  INVX2 U443 ( .A(n330), .Y(n559) );
  MUX2X1 U444 ( .B(E2[3]), .A(N229), .S(n25), .Y(n331) );
  INVX2 U445 ( .A(n331), .Y(n560) );
  MUX2X1 U446 ( .B(E2[2]), .A(N228), .S(n25), .Y(n332) );
  INVX2 U447 ( .A(n332), .Y(n561) );
  MUX2X1 U448 ( .B(E2[1]), .A(N227), .S(n25), .Y(n333) );
  INVX2 U449 ( .A(n333), .Y(n562) );
  MUX2X1 U450 ( .B(E2[0]), .A(N226), .S(n25), .Y(n334) );
  INVX2 U451 ( .A(n334), .Y(n563) );
  INVX2 U452 ( .A(N247), .Y(n336) );
  NAND2X1 U453 ( .A(n1), .B(n615), .Y(n389) );
  INVX2 U454 ( .A(n389), .Y(n408) );
  OAI21X1 U455 ( .A(n385), .B(n408), .C(N269), .Y(n335) );
  OAI21X1 U456 ( .A(n1), .B(n336), .C(n335), .Y(n567) );
  INVX2 U457 ( .A(Gy[1]), .Y(n339) );
  XOR2X1 U460 ( .A(Gy[1]), .B(N269), .Y(n337) );
  AOI22X1 U461 ( .A(n337), .B(n385), .C(N248), .D(n384), .Y(n338) );
  OAI21X1 U463 ( .A(n389), .B(n339), .C(n338), .Y(n589) );
  INVX2 U466 ( .A(Gy[2]), .Y(n345) );
  INVX2 U468 ( .A(N269), .Y(n340) );
  NAND2X1 U470 ( .A(n340), .B(n339), .Y(n344) );
  XOR2X1 U471 ( .A(n344), .B(Gy[2]), .Y(n342) );
  AOI22X1 U473 ( .A(n342), .B(n385), .C(N249), .D(n384), .Y(n343) );
  OAI21X1 U474 ( .A(n389), .B(n345), .C(n343), .Y(n588) );
  INVX2 U480 ( .A(Gy[3]), .Y(n350) );
  INVX2 U481 ( .A(n344), .Y(n346) );
  NAND2X1 U483 ( .A(n346), .B(n345), .Y(n349) );
  XOR2X1 U485 ( .A(n349), .B(Gy[3]), .Y(n347) );
  AOI22X1 U486 ( .A(n347), .B(n385), .C(N250), .D(n384), .Y(n348) );
  OAI21X1 U489 ( .A(n389), .B(n350), .C(n348), .Y(n587) );
  INVX2 U494 ( .A(Gy[4]), .Y(n355) );
  INVX2 U495 ( .A(n349), .Y(n351) );
  NAND2X1 U496 ( .A(n351), .B(n350), .Y(n354) );
  XOR2X1 U497 ( .A(n354), .B(Gy[4]), .Y(n352) );
  AOI22X1 U498 ( .A(n352), .B(n385), .C(N251), .D(n384), .Y(n353) );
  OAI21X1 U499 ( .A(n389), .B(n355), .C(n353), .Y(n586) );
  INVX2 U500 ( .A(Gy[5]), .Y(n360) );
  INVX2 U501 ( .A(n354), .Y(n356) );
  NAND2X1 U502 ( .A(n356), .B(n355), .Y(n359) );
  XOR2X1 U503 ( .A(n359), .B(Gy[5]), .Y(n357) );
  AOI22X1 U504 ( .A(n357), .B(n385), .C(N252), .D(n384), .Y(n358) );
  OAI21X1 U505 ( .A(n389), .B(n360), .C(n358), .Y(n585) );
  INVX2 U506 ( .A(Gy[6]), .Y(n366) );
  INVX2 U507 ( .A(n359), .Y(n361) );
  NAND2X1 U508 ( .A(n361), .B(n360), .Y(n365) );
  XOR2X1 U509 ( .A(n365), .B(Gy[6]), .Y(n362) );
  AOI22X1 U510 ( .A(n362), .B(n385), .C(N253), .D(n384), .Y(n363) );
  OAI21X1 U511 ( .A(n389), .B(n366), .C(n363), .Y(n584) );
  INVX2 U512 ( .A(Gy[7]), .Y(n371) );
  INVX2 U513 ( .A(n365), .Y(n367) );
  NAND2X1 U514 ( .A(n367), .B(n366), .Y(n370) );
  XOR2X1 U515 ( .A(n370), .B(Gy[7]), .Y(n368) );
  AOI22X1 U516 ( .A(n368), .B(n385), .C(N254), .D(n384), .Y(n369) );
  OAI21X1 U517 ( .A(n389), .B(n371), .C(n369), .Y(n583) );
  INVX2 U518 ( .A(Gy[8]), .Y(n376) );
  INVX2 U519 ( .A(n370), .Y(n372) );
  NAND2X1 U520 ( .A(n372), .B(n371), .Y(n375) );
  XOR2X1 U521 ( .A(n375), .B(Gy[8]), .Y(n373) );
  AOI22X1 U522 ( .A(n373), .B(n385), .C(N255), .D(n384), .Y(n374) );
  OAI21X1 U523 ( .A(n389), .B(n376), .C(n374), .Y(n582) );
  INVX2 U524 ( .A(Gy[9]), .Y(n381) );
  INVX2 U525 ( .A(n375), .Y(n377) );
  NAND2X1 U526 ( .A(n377), .B(n376), .Y(n380) );
  XOR2X1 U527 ( .A(n380), .B(Gy[9]), .Y(n378) );
  AOI22X1 U528 ( .A(n378), .B(n385), .C(N256), .D(n384), .Y(n379) );
  OAI21X1 U529 ( .A(n389), .B(n381), .C(n379), .Y(n581) );
  INVX2 U530 ( .A(Gy[10]), .Y(n406) );
  INVX2 U531 ( .A(n380), .Y(n382) );
  NAND2X1 U532 ( .A(n382), .B(n381), .Y(n383) );
  XOR2X1 U533 ( .A(n383), .B(Gy[10]), .Y(n387) );
  AOI22X1 U534 ( .A(n387), .B(n385), .C(N257), .D(n384), .Y(n388) );
  OAI21X1 U535 ( .A(n406), .B(n389), .C(n388), .Y(n568) );
  NOR2X1 U536 ( .A(N290), .B(N289), .Y(n391) );
  INVX2 U537 ( .A(N288), .Y(n390) );
  AOI21X1 U538 ( .A(n391), .B(n390), .C(n632), .Y(n392) );
  INVX2 U539 ( .A(n392), .Y(n402) );
  INVX2 U540 ( .A(n632), .Y(n400) );
  MUX2X1 U541 ( .B(temp_sum[0]), .A(N280), .S(n400), .Y(n393) );
  NAND2X1 U542 ( .A(n402), .B(n393), .Y(n590) );
  MUX2X1 U543 ( .B(temp_sum[1]), .A(N281), .S(n400), .Y(n394) );
  NAND2X1 U544 ( .A(n402), .B(n394), .Y(n591) );
  MUX2X1 U545 ( .B(temp_sum[2]), .A(N282), .S(n400), .Y(n395) );
  NAND2X1 U546 ( .A(n402), .B(n395), .Y(n592) );
  MUX2X1 U547 ( .B(temp_sum[3]), .A(N283), .S(n400), .Y(n396) );
  NAND2X1 U548 ( .A(n402), .B(n396), .Y(n593) );
  MUX2X1 U549 ( .B(temp_sum[4]), .A(N284), .S(n400), .Y(n397) );
  NAND2X1 U550 ( .A(n402), .B(n397), .Y(n594) );
  MUX2X1 U551 ( .B(temp_sum[5]), .A(N285), .S(n400), .Y(n398) );
  NAND2X1 U552 ( .A(n402), .B(n398), .Y(n595) );
  MUX2X1 U553 ( .B(temp_sum[6]), .A(N286), .S(n400), .Y(n399) );
  NAND2X1 U554 ( .A(n402), .B(n399), .Y(n596) );
  MUX2X1 U555 ( .B(temp_sum[7]), .A(N287), .S(n400), .Y(n401) );
  NAND2X1 U556 ( .A(n402), .B(n401), .Y(n597) );
  NAND2X1 U557 ( .A(n22), .B(n8), .Y(n617) );
  NAND2X1 U558 ( .A(n9), .B(n18), .Y(n616) );
  NAND2X1 U559 ( .A(n2), .B(n8), .Y(n610) );
  OAI21X1 U560 ( .A(Gx[10]), .B(n610), .C(n632), .Y(n619) );
  INVX2 U561 ( .A(n607), .Y(n403) );
  NOR2X1 U562 ( .A(n404), .B(n403), .Y(n405) );
  OAI21X1 U563 ( .A(n617), .B(n406), .C(n405), .Y(n625) );
  INVX2 U564 ( .A(Gx[10]), .Y(n407) );
  OAI21X1 U565 ( .A(n610), .B(n407), .C(n616), .Y(n624) );
  INVX2 U566 ( .A(n624), .Y(n564) );
  OAI21X1 U567 ( .A(Gy[10]), .B(n617), .C(n616), .Y(n618) );
  INVX2 U568 ( .A(n633), .Y(n565) );
  INVX2 U569 ( .A(n605), .Y(n566) );
  NOR2X1 U570 ( .A(n612), .B(n611), .Y(n613) );
endmodule


module edge_detection_6_DW01_add_0 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [10:1] carry;

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_6_DW01_add_1 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1;
  wire   [10:1] carry;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  XOR2X1 U1 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  NAND2X1 U2 ( .A(B[1]), .B(A[1]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(carry[2]) );
endmodule


module edge_detection_6_DW01_add_2 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1;
  wire   [10:1] carry;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  XOR2X1 U1 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  NAND2X1 U2 ( .A(B[1]), .B(A[1]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(carry[2]) );
endmodule


module edge_detection_6_DW01_add_3 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;

  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_6_DW01_add_4 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;

  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_6_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  INVX1 U1 ( .A(B[0]), .Y(n8) );
  INVX1 U2 ( .A(B[7]), .Y(n2) );
  INVX1 U3 ( .A(B[5]), .Y(n3) );
  INVX1 U4 ( .A(B[6]), .Y(n9) );
  INVX1 U5 ( .A(B[4]), .Y(n4) );
  INVX1 U6 ( .A(B[3]), .Y(n5) );
  INVX1 U7 ( .A(B[2]), .Y(n6) );
  INVX1 U8 ( .A(B[1]), .Y(n7) );
  OR2X1 U9 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U10 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U11 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module edge_detection_6_DW01_sub_3 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X2 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_6_DW01_sub_4 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  INVX1 U1 ( .A(B[0]), .Y(n8) );
  INVX1 U2 ( .A(B[7]), .Y(n2) );
  INVX1 U3 ( .A(B[6]), .Y(n9) );
  INVX1 U4 ( .A(B[5]), .Y(n3) );
  INVX1 U5 ( .A(B[4]), .Y(n4) );
  INVX1 U6 ( .A(B[2]), .Y(n6) );
  INVX1 U7 ( .A(B[3]), .Y(n5) );
  INVX1 U8 ( .A(B[1]), .Y(n7) );
  OR2X1 U9 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U10 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U11 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module edge_detection_6_DW01_sub_5 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  INVX1 U1 ( .A(B[0]), .Y(n8) );
  INVX1 U2 ( .A(B[7]), .Y(n2) );
  INVX1 U3 ( .A(B[6]), .Y(n9) );
  INVX1 U4 ( .A(B[5]), .Y(n3) );
  INVX1 U5 ( .A(B[4]), .Y(n4) );
  INVX1 U6 ( .A(B[2]), .Y(n6) );
  INVX1 U7 ( .A(B[3]), .Y(n5) );
  INVX1 U8 ( .A(B[1]), .Y(n7) );
  OR2X1 U9 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U10 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U11 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module edge_detection_6_DW01_sub_6 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X2 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_6_DW01_sub_7 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  INVX1 U1 ( .A(B[0]), .Y(n8) );
  INVX1 U2 ( .A(B[7]), .Y(n2) );
  INVX1 U3 ( .A(B[5]), .Y(n3) );
  INVX1 U4 ( .A(B[6]), .Y(n9) );
  INVX1 U5 ( .A(B[4]), .Y(n4) );
  INVX1 U6 ( .A(B[3]), .Y(n5) );
  INVX1 U7 ( .A(B[2]), .Y(n6) );
  INVX1 U8 ( .A(B[1]), .Y(n7) );
  OR2X1 U9 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U10 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U11 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module edge_detection_6 ( clk, n_rst, i_gradient_start, P0, P1, P2, P3, P4, P5, 
        P6, P7, P8, o_gradient_data_ready, o_processed_sum );
  input [7:0] P0;
  input [7:0] P1;
  input [7:0] P2;
  input [7:0] P3;
  input [7:0] P4;
  input [7:0] P5;
  input [7:0] P6;
  input [7:0] P7;
  input [7:0] P8;
  output [7:0] o_processed_sum;
  input clk, n_rst, i_gradient_start;
  output o_gradient_data_ready;
  wire   N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152,
         N153, N154, N155, N156, N157, N158, N159, N160, N161, N162, N163,
         N164, N165, N166, N167, N168, N169, N170, N171, N172, N173, N174,
         N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N187, N188, N189, N190, N191, N192, N193, N194, N195, N197,
         N198, N199, N200, N201, N202, N203, N204, N205, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N269, N280, N281, N282, N283, N284,
         N285, N286, N287, N288, N289, N290, n1, n2, n8, n9, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n65, n141,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n443, n444, n451, n452, n461, n466,
         n469, n477, n478, n479, n480, n482, n483, n486, n487, n488, n517,
         n518, n520, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633;
  wire   [5:0] state;
  wire   [8:0] A1;
  wire   [9:0] C1;
  wire   [8:0] D1;
  wire   [9:0] E1;
  wire   [8:0] A2;
  wire   [9:0] C2;
  wire   [8:0] D2;
  wire   [9:0] E2;
  wire   [10:0] Gx;
  wire   [10:0] Gy;
  wire   [7:0] temp_sum;

  DFFSR \Gy_reg[0]  ( .D(n567), .CLK(clk), .R(n177), .S(1'b1), .Q(N269) );
  DFFSR \Gy_reg[10]  ( .D(n568), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[10]) );
  DFFSR \state_reg[0]  ( .D(n19), .CLK(clk), .R(n177), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n569), .CLK(clk), .R(n177), .S(1'b1), .Q(state[1])
         );
  DFFSR \C1_reg[9]  ( .D(n526), .CLK(clk), .R(n177), .S(1'b1), .Q(C1[9]) );
  DFFSR \Gx_reg[10]  ( .D(n580), .CLK(clk), .R(n176), .S(1'b1), .Q(Gx[10]) );
  DFFSR \state_reg[3]  ( .D(n21), .CLK(clk), .R(n176), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(n20), .CLK(clk), .R(n176), .S(1'b1), .Q(state[2])
         );
  DFFSR \A1_reg[0]  ( .D(n418), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[0]) );
  DFFSR \A1_reg[1]  ( .D(n417), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[1]) );
  DFFSR \A1_reg[2]  ( .D(n416), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[2]) );
  DFFSR \A1_reg[3]  ( .D(n415), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[3]) );
  DFFSR \A1_reg[4]  ( .D(n414), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[4]) );
  DFFSR \A1_reg[5]  ( .D(n413), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[5]) );
  DFFSR \A1_reg[6]  ( .D(n412), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[6]) );
  DFFSR \A1_reg[7]  ( .D(n411), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[7]) );
  DFFSR \A1_reg[8]  ( .D(n410), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[8]) );
  DFFSR \B1_reg[0]  ( .D(n436), .CLK(clk), .R(n175), .S(1'b1), .Q(N197) );
  DFFSR \B1_reg[1]  ( .D(n435), .CLK(clk), .R(n175), .S(1'b1), .Q(N198) );
  DFFSR \B1_reg[2]  ( .D(n434), .CLK(clk), .R(n175), .S(1'b1), .Q(N199) );
  DFFSR \B1_reg[3]  ( .D(n433), .CLK(clk), .R(n175), .S(1'b1), .Q(N200) );
  DFFSR \B1_reg[4]  ( .D(n432), .CLK(clk), .R(n175), .S(1'b1), .Q(N201) );
  DFFSR \B1_reg[5]  ( .D(n431), .CLK(clk), .R(n175), .S(1'b1), .Q(N202) );
  DFFSR \B1_reg[6]  ( .D(n430), .CLK(clk), .R(n175), .S(1'b1), .Q(N203) );
  DFFSR \B1_reg[7]  ( .D(n429), .CLK(clk), .R(n175), .S(1'b1), .Q(N204) );
  DFFSR \B1_reg[8]  ( .D(n428), .CLK(clk), .R(n175), .S(1'b1), .Q(N205) );
  DFFSR \C1_reg[1]  ( .D(n534), .CLK(clk), .R(n175), .S(1'b1), .Q(C1[1]) );
  DFFSR \C1_reg[2]  ( .D(n533), .CLK(clk), .R(n175), .S(1'b1), .Q(C1[2]) );
  DFFSR \C1_reg[3]  ( .D(n532), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[3]) );
  DFFSR \C1_reg[4]  ( .D(n531), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[4]) );
  DFFSR \C1_reg[5]  ( .D(n530), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[5]) );
  DFFSR \C1_reg[6]  ( .D(n529), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[6]) );
  DFFSR \C1_reg[7]  ( .D(n528), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[7]) );
  DFFSR \C1_reg[8]  ( .D(n527), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[8]) );
  DFFSR \D1_reg[0]  ( .D(n483), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[0]) );
  DFFSR \D1_reg[1]  ( .D(n482), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[1]) );
  DFFSR \D1_reg[2]  ( .D(n480), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[2]) );
  DFFSR \D1_reg[3]  ( .D(n479), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[3]) );
  DFFSR \D1_reg[4]  ( .D(n478), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[4]) );
  DFFSR \D1_reg[5]  ( .D(n477), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[5]) );
  DFFSR \D1_reg[6]  ( .D(n469), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[6]) );
  DFFSR \D1_reg[7]  ( .D(n466), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[7]) );
  DFFSR \D1_reg[8]  ( .D(n461), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[8]) );
  DFFSR \E1_reg[0]  ( .D(n553), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[0]) );
  DFFSR \E1_reg[1]  ( .D(n552), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[1]) );
  DFFSR \E1_reg[2]  ( .D(n551), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[2]) );
  DFFSR \E1_reg[3]  ( .D(n550), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[3]) );
  DFFSR \E1_reg[4]  ( .D(n549), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[4]) );
  DFFSR \E1_reg[5]  ( .D(n548), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[5]) );
  DFFSR \E1_reg[6]  ( .D(n547), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[6]) );
  DFFSR \E1_reg[7]  ( .D(n546), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[7]) );
  DFFSR \E1_reg[8]  ( .D(n545), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[8]) );
  DFFSR \E1_reg[9]  ( .D(n544), .CLK(clk), .R(n172), .S(1'b1), .Q(E1[9]) );
  DFFSR \A2_reg[0]  ( .D(n427), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[0]) );
  DFFSR \A2_reg[1]  ( .D(n426), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[1]) );
  DFFSR \A2_reg[2]  ( .D(n425), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[2]) );
  DFFSR \A2_reg[3]  ( .D(n424), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[3]) );
  DFFSR \A2_reg[4]  ( .D(n423), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[4]) );
  DFFSR \A2_reg[5]  ( .D(n422), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[5]) );
  DFFSR \A2_reg[6]  ( .D(n421), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[6]) );
  DFFSR \A2_reg[7]  ( .D(n420), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[7]) );
  DFFSR \A2_reg[8]  ( .D(n419), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[8]) );
  DFFSR \B2_reg[0]  ( .D(n452), .CLK(clk), .R(n172), .S(1'b1), .Q(N207) );
  DFFSR \B2_reg[1]  ( .D(n451), .CLK(clk), .R(n172), .S(1'b1), .Q(N208) );
  DFFSR \B2_reg[2]  ( .D(n444), .CLK(clk), .R(n171), .S(1'b1), .Q(N209) );
  DFFSR \B2_reg[3]  ( .D(n443), .CLK(clk), .R(n171), .S(1'b1), .Q(N210) );
  DFFSR \B2_reg[4]  ( .D(n441), .CLK(clk), .R(n171), .S(1'b1), .Q(N211) );
  DFFSR \B2_reg[5]  ( .D(n440), .CLK(clk), .R(n171), .S(1'b1), .Q(N212) );
  DFFSR \B2_reg[6]  ( .D(n439), .CLK(clk), .R(n171), .S(1'b1), .Q(N213) );
  DFFSR \B2_reg[7]  ( .D(n438), .CLK(clk), .R(n171), .S(1'b1), .Q(N214) );
  DFFSR \B2_reg[8]  ( .D(n437), .CLK(clk), .R(n171), .S(1'b1), .Q(N215) );
  DFFSR \D2_reg[0]  ( .D(n525), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[0]) );
  DFFSR \D2_reg[1]  ( .D(n524), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[1]) );
  DFFSR \D2_reg[2]  ( .D(n523), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[2]) );
  DFFSR \D2_reg[3]  ( .D(n520), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[3]) );
  DFFSR \D2_reg[4]  ( .D(n518), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[4]) );
  DFFSR \D2_reg[5]  ( .D(n517), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[5]) );
  DFFSR \D2_reg[6]  ( .D(n488), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[6]) );
  DFFSR \D2_reg[7]  ( .D(n487), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[7]) );
  DFFSR \D2_reg[8]  ( .D(n486), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[8]) );
  DFFSR \E2_reg[0]  ( .D(n563), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[0]) );
  DFFSR \E2_reg[1]  ( .D(n562), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[1]) );
  DFFSR \E2_reg[2]  ( .D(n561), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[2]) );
  DFFSR \E2_reg[3]  ( .D(n560), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[3]) );
  DFFSR \E2_reg[4]  ( .D(n559), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[4]) );
  DFFSR \E2_reg[5]  ( .D(n558), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[5]) );
  DFFSR \E2_reg[6]  ( .D(n557), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[6]) );
  DFFSR \E2_reg[7]  ( .D(n556), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[7]) );
  DFFSR \E2_reg[8]  ( .D(n555), .CLK(clk), .R(n169), .S(1'b1), .Q(E2[8]) );
  DFFSR \E2_reg[9]  ( .D(n554), .CLK(clk), .R(n169), .S(1'b1), .Q(E2[9]) );
  DFFSR o_gradient_data_ready_reg ( .D(n565), .CLK(clk), .R(n169), .S(1'b1), 
        .Q(o_gradient_data_ready) );
  DFFSR \Gx_reg[0]  ( .D(n570), .CLK(clk), .R(n169), .S(1'b1), .Q(N258) );
  DFFSR \Gx_reg[1]  ( .D(n571), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[1]) );
  DFFSR \Gx_reg[2]  ( .D(n572), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[2]) );
  DFFSR \Gx_reg[3]  ( .D(n573), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[3]) );
  DFFSR \Gx_reg[4]  ( .D(n574), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[4]) );
  DFFSR \Gx_reg[5]  ( .D(n575), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[5]) );
  DFFSR \Gx_reg[6]  ( .D(n576), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[6]) );
  DFFSR \Gx_reg[7]  ( .D(n577), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[7]) );
  DFFSR \Gx_reg[8]  ( .D(n578), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[8]) );
  DFFSR \Gx_reg[9]  ( .D(n579), .CLK(clk), .R(n168), .S(1'b1), .Q(Gx[9]) );
  DFFSR \C2_reg[1]  ( .D(n543), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[1]) );
  DFFSR \C2_reg[2]  ( .D(n542), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[2]) );
  DFFSR \C2_reg[3]  ( .D(n541), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[3]) );
  DFFSR \C2_reg[4]  ( .D(n540), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[4]) );
  DFFSR \C2_reg[5]  ( .D(n539), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[5]) );
  DFFSR \C2_reg[6]  ( .D(n538), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[6]) );
  DFFSR \C2_reg[7]  ( .D(n537), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[7]) );
  DFFSR \C2_reg[8]  ( .D(n536), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[8]) );
  DFFSR \C2_reg[9]  ( .D(n535), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[9]) );
  DFFSR \Gy_reg[1]  ( .D(n589), .CLK(clk), .R(n168), .S(1'b1), .Q(Gy[1]) );
  DFFSR \Gy_reg[2]  ( .D(n588), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[2]) );
  DFFSR \Gy_reg[3]  ( .D(n587), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[3]) );
  DFFSR \Gy_reg[4]  ( .D(n586), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[4]) );
  DFFSR \Gy_reg[5]  ( .D(n585), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[5]) );
  DFFSR \Gy_reg[6]  ( .D(n584), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[6]) );
  DFFSR \Gy_reg[7]  ( .D(n583), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[7]) );
  DFFSR \Gy_reg[8]  ( .D(n582), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[8]) );
  DFFSR \Gy_reg[9]  ( .D(n581), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[9]) );
  DFFSR \temp_sum_reg[0]  ( .D(n590), .CLK(clk), .R(n141), .S(1'b1), .Q(
        temp_sum[0]) );
  DFFSR \o_processed_sum_reg[0]  ( .D(temp_sum[0]), .CLK(clk), .R(n141), .S(
        1'b1), .Q(o_processed_sum[0]) );
  DFFSR \temp_sum_reg[1]  ( .D(n591), .CLK(clk), .R(n141), .S(1'b1), .Q(
        temp_sum[1]) );
  DFFSR \o_processed_sum_reg[1]  ( .D(temp_sum[1]), .CLK(clk), .R(n141), .S(
        1'b1), .Q(o_processed_sum[1]) );
  DFFSR \temp_sum_reg[2]  ( .D(n592), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[2]) );
  DFFSR \o_processed_sum_reg[2]  ( .D(temp_sum[2]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[2]) );
  DFFSR \temp_sum_reg[3]  ( .D(n593), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[3]) );
  DFFSR \o_processed_sum_reg[3]  ( .D(temp_sum[3]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[3]) );
  DFFSR \temp_sum_reg[4]  ( .D(n594), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[4]) );
  DFFSR \o_processed_sum_reg[4]  ( .D(temp_sum[4]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[4]) );
  DFFSR \temp_sum_reg[5]  ( .D(n595), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[5]) );
  DFFSR \o_processed_sum_reg[5]  ( .D(temp_sum[5]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[5]) );
  DFFSR \temp_sum_reg[6]  ( .D(n596), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[6]) );
  DFFSR \o_processed_sum_reg[6]  ( .D(temp_sum[6]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[6]) );
  DFFSR \temp_sum_reg[7]  ( .D(n597), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[7]) );
  DFFSR \o_processed_sum_reg[7]  ( .D(temp_sum[7]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[7]) );
  AND2X2 U157 ( .A(n630), .B(n623), .Y(n614) );
  AND2X2 U160 ( .A(n633), .B(n632), .Y(n600) );
  OR2X1 U458 ( .A(n625), .B(n624), .Y(n626) );
  NAND3X1 U459 ( .A(n623), .B(n622), .C(n408), .Y(n627) );
  OR2X1 U462 ( .A(n619), .B(n618), .Y(n620) );
  NAND3X1 U464 ( .A(n615), .B(n622), .C(n614), .Y(n621) );
  OAI21X1 U465 ( .A(n622), .B(n409), .C(n613), .Y(n569) );
  NAND2X1 U467 ( .A(n564), .B(n617), .Y(n611) );
  NAND3X1 U469 ( .A(n628), .B(n632), .C(n629), .Y(n612) );
  OR2X1 U472 ( .A(n619), .B(n625), .Y(n608) );
  NAND3X1 U475 ( .A(n629), .B(n622), .C(n606), .Y(n609) );
  NAND2X1 U476 ( .A(i_gradient_start), .B(n566), .Y(n606) );
  NAND2X1 U477 ( .A(n604), .B(n603), .Y(n622) );
  NOR2X1 U478 ( .A(n602), .B(n601), .Y(n603) );
  NAND3X1 U479 ( .A(n630), .B(n629), .C(n610), .Y(n601) );
  NAND3X1 U482 ( .A(n631), .B(n628), .C(n600), .Y(n602) );
  NAND3X1 U484 ( .A(state[2]), .B(n17), .C(state[3]), .Y(n633) );
  NOR2X1 U487 ( .A(n599), .B(n598), .Y(n604) );
  NAND3X1 U488 ( .A(n605), .B(n616), .C(n408), .Y(n598) );
  NAND2X1 U490 ( .A(n16), .B(n2), .Y(n605) );
  NAND3X1 U491 ( .A(n617), .B(n607), .C(n623), .Y(n599) );
  NAND2X1 U492 ( .A(n9), .B(n17), .Y(n623) );
  NAND2X1 U493 ( .A(n22), .B(n9), .Y(n607) );
  edge_detection_6_DW01_add_0 add_231 ( .A({Gx[10:1], N258}), .B({Gy[10:1], 
        N269}), .CI(1'b0), .SUM({N290, N289, N288, N287, N286, N285, N284, 
        N283, N282, N281, N280}) );
  edge_detection_6_DW01_add_1 add_219 ( .A({C2[9], C2[9:1], 1'b0}), .B({E2[9], 
        E2}), .CI(1'b0), .SUM({N257, N256, N255, N254, N253, N252, N251, N250, 
        N249, N248, N247}) );
  edge_detection_6_DW01_add_2 add_218 ( .A({C1[9], C1[9:1], 1'b0}), .B({E1[9], 
        E1}), .CI(1'b0), .SUM({N246, N245, N244, N243, N242, N241, N240, N239, 
        N238, N237, N236}) );
  edge_detection_6_DW01_add_3 add_214 ( .A({A2[8], A2}), .B({D2[8], D2}), .CI(
        1'b0), .SUM({N235, N234, N233, N232, N231, N230, N229, N228, N227, 
        N226}) );
  edge_detection_6_DW01_add_4 add_213 ( .A({A1[8], A1}), .B({D1[8], D1}), .CI(
        1'b0), .SUM({N225, N224, N223, N222, N221, N220, N219, N218, N217, 
        N216}) );
  edge_detection_6_DW01_sub_2 sub_204 ( .A({1'b0, P2}), .B({1'b0, P8}), .CI(
        1'b0), .DIFF({N195, N194, N193, N192, N191, N190, N189, N188, N187})
         );
  edge_detection_6_DW01_sub_3 sub_203 ( .A({1'b0, P8}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N186, N185, N184, N183, N182, N181, N180, N179, N178})
         );
  edge_detection_6_DW01_sub_4 sub_202 ( .A({1'b0, P1}), .B({1'b0, P7}), .CI(
        1'b0), .DIFF({N177, N176, N175, N174, N173, N172, N171, N170, N169})
         );
  edge_detection_6_DW01_sub_5 sub_201 ( .A({1'b0, P5}), .B({1'b0, P3}), .CI(
        1'b0), .DIFF({N168, N167, N166, N165, N164, N163, N162, N161, N160})
         );
  edge_detection_6_DW01_sub_6 sub_200 ( .A({1'b0, P0}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N159, N158, N157, N156, N155, N154, N153, N152, N151})
         );
  edge_detection_6_DW01_sub_7 sub_199 ( .A({1'b0, P2}), .B({1'b0, P0}), .CI(
        1'b0), .DIFF({N150, N149, N148, N147, N146, N145, N144, N143, N142})
         );
  NAND2X1 U5 ( .A(n2), .B(n9), .Y(n1) );
  AND2X2 U6 ( .A(n409), .B(n178), .Y(n2) );
  AND2X2 U12 ( .A(state[3]), .B(n179), .Y(n8) );
  AND2X2 U13 ( .A(state[2]), .B(n235), .Y(n9) );
  AND2X2 U52 ( .A(n235), .B(n179), .Y(n16) );
  AND2X2 U128 ( .A(state[1]), .B(n178), .Y(n17) );
  AND2X2 U155 ( .A(state[0]), .B(state[1]), .Y(n18) );
  OR2X2 U156 ( .A(n609), .B(n608), .Y(n19) );
  OR2X2 U158 ( .A(n621), .B(n620), .Y(n20) );
  OR2X2 U159 ( .A(n627), .B(n626), .Y(n21) );
  AND2X2 U161 ( .A(state[0]), .B(n409), .Y(n22) );
  OR2X2 U162 ( .A(n260), .B(Gx[6]), .Y(n264) );
  OR2X2 U163 ( .A(n268), .B(Gx[8]), .Y(n272) );
  OR2X2 U164 ( .A(N258), .B(Gx[1]), .Y(n244) );
  BUFX2 U165 ( .A(n323), .Y(n29) );
  BUFX2 U166 ( .A(n323), .Y(n28) );
  BUFX2 U167 ( .A(n323), .Y(n26) );
  BUFX2 U168 ( .A(n323), .Y(n27) );
  INVX2 U169 ( .A(n630), .Y(n25) );
  INVX2 U170 ( .A(n1), .Y(n384) );
  INVX2 U171 ( .A(n629), .Y(n24) );
  BUFX2 U172 ( .A(n323), .Y(n30) );
  INVX2 U173 ( .A(n631), .Y(n404) );
  AND2X2 U174 ( .A(n631), .B(n1), .Y(n23) );
  INVX2 U175 ( .A(n615), .Y(n385) );
  BUFX2 U176 ( .A(n_rst), .Y(n65) );
  BUFX2 U177 ( .A(n_rst), .Y(n141) );
  BUFX2 U178 ( .A(n_rst), .Y(n169) );
  BUFX2 U179 ( .A(n_rst), .Y(n170) );
  BUFX2 U180 ( .A(n_rst), .Y(n171) );
  BUFX2 U181 ( .A(n_rst), .Y(n172) );
  BUFX2 U182 ( .A(n_rst), .Y(n173) );
  BUFX2 U183 ( .A(n_rst), .Y(n174) );
  BUFX2 U184 ( .A(n_rst), .Y(n176) );
  BUFX2 U185 ( .A(n_rst), .Y(n168) );
  BUFX2 U186 ( .A(n_rst), .Y(n175) );
  BUFX2 U187 ( .A(n_rst), .Y(n177) );
  OR2X1 U188 ( .A(n244), .B(Gx[2]), .Y(n248) );
  OR2X1 U189 ( .A(n264), .B(Gx[7]), .Y(n268) );
  OR2X1 U190 ( .A(n256), .B(Gx[5]), .Y(n260) );
  OR2X1 U191 ( .A(n252), .B(Gx[4]), .Y(n256) );
  OR2X1 U192 ( .A(n248), .B(Gx[3]), .Y(n252) );
  INVX2 U195 ( .A(state[1]), .Y(n409) );
  INVX2 U196 ( .A(state[0]), .Y(n178) );
  NAND3X1 U197 ( .A(state[2]), .B(state[3]), .C(n2), .Y(n632) );
  INVX2 U198 ( .A(state[2]), .Y(n179) );
  NAND2X1 U199 ( .A(n17), .B(n8), .Y(n631) );
  INVX2 U200 ( .A(state[3]), .Y(n235) );
  NAND2X1 U201 ( .A(n16), .B(n22), .Y(n628) );
  INVX2 U202 ( .A(n628), .Y(n323) );
  MUX2X1 U203 ( .B(N205), .A(N168), .S(n26), .Y(n180) );
  INVX2 U204 ( .A(n180), .Y(n428) );
  NAND2X1 U205 ( .A(n16), .B(n17), .Y(n629) );
  INVX2 U206 ( .A(C1[9]), .Y(n182) );
  INVX2 U207 ( .A(N205), .Y(n181) );
  MUX2X1 U208 ( .B(n182), .A(n181), .S(n24), .Y(n526) );
  MUX2X1 U209 ( .B(N204), .A(N167), .S(n26), .Y(n183) );
  INVX2 U210 ( .A(n183), .Y(n429) );
  INVX2 U211 ( .A(C1[8]), .Y(n185) );
  INVX2 U212 ( .A(N204), .Y(n184) );
  MUX2X1 U213 ( .B(n185), .A(n184), .S(n24), .Y(n527) );
  MUX2X1 U214 ( .B(N203), .A(N166), .S(n26), .Y(n186) );
  INVX2 U215 ( .A(n186), .Y(n430) );
  INVX2 U216 ( .A(C1[7]), .Y(n188) );
  INVX2 U217 ( .A(N203), .Y(n187) );
  MUX2X1 U218 ( .B(n188), .A(n187), .S(n24), .Y(n528) );
  MUX2X1 U219 ( .B(N202), .A(N165), .S(n26), .Y(n189) );
  INVX2 U220 ( .A(n189), .Y(n431) );
  INVX2 U221 ( .A(C1[6]), .Y(n191) );
  INVX2 U222 ( .A(N202), .Y(n190) );
  MUX2X1 U223 ( .B(n191), .A(n190), .S(n24), .Y(n529) );
  MUX2X1 U224 ( .B(N201), .A(N164), .S(n26), .Y(n192) );
  INVX2 U225 ( .A(n192), .Y(n432) );
  INVX2 U226 ( .A(C1[5]), .Y(n194) );
  INVX2 U227 ( .A(N201), .Y(n193) );
  MUX2X1 U228 ( .B(n194), .A(n193), .S(n24), .Y(n530) );
  MUX2X1 U229 ( .B(N200), .A(N163), .S(n26), .Y(n195) );
  INVX2 U230 ( .A(n195), .Y(n433) );
  INVX2 U231 ( .A(C1[4]), .Y(n197) );
  INVX2 U232 ( .A(N200), .Y(n196) );
  MUX2X1 U233 ( .B(n197), .A(n196), .S(n24), .Y(n531) );
  MUX2X1 U234 ( .B(N199), .A(N162), .S(n26), .Y(n198) );
  INVX2 U235 ( .A(n198), .Y(n434) );
  INVX2 U236 ( .A(C1[3]), .Y(n200) );
  INVX2 U237 ( .A(N199), .Y(n199) );
  MUX2X1 U238 ( .B(n200), .A(n199), .S(n24), .Y(n532) );
  MUX2X1 U239 ( .B(N198), .A(N161), .S(n26), .Y(n201) );
  INVX2 U240 ( .A(n201), .Y(n435) );
  INVX2 U241 ( .A(C1[2]), .Y(n203) );
  INVX2 U242 ( .A(N198), .Y(n202) );
  MUX2X1 U243 ( .B(n203), .A(n202), .S(n24), .Y(n533) );
  MUX2X1 U244 ( .B(N197), .A(N160), .S(n26), .Y(n204) );
  INVX2 U245 ( .A(n204), .Y(n436) );
  INVX2 U246 ( .A(C1[1]), .Y(n206) );
  INVX2 U247 ( .A(N197), .Y(n205) );
  MUX2X1 U248 ( .B(n206), .A(n205), .S(n24), .Y(n534) );
  MUX2X1 U249 ( .B(A1[8]), .A(N150), .S(n26), .Y(n207) );
  INVX2 U250 ( .A(n207), .Y(n410) );
  MUX2X1 U251 ( .B(A1[7]), .A(N149), .S(n26), .Y(n208) );
  INVX2 U252 ( .A(n208), .Y(n411) );
  MUX2X1 U253 ( .B(A1[6]), .A(N148), .S(n26), .Y(n209) );
  INVX2 U254 ( .A(n209), .Y(n412) );
  MUX2X1 U255 ( .B(A1[5]), .A(N147), .S(n26), .Y(n210) );
  INVX2 U256 ( .A(n210), .Y(n413) );
  MUX2X1 U257 ( .B(A1[4]), .A(N146), .S(n27), .Y(n211) );
  INVX2 U258 ( .A(n211), .Y(n414) );
  MUX2X1 U259 ( .B(A1[3]), .A(N145), .S(n27), .Y(n212) );
  INVX2 U260 ( .A(n212), .Y(n415) );
  MUX2X1 U261 ( .B(A1[2]), .A(N144), .S(n27), .Y(n213) );
  INVX2 U262 ( .A(n213), .Y(n416) );
  MUX2X1 U263 ( .B(A1[1]), .A(N143), .S(n27), .Y(n214) );
  INVX2 U264 ( .A(n214), .Y(n417) );
  MUX2X1 U265 ( .B(A1[0]), .A(N142), .S(n27), .Y(n215) );
  INVX2 U266 ( .A(n215), .Y(n418) );
  MUX2X1 U267 ( .B(D1[8]), .A(N186), .S(n27), .Y(n216) );
  INVX2 U268 ( .A(n216), .Y(n461) );
  MUX2X1 U269 ( .B(D1[7]), .A(N185), .S(n27), .Y(n217) );
  INVX2 U270 ( .A(n217), .Y(n466) );
  MUX2X1 U271 ( .B(D1[6]), .A(N184), .S(n27), .Y(n218) );
  INVX2 U272 ( .A(n218), .Y(n469) );
  MUX2X1 U273 ( .B(D1[5]), .A(N183), .S(n27), .Y(n219) );
  INVX2 U274 ( .A(n219), .Y(n477) );
  MUX2X1 U275 ( .B(D1[4]), .A(N182), .S(n27), .Y(n220) );
  INVX2 U276 ( .A(n220), .Y(n478) );
  MUX2X1 U277 ( .B(D1[3]), .A(N181), .S(n27), .Y(n221) );
  INVX2 U278 ( .A(n221), .Y(n479) );
  MUX2X1 U279 ( .B(D1[2]), .A(N180), .S(n27), .Y(n222) );
  INVX2 U280 ( .A(n222), .Y(n480) );
  MUX2X1 U281 ( .B(D1[1]), .A(N179), .S(n27), .Y(n223) );
  INVX2 U282 ( .A(n223), .Y(n482) );
  MUX2X1 U283 ( .B(D1[0]), .A(N178), .S(n28), .Y(n224) );
  INVX2 U284 ( .A(n224), .Y(n483) );
  NAND2X1 U285 ( .A(n16), .B(n18), .Y(n630) );
  MUX2X1 U286 ( .B(E1[9]), .A(N225), .S(n25), .Y(n225) );
  INVX2 U287 ( .A(n225), .Y(n544) );
  MUX2X1 U288 ( .B(E1[8]), .A(N224), .S(n25), .Y(n226) );
  INVX2 U289 ( .A(n226), .Y(n545) );
  MUX2X1 U290 ( .B(E1[7]), .A(N223), .S(n25), .Y(n227) );
  INVX2 U291 ( .A(n227), .Y(n546) );
  MUX2X1 U292 ( .B(E1[6]), .A(N222), .S(n25), .Y(n228) );
  INVX2 U293 ( .A(n228), .Y(n547) );
  MUX2X1 U294 ( .B(E1[5]), .A(N221), .S(n25), .Y(n229) );
  INVX2 U295 ( .A(n229), .Y(n548) );
  MUX2X1 U296 ( .B(E1[4]), .A(N220), .S(n25), .Y(n230) );
  INVX2 U297 ( .A(n230), .Y(n549) );
  MUX2X1 U298 ( .B(E1[3]), .A(N219), .S(n25), .Y(n231) );
  INVX2 U299 ( .A(n231), .Y(n550) );
  MUX2X1 U300 ( .B(E1[2]), .A(N218), .S(n25), .Y(n232) );
  INVX2 U301 ( .A(n232), .Y(n551) );
  MUX2X1 U302 ( .B(E1[1]), .A(N217), .S(n25), .Y(n233) );
  INVX2 U303 ( .A(n233), .Y(n552) );
  MUX2X1 U304 ( .B(E1[0]), .A(N216), .S(n25), .Y(n234) );
  INVX2 U305 ( .A(n234), .Y(n553) );
  INVX2 U306 ( .A(N236), .Y(n237) );
  OAI21X1 U307 ( .A(n404), .B(n23), .C(N258), .Y(n236) );
  OAI21X1 U308 ( .A(n1), .B(n237), .C(n236), .Y(n570) );
  INVX2 U309 ( .A(N237), .Y(n240) );
  XOR2X1 U310 ( .A(Gx[1]), .B(N258), .Y(n238) );
  AOI22X1 U311 ( .A(n238), .B(n404), .C(Gx[1]), .D(n23), .Y(n239) );
  OAI21X1 U312 ( .A(n1), .B(n240), .C(n239), .Y(n571) );
  INVX2 U313 ( .A(N238), .Y(n243) );
  XOR2X1 U314 ( .A(n244), .B(Gx[2]), .Y(n241) );
  AOI22X1 U315 ( .A(n241), .B(n404), .C(Gx[2]), .D(n23), .Y(n242) );
  OAI21X1 U316 ( .A(n1), .B(n243), .C(n242), .Y(n572) );
  INVX2 U317 ( .A(N239), .Y(n247) );
  XOR2X1 U318 ( .A(n248), .B(Gx[3]), .Y(n245) );
  AOI22X1 U319 ( .A(n245), .B(n404), .C(Gx[3]), .D(n23), .Y(n246) );
  OAI21X1 U320 ( .A(n1), .B(n247), .C(n246), .Y(n573) );
  INVX2 U321 ( .A(N240), .Y(n251) );
  XOR2X1 U322 ( .A(n252), .B(Gx[4]), .Y(n249) );
  AOI22X1 U323 ( .A(n249), .B(n404), .C(Gx[4]), .D(n23), .Y(n250) );
  OAI21X1 U324 ( .A(n1), .B(n251), .C(n250), .Y(n574) );
  INVX2 U325 ( .A(N241), .Y(n255) );
  XOR2X1 U326 ( .A(n256), .B(Gx[5]), .Y(n253) );
  AOI22X1 U327 ( .A(n253), .B(n404), .C(Gx[5]), .D(n23), .Y(n254) );
  OAI21X1 U328 ( .A(n1), .B(n255), .C(n254), .Y(n575) );
  INVX2 U329 ( .A(N242), .Y(n259) );
  XOR2X1 U330 ( .A(n260), .B(Gx[6]), .Y(n257) );
  AOI22X1 U331 ( .A(n257), .B(n404), .C(Gx[6]), .D(n23), .Y(n258) );
  OAI21X1 U332 ( .A(n1), .B(n259), .C(n258), .Y(n576) );
  INVX2 U333 ( .A(N243), .Y(n263) );
  XOR2X1 U334 ( .A(n264), .B(Gx[7]), .Y(n261) );
  AOI22X1 U335 ( .A(n261), .B(n404), .C(Gx[7]), .D(n23), .Y(n262) );
  OAI21X1 U336 ( .A(n1), .B(n263), .C(n262), .Y(n577) );
  INVX2 U337 ( .A(N244), .Y(n267) );
  XOR2X1 U338 ( .A(n268), .B(Gx[8]), .Y(n265) );
  AOI22X1 U339 ( .A(n265), .B(n404), .C(Gx[8]), .D(n23), .Y(n266) );
  OAI21X1 U340 ( .A(n1), .B(n267), .C(n266), .Y(n578) );
  INVX2 U341 ( .A(N245), .Y(n271) );
  XOR2X1 U342 ( .A(n272), .B(Gx[9]), .Y(n269) );
  AOI22X1 U343 ( .A(n269), .B(n404), .C(Gx[9]), .D(n23), .Y(n270) );
  OAI21X1 U344 ( .A(n1), .B(n271), .C(n270), .Y(n579) );
  NOR2X1 U345 ( .A(Gx[9]), .B(n272), .Y(n273) );
  XNOR2X1 U346 ( .A(n273), .B(Gx[10]), .Y(n274) );
  AOI22X1 U347 ( .A(n23), .B(Gx[10]), .C(n274), .D(n404), .Y(n276) );
  NAND2X1 U348 ( .A(N246), .B(n384), .Y(n275) );
  NAND2X1 U349 ( .A(n276), .B(n275), .Y(n580) );
  NAND2X1 U350 ( .A(n8), .B(n18), .Y(n615) );
  MUX2X1 U351 ( .B(N215), .A(N177), .S(n28), .Y(n277) );
  INVX2 U352 ( .A(n277), .Y(n437) );
  INVX2 U353 ( .A(C2[9]), .Y(n279) );
  INVX2 U354 ( .A(N215), .Y(n278) );
  MUX2X1 U355 ( .B(n279), .A(n278), .S(n24), .Y(n535) );
  MUX2X1 U356 ( .B(N214), .A(N176), .S(n28), .Y(n280) );
  INVX2 U357 ( .A(n280), .Y(n438) );
  INVX2 U358 ( .A(C2[8]), .Y(n282) );
  INVX2 U359 ( .A(N214), .Y(n281) );
  MUX2X1 U360 ( .B(n282), .A(n281), .S(n24), .Y(n536) );
  MUX2X1 U361 ( .B(N213), .A(N175), .S(n28), .Y(n283) );
  INVX2 U362 ( .A(n283), .Y(n439) );
  INVX2 U363 ( .A(C2[7]), .Y(n285) );
  INVX2 U364 ( .A(N213), .Y(n284) );
  MUX2X1 U365 ( .B(n285), .A(n284), .S(n24), .Y(n537) );
  MUX2X1 U366 ( .B(N212), .A(N174), .S(n28), .Y(n286) );
  INVX2 U367 ( .A(n286), .Y(n440) );
  INVX2 U368 ( .A(C2[6]), .Y(n288) );
  INVX2 U369 ( .A(N212), .Y(n287) );
  MUX2X1 U370 ( .B(n288), .A(n287), .S(n24), .Y(n538) );
  MUX2X1 U371 ( .B(N211), .A(N173), .S(n28), .Y(n289) );
  INVX2 U372 ( .A(n289), .Y(n441) );
  INVX2 U373 ( .A(C2[5]), .Y(n291) );
  INVX2 U374 ( .A(N211), .Y(n290) );
  MUX2X1 U375 ( .B(n291), .A(n290), .S(n24), .Y(n539) );
  MUX2X1 U376 ( .B(N210), .A(N172), .S(n28), .Y(n292) );
  INVX2 U377 ( .A(n292), .Y(n443) );
  INVX2 U378 ( .A(C2[4]), .Y(n294) );
  INVX2 U379 ( .A(N210), .Y(n293) );
  MUX2X1 U380 ( .B(n294), .A(n293), .S(n24), .Y(n540) );
  MUX2X1 U381 ( .B(N209), .A(N171), .S(n28), .Y(n295) );
  INVX2 U382 ( .A(n295), .Y(n444) );
  INVX2 U383 ( .A(C2[3]), .Y(n297) );
  INVX2 U384 ( .A(N209), .Y(n296) );
  MUX2X1 U385 ( .B(n297), .A(n296), .S(n24), .Y(n541) );
  MUX2X1 U386 ( .B(N208), .A(N170), .S(n28), .Y(n298) );
  INVX2 U387 ( .A(n298), .Y(n451) );
  INVX2 U388 ( .A(C2[2]), .Y(n300) );
  INVX2 U389 ( .A(N208), .Y(n299) );
  MUX2X1 U390 ( .B(n300), .A(n299), .S(n24), .Y(n542) );
  MUX2X1 U391 ( .B(N207), .A(N169), .S(n28), .Y(n301) );
  INVX2 U392 ( .A(n301), .Y(n452) );
  INVX2 U393 ( .A(C2[1]), .Y(n304) );
  INVX2 U394 ( .A(N207), .Y(n302) );
  MUX2X1 U395 ( .B(n304), .A(n302), .S(n24), .Y(n543) );
  MUX2X1 U396 ( .B(A2[8]), .A(N159), .S(n28), .Y(n305) );
  INVX2 U397 ( .A(n305), .Y(n419) );
  MUX2X1 U398 ( .B(A2[7]), .A(N158), .S(n28), .Y(n306) );
  INVX2 U399 ( .A(n306), .Y(n420) );
  MUX2X1 U400 ( .B(A2[6]), .A(N157), .S(n28), .Y(n307) );
  INVX2 U401 ( .A(n307), .Y(n421) );
  MUX2X1 U402 ( .B(A2[5]), .A(N156), .S(n29), .Y(n308) );
  INVX2 U403 ( .A(n308), .Y(n422) );
  MUX2X1 U404 ( .B(A2[4]), .A(N155), .S(n29), .Y(n309) );
  INVX2 U405 ( .A(n309), .Y(n423) );
  MUX2X1 U406 ( .B(A2[3]), .A(N154), .S(n29), .Y(n310) );
  INVX2 U407 ( .A(n310), .Y(n424) );
  MUX2X1 U408 ( .B(A2[2]), .A(N153), .S(n29), .Y(n311) );
  INVX2 U409 ( .A(n311), .Y(n425) );
  MUX2X1 U410 ( .B(A2[1]), .A(N152), .S(n29), .Y(n312) );
  INVX2 U411 ( .A(n312), .Y(n426) );
  MUX2X1 U412 ( .B(A2[0]), .A(N151), .S(n29), .Y(n313) );
  INVX2 U413 ( .A(n313), .Y(n427) );
  MUX2X1 U414 ( .B(D2[8]), .A(N195), .S(n29), .Y(n314) );
  INVX2 U415 ( .A(n314), .Y(n486) );
  MUX2X1 U416 ( .B(D2[7]), .A(N194), .S(n29), .Y(n316) );
  INVX2 U417 ( .A(n316), .Y(n487) );
  MUX2X1 U418 ( .B(D2[6]), .A(N193), .S(n29), .Y(n317) );
  INVX2 U419 ( .A(n317), .Y(n488) );
  MUX2X1 U420 ( .B(D2[5]), .A(N192), .S(n29), .Y(n318) );
  INVX2 U421 ( .A(n318), .Y(n517) );
  MUX2X1 U422 ( .B(D2[4]), .A(N191), .S(n29), .Y(n319) );
  INVX2 U423 ( .A(n319), .Y(n518) );
  MUX2X1 U424 ( .B(D2[3]), .A(N190), .S(n29), .Y(n320) );
  INVX2 U425 ( .A(n320), .Y(n520) );
  MUX2X1 U426 ( .B(D2[2]), .A(N189), .S(n29), .Y(n321) );
  INVX2 U427 ( .A(n321), .Y(n523) );
  MUX2X1 U428 ( .B(D2[1]), .A(N188), .S(n30), .Y(n322) );
  INVX2 U429 ( .A(n322), .Y(n524) );
  MUX2X1 U430 ( .B(D2[0]), .A(N187), .S(n30), .Y(n324) );
  INVX2 U431 ( .A(n324), .Y(n525) );
  MUX2X1 U432 ( .B(E2[9]), .A(N235), .S(n25), .Y(n325) );
  INVX2 U433 ( .A(n325), .Y(n554) );
  MUX2X1 U434 ( .B(E2[8]), .A(N234), .S(n25), .Y(n326) );
  INVX2 U435 ( .A(n326), .Y(n555) );
  MUX2X1 U436 ( .B(E2[7]), .A(N233), .S(n25), .Y(n327) );
  INVX2 U437 ( .A(n327), .Y(n556) );
  MUX2X1 U438 ( .B(E2[6]), .A(N232), .S(n25), .Y(n328) );
  INVX2 U439 ( .A(n328), .Y(n557) );
  MUX2X1 U440 ( .B(E2[5]), .A(N231), .S(n25), .Y(n329) );
  INVX2 U441 ( .A(n329), .Y(n558) );
  MUX2X1 U442 ( .B(E2[4]), .A(N230), .S(n25), .Y(n330) );
  INVX2 U443 ( .A(n330), .Y(n559) );
  MUX2X1 U444 ( .B(E2[3]), .A(N229), .S(n25), .Y(n331) );
  INVX2 U445 ( .A(n331), .Y(n560) );
  MUX2X1 U446 ( .B(E2[2]), .A(N228), .S(n25), .Y(n332) );
  INVX2 U447 ( .A(n332), .Y(n561) );
  MUX2X1 U448 ( .B(E2[1]), .A(N227), .S(n25), .Y(n333) );
  INVX2 U449 ( .A(n333), .Y(n562) );
  MUX2X1 U450 ( .B(E2[0]), .A(N226), .S(n25), .Y(n334) );
  INVX2 U451 ( .A(n334), .Y(n563) );
  INVX2 U452 ( .A(N247), .Y(n336) );
  NAND2X1 U453 ( .A(n1), .B(n615), .Y(n389) );
  INVX2 U454 ( .A(n389), .Y(n408) );
  OAI21X1 U455 ( .A(n385), .B(n408), .C(N269), .Y(n335) );
  OAI21X1 U456 ( .A(n1), .B(n336), .C(n335), .Y(n567) );
  INVX2 U457 ( .A(Gy[1]), .Y(n339) );
  XOR2X1 U460 ( .A(Gy[1]), .B(N269), .Y(n337) );
  AOI22X1 U461 ( .A(n337), .B(n385), .C(N248), .D(n384), .Y(n338) );
  OAI21X1 U463 ( .A(n389), .B(n339), .C(n338), .Y(n589) );
  INVX2 U466 ( .A(Gy[2]), .Y(n345) );
  INVX2 U468 ( .A(N269), .Y(n340) );
  NAND2X1 U470 ( .A(n340), .B(n339), .Y(n344) );
  XOR2X1 U471 ( .A(n344), .B(Gy[2]), .Y(n342) );
  AOI22X1 U473 ( .A(n342), .B(n385), .C(N249), .D(n384), .Y(n343) );
  OAI21X1 U474 ( .A(n389), .B(n345), .C(n343), .Y(n588) );
  INVX2 U480 ( .A(Gy[3]), .Y(n350) );
  INVX2 U481 ( .A(n344), .Y(n346) );
  NAND2X1 U483 ( .A(n346), .B(n345), .Y(n349) );
  XOR2X1 U485 ( .A(n349), .B(Gy[3]), .Y(n347) );
  AOI22X1 U486 ( .A(n347), .B(n385), .C(N250), .D(n384), .Y(n348) );
  OAI21X1 U489 ( .A(n389), .B(n350), .C(n348), .Y(n587) );
  INVX2 U494 ( .A(Gy[4]), .Y(n355) );
  INVX2 U495 ( .A(n349), .Y(n351) );
  NAND2X1 U496 ( .A(n351), .B(n350), .Y(n354) );
  XOR2X1 U497 ( .A(n354), .B(Gy[4]), .Y(n352) );
  AOI22X1 U498 ( .A(n352), .B(n385), .C(N251), .D(n384), .Y(n353) );
  OAI21X1 U499 ( .A(n389), .B(n355), .C(n353), .Y(n586) );
  INVX2 U500 ( .A(Gy[5]), .Y(n360) );
  INVX2 U501 ( .A(n354), .Y(n356) );
  NAND2X1 U502 ( .A(n356), .B(n355), .Y(n359) );
  XOR2X1 U503 ( .A(n359), .B(Gy[5]), .Y(n357) );
  AOI22X1 U504 ( .A(n357), .B(n385), .C(N252), .D(n384), .Y(n358) );
  OAI21X1 U505 ( .A(n389), .B(n360), .C(n358), .Y(n585) );
  INVX2 U506 ( .A(Gy[6]), .Y(n366) );
  INVX2 U507 ( .A(n359), .Y(n361) );
  NAND2X1 U508 ( .A(n361), .B(n360), .Y(n365) );
  XOR2X1 U509 ( .A(n365), .B(Gy[6]), .Y(n362) );
  AOI22X1 U510 ( .A(n362), .B(n385), .C(N253), .D(n384), .Y(n363) );
  OAI21X1 U511 ( .A(n389), .B(n366), .C(n363), .Y(n584) );
  INVX2 U512 ( .A(Gy[7]), .Y(n371) );
  INVX2 U513 ( .A(n365), .Y(n367) );
  NAND2X1 U514 ( .A(n367), .B(n366), .Y(n370) );
  XOR2X1 U515 ( .A(n370), .B(Gy[7]), .Y(n368) );
  AOI22X1 U516 ( .A(n368), .B(n385), .C(N254), .D(n384), .Y(n369) );
  OAI21X1 U517 ( .A(n389), .B(n371), .C(n369), .Y(n583) );
  INVX2 U518 ( .A(Gy[8]), .Y(n376) );
  INVX2 U519 ( .A(n370), .Y(n372) );
  NAND2X1 U520 ( .A(n372), .B(n371), .Y(n375) );
  XOR2X1 U521 ( .A(n375), .B(Gy[8]), .Y(n373) );
  AOI22X1 U522 ( .A(n373), .B(n385), .C(N255), .D(n384), .Y(n374) );
  OAI21X1 U523 ( .A(n389), .B(n376), .C(n374), .Y(n582) );
  INVX2 U524 ( .A(Gy[9]), .Y(n381) );
  INVX2 U525 ( .A(n375), .Y(n377) );
  NAND2X1 U526 ( .A(n377), .B(n376), .Y(n380) );
  XOR2X1 U527 ( .A(n380), .B(Gy[9]), .Y(n378) );
  AOI22X1 U528 ( .A(n378), .B(n385), .C(N256), .D(n384), .Y(n379) );
  OAI21X1 U529 ( .A(n389), .B(n381), .C(n379), .Y(n581) );
  INVX2 U530 ( .A(Gy[10]), .Y(n406) );
  INVX2 U531 ( .A(n380), .Y(n382) );
  NAND2X1 U532 ( .A(n382), .B(n381), .Y(n383) );
  XOR2X1 U533 ( .A(n383), .B(Gy[10]), .Y(n387) );
  AOI22X1 U534 ( .A(n387), .B(n385), .C(N257), .D(n384), .Y(n388) );
  OAI21X1 U535 ( .A(n406), .B(n389), .C(n388), .Y(n568) );
  NOR2X1 U536 ( .A(N290), .B(N289), .Y(n391) );
  INVX2 U537 ( .A(N288), .Y(n390) );
  AOI21X1 U538 ( .A(n391), .B(n390), .C(n632), .Y(n392) );
  INVX2 U539 ( .A(n392), .Y(n402) );
  INVX2 U540 ( .A(n632), .Y(n400) );
  MUX2X1 U541 ( .B(temp_sum[0]), .A(N280), .S(n400), .Y(n393) );
  NAND2X1 U542 ( .A(n402), .B(n393), .Y(n590) );
  MUX2X1 U543 ( .B(temp_sum[1]), .A(N281), .S(n400), .Y(n394) );
  NAND2X1 U544 ( .A(n402), .B(n394), .Y(n591) );
  MUX2X1 U545 ( .B(temp_sum[2]), .A(N282), .S(n400), .Y(n395) );
  NAND2X1 U546 ( .A(n402), .B(n395), .Y(n592) );
  MUX2X1 U547 ( .B(temp_sum[3]), .A(N283), .S(n400), .Y(n396) );
  NAND2X1 U548 ( .A(n402), .B(n396), .Y(n593) );
  MUX2X1 U549 ( .B(temp_sum[4]), .A(N284), .S(n400), .Y(n397) );
  NAND2X1 U550 ( .A(n402), .B(n397), .Y(n594) );
  MUX2X1 U551 ( .B(temp_sum[5]), .A(N285), .S(n400), .Y(n398) );
  NAND2X1 U552 ( .A(n402), .B(n398), .Y(n595) );
  MUX2X1 U553 ( .B(temp_sum[6]), .A(N286), .S(n400), .Y(n399) );
  NAND2X1 U554 ( .A(n402), .B(n399), .Y(n596) );
  MUX2X1 U555 ( .B(temp_sum[7]), .A(N287), .S(n400), .Y(n401) );
  NAND2X1 U556 ( .A(n402), .B(n401), .Y(n597) );
  NAND2X1 U557 ( .A(n22), .B(n8), .Y(n617) );
  NAND2X1 U558 ( .A(n9), .B(n18), .Y(n616) );
  NAND2X1 U559 ( .A(n2), .B(n8), .Y(n610) );
  OAI21X1 U560 ( .A(Gx[10]), .B(n610), .C(n632), .Y(n619) );
  INVX2 U561 ( .A(n607), .Y(n403) );
  NOR2X1 U562 ( .A(n404), .B(n403), .Y(n405) );
  OAI21X1 U563 ( .A(n617), .B(n406), .C(n405), .Y(n625) );
  INVX2 U564 ( .A(Gx[10]), .Y(n407) );
  OAI21X1 U565 ( .A(n610), .B(n407), .C(n616), .Y(n624) );
  INVX2 U566 ( .A(n624), .Y(n564) );
  OAI21X1 U567 ( .A(Gy[10]), .B(n617), .C(n616), .Y(n618) );
  INVX2 U568 ( .A(n633), .Y(n565) );
  INVX2 U569 ( .A(n605), .Y(n566) );
  NOR2X1 U570 ( .A(n612), .B(n611), .Y(n613) );
endmodule


module edge_detection_5_DW01_add_0 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [10:1] carry;

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_5_DW01_add_1 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1;
  wire   [10:1] carry;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  XOR2X1 U1 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  NAND2X1 U2 ( .A(B[1]), .B(A[1]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(carry[2]) );
endmodule


module edge_detection_5_DW01_add_2 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1;
  wire   [10:1] carry;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  XOR2X1 U1 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  NAND2X1 U2 ( .A(B[1]), .B(A[1]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(carry[2]) );
endmodule


module edge_detection_5_DW01_add_3 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;

  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_5_DW01_add_4 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;

  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_5_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  INVX1 U1 ( .A(B[3]), .Y(n5) );
  INVX1 U2 ( .A(B[2]), .Y(n6) );
  INVX1 U3 ( .A(B[1]), .Y(n7) );
  OR2X2 U4 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U5 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U6 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U7 ( .A(B[7]), .Y(n2) );
  INVX2 U8 ( .A(B[5]), .Y(n3) );
  INVX2 U9 ( .A(B[4]), .Y(n4) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_5_DW01_sub_3 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_5_DW01_sub_4 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_5_DW01_sub_5 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n3), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n4), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n5), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n6), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n7), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n9), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[6]), .Y(n3) );
  INVX2 U6 ( .A(B[5]), .Y(n4) );
  INVX2 U7 ( .A(B[4]), .Y(n5) );
  INVX2 U8 ( .A(B[3]), .Y(n6) );
  INVX2 U9 ( .A(B[2]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[1]), .Y(n9) );
endmodule


module edge_detection_5_DW01_sub_6 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_5_DW01_sub_7 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X2 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_5 ( clk, n_rst, i_gradient_start, P0, P1, P2, P3, P4, P5, 
        P6, P7, P8, o_gradient_data_ready, o_processed_sum );
  input [7:0] P0;
  input [7:0] P1;
  input [7:0] P2;
  input [7:0] P3;
  input [7:0] P4;
  input [7:0] P5;
  input [7:0] P6;
  input [7:0] P7;
  input [7:0] P8;
  output [7:0] o_processed_sum;
  input clk, n_rst, i_gradient_start;
  output o_gradient_data_ready;
  wire   N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152,
         N153, N154, N155, N156, N157, N158, N159, N160, N161, N162, N163,
         N164, N165, N166, N167, N168, N169, N170, N171, N172, N173, N174,
         N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N187, N188, N189, N190, N191, N192, N193, N194, N195, N197,
         N198, N199, N200, N201, N202, N203, N204, N205, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N269, N280, N281, N282, N283, N284,
         N285, N286, N287, N288, N289, N290, n1, n2, n8, n9, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n65, n141,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n443, n444, n451, n452, n461, n466,
         n469, n477, n478, n479, n480, n482, n483, n486, n487, n488, n517,
         n518, n520, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633;
  wire   [5:0] state;
  wire   [8:0] A1;
  wire   [9:0] C1;
  wire   [8:0] D1;
  wire   [9:0] E1;
  wire   [8:0] A2;
  wire   [9:0] C2;
  wire   [8:0] D2;
  wire   [9:0] E2;
  wire   [10:0] Gx;
  wire   [10:0] Gy;
  wire   [7:0] temp_sum;

  DFFSR \Gy_reg[0]  ( .D(n567), .CLK(clk), .R(n177), .S(1'b1), .Q(N269) );
  DFFSR \Gy_reg[10]  ( .D(n568), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[10]) );
  DFFSR \state_reg[0]  ( .D(n19), .CLK(clk), .R(n177), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n569), .CLK(clk), .R(n177), .S(1'b1), .Q(state[1])
         );
  DFFSR \C1_reg[9]  ( .D(n526), .CLK(clk), .R(n177), .S(1'b1), .Q(C1[9]) );
  DFFSR \Gx_reg[10]  ( .D(n580), .CLK(clk), .R(n176), .S(1'b1), .Q(Gx[10]) );
  DFFSR \state_reg[3]  ( .D(n21), .CLK(clk), .R(n176), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(n20), .CLK(clk), .R(n176), .S(1'b1), .Q(state[2])
         );
  DFFSR \A1_reg[0]  ( .D(n418), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[0]) );
  DFFSR \A1_reg[1]  ( .D(n417), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[1]) );
  DFFSR \A1_reg[2]  ( .D(n416), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[2]) );
  DFFSR \A1_reg[3]  ( .D(n415), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[3]) );
  DFFSR \A1_reg[4]  ( .D(n414), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[4]) );
  DFFSR \A1_reg[5]  ( .D(n413), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[5]) );
  DFFSR \A1_reg[6]  ( .D(n412), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[6]) );
  DFFSR \A1_reg[7]  ( .D(n411), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[7]) );
  DFFSR \A1_reg[8]  ( .D(n410), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[8]) );
  DFFSR \B1_reg[0]  ( .D(n436), .CLK(clk), .R(n175), .S(1'b1), .Q(N197) );
  DFFSR \B1_reg[1]  ( .D(n435), .CLK(clk), .R(n175), .S(1'b1), .Q(N198) );
  DFFSR \B1_reg[2]  ( .D(n434), .CLK(clk), .R(n175), .S(1'b1), .Q(N199) );
  DFFSR \B1_reg[3]  ( .D(n433), .CLK(clk), .R(n175), .S(1'b1), .Q(N200) );
  DFFSR \B1_reg[4]  ( .D(n432), .CLK(clk), .R(n175), .S(1'b1), .Q(N201) );
  DFFSR \B1_reg[5]  ( .D(n431), .CLK(clk), .R(n175), .S(1'b1), .Q(N202) );
  DFFSR \B1_reg[6]  ( .D(n430), .CLK(clk), .R(n175), .S(1'b1), .Q(N203) );
  DFFSR \B1_reg[7]  ( .D(n429), .CLK(clk), .R(n175), .S(1'b1), .Q(N204) );
  DFFSR \B1_reg[8]  ( .D(n428), .CLK(clk), .R(n175), .S(1'b1), .Q(N205) );
  DFFSR \C1_reg[1]  ( .D(n534), .CLK(clk), .R(n175), .S(1'b1), .Q(C1[1]) );
  DFFSR \C1_reg[2]  ( .D(n533), .CLK(clk), .R(n175), .S(1'b1), .Q(C1[2]) );
  DFFSR \C1_reg[3]  ( .D(n532), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[3]) );
  DFFSR \C1_reg[4]  ( .D(n531), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[4]) );
  DFFSR \C1_reg[5]  ( .D(n530), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[5]) );
  DFFSR \C1_reg[6]  ( .D(n529), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[6]) );
  DFFSR \C1_reg[7]  ( .D(n528), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[7]) );
  DFFSR \C1_reg[8]  ( .D(n527), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[8]) );
  DFFSR \D1_reg[0]  ( .D(n483), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[0]) );
  DFFSR \D1_reg[1]  ( .D(n482), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[1]) );
  DFFSR \D1_reg[2]  ( .D(n480), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[2]) );
  DFFSR \D1_reg[3]  ( .D(n479), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[3]) );
  DFFSR \D1_reg[4]  ( .D(n478), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[4]) );
  DFFSR \D1_reg[5]  ( .D(n477), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[5]) );
  DFFSR \D1_reg[6]  ( .D(n469), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[6]) );
  DFFSR \D1_reg[7]  ( .D(n466), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[7]) );
  DFFSR \D1_reg[8]  ( .D(n461), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[8]) );
  DFFSR \E1_reg[0]  ( .D(n553), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[0]) );
  DFFSR \E1_reg[1]  ( .D(n552), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[1]) );
  DFFSR \E1_reg[2]  ( .D(n551), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[2]) );
  DFFSR \E1_reg[3]  ( .D(n550), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[3]) );
  DFFSR \E1_reg[4]  ( .D(n549), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[4]) );
  DFFSR \E1_reg[5]  ( .D(n548), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[5]) );
  DFFSR \E1_reg[6]  ( .D(n547), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[6]) );
  DFFSR \E1_reg[7]  ( .D(n546), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[7]) );
  DFFSR \E1_reg[8]  ( .D(n545), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[8]) );
  DFFSR \E1_reg[9]  ( .D(n544), .CLK(clk), .R(n172), .S(1'b1), .Q(E1[9]) );
  DFFSR \A2_reg[0]  ( .D(n427), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[0]) );
  DFFSR \A2_reg[1]  ( .D(n426), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[1]) );
  DFFSR \A2_reg[2]  ( .D(n425), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[2]) );
  DFFSR \A2_reg[3]  ( .D(n424), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[3]) );
  DFFSR \A2_reg[4]  ( .D(n423), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[4]) );
  DFFSR \A2_reg[5]  ( .D(n422), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[5]) );
  DFFSR \A2_reg[6]  ( .D(n421), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[6]) );
  DFFSR \A2_reg[7]  ( .D(n420), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[7]) );
  DFFSR \A2_reg[8]  ( .D(n419), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[8]) );
  DFFSR \B2_reg[0]  ( .D(n452), .CLK(clk), .R(n172), .S(1'b1), .Q(N207) );
  DFFSR \B2_reg[1]  ( .D(n451), .CLK(clk), .R(n172), .S(1'b1), .Q(N208) );
  DFFSR \B2_reg[2]  ( .D(n444), .CLK(clk), .R(n171), .S(1'b1), .Q(N209) );
  DFFSR \B2_reg[3]  ( .D(n443), .CLK(clk), .R(n171), .S(1'b1), .Q(N210) );
  DFFSR \B2_reg[4]  ( .D(n441), .CLK(clk), .R(n171), .S(1'b1), .Q(N211) );
  DFFSR \B2_reg[5]  ( .D(n440), .CLK(clk), .R(n171), .S(1'b1), .Q(N212) );
  DFFSR \B2_reg[6]  ( .D(n439), .CLK(clk), .R(n171), .S(1'b1), .Q(N213) );
  DFFSR \B2_reg[7]  ( .D(n438), .CLK(clk), .R(n171), .S(1'b1), .Q(N214) );
  DFFSR \B2_reg[8]  ( .D(n437), .CLK(clk), .R(n171), .S(1'b1), .Q(N215) );
  DFFSR \D2_reg[0]  ( .D(n525), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[0]) );
  DFFSR \D2_reg[1]  ( .D(n524), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[1]) );
  DFFSR \D2_reg[2]  ( .D(n523), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[2]) );
  DFFSR \D2_reg[3]  ( .D(n520), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[3]) );
  DFFSR \D2_reg[4]  ( .D(n518), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[4]) );
  DFFSR \D2_reg[5]  ( .D(n517), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[5]) );
  DFFSR \D2_reg[6]  ( .D(n488), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[6]) );
  DFFSR \D2_reg[7]  ( .D(n487), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[7]) );
  DFFSR \D2_reg[8]  ( .D(n486), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[8]) );
  DFFSR \E2_reg[0]  ( .D(n563), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[0]) );
  DFFSR \E2_reg[1]  ( .D(n562), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[1]) );
  DFFSR \E2_reg[2]  ( .D(n561), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[2]) );
  DFFSR \E2_reg[3]  ( .D(n560), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[3]) );
  DFFSR \E2_reg[4]  ( .D(n559), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[4]) );
  DFFSR \E2_reg[5]  ( .D(n558), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[5]) );
  DFFSR \E2_reg[6]  ( .D(n557), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[6]) );
  DFFSR \E2_reg[7]  ( .D(n556), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[7]) );
  DFFSR \E2_reg[8]  ( .D(n555), .CLK(clk), .R(n169), .S(1'b1), .Q(E2[8]) );
  DFFSR \E2_reg[9]  ( .D(n554), .CLK(clk), .R(n169), .S(1'b1), .Q(E2[9]) );
  DFFSR o_gradient_data_ready_reg ( .D(n565), .CLK(clk), .R(n169), .S(1'b1), 
        .Q(o_gradient_data_ready) );
  DFFSR \Gx_reg[0]  ( .D(n570), .CLK(clk), .R(n169), .S(1'b1), .Q(N258) );
  DFFSR \Gx_reg[1]  ( .D(n571), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[1]) );
  DFFSR \Gx_reg[2]  ( .D(n572), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[2]) );
  DFFSR \Gx_reg[3]  ( .D(n573), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[3]) );
  DFFSR \Gx_reg[4]  ( .D(n574), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[4]) );
  DFFSR \Gx_reg[5]  ( .D(n575), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[5]) );
  DFFSR \Gx_reg[6]  ( .D(n576), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[6]) );
  DFFSR \Gx_reg[7]  ( .D(n577), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[7]) );
  DFFSR \Gx_reg[8]  ( .D(n578), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[8]) );
  DFFSR \Gx_reg[9]  ( .D(n579), .CLK(clk), .R(n168), .S(1'b1), .Q(Gx[9]) );
  DFFSR \C2_reg[1]  ( .D(n543), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[1]) );
  DFFSR \C2_reg[2]  ( .D(n542), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[2]) );
  DFFSR \C2_reg[3]  ( .D(n541), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[3]) );
  DFFSR \C2_reg[4]  ( .D(n540), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[4]) );
  DFFSR \C2_reg[5]  ( .D(n539), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[5]) );
  DFFSR \C2_reg[6]  ( .D(n538), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[6]) );
  DFFSR \C2_reg[7]  ( .D(n537), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[7]) );
  DFFSR \C2_reg[8]  ( .D(n536), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[8]) );
  DFFSR \C2_reg[9]  ( .D(n535), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[9]) );
  DFFSR \Gy_reg[1]  ( .D(n589), .CLK(clk), .R(n168), .S(1'b1), .Q(Gy[1]) );
  DFFSR \Gy_reg[2]  ( .D(n588), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[2]) );
  DFFSR \Gy_reg[3]  ( .D(n587), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[3]) );
  DFFSR \Gy_reg[4]  ( .D(n586), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[4]) );
  DFFSR \Gy_reg[5]  ( .D(n585), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[5]) );
  DFFSR \Gy_reg[6]  ( .D(n584), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[6]) );
  DFFSR \Gy_reg[7]  ( .D(n583), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[7]) );
  DFFSR \Gy_reg[8]  ( .D(n582), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[8]) );
  DFFSR \Gy_reg[9]  ( .D(n581), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[9]) );
  DFFSR \temp_sum_reg[0]  ( .D(n590), .CLK(clk), .R(n141), .S(1'b1), .Q(
        temp_sum[0]) );
  DFFSR \o_processed_sum_reg[0]  ( .D(temp_sum[0]), .CLK(clk), .R(n141), .S(
        1'b1), .Q(o_processed_sum[0]) );
  DFFSR \temp_sum_reg[1]  ( .D(n591), .CLK(clk), .R(n141), .S(1'b1), .Q(
        temp_sum[1]) );
  DFFSR \o_processed_sum_reg[1]  ( .D(temp_sum[1]), .CLK(clk), .R(n141), .S(
        1'b1), .Q(o_processed_sum[1]) );
  DFFSR \temp_sum_reg[2]  ( .D(n592), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[2]) );
  DFFSR \o_processed_sum_reg[2]  ( .D(temp_sum[2]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[2]) );
  DFFSR \temp_sum_reg[3]  ( .D(n593), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[3]) );
  DFFSR \o_processed_sum_reg[3]  ( .D(temp_sum[3]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[3]) );
  DFFSR \temp_sum_reg[4]  ( .D(n594), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[4]) );
  DFFSR \o_processed_sum_reg[4]  ( .D(temp_sum[4]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[4]) );
  DFFSR \temp_sum_reg[5]  ( .D(n595), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[5]) );
  DFFSR \o_processed_sum_reg[5]  ( .D(temp_sum[5]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[5]) );
  DFFSR \temp_sum_reg[6]  ( .D(n596), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[6]) );
  DFFSR \o_processed_sum_reg[6]  ( .D(temp_sum[6]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[6]) );
  DFFSR \temp_sum_reg[7]  ( .D(n597), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[7]) );
  DFFSR \o_processed_sum_reg[7]  ( .D(temp_sum[7]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[7]) );
  AND2X2 U157 ( .A(n630), .B(n623), .Y(n614) );
  AND2X2 U160 ( .A(n633), .B(n632), .Y(n600) );
  OR2X1 U458 ( .A(n625), .B(n624), .Y(n626) );
  NAND3X1 U459 ( .A(n623), .B(n622), .C(n408), .Y(n627) );
  OR2X1 U462 ( .A(n619), .B(n618), .Y(n620) );
  NAND3X1 U464 ( .A(n615), .B(n622), .C(n614), .Y(n621) );
  OAI21X1 U465 ( .A(n622), .B(n409), .C(n613), .Y(n569) );
  NAND2X1 U467 ( .A(n564), .B(n617), .Y(n611) );
  NAND3X1 U469 ( .A(n628), .B(n632), .C(n629), .Y(n612) );
  OR2X1 U472 ( .A(n619), .B(n625), .Y(n608) );
  NAND3X1 U475 ( .A(n629), .B(n622), .C(n606), .Y(n609) );
  NAND2X1 U476 ( .A(i_gradient_start), .B(n566), .Y(n606) );
  NAND2X1 U477 ( .A(n604), .B(n603), .Y(n622) );
  NOR2X1 U478 ( .A(n602), .B(n601), .Y(n603) );
  NAND3X1 U479 ( .A(n630), .B(n629), .C(n610), .Y(n601) );
  NAND3X1 U482 ( .A(n631), .B(n628), .C(n600), .Y(n602) );
  NAND3X1 U484 ( .A(state[2]), .B(n17), .C(state[3]), .Y(n633) );
  NOR2X1 U487 ( .A(n599), .B(n598), .Y(n604) );
  NAND3X1 U488 ( .A(n605), .B(n616), .C(n408), .Y(n598) );
  NAND2X1 U490 ( .A(n16), .B(n2), .Y(n605) );
  NAND3X1 U491 ( .A(n617), .B(n607), .C(n623), .Y(n599) );
  NAND2X1 U492 ( .A(n9), .B(n17), .Y(n623) );
  NAND2X1 U493 ( .A(n22), .B(n9), .Y(n607) );
  edge_detection_5_DW01_add_0 add_231 ( .A({Gx[10:1], N258}), .B({Gy[10:1], 
        N269}), .CI(1'b0), .SUM({N290, N289, N288, N287, N286, N285, N284, 
        N283, N282, N281, N280}) );
  edge_detection_5_DW01_add_1 add_219 ( .A({C2[9], C2[9:1], 1'b0}), .B({E2[9], 
        E2}), .CI(1'b0), .SUM({N257, N256, N255, N254, N253, N252, N251, N250, 
        N249, N248, N247}) );
  edge_detection_5_DW01_add_2 add_218 ( .A({C1[9], C1[9:1], 1'b0}), .B({E1[9], 
        E1}), .CI(1'b0), .SUM({N246, N245, N244, N243, N242, N241, N240, N239, 
        N238, N237, N236}) );
  edge_detection_5_DW01_add_3 add_214 ( .A({A2[8], A2}), .B({D2[8], D2}), .CI(
        1'b0), .SUM({N235, N234, N233, N232, N231, N230, N229, N228, N227, 
        N226}) );
  edge_detection_5_DW01_add_4 add_213 ( .A({A1[8], A1}), .B({D1[8], D1}), .CI(
        1'b0), .SUM({N225, N224, N223, N222, N221, N220, N219, N218, N217, 
        N216}) );
  edge_detection_5_DW01_sub_2 sub_204 ( .A({1'b0, P2}), .B({1'b0, P8}), .CI(
        1'b0), .DIFF({N195, N194, N193, N192, N191, N190, N189, N188, N187})
         );
  edge_detection_5_DW01_sub_3 sub_203 ( .A({1'b0, P8}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N186, N185, N184, N183, N182, N181, N180, N179, N178})
         );
  edge_detection_5_DW01_sub_4 sub_202 ( .A({1'b0, P1}), .B({1'b0, P7}), .CI(
        1'b0), .DIFF({N177, N176, N175, N174, N173, N172, N171, N170, N169})
         );
  edge_detection_5_DW01_sub_5 sub_201 ( .A({1'b0, P5}), .B({1'b0, P3}), .CI(
        1'b0), .DIFF({N168, N167, N166, N165, N164, N163, N162, N161, N160})
         );
  edge_detection_5_DW01_sub_6 sub_200 ( .A({1'b0, P0}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N159, N158, N157, N156, N155, N154, N153, N152, N151})
         );
  edge_detection_5_DW01_sub_7 sub_199 ( .A({1'b0, P2}), .B({1'b0, P0}), .CI(
        1'b0), .DIFF({N150, N149, N148, N147, N146, N145, N144, N143, N142})
         );
  NAND2X1 U5 ( .A(n2), .B(n9), .Y(n1) );
  AND2X2 U6 ( .A(n409), .B(n178), .Y(n2) );
  AND2X2 U12 ( .A(state[3]), .B(n179), .Y(n8) );
  AND2X2 U13 ( .A(state[2]), .B(n235), .Y(n9) );
  AND2X2 U52 ( .A(n235), .B(n179), .Y(n16) );
  AND2X2 U128 ( .A(state[1]), .B(n178), .Y(n17) );
  AND2X2 U155 ( .A(state[0]), .B(state[1]), .Y(n18) );
  OR2X2 U156 ( .A(n609), .B(n608), .Y(n19) );
  OR2X2 U158 ( .A(n621), .B(n620), .Y(n20) );
  OR2X2 U159 ( .A(n627), .B(n626), .Y(n21) );
  AND2X2 U161 ( .A(state[0]), .B(n409), .Y(n22) );
  OR2X2 U162 ( .A(n260), .B(Gx[6]), .Y(n264) );
  OR2X2 U163 ( .A(n268), .B(Gx[8]), .Y(n272) );
  OR2X2 U164 ( .A(N258), .B(Gx[1]), .Y(n244) );
  BUFX2 U165 ( .A(n323), .Y(n29) );
  BUFX2 U166 ( .A(n323), .Y(n28) );
  BUFX2 U167 ( .A(n323), .Y(n26) );
  BUFX2 U168 ( .A(n323), .Y(n27) );
  INVX2 U169 ( .A(n630), .Y(n25) );
  INVX2 U170 ( .A(n1), .Y(n384) );
  INVX2 U171 ( .A(n629), .Y(n24) );
  BUFX2 U172 ( .A(n323), .Y(n30) );
  INVX2 U173 ( .A(n631), .Y(n404) );
  AND2X2 U174 ( .A(n631), .B(n1), .Y(n23) );
  INVX2 U175 ( .A(n615), .Y(n385) );
  BUFX2 U176 ( .A(n_rst), .Y(n65) );
  BUFX2 U177 ( .A(n_rst), .Y(n141) );
  BUFX2 U178 ( .A(n_rst), .Y(n169) );
  BUFX2 U179 ( .A(n_rst), .Y(n170) );
  BUFX2 U180 ( .A(n_rst), .Y(n171) );
  BUFX2 U181 ( .A(n_rst), .Y(n172) );
  BUFX2 U182 ( .A(n_rst), .Y(n173) );
  BUFX2 U183 ( .A(n_rst), .Y(n174) );
  BUFX2 U184 ( .A(n_rst), .Y(n176) );
  BUFX2 U185 ( .A(n_rst), .Y(n168) );
  BUFX2 U186 ( .A(n_rst), .Y(n175) );
  BUFX2 U187 ( .A(n_rst), .Y(n177) );
  OR2X1 U188 ( .A(n244), .B(Gx[2]), .Y(n248) );
  OR2X1 U189 ( .A(n264), .B(Gx[7]), .Y(n268) );
  OR2X1 U190 ( .A(n256), .B(Gx[5]), .Y(n260) );
  OR2X1 U191 ( .A(n252), .B(Gx[4]), .Y(n256) );
  OR2X1 U192 ( .A(n248), .B(Gx[3]), .Y(n252) );
  INVX2 U195 ( .A(state[1]), .Y(n409) );
  INVX2 U196 ( .A(state[0]), .Y(n178) );
  NAND3X1 U197 ( .A(state[2]), .B(state[3]), .C(n2), .Y(n632) );
  INVX2 U198 ( .A(state[2]), .Y(n179) );
  NAND2X1 U199 ( .A(n17), .B(n8), .Y(n631) );
  INVX2 U200 ( .A(state[3]), .Y(n235) );
  NAND2X1 U201 ( .A(n16), .B(n22), .Y(n628) );
  INVX2 U202 ( .A(n628), .Y(n323) );
  MUX2X1 U203 ( .B(N205), .A(N168), .S(n26), .Y(n180) );
  INVX2 U204 ( .A(n180), .Y(n428) );
  NAND2X1 U205 ( .A(n16), .B(n17), .Y(n629) );
  INVX2 U206 ( .A(C1[9]), .Y(n182) );
  INVX2 U207 ( .A(N205), .Y(n181) );
  MUX2X1 U208 ( .B(n182), .A(n181), .S(n24), .Y(n526) );
  MUX2X1 U209 ( .B(N204), .A(N167), .S(n26), .Y(n183) );
  INVX2 U210 ( .A(n183), .Y(n429) );
  INVX2 U211 ( .A(C1[8]), .Y(n185) );
  INVX2 U212 ( .A(N204), .Y(n184) );
  MUX2X1 U213 ( .B(n185), .A(n184), .S(n24), .Y(n527) );
  MUX2X1 U214 ( .B(N203), .A(N166), .S(n26), .Y(n186) );
  INVX2 U215 ( .A(n186), .Y(n430) );
  INVX2 U216 ( .A(C1[7]), .Y(n188) );
  INVX2 U217 ( .A(N203), .Y(n187) );
  MUX2X1 U218 ( .B(n188), .A(n187), .S(n24), .Y(n528) );
  MUX2X1 U219 ( .B(N202), .A(N165), .S(n26), .Y(n189) );
  INVX2 U220 ( .A(n189), .Y(n431) );
  INVX2 U221 ( .A(C1[6]), .Y(n191) );
  INVX2 U222 ( .A(N202), .Y(n190) );
  MUX2X1 U223 ( .B(n191), .A(n190), .S(n24), .Y(n529) );
  MUX2X1 U224 ( .B(N201), .A(N164), .S(n26), .Y(n192) );
  INVX2 U225 ( .A(n192), .Y(n432) );
  INVX2 U226 ( .A(C1[5]), .Y(n194) );
  INVX2 U227 ( .A(N201), .Y(n193) );
  MUX2X1 U228 ( .B(n194), .A(n193), .S(n24), .Y(n530) );
  MUX2X1 U229 ( .B(N200), .A(N163), .S(n26), .Y(n195) );
  INVX2 U230 ( .A(n195), .Y(n433) );
  INVX2 U231 ( .A(C1[4]), .Y(n197) );
  INVX2 U232 ( .A(N200), .Y(n196) );
  MUX2X1 U233 ( .B(n197), .A(n196), .S(n24), .Y(n531) );
  MUX2X1 U234 ( .B(N199), .A(N162), .S(n26), .Y(n198) );
  INVX2 U235 ( .A(n198), .Y(n434) );
  INVX2 U236 ( .A(C1[3]), .Y(n200) );
  INVX2 U237 ( .A(N199), .Y(n199) );
  MUX2X1 U238 ( .B(n200), .A(n199), .S(n24), .Y(n532) );
  MUX2X1 U239 ( .B(N198), .A(N161), .S(n26), .Y(n201) );
  INVX2 U240 ( .A(n201), .Y(n435) );
  INVX2 U241 ( .A(C1[2]), .Y(n203) );
  INVX2 U242 ( .A(N198), .Y(n202) );
  MUX2X1 U243 ( .B(n203), .A(n202), .S(n24), .Y(n533) );
  MUX2X1 U244 ( .B(N197), .A(N160), .S(n26), .Y(n204) );
  INVX2 U245 ( .A(n204), .Y(n436) );
  INVX2 U246 ( .A(C1[1]), .Y(n206) );
  INVX2 U247 ( .A(N197), .Y(n205) );
  MUX2X1 U248 ( .B(n206), .A(n205), .S(n24), .Y(n534) );
  MUX2X1 U249 ( .B(A1[8]), .A(N150), .S(n26), .Y(n207) );
  INVX2 U250 ( .A(n207), .Y(n410) );
  MUX2X1 U251 ( .B(A1[7]), .A(N149), .S(n26), .Y(n208) );
  INVX2 U252 ( .A(n208), .Y(n411) );
  MUX2X1 U253 ( .B(A1[6]), .A(N148), .S(n26), .Y(n209) );
  INVX2 U254 ( .A(n209), .Y(n412) );
  MUX2X1 U255 ( .B(A1[5]), .A(N147), .S(n26), .Y(n210) );
  INVX2 U256 ( .A(n210), .Y(n413) );
  MUX2X1 U257 ( .B(A1[4]), .A(N146), .S(n27), .Y(n211) );
  INVX2 U258 ( .A(n211), .Y(n414) );
  MUX2X1 U259 ( .B(A1[3]), .A(N145), .S(n27), .Y(n212) );
  INVX2 U260 ( .A(n212), .Y(n415) );
  MUX2X1 U261 ( .B(A1[2]), .A(N144), .S(n27), .Y(n213) );
  INVX2 U262 ( .A(n213), .Y(n416) );
  MUX2X1 U263 ( .B(A1[1]), .A(N143), .S(n27), .Y(n214) );
  INVX2 U264 ( .A(n214), .Y(n417) );
  MUX2X1 U265 ( .B(A1[0]), .A(N142), .S(n27), .Y(n215) );
  INVX2 U266 ( .A(n215), .Y(n418) );
  MUX2X1 U267 ( .B(D1[8]), .A(N186), .S(n27), .Y(n216) );
  INVX2 U268 ( .A(n216), .Y(n461) );
  MUX2X1 U269 ( .B(D1[7]), .A(N185), .S(n27), .Y(n217) );
  INVX2 U270 ( .A(n217), .Y(n466) );
  MUX2X1 U271 ( .B(D1[6]), .A(N184), .S(n27), .Y(n218) );
  INVX2 U272 ( .A(n218), .Y(n469) );
  MUX2X1 U273 ( .B(D1[5]), .A(N183), .S(n27), .Y(n219) );
  INVX2 U274 ( .A(n219), .Y(n477) );
  MUX2X1 U275 ( .B(D1[4]), .A(N182), .S(n27), .Y(n220) );
  INVX2 U276 ( .A(n220), .Y(n478) );
  MUX2X1 U277 ( .B(D1[3]), .A(N181), .S(n27), .Y(n221) );
  INVX2 U278 ( .A(n221), .Y(n479) );
  MUX2X1 U279 ( .B(D1[2]), .A(N180), .S(n27), .Y(n222) );
  INVX2 U280 ( .A(n222), .Y(n480) );
  MUX2X1 U281 ( .B(D1[1]), .A(N179), .S(n27), .Y(n223) );
  INVX2 U282 ( .A(n223), .Y(n482) );
  MUX2X1 U283 ( .B(D1[0]), .A(N178), .S(n28), .Y(n224) );
  INVX2 U284 ( .A(n224), .Y(n483) );
  NAND2X1 U285 ( .A(n16), .B(n18), .Y(n630) );
  MUX2X1 U286 ( .B(E1[9]), .A(N225), .S(n25), .Y(n225) );
  INVX2 U287 ( .A(n225), .Y(n544) );
  MUX2X1 U288 ( .B(E1[8]), .A(N224), .S(n25), .Y(n226) );
  INVX2 U289 ( .A(n226), .Y(n545) );
  MUX2X1 U290 ( .B(E1[7]), .A(N223), .S(n25), .Y(n227) );
  INVX2 U291 ( .A(n227), .Y(n546) );
  MUX2X1 U292 ( .B(E1[6]), .A(N222), .S(n25), .Y(n228) );
  INVX2 U293 ( .A(n228), .Y(n547) );
  MUX2X1 U294 ( .B(E1[5]), .A(N221), .S(n25), .Y(n229) );
  INVX2 U295 ( .A(n229), .Y(n548) );
  MUX2X1 U296 ( .B(E1[4]), .A(N220), .S(n25), .Y(n230) );
  INVX2 U297 ( .A(n230), .Y(n549) );
  MUX2X1 U298 ( .B(E1[3]), .A(N219), .S(n25), .Y(n231) );
  INVX2 U299 ( .A(n231), .Y(n550) );
  MUX2X1 U300 ( .B(E1[2]), .A(N218), .S(n25), .Y(n232) );
  INVX2 U301 ( .A(n232), .Y(n551) );
  MUX2X1 U302 ( .B(E1[1]), .A(N217), .S(n25), .Y(n233) );
  INVX2 U303 ( .A(n233), .Y(n552) );
  MUX2X1 U304 ( .B(E1[0]), .A(N216), .S(n25), .Y(n234) );
  INVX2 U305 ( .A(n234), .Y(n553) );
  INVX2 U306 ( .A(N236), .Y(n237) );
  OAI21X1 U307 ( .A(n404), .B(n23), .C(N258), .Y(n236) );
  OAI21X1 U308 ( .A(n1), .B(n237), .C(n236), .Y(n570) );
  INVX2 U309 ( .A(N237), .Y(n240) );
  XOR2X1 U310 ( .A(Gx[1]), .B(N258), .Y(n238) );
  AOI22X1 U311 ( .A(n238), .B(n404), .C(Gx[1]), .D(n23), .Y(n239) );
  OAI21X1 U312 ( .A(n1), .B(n240), .C(n239), .Y(n571) );
  INVX2 U313 ( .A(N238), .Y(n243) );
  XOR2X1 U314 ( .A(n244), .B(Gx[2]), .Y(n241) );
  AOI22X1 U315 ( .A(n241), .B(n404), .C(Gx[2]), .D(n23), .Y(n242) );
  OAI21X1 U316 ( .A(n1), .B(n243), .C(n242), .Y(n572) );
  INVX2 U317 ( .A(N239), .Y(n247) );
  XOR2X1 U318 ( .A(n248), .B(Gx[3]), .Y(n245) );
  AOI22X1 U319 ( .A(n245), .B(n404), .C(Gx[3]), .D(n23), .Y(n246) );
  OAI21X1 U320 ( .A(n1), .B(n247), .C(n246), .Y(n573) );
  INVX2 U321 ( .A(N240), .Y(n251) );
  XOR2X1 U322 ( .A(n252), .B(Gx[4]), .Y(n249) );
  AOI22X1 U323 ( .A(n249), .B(n404), .C(Gx[4]), .D(n23), .Y(n250) );
  OAI21X1 U324 ( .A(n1), .B(n251), .C(n250), .Y(n574) );
  INVX2 U325 ( .A(N241), .Y(n255) );
  XOR2X1 U326 ( .A(n256), .B(Gx[5]), .Y(n253) );
  AOI22X1 U327 ( .A(n253), .B(n404), .C(Gx[5]), .D(n23), .Y(n254) );
  OAI21X1 U328 ( .A(n1), .B(n255), .C(n254), .Y(n575) );
  INVX2 U329 ( .A(N242), .Y(n259) );
  XOR2X1 U330 ( .A(n260), .B(Gx[6]), .Y(n257) );
  AOI22X1 U331 ( .A(n257), .B(n404), .C(Gx[6]), .D(n23), .Y(n258) );
  OAI21X1 U332 ( .A(n1), .B(n259), .C(n258), .Y(n576) );
  INVX2 U333 ( .A(N243), .Y(n263) );
  XOR2X1 U334 ( .A(n264), .B(Gx[7]), .Y(n261) );
  AOI22X1 U335 ( .A(n261), .B(n404), .C(Gx[7]), .D(n23), .Y(n262) );
  OAI21X1 U336 ( .A(n1), .B(n263), .C(n262), .Y(n577) );
  INVX2 U337 ( .A(N244), .Y(n267) );
  XOR2X1 U338 ( .A(n268), .B(Gx[8]), .Y(n265) );
  AOI22X1 U339 ( .A(n265), .B(n404), .C(Gx[8]), .D(n23), .Y(n266) );
  OAI21X1 U340 ( .A(n1), .B(n267), .C(n266), .Y(n578) );
  INVX2 U341 ( .A(N245), .Y(n271) );
  XOR2X1 U342 ( .A(n272), .B(Gx[9]), .Y(n269) );
  AOI22X1 U343 ( .A(n269), .B(n404), .C(Gx[9]), .D(n23), .Y(n270) );
  OAI21X1 U344 ( .A(n1), .B(n271), .C(n270), .Y(n579) );
  NOR2X1 U345 ( .A(Gx[9]), .B(n272), .Y(n273) );
  XNOR2X1 U346 ( .A(n273), .B(Gx[10]), .Y(n274) );
  AOI22X1 U347 ( .A(n23), .B(Gx[10]), .C(n274), .D(n404), .Y(n276) );
  NAND2X1 U348 ( .A(N246), .B(n384), .Y(n275) );
  NAND2X1 U349 ( .A(n276), .B(n275), .Y(n580) );
  NAND2X1 U350 ( .A(n8), .B(n18), .Y(n615) );
  MUX2X1 U351 ( .B(N215), .A(N177), .S(n28), .Y(n277) );
  INVX2 U352 ( .A(n277), .Y(n437) );
  INVX2 U353 ( .A(C2[9]), .Y(n279) );
  INVX2 U354 ( .A(N215), .Y(n278) );
  MUX2X1 U355 ( .B(n279), .A(n278), .S(n24), .Y(n535) );
  MUX2X1 U356 ( .B(N214), .A(N176), .S(n28), .Y(n280) );
  INVX2 U357 ( .A(n280), .Y(n438) );
  INVX2 U358 ( .A(C2[8]), .Y(n282) );
  INVX2 U359 ( .A(N214), .Y(n281) );
  MUX2X1 U360 ( .B(n282), .A(n281), .S(n24), .Y(n536) );
  MUX2X1 U361 ( .B(N213), .A(N175), .S(n28), .Y(n283) );
  INVX2 U362 ( .A(n283), .Y(n439) );
  INVX2 U363 ( .A(C2[7]), .Y(n285) );
  INVX2 U364 ( .A(N213), .Y(n284) );
  MUX2X1 U365 ( .B(n285), .A(n284), .S(n24), .Y(n537) );
  MUX2X1 U366 ( .B(N212), .A(N174), .S(n28), .Y(n286) );
  INVX2 U367 ( .A(n286), .Y(n440) );
  INVX2 U368 ( .A(C2[6]), .Y(n288) );
  INVX2 U369 ( .A(N212), .Y(n287) );
  MUX2X1 U370 ( .B(n288), .A(n287), .S(n24), .Y(n538) );
  MUX2X1 U371 ( .B(N211), .A(N173), .S(n28), .Y(n289) );
  INVX2 U372 ( .A(n289), .Y(n441) );
  INVX2 U373 ( .A(C2[5]), .Y(n291) );
  INVX2 U374 ( .A(N211), .Y(n290) );
  MUX2X1 U375 ( .B(n291), .A(n290), .S(n24), .Y(n539) );
  MUX2X1 U376 ( .B(N210), .A(N172), .S(n28), .Y(n292) );
  INVX2 U377 ( .A(n292), .Y(n443) );
  INVX2 U378 ( .A(C2[4]), .Y(n294) );
  INVX2 U379 ( .A(N210), .Y(n293) );
  MUX2X1 U380 ( .B(n294), .A(n293), .S(n24), .Y(n540) );
  MUX2X1 U381 ( .B(N209), .A(N171), .S(n28), .Y(n295) );
  INVX2 U382 ( .A(n295), .Y(n444) );
  INVX2 U383 ( .A(C2[3]), .Y(n297) );
  INVX2 U384 ( .A(N209), .Y(n296) );
  MUX2X1 U385 ( .B(n297), .A(n296), .S(n24), .Y(n541) );
  MUX2X1 U386 ( .B(N208), .A(N170), .S(n28), .Y(n298) );
  INVX2 U387 ( .A(n298), .Y(n451) );
  INVX2 U388 ( .A(C2[2]), .Y(n300) );
  INVX2 U389 ( .A(N208), .Y(n299) );
  MUX2X1 U390 ( .B(n300), .A(n299), .S(n24), .Y(n542) );
  MUX2X1 U391 ( .B(N207), .A(N169), .S(n28), .Y(n301) );
  INVX2 U392 ( .A(n301), .Y(n452) );
  INVX2 U393 ( .A(C2[1]), .Y(n304) );
  INVX2 U394 ( .A(N207), .Y(n302) );
  MUX2X1 U395 ( .B(n304), .A(n302), .S(n24), .Y(n543) );
  MUX2X1 U396 ( .B(A2[8]), .A(N159), .S(n28), .Y(n305) );
  INVX2 U397 ( .A(n305), .Y(n419) );
  MUX2X1 U398 ( .B(A2[7]), .A(N158), .S(n28), .Y(n306) );
  INVX2 U399 ( .A(n306), .Y(n420) );
  MUX2X1 U400 ( .B(A2[6]), .A(N157), .S(n28), .Y(n307) );
  INVX2 U401 ( .A(n307), .Y(n421) );
  MUX2X1 U402 ( .B(A2[5]), .A(N156), .S(n29), .Y(n308) );
  INVX2 U403 ( .A(n308), .Y(n422) );
  MUX2X1 U404 ( .B(A2[4]), .A(N155), .S(n29), .Y(n309) );
  INVX2 U405 ( .A(n309), .Y(n423) );
  MUX2X1 U406 ( .B(A2[3]), .A(N154), .S(n29), .Y(n310) );
  INVX2 U407 ( .A(n310), .Y(n424) );
  MUX2X1 U408 ( .B(A2[2]), .A(N153), .S(n29), .Y(n311) );
  INVX2 U409 ( .A(n311), .Y(n425) );
  MUX2X1 U410 ( .B(A2[1]), .A(N152), .S(n29), .Y(n312) );
  INVX2 U411 ( .A(n312), .Y(n426) );
  MUX2X1 U412 ( .B(A2[0]), .A(N151), .S(n29), .Y(n313) );
  INVX2 U413 ( .A(n313), .Y(n427) );
  MUX2X1 U414 ( .B(D2[8]), .A(N195), .S(n29), .Y(n314) );
  INVX2 U415 ( .A(n314), .Y(n486) );
  MUX2X1 U416 ( .B(D2[7]), .A(N194), .S(n29), .Y(n316) );
  INVX2 U417 ( .A(n316), .Y(n487) );
  MUX2X1 U418 ( .B(D2[6]), .A(N193), .S(n29), .Y(n317) );
  INVX2 U419 ( .A(n317), .Y(n488) );
  MUX2X1 U420 ( .B(D2[5]), .A(N192), .S(n29), .Y(n318) );
  INVX2 U421 ( .A(n318), .Y(n517) );
  MUX2X1 U422 ( .B(D2[4]), .A(N191), .S(n29), .Y(n319) );
  INVX2 U423 ( .A(n319), .Y(n518) );
  MUX2X1 U424 ( .B(D2[3]), .A(N190), .S(n29), .Y(n320) );
  INVX2 U425 ( .A(n320), .Y(n520) );
  MUX2X1 U426 ( .B(D2[2]), .A(N189), .S(n29), .Y(n321) );
  INVX2 U427 ( .A(n321), .Y(n523) );
  MUX2X1 U428 ( .B(D2[1]), .A(N188), .S(n30), .Y(n322) );
  INVX2 U429 ( .A(n322), .Y(n524) );
  MUX2X1 U430 ( .B(D2[0]), .A(N187), .S(n30), .Y(n324) );
  INVX2 U431 ( .A(n324), .Y(n525) );
  MUX2X1 U432 ( .B(E2[9]), .A(N235), .S(n25), .Y(n325) );
  INVX2 U433 ( .A(n325), .Y(n554) );
  MUX2X1 U434 ( .B(E2[8]), .A(N234), .S(n25), .Y(n326) );
  INVX2 U435 ( .A(n326), .Y(n555) );
  MUX2X1 U436 ( .B(E2[7]), .A(N233), .S(n25), .Y(n327) );
  INVX2 U437 ( .A(n327), .Y(n556) );
  MUX2X1 U438 ( .B(E2[6]), .A(N232), .S(n25), .Y(n328) );
  INVX2 U439 ( .A(n328), .Y(n557) );
  MUX2X1 U440 ( .B(E2[5]), .A(N231), .S(n25), .Y(n329) );
  INVX2 U441 ( .A(n329), .Y(n558) );
  MUX2X1 U442 ( .B(E2[4]), .A(N230), .S(n25), .Y(n330) );
  INVX2 U443 ( .A(n330), .Y(n559) );
  MUX2X1 U444 ( .B(E2[3]), .A(N229), .S(n25), .Y(n331) );
  INVX2 U445 ( .A(n331), .Y(n560) );
  MUX2X1 U446 ( .B(E2[2]), .A(N228), .S(n25), .Y(n332) );
  INVX2 U447 ( .A(n332), .Y(n561) );
  MUX2X1 U448 ( .B(E2[1]), .A(N227), .S(n25), .Y(n333) );
  INVX2 U449 ( .A(n333), .Y(n562) );
  MUX2X1 U450 ( .B(E2[0]), .A(N226), .S(n25), .Y(n334) );
  INVX2 U451 ( .A(n334), .Y(n563) );
  INVX2 U452 ( .A(N247), .Y(n336) );
  NAND2X1 U453 ( .A(n1), .B(n615), .Y(n389) );
  INVX2 U454 ( .A(n389), .Y(n408) );
  OAI21X1 U455 ( .A(n385), .B(n408), .C(N269), .Y(n335) );
  OAI21X1 U456 ( .A(n1), .B(n336), .C(n335), .Y(n567) );
  INVX2 U457 ( .A(Gy[1]), .Y(n339) );
  XOR2X1 U460 ( .A(Gy[1]), .B(N269), .Y(n337) );
  AOI22X1 U461 ( .A(n337), .B(n385), .C(N248), .D(n384), .Y(n338) );
  OAI21X1 U463 ( .A(n389), .B(n339), .C(n338), .Y(n589) );
  INVX2 U466 ( .A(Gy[2]), .Y(n345) );
  INVX2 U468 ( .A(N269), .Y(n340) );
  NAND2X1 U470 ( .A(n340), .B(n339), .Y(n344) );
  XOR2X1 U471 ( .A(n344), .B(Gy[2]), .Y(n342) );
  AOI22X1 U473 ( .A(n342), .B(n385), .C(N249), .D(n384), .Y(n343) );
  OAI21X1 U474 ( .A(n389), .B(n345), .C(n343), .Y(n588) );
  INVX2 U480 ( .A(Gy[3]), .Y(n350) );
  INVX2 U481 ( .A(n344), .Y(n346) );
  NAND2X1 U483 ( .A(n346), .B(n345), .Y(n349) );
  XOR2X1 U485 ( .A(n349), .B(Gy[3]), .Y(n347) );
  AOI22X1 U486 ( .A(n347), .B(n385), .C(N250), .D(n384), .Y(n348) );
  OAI21X1 U489 ( .A(n389), .B(n350), .C(n348), .Y(n587) );
  INVX2 U494 ( .A(Gy[4]), .Y(n355) );
  INVX2 U495 ( .A(n349), .Y(n351) );
  NAND2X1 U496 ( .A(n351), .B(n350), .Y(n354) );
  XOR2X1 U497 ( .A(n354), .B(Gy[4]), .Y(n352) );
  AOI22X1 U498 ( .A(n352), .B(n385), .C(N251), .D(n384), .Y(n353) );
  OAI21X1 U499 ( .A(n389), .B(n355), .C(n353), .Y(n586) );
  INVX2 U500 ( .A(Gy[5]), .Y(n360) );
  INVX2 U501 ( .A(n354), .Y(n356) );
  NAND2X1 U502 ( .A(n356), .B(n355), .Y(n359) );
  XOR2X1 U503 ( .A(n359), .B(Gy[5]), .Y(n357) );
  AOI22X1 U504 ( .A(n357), .B(n385), .C(N252), .D(n384), .Y(n358) );
  OAI21X1 U505 ( .A(n389), .B(n360), .C(n358), .Y(n585) );
  INVX2 U506 ( .A(Gy[6]), .Y(n366) );
  INVX2 U507 ( .A(n359), .Y(n361) );
  NAND2X1 U508 ( .A(n361), .B(n360), .Y(n365) );
  XOR2X1 U509 ( .A(n365), .B(Gy[6]), .Y(n362) );
  AOI22X1 U510 ( .A(n362), .B(n385), .C(N253), .D(n384), .Y(n363) );
  OAI21X1 U511 ( .A(n389), .B(n366), .C(n363), .Y(n584) );
  INVX2 U512 ( .A(Gy[7]), .Y(n371) );
  INVX2 U513 ( .A(n365), .Y(n367) );
  NAND2X1 U514 ( .A(n367), .B(n366), .Y(n370) );
  XOR2X1 U515 ( .A(n370), .B(Gy[7]), .Y(n368) );
  AOI22X1 U516 ( .A(n368), .B(n385), .C(N254), .D(n384), .Y(n369) );
  OAI21X1 U517 ( .A(n389), .B(n371), .C(n369), .Y(n583) );
  INVX2 U518 ( .A(Gy[8]), .Y(n376) );
  INVX2 U519 ( .A(n370), .Y(n372) );
  NAND2X1 U520 ( .A(n372), .B(n371), .Y(n375) );
  XOR2X1 U521 ( .A(n375), .B(Gy[8]), .Y(n373) );
  AOI22X1 U522 ( .A(n373), .B(n385), .C(N255), .D(n384), .Y(n374) );
  OAI21X1 U523 ( .A(n389), .B(n376), .C(n374), .Y(n582) );
  INVX2 U524 ( .A(Gy[9]), .Y(n381) );
  INVX2 U525 ( .A(n375), .Y(n377) );
  NAND2X1 U526 ( .A(n377), .B(n376), .Y(n380) );
  XOR2X1 U527 ( .A(n380), .B(Gy[9]), .Y(n378) );
  AOI22X1 U528 ( .A(n378), .B(n385), .C(N256), .D(n384), .Y(n379) );
  OAI21X1 U529 ( .A(n389), .B(n381), .C(n379), .Y(n581) );
  INVX2 U530 ( .A(Gy[10]), .Y(n406) );
  INVX2 U531 ( .A(n380), .Y(n382) );
  NAND2X1 U532 ( .A(n382), .B(n381), .Y(n383) );
  XOR2X1 U533 ( .A(n383), .B(Gy[10]), .Y(n387) );
  AOI22X1 U534 ( .A(n387), .B(n385), .C(N257), .D(n384), .Y(n388) );
  OAI21X1 U535 ( .A(n406), .B(n389), .C(n388), .Y(n568) );
  NOR2X1 U536 ( .A(N290), .B(N289), .Y(n391) );
  INVX2 U537 ( .A(N288), .Y(n390) );
  AOI21X1 U538 ( .A(n391), .B(n390), .C(n632), .Y(n392) );
  INVX2 U539 ( .A(n392), .Y(n402) );
  INVX2 U540 ( .A(n632), .Y(n400) );
  MUX2X1 U541 ( .B(temp_sum[0]), .A(N280), .S(n400), .Y(n393) );
  NAND2X1 U542 ( .A(n402), .B(n393), .Y(n590) );
  MUX2X1 U543 ( .B(temp_sum[1]), .A(N281), .S(n400), .Y(n394) );
  NAND2X1 U544 ( .A(n402), .B(n394), .Y(n591) );
  MUX2X1 U545 ( .B(temp_sum[2]), .A(N282), .S(n400), .Y(n395) );
  NAND2X1 U546 ( .A(n402), .B(n395), .Y(n592) );
  MUX2X1 U547 ( .B(temp_sum[3]), .A(N283), .S(n400), .Y(n396) );
  NAND2X1 U548 ( .A(n402), .B(n396), .Y(n593) );
  MUX2X1 U549 ( .B(temp_sum[4]), .A(N284), .S(n400), .Y(n397) );
  NAND2X1 U550 ( .A(n402), .B(n397), .Y(n594) );
  MUX2X1 U551 ( .B(temp_sum[5]), .A(N285), .S(n400), .Y(n398) );
  NAND2X1 U552 ( .A(n402), .B(n398), .Y(n595) );
  MUX2X1 U553 ( .B(temp_sum[6]), .A(N286), .S(n400), .Y(n399) );
  NAND2X1 U554 ( .A(n402), .B(n399), .Y(n596) );
  MUX2X1 U555 ( .B(temp_sum[7]), .A(N287), .S(n400), .Y(n401) );
  NAND2X1 U556 ( .A(n402), .B(n401), .Y(n597) );
  NAND2X1 U557 ( .A(n22), .B(n8), .Y(n617) );
  NAND2X1 U558 ( .A(n9), .B(n18), .Y(n616) );
  NAND2X1 U559 ( .A(n2), .B(n8), .Y(n610) );
  OAI21X1 U560 ( .A(Gx[10]), .B(n610), .C(n632), .Y(n619) );
  INVX2 U561 ( .A(n607), .Y(n403) );
  NOR2X1 U562 ( .A(n404), .B(n403), .Y(n405) );
  OAI21X1 U563 ( .A(n617), .B(n406), .C(n405), .Y(n625) );
  INVX2 U564 ( .A(Gx[10]), .Y(n407) );
  OAI21X1 U565 ( .A(n610), .B(n407), .C(n616), .Y(n624) );
  INVX2 U566 ( .A(n624), .Y(n564) );
  OAI21X1 U567 ( .A(Gy[10]), .B(n617), .C(n616), .Y(n618) );
  INVX2 U568 ( .A(n633), .Y(n565) );
  INVX2 U569 ( .A(n605), .Y(n566) );
  NOR2X1 U570 ( .A(n612), .B(n611), .Y(n613) );
endmodule


module edge_detection_4_DW01_add_0 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [10:1] carry;

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_4_DW01_add_1 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1;
  wire   [10:1] carry;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  XOR2X1 U1 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  NAND2X1 U2 ( .A(B[1]), .B(A[1]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(carry[2]) );
endmodule


module edge_detection_4_DW01_add_2 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1;
  wire   [10:1] carry;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  XOR2X1 U1 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  NAND2X1 U2 ( .A(B[1]), .B(A[1]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(carry[2]) );
endmodule


module edge_detection_4_DW01_add_3 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;

  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_4_DW01_add_4 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;

  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_4_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_4_DW01_sub_3 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_4_DW01_sub_4 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  INVX1 U1 ( .A(B[5]), .Y(n3) );
  INVX1 U2 ( .A(B[3]), .Y(n5) );
  INVX1 U3 ( .A(B[7]), .Y(n2) );
  INVX1 U4 ( .A(B[6]), .Y(n9) );
  INVX1 U5 ( .A(B[4]), .Y(n4) );
  INVX1 U6 ( .A(B[2]), .Y(n6) );
  INVX1 U7 ( .A(B[1]), .Y(n7) );
  OR2X2 U8 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U9 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U10 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U11 ( .A(B[0]), .Y(n8) );
endmodule


module edge_detection_4_DW01_sub_5 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n3), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n4), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n5), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n6), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n7), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n9), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  INVX1 U1 ( .A(B[7]), .Y(n2) );
  INVX1 U2 ( .A(B[6]), .Y(n3) );
  INVX1 U3 ( .A(B[5]), .Y(n4) );
  INVX1 U4 ( .A(B[3]), .Y(n6) );
  INVX1 U5 ( .A(B[4]), .Y(n5) );
  INVX1 U6 ( .A(B[2]), .Y(n7) );
  INVX1 U7 ( .A(B[1]), .Y(n9) );
  OR2X2 U8 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U9 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U10 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U11 ( .A(B[0]), .Y(n8) );
endmodule


module edge_detection_4_DW01_sub_6 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_4_DW01_sub_7 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_4 ( clk, n_rst, i_gradient_start, P0, P1, P2, P3, P4, P5, 
        P6, P7, P8, o_gradient_data_ready, o_processed_sum );
  input [7:0] P0;
  input [7:0] P1;
  input [7:0] P2;
  input [7:0] P3;
  input [7:0] P4;
  input [7:0] P5;
  input [7:0] P6;
  input [7:0] P7;
  input [7:0] P8;
  output [7:0] o_processed_sum;
  input clk, n_rst, i_gradient_start;
  output o_gradient_data_ready;
  wire   N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152,
         N153, N154, N155, N156, N157, N158, N159, N160, N161, N162, N163,
         N164, N165, N166, N167, N168, N169, N170, N171, N172, N173, N174,
         N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N187, N188, N189, N190, N191, N192, N193, N194, N195, N197,
         N198, N199, N200, N201, N202, N203, N204, N205, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N269, N280, N281, N282, N283, N284,
         N285, N286, N287, N288, N289, N290, n1, n2, n8, n9, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n65, n141,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n443, n444, n451, n452, n461, n466,
         n469, n477, n478, n479, n480, n482, n483, n486, n487, n488, n517,
         n518, n520, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633;
  wire   [5:0] state;
  wire   [8:0] A1;
  wire   [9:0] C1;
  wire   [8:0] D1;
  wire   [9:0] E1;
  wire   [8:0] A2;
  wire   [9:0] C2;
  wire   [8:0] D2;
  wire   [9:0] E2;
  wire   [10:0] Gx;
  wire   [10:0] Gy;
  wire   [7:0] temp_sum;

  DFFSR \Gy_reg[0]  ( .D(n567), .CLK(clk), .R(n177), .S(1'b1), .Q(N269) );
  DFFSR \Gy_reg[10]  ( .D(n568), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[10]) );
  DFFSR \state_reg[0]  ( .D(n19), .CLK(clk), .R(n177), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n569), .CLK(clk), .R(n177), .S(1'b1), .Q(state[1])
         );
  DFFSR \C1_reg[9]  ( .D(n526), .CLK(clk), .R(n177), .S(1'b1), .Q(C1[9]) );
  DFFSR \Gx_reg[10]  ( .D(n580), .CLK(clk), .R(n176), .S(1'b1), .Q(Gx[10]) );
  DFFSR \state_reg[3]  ( .D(n21), .CLK(clk), .R(n176), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(n20), .CLK(clk), .R(n176), .S(1'b1), .Q(state[2])
         );
  DFFSR \A1_reg[0]  ( .D(n418), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[0]) );
  DFFSR \A1_reg[1]  ( .D(n417), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[1]) );
  DFFSR \A1_reg[2]  ( .D(n416), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[2]) );
  DFFSR \A1_reg[3]  ( .D(n415), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[3]) );
  DFFSR \A1_reg[4]  ( .D(n414), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[4]) );
  DFFSR \A1_reg[5]  ( .D(n413), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[5]) );
  DFFSR \A1_reg[6]  ( .D(n412), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[6]) );
  DFFSR \A1_reg[7]  ( .D(n411), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[7]) );
  DFFSR \A1_reg[8]  ( .D(n410), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[8]) );
  DFFSR \B1_reg[0]  ( .D(n436), .CLK(clk), .R(n175), .S(1'b1), .Q(N197) );
  DFFSR \B1_reg[1]  ( .D(n435), .CLK(clk), .R(n175), .S(1'b1), .Q(N198) );
  DFFSR \B1_reg[2]  ( .D(n434), .CLK(clk), .R(n175), .S(1'b1), .Q(N199) );
  DFFSR \B1_reg[3]  ( .D(n433), .CLK(clk), .R(n175), .S(1'b1), .Q(N200) );
  DFFSR \B1_reg[4]  ( .D(n432), .CLK(clk), .R(n175), .S(1'b1), .Q(N201) );
  DFFSR \B1_reg[5]  ( .D(n431), .CLK(clk), .R(n175), .S(1'b1), .Q(N202) );
  DFFSR \B1_reg[6]  ( .D(n430), .CLK(clk), .R(n175), .S(1'b1), .Q(N203) );
  DFFSR \B1_reg[7]  ( .D(n429), .CLK(clk), .R(n175), .S(1'b1), .Q(N204) );
  DFFSR \B1_reg[8]  ( .D(n428), .CLK(clk), .R(n175), .S(1'b1), .Q(N205) );
  DFFSR \C1_reg[1]  ( .D(n534), .CLK(clk), .R(n175), .S(1'b1), .Q(C1[1]) );
  DFFSR \C1_reg[2]  ( .D(n533), .CLK(clk), .R(n175), .S(1'b1), .Q(C1[2]) );
  DFFSR \C1_reg[3]  ( .D(n532), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[3]) );
  DFFSR \C1_reg[4]  ( .D(n531), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[4]) );
  DFFSR \C1_reg[5]  ( .D(n530), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[5]) );
  DFFSR \C1_reg[6]  ( .D(n529), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[6]) );
  DFFSR \C1_reg[7]  ( .D(n528), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[7]) );
  DFFSR \C1_reg[8]  ( .D(n527), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[8]) );
  DFFSR \D1_reg[0]  ( .D(n483), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[0]) );
  DFFSR \D1_reg[1]  ( .D(n482), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[1]) );
  DFFSR \D1_reg[2]  ( .D(n480), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[2]) );
  DFFSR \D1_reg[3]  ( .D(n479), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[3]) );
  DFFSR \D1_reg[4]  ( .D(n478), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[4]) );
  DFFSR \D1_reg[5]  ( .D(n477), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[5]) );
  DFFSR \D1_reg[6]  ( .D(n469), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[6]) );
  DFFSR \D1_reg[7]  ( .D(n466), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[7]) );
  DFFSR \D1_reg[8]  ( .D(n461), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[8]) );
  DFFSR \E1_reg[0]  ( .D(n553), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[0]) );
  DFFSR \E1_reg[1]  ( .D(n552), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[1]) );
  DFFSR \E1_reg[2]  ( .D(n551), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[2]) );
  DFFSR \E1_reg[3]  ( .D(n550), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[3]) );
  DFFSR \E1_reg[4]  ( .D(n549), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[4]) );
  DFFSR \E1_reg[5]  ( .D(n548), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[5]) );
  DFFSR \E1_reg[6]  ( .D(n547), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[6]) );
  DFFSR \E1_reg[7]  ( .D(n546), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[7]) );
  DFFSR \E1_reg[8]  ( .D(n545), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[8]) );
  DFFSR \E1_reg[9]  ( .D(n544), .CLK(clk), .R(n172), .S(1'b1), .Q(E1[9]) );
  DFFSR \A2_reg[0]  ( .D(n427), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[0]) );
  DFFSR \A2_reg[1]  ( .D(n426), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[1]) );
  DFFSR \A2_reg[2]  ( .D(n425), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[2]) );
  DFFSR \A2_reg[3]  ( .D(n424), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[3]) );
  DFFSR \A2_reg[4]  ( .D(n423), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[4]) );
  DFFSR \A2_reg[5]  ( .D(n422), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[5]) );
  DFFSR \A2_reg[6]  ( .D(n421), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[6]) );
  DFFSR \A2_reg[7]  ( .D(n420), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[7]) );
  DFFSR \A2_reg[8]  ( .D(n419), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[8]) );
  DFFSR \B2_reg[0]  ( .D(n452), .CLK(clk), .R(n172), .S(1'b1), .Q(N207) );
  DFFSR \B2_reg[1]  ( .D(n451), .CLK(clk), .R(n172), .S(1'b1), .Q(N208) );
  DFFSR \B2_reg[2]  ( .D(n444), .CLK(clk), .R(n171), .S(1'b1), .Q(N209) );
  DFFSR \B2_reg[3]  ( .D(n443), .CLK(clk), .R(n171), .S(1'b1), .Q(N210) );
  DFFSR \B2_reg[4]  ( .D(n441), .CLK(clk), .R(n171), .S(1'b1), .Q(N211) );
  DFFSR \B2_reg[5]  ( .D(n440), .CLK(clk), .R(n171), .S(1'b1), .Q(N212) );
  DFFSR \B2_reg[6]  ( .D(n439), .CLK(clk), .R(n171), .S(1'b1), .Q(N213) );
  DFFSR \B2_reg[7]  ( .D(n438), .CLK(clk), .R(n171), .S(1'b1), .Q(N214) );
  DFFSR \B2_reg[8]  ( .D(n437), .CLK(clk), .R(n171), .S(1'b1), .Q(N215) );
  DFFSR \D2_reg[0]  ( .D(n525), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[0]) );
  DFFSR \D2_reg[1]  ( .D(n524), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[1]) );
  DFFSR \D2_reg[2]  ( .D(n523), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[2]) );
  DFFSR \D2_reg[3]  ( .D(n520), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[3]) );
  DFFSR \D2_reg[4]  ( .D(n518), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[4]) );
  DFFSR \D2_reg[5]  ( .D(n517), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[5]) );
  DFFSR \D2_reg[6]  ( .D(n488), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[6]) );
  DFFSR \D2_reg[7]  ( .D(n487), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[7]) );
  DFFSR \D2_reg[8]  ( .D(n486), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[8]) );
  DFFSR \E2_reg[0]  ( .D(n563), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[0]) );
  DFFSR \E2_reg[1]  ( .D(n562), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[1]) );
  DFFSR \E2_reg[2]  ( .D(n561), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[2]) );
  DFFSR \E2_reg[3]  ( .D(n560), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[3]) );
  DFFSR \E2_reg[4]  ( .D(n559), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[4]) );
  DFFSR \E2_reg[5]  ( .D(n558), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[5]) );
  DFFSR \E2_reg[6]  ( .D(n557), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[6]) );
  DFFSR \E2_reg[7]  ( .D(n556), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[7]) );
  DFFSR \E2_reg[8]  ( .D(n555), .CLK(clk), .R(n169), .S(1'b1), .Q(E2[8]) );
  DFFSR \E2_reg[9]  ( .D(n554), .CLK(clk), .R(n169), .S(1'b1), .Q(E2[9]) );
  DFFSR o_gradient_data_ready_reg ( .D(n565), .CLK(clk), .R(n169), .S(1'b1), 
        .Q(o_gradient_data_ready) );
  DFFSR \Gx_reg[0]  ( .D(n570), .CLK(clk), .R(n169), .S(1'b1), .Q(N258) );
  DFFSR \Gx_reg[1]  ( .D(n571), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[1]) );
  DFFSR \Gx_reg[2]  ( .D(n572), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[2]) );
  DFFSR \Gx_reg[3]  ( .D(n573), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[3]) );
  DFFSR \Gx_reg[4]  ( .D(n574), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[4]) );
  DFFSR \Gx_reg[5]  ( .D(n575), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[5]) );
  DFFSR \Gx_reg[6]  ( .D(n576), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[6]) );
  DFFSR \Gx_reg[7]  ( .D(n577), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[7]) );
  DFFSR \Gx_reg[8]  ( .D(n578), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[8]) );
  DFFSR \Gx_reg[9]  ( .D(n579), .CLK(clk), .R(n168), .S(1'b1), .Q(Gx[9]) );
  DFFSR \C2_reg[1]  ( .D(n543), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[1]) );
  DFFSR \C2_reg[2]  ( .D(n542), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[2]) );
  DFFSR \C2_reg[3]  ( .D(n541), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[3]) );
  DFFSR \C2_reg[4]  ( .D(n540), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[4]) );
  DFFSR \C2_reg[5]  ( .D(n539), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[5]) );
  DFFSR \C2_reg[6]  ( .D(n538), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[6]) );
  DFFSR \C2_reg[7]  ( .D(n537), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[7]) );
  DFFSR \C2_reg[8]  ( .D(n536), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[8]) );
  DFFSR \C2_reg[9]  ( .D(n535), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[9]) );
  DFFSR \Gy_reg[1]  ( .D(n589), .CLK(clk), .R(n168), .S(1'b1), .Q(Gy[1]) );
  DFFSR \Gy_reg[2]  ( .D(n588), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[2]) );
  DFFSR \Gy_reg[3]  ( .D(n587), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[3]) );
  DFFSR \Gy_reg[4]  ( .D(n586), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[4]) );
  DFFSR \Gy_reg[5]  ( .D(n585), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[5]) );
  DFFSR \Gy_reg[6]  ( .D(n584), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[6]) );
  DFFSR \Gy_reg[7]  ( .D(n583), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[7]) );
  DFFSR \Gy_reg[8]  ( .D(n582), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[8]) );
  DFFSR \Gy_reg[9]  ( .D(n581), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[9]) );
  DFFSR \temp_sum_reg[0]  ( .D(n590), .CLK(clk), .R(n141), .S(1'b1), .Q(
        temp_sum[0]) );
  DFFSR \o_processed_sum_reg[0]  ( .D(temp_sum[0]), .CLK(clk), .R(n141), .S(
        1'b1), .Q(o_processed_sum[0]) );
  DFFSR \temp_sum_reg[1]  ( .D(n591), .CLK(clk), .R(n141), .S(1'b1), .Q(
        temp_sum[1]) );
  DFFSR \o_processed_sum_reg[1]  ( .D(temp_sum[1]), .CLK(clk), .R(n141), .S(
        1'b1), .Q(o_processed_sum[1]) );
  DFFSR \temp_sum_reg[2]  ( .D(n592), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[2]) );
  DFFSR \o_processed_sum_reg[2]  ( .D(temp_sum[2]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[2]) );
  DFFSR \temp_sum_reg[3]  ( .D(n593), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[3]) );
  DFFSR \o_processed_sum_reg[3]  ( .D(temp_sum[3]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[3]) );
  DFFSR \temp_sum_reg[4]  ( .D(n594), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[4]) );
  DFFSR \o_processed_sum_reg[4]  ( .D(temp_sum[4]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[4]) );
  DFFSR \temp_sum_reg[5]  ( .D(n595), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[5]) );
  DFFSR \o_processed_sum_reg[5]  ( .D(temp_sum[5]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[5]) );
  DFFSR \temp_sum_reg[6]  ( .D(n596), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[6]) );
  DFFSR \o_processed_sum_reg[6]  ( .D(temp_sum[6]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[6]) );
  DFFSR \temp_sum_reg[7]  ( .D(n597), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[7]) );
  DFFSR \o_processed_sum_reg[7]  ( .D(temp_sum[7]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[7]) );
  AND2X2 U157 ( .A(n630), .B(n623), .Y(n614) );
  AND2X2 U160 ( .A(n633), .B(n632), .Y(n600) );
  OR2X1 U458 ( .A(n625), .B(n624), .Y(n626) );
  NAND3X1 U459 ( .A(n623), .B(n622), .C(n408), .Y(n627) );
  OR2X1 U462 ( .A(n619), .B(n618), .Y(n620) );
  NAND3X1 U464 ( .A(n615), .B(n622), .C(n614), .Y(n621) );
  OAI21X1 U465 ( .A(n622), .B(n409), .C(n613), .Y(n569) );
  NAND2X1 U467 ( .A(n564), .B(n617), .Y(n611) );
  NAND3X1 U469 ( .A(n628), .B(n632), .C(n629), .Y(n612) );
  OR2X1 U472 ( .A(n619), .B(n625), .Y(n608) );
  NAND3X1 U475 ( .A(n629), .B(n622), .C(n606), .Y(n609) );
  NAND2X1 U476 ( .A(i_gradient_start), .B(n566), .Y(n606) );
  NAND2X1 U477 ( .A(n604), .B(n603), .Y(n622) );
  NOR2X1 U478 ( .A(n602), .B(n601), .Y(n603) );
  NAND3X1 U479 ( .A(n630), .B(n629), .C(n610), .Y(n601) );
  NAND3X1 U482 ( .A(n631), .B(n628), .C(n600), .Y(n602) );
  NAND3X1 U484 ( .A(state[2]), .B(n17), .C(state[3]), .Y(n633) );
  NOR2X1 U487 ( .A(n599), .B(n598), .Y(n604) );
  NAND3X1 U488 ( .A(n605), .B(n616), .C(n408), .Y(n598) );
  NAND2X1 U490 ( .A(n16), .B(n2), .Y(n605) );
  NAND3X1 U491 ( .A(n617), .B(n607), .C(n623), .Y(n599) );
  NAND2X1 U492 ( .A(n9), .B(n17), .Y(n623) );
  NAND2X1 U493 ( .A(n22), .B(n9), .Y(n607) );
  edge_detection_4_DW01_add_0 add_231 ( .A({Gx[10:1], N258}), .B({Gy[10:1], 
        N269}), .CI(1'b0), .SUM({N290, N289, N288, N287, N286, N285, N284, 
        N283, N282, N281, N280}) );
  edge_detection_4_DW01_add_1 add_219 ( .A({C2[9], C2[9:1], 1'b0}), .B({E2[9], 
        E2}), .CI(1'b0), .SUM({N257, N256, N255, N254, N253, N252, N251, N250, 
        N249, N248, N247}) );
  edge_detection_4_DW01_add_2 add_218 ( .A({C1[9], C1[9:1], 1'b0}), .B({E1[9], 
        E1}), .CI(1'b0), .SUM({N246, N245, N244, N243, N242, N241, N240, N239, 
        N238, N237, N236}) );
  edge_detection_4_DW01_add_3 add_214 ( .A({A2[8], A2}), .B({D2[8], D2}), .CI(
        1'b0), .SUM({N235, N234, N233, N232, N231, N230, N229, N228, N227, 
        N226}) );
  edge_detection_4_DW01_add_4 add_213 ( .A({A1[8], A1}), .B({D1[8], D1}), .CI(
        1'b0), .SUM({N225, N224, N223, N222, N221, N220, N219, N218, N217, 
        N216}) );
  edge_detection_4_DW01_sub_2 sub_204 ( .A({1'b0, P2}), .B({1'b0, P8}), .CI(
        1'b0), .DIFF({N195, N194, N193, N192, N191, N190, N189, N188, N187})
         );
  edge_detection_4_DW01_sub_3 sub_203 ( .A({1'b0, P8}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N186, N185, N184, N183, N182, N181, N180, N179, N178})
         );
  edge_detection_4_DW01_sub_4 sub_202 ( .A({1'b0, P1}), .B({1'b0, P7}), .CI(
        1'b0), .DIFF({N177, N176, N175, N174, N173, N172, N171, N170, N169})
         );
  edge_detection_4_DW01_sub_5 sub_201 ( .A({1'b0, P5}), .B({1'b0, P3}), .CI(
        1'b0), .DIFF({N168, N167, N166, N165, N164, N163, N162, N161, N160})
         );
  edge_detection_4_DW01_sub_6 sub_200 ( .A({1'b0, P0}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N159, N158, N157, N156, N155, N154, N153, N152, N151})
         );
  edge_detection_4_DW01_sub_7 sub_199 ( .A({1'b0, P2}), .B({1'b0, P0}), .CI(
        1'b0), .DIFF({N150, N149, N148, N147, N146, N145, N144, N143, N142})
         );
  NAND2X1 U5 ( .A(n2), .B(n9), .Y(n1) );
  AND2X2 U6 ( .A(n409), .B(n178), .Y(n2) );
  AND2X2 U12 ( .A(state[3]), .B(n179), .Y(n8) );
  AND2X2 U13 ( .A(state[2]), .B(n235), .Y(n9) );
  AND2X2 U52 ( .A(n235), .B(n179), .Y(n16) );
  AND2X2 U128 ( .A(state[1]), .B(n178), .Y(n17) );
  AND2X2 U155 ( .A(state[0]), .B(state[1]), .Y(n18) );
  OR2X2 U156 ( .A(n609), .B(n608), .Y(n19) );
  OR2X2 U158 ( .A(n621), .B(n620), .Y(n20) );
  OR2X2 U159 ( .A(n627), .B(n626), .Y(n21) );
  AND2X2 U161 ( .A(state[0]), .B(n409), .Y(n22) );
  OR2X2 U162 ( .A(n260), .B(Gx[6]), .Y(n264) );
  OR2X2 U163 ( .A(n268), .B(Gx[8]), .Y(n272) );
  OR2X2 U164 ( .A(N258), .B(Gx[1]), .Y(n244) );
  BUFX2 U165 ( .A(n323), .Y(n29) );
  BUFX2 U166 ( .A(n323), .Y(n28) );
  BUFX2 U167 ( .A(n323), .Y(n26) );
  BUFX2 U168 ( .A(n323), .Y(n27) );
  INVX2 U169 ( .A(n630), .Y(n25) );
  INVX2 U170 ( .A(n1), .Y(n384) );
  INVX2 U171 ( .A(n629), .Y(n24) );
  BUFX2 U172 ( .A(n323), .Y(n30) );
  INVX2 U173 ( .A(n631), .Y(n404) );
  AND2X2 U174 ( .A(n631), .B(n1), .Y(n23) );
  INVX2 U175 ( .A(n615), .Y(n385) );
  BUFX2 U176 ( .A(n_rst), .Y(n65) );
  BUFX2 U177 ( .A(n_rst), .Y(n141) );
  BUFX2 U178 ( .A(n_rst), .Y(n169) );
  BUFX2 U179 ( .A(n_rst), .Y(n170) );
  BUFX2 U180 ( .A(n_rst), .Y(n171) );
  BUFX2 U181 ( .A(n_rst), .Y(n172) );
  BUFX2 U182 ( .A(n_rst), .Y(n173) );
  BUFX2 U183 ( .A(n_rst), .Y(n174) );
  BUFX2 U184 ( .A(n_rst), .Y(n176) );
  BUFX2 U185 ( .A(n_rst), .Y(n168) );
  BUFX2 U186 ( .A(n_rst), .Y(n175) );
  BUFX2 U187 ( .A(n_rst), .Y(n177) );
  OR2X1 U188 ( .A(n244), .B(Gx[2]), .Y(n248) );
  OR2X1 U189 ( .A(n264), .B(Gx[7]), .Y(n268) );
  OR2X1 U190 ( .A(n256), .B(Gx[5]), .Y(n260) );
  OR2X1 U191 ( .A(n252), .B(Gx[4]), .Y(n256) );
  OR2X1 U192 ( .A(n248), .B(Gx[3]), .Y(n252) );
  INVX2 U195 ( .A(state[1]), .Y(n409) );
  INVX2 U196 ( .A(state[0]), .Y(n178) );
  NAND3X1 U197 ( .A(state[2]), .B(state[3]), .C(n2), .Y(n632) );
  INVX2 U198 ( .A(state[2]), .Y(n179) );
  NAND2X1 U199 ( .A(n17), .B(n8), .Y(n631) );
  INVX2 U200 ( .A(state[3]), .Y(n235) );
  NAND2X1 U201 ( .A(n16), .B(n22), .Y(n628) );
  INVX2 U202 ( .A(n628), .Y(n323) );
  MUX2X1 U203 ( .B(N205), .A(N168), .S(n26), .Y(n180) );
  INVX2 U204 ( .A(n180), .Y(n428) );
  NAND2X1 U205 ( .A(n16), .B(n17), .Y(n629) );
  INVX2 U206 ( .A(C1[9]), .Y(n182) );
  INVX2 U207 ( .A(N205), .Y(n181) );
  MUX2X1 U208 ( .B(n182), .A(n181), .S(n24), .Y(n526) );
  MUX2X1 U209 ( .B(N204), .A(N167), .S(n26), .Y(n183) );
  INVX2 U210 ( .A(n183), .Y(n429) );
  INVX2 U211 ( .A(C1[8]), .Y(n185) );
  INVX2 U212 ( .A(N204), .Y(n184) );
  MUX2X1 U213 ( .B(n185), .A(n184), .S(n24), .Y(n527) );
  MUX2X1 U214 ( .B(N203), .A(N166), .S(n26), .Y(n186) );
  INVX2 U215 ( .A(n186), .Y(n430) );
  INVX2 U216 ( .A(C1[7]), .Y(n188) );
  INVX2 U217 ( .A(N203), .Y(n187) );
  MUX2X1 U218 ( .B(n188), .A(n187), .S(n24), .Y(n528) );
  MUX2X1 U219 ( .B(N202), .A(N165), .S(n26), .Y(n189) );
  INVX2 U220 ( .A(n189), .Y(n431) );
  INVX2 U221 ( .A(C1[6]), .Y(n191) );
  INVX2 U222 ( .A(N202), .Y(n190) );
  MUX2X1 U223 ( .B(n191), .A(n190), .S(n24), .Y(n529) );
  MUX2X1 U224 ( .B(N201), .A(N164), .S(n26), .Y(n192) );
  INVX2 U225 ( .A(n192), .Y(n432) );
  INVX2 U226 ( .A(C1[5]), .Y(n194) );
  INVX2 U227 ( .A(N201), .Y(n193) );
  MUX2X1 U228 ( .B(n194), .A(n193), .S(n24), .Y(n530) );
  MUX2X1 U229 ( .B(N200), .A(N163), .S(n26), .Y(n195) );
  INVX2 U230 ( .A(n195), .Y(n433) );
  INVX2 U231 ( .A(C1[4]), .Y(n197) );
  INVX2 U232 ( .A(N200), .Y(n196) );
  MUX2X1 U233 ( .B(n197), .A(n196), .S(n24), .Y(n531) );
  MUX2X1 U234 ( .B(N199), .A(N162), .S(n26), .Y(n198) );
  INVX2 U235 ( .A(n198), .Y(n434) );
  INVX2 U236 ( .A(C1[3]), .Y(n200) );
  INVX2 U237 ( .A(N199), .Y(n199) );
  MUX2X1 U238 ( .B(n200), .A(n199), .S(n24), .Y(n532) );
  MUX2X1 U239 ( .B(N198), .A(N161), .S(n26), .Y(n201) );
  INVX2 U240 ( .A(n201), .Y(n435) );
  INVX2 U241 ( .A(C1[2]), .Y(n203) );
  INVX2 U242 ( .A(N198), .Y(n202) );
  MUX2X1 U243 ( .B(n203), .A(n202), .S(n24), .Y(n533) );
  MUX2X1 U244 ( .B(N197), .A(N160), .S(n26), .Y(n204) );
  INVX2 U245 ( .A(n204), .Y(n436) );
  INVX2 U246 ( .A(C1[1]), .Y(n206) );
  INVX2 U247 ( .A(N197), .Y(n205) );
  MUX2X1 U248 ( .B(n206), .A(n205), .S(n24), .Y(n534) );
  MUX2X1 U249 ( .B(A1[8]), .A(N150), .S(n26), .Y(n207) );
  INVX2 U250 ( .A(n207), .Y(n410) );
  MUX2X1 U251 ( .B(A1[7]), .A(N149), .S(n26), .Y(n208) );
  INVX2 U252 ( .A(n208), .Y(n411) );
  MUX2X1 U253 ( .B(A1[6]), .A(N148), .S(n26), .Y(n209) );
  INVX2 U254 ( .A(n209), .Y(n412) );
  MUX2X1 U255 ( .B(A1[5]), .A(N147), .S(n26), .Y(n210) );
  INVX2 U256 ( .A(n210), .Y(n413) );
  MUX2X1 U257 ( .B(A1[4]), .A(N146), .S(n27), .Y(n211) );
  INVX2 U258 ( .A(n211), .Y(n414) );
  MUX2X1 U259 ( .B(A1[3]), .A(N145), .S(n27), .Y(n212) );
  INVX2 U260 ( .A(n212), .Y(n415) );
  MUX2X1 U261 ( .B(A1[2]), .A(N144), .S(n27), .Y(n213) );
  INVX2 U262 ( .A(n213), .Y(n416) );
  MUX2X1 U263 ( .B(A1[1]), .A(N143), .S(n27), .Y(n214) );
  INVX2 U264 ( .A(n214), .Y(n417) );
  MUX2X1 U265 ( .B(A1[0]), .A(N142), .S(n27), .Y(n215) );
  INVX2 U266 ( .A(n215), .Y(n418) );
  MUX2X1 U267 ( .B(D1[8]), .A(N186), .S(n27), .Y(n216) );
  INVX2 U268 ( .A(n216), .Y(n461) );
  MUX2X1 U269 ( .B(D1[7]), .A(N185), .S(n27), .Y(n217) );
  INVX2 U270 ( .A(n217), .Y(n466) );
  MUX2X1 U271 ( .B(D1[6]), .A(N184), .S(n27), .Y(n218) );
  INVX2 U272 ( .A(n218), .Y(n469) );
  MUX2X1 U273 ( .B(D1[5]), .A(N183), .S(n27), .Y(n219) );
  INVX2 U274 ( .A(n219), .Y(n477) );
  MUX2X1 U275 ( .B(D1[4]), .A(N182), .S(n27), .Y(n220) );
  INVX2 U276 ( .A(n220), .Y(n478) );
  MUX2X1 U277 ( .B(D1[3]), .A(N181), .S(n27), .Y(n221) );
  INVX2 U278 ( .A(n221), .Y(n479) );
  MUX2X1 U279 ( .B(D1[2]), .A(N180), .S(n27), .Y(n222) );
  INVX2 U280 ( .A(n222), .Y(n480) );
  MUX2X1 U281 ( .B(D1[1]), .A(N179), .S(n27), .Y(n223) );
  INVX2 U282 ( .A(n223), .Y(n482) );
  MUX2X1 U283 ( .B(D1[0]), .A(N178), .S(n28), .Y(n224) );
  INVX2 U284 ( .A(n224), .Y(n483) );
  NAND2X1 U285 ( .A(n16), .B(n18), .Y(n630) );
  MUX2X1 U286 ( .B(E1[9]), .A(N225), .S(n25), .Y(n225) );
  INVX2 U287 ( .A(n225), .Y(n544) );
  MUX2X1 U288 ( .B(E1[8]), .A(N224), .S(n25), .Y(n226) );
  INVX2 U289 ( .A(n226), .Y(n545) );
  MUX2X1 U290 ( .B(E1[7]), .A(N223), .S(n25), .Y(n227) );
  INVX2 U291 ( .A(n227), .Y(n546) );
  MUX2X1 U292 ( .B(E1[6]), .A(N222), .S(n25), .Y(n228) );
  INVX2 U293 ( .A(n228), .Y(n547) );
  MUX2X1 U294 ( .B(E1[5]), .A(N221), .S(n25), .Y(n229) );
  INVX2 U295 ( .A(n229), .Y(n548) );
  MUX2X1 U296 ( .B(E1[4]), .A(N220), .S(n25), .Y(n230) );
  INVX2 U297 ( .A(n230), .Y(n549) );
  MUX2X1 U298 ( .B(E1[3]), .A(N219), .S(n25), .Y(n231) );
  INVX2 U299 ( .A(n231), .Y(n550) );
  MUX2X1 U300 ( .B(E1[2]), .A(N218), .S(n25), .Y(n232) );
  INVX2 U301 ( .A(n232), .Y(n551) );
  MUX2X1 U302 ( .B(E1[1]), .A(N217), .S(n25), .Y(n233) );
  INVX2 U303 ( .A(n233), .Y(n552) );
  MUX2X1 U304 ( .B(E1[0]), .A(N216), .S(n25), .Y(n234) );
  INVX2 U305 ( .A(n234), .Y(n553) );
  INVX2 U306 ( .A(N236), .Y(n237) );
  OAI21X1 U307 ( .A(n404), .B(n23), .C(N258), .Y(n236) );
  OAI21X1 U308 ( .A(n1), .B(n237), .C(n236), .Y(n570) );
  INVX2 U309 ( .A(N237), .Y(n240) );
  XOR2X1 U310 ( .A(Gx[1]), .B(N258), .Y(n238) );
  AOI22X1 U311 ( .A(n238), .B(n404), .C(Gx[1]), .D(n23), .Y(n239) );
  OAI21X1 U312 ( .A(n1), .B(n240), .C(n239), .Y(n571) );
  INVX2 U313 ( .A(N238), .Y(n243) );
  XOR2X1 U314 ( .A(n244), .B(Gx[2]), .Y(n241) );
  AOI22X1 U315 ( .A(n241), .B(n404), .C(Gx[2]), .D(n23), .Y(n242) );
  OAI21X1 U316 ( .A(n1), .B(n243), .C(n242), .Y(n572) );
  INVX2 U317 ( .A(N239), .Y(n247) );
  XOR2X1 U318 ( .A(n248), .B(Gx[3]), .Y(n245) );
  AOI22X1 U319 ( .A(n245), .B(n404), .C(Gx[3]), .D(n23), .Y(n246) );
  OAI21X1 U320 ( .A(n1), .B(n247), .C(n246), .Y(n573) );
  INVX2 U321 ( .A(N240), .Y(n251) );
  XOR2X1 U322 ( .A(n252), .B(Gx[4]), .Y(n249) );
  AOI22X1 U323 ( .A(n249), .B(n404), .C(Gx[4]), .D(n23), .Y(n250) );
  OAI21X1 U324 ( .A(n1), .B(n251), .C(n250), .Y(n574) );
  INVX2 U325 ( .A(N241), .Y(n255) );
  XOR2X1 U326 ( .A(n256), .B(Gx[5]), .Y(n253) );
  AOI22X1 U327 ( .A(n253), .B(n404), .C(Gx[5]), .D(n23), .Y(n254) );
  OAI21X1 U328 ( .A(n1), .B(n255), .C(n254), .Y(n575) );
  INVX2 U329 ( .A(N242), .Y(n259) );
  XOR2X1 U330 ( .A(n260), .B(Gx[6]), .Y(n257) );
  AOI22X1 U331 ( .A(n257), .B(n404), .C(Gx[6]), .D(n23), .Y(n258) );
  OAI21X1 U332 ( .A(n1), .B(n259), .C(n258), .Y(n576) );
  INVX2 U333 ( .A(N243), .Y(n263) );
  XOR2X1 U334 ( .A(n264), .B(Gx[7]), .Y(n261) );
  AOI22X1 U335 ( .A(n261), .B(n404), .C(Gx[7]), .D(n23), .Y(n262) );
  OAI21X1 U336 ( .A(n1), .B(n263), .C(n262), .Y(n577) );
  INVX2 U337 ( .A(N244), .Y(n267) );
  XOR2X1 U338 ( .A(n268), .B(Gx[8]), .Y(n265) );
  AOI22X1 U339 ( .A(n265), .B(n404), .C(Gx[8]), .D(n23), .Y(n266) );
  OAI21X1 U340 ( .A(n1), .B(n267), .C(n266), .Y(n578) );
  INVX2 U341 ( .A(N245), .Y(n271) );
  XOR2X1 U342 ( .A(n272), .B(Gx[9]), .Y(n269) );
  AOI22X1 U343 ( .A(n269), .B(n404), .C(Gx[9]), .D(n23), .Y(n270) );
  OAI21X1 U344 ( .A(n1), .B(n271), .C(n270), .Y(n579) );
  NOR2X1 U345 ( .A(Gx[9]), .B(n272), .Y(n273) );
  XNOR2X1 U346 ( .A(n273), .B(Gx[10]), .Y(n274) );
  AOI22X1 U347 ( .A(n23), .B(Gx[10]), .C(n274), .D(n404), .Y(n276) );
  NAND2X1 U348 ( .A(N246), .B(n384), .Y(n275) );
  NAND2X1 U349 ( .A(n276), .B(n275), .Y(n580) );
  NAND2X1 U350 ( .A(n8), .B(n18), .Y(n615) );
  MUX2X1 U351 ( .B(N215), .A(N177), .S(n28), .Y(n277) );
  INVX2 U352 ( .A(n277), .Y(n437) );
  INVX2 U353 ( .A(C2[9]), .Y(n279) );
  INVX2 U354 ( .A(N215), .Y(n278) );
  MUX2X1 U355 ( .B(n279), .A(n278), .S(n24), .Y(n535) );
  MUX2X1 U356 ( .B(N214), .A(N176), .S(n28), .Y(n280) );
  INVX2 U357 ( .A(n280), .Y(n438) );
  INVX2 U358 ( .A(C2[8]), .Y(n282) );
  INVX2 U359 ( .A(N214), .Y(n281) );
  MUX2X1 U360 ( .B(n282), .A(n281), .S(n24), .Y(n536) );
  MUX2X1 U361 ( .B(N213), .A(N175), .S(n28), .Y(n283) );
  INVX2 U362 ( .A(n283), .Y(n439) );
  INVX2 U363 ( .A(C2[7]), .Y(n285) );
  INVX2 U364 ( .A(N213), .Y(n284) );
  MUX2X1 U365 ( .B(n285), .A(n284), .S(n24), .Y(n537) );
  MUX2X1 U366 ( .B(N212), .A(N174), .S(n28), .Y(n286) );
  INVX2 U367 ( .A(n286), .Y(n440) );
  INVX2 U368 ( .A(C2[6]), .Y(n288) );
  INVX2 U369 ( .A(N212), .Y(n287) );
  MUX2X1 U370 ( .B(n288), .A(n287), .S(n24), .Y(n538) );
  MUX2X1 U371 ( .B(N211), .A(N173), .S(n28), .Y(n289) );
  INVX2 U372 ( .A(n289), .Y(n441) );
  INVX2 U373 ( .A(C2[5]), .Y(n291) );
  INVX2 U374 ( .A(N211), .Y(n290) );
  MUX2X1 U375 ( .B(n291), .A(n290), .S(n24), .Y(n539) );
  MUX2X1 U376 ( .B(N210), .A(N172), .S(n28), .Y(n292) );
  INVX2 U377 ( .A(n292), .Y(n443) );
  INVX2 U378 ( .A(C2[4]), .Y(n294) );
  INVX2 U379 ( .A(N210), .Y(n293) );
  MUX2X1 U380 ( .B(n294), .A(n293), .S(n24), .Y(n540) );
  MUX2X1 U381 ( .B(N209), .A(N171), .S(n28), .Y(n295) );
  INVX2 U382 ( .A(n295), .Y(n444) );
  INVX2 U383 ( .A(C2[3]), .Y(n297) );
  INVX2 U384 ( .A(N209), .Y(n296) );
  MUX2X1 U385 ( .B(n297), .A(n296), .S(n24), .Y(n541) );
  MUX2X1 U386 ( .B(N208), .A(N170), .S(n28), .Y(n298) );
  INVX2 U387 ( .A(n298), .Y(n451) );
  INVX2 U388 ( .A(C2[2]), .Y(n300) );
  INVX2 U389 ( .A(N208), .Y(n299) );
  MUX2X1 U390 ( .B(n300), .A(n299), .S(n24), .Y(n542) );
  MUX2X1 U391 ( .B(N207), .A(N169), .S(n28), .Y(n301) );
  INVX2 U392 ( .A(n301), .Y(n452) );
  INVX2 U393 ( .A(C2[1]), .Y(n304) );
  INVX2 U394 ( .A(N207), .Y(n302) );
  MUX2X1 U395 ( .B(n304), .A(n302), .S(n24), .Y(n543) );
  MUX2X1 U396 ( .B(A2[8]), .A(N159), .S(n28), .Y(n305) );
  INVX2 U397 ( .A(n305), .Y(n419) );
  MUX2X1 U398 ( .B(A2[7]), .A(N158), .S(n28), .Y(n306) );
  INVX2 U399 ( .A(n306), .Y(n420) );
  MUX2X1 U400 ( .B(A2[6]), .A(N157), .S(n28), .Y(n307) );
  INVX2 U401 ( .A(n307), .Y(n421) );
  MUX2X1 U402 ( .B(A2[5]), .A(N156), .S(n29), .Y(n308) );
  INVX2 U403 ( .A(n308), .Y(n422) );
  MUX2X1 U404 ( .B(A2[4]), .A(N155), .S(n29), .Y(n309) );
  INVX2 U405 ( .A(n309), .Y(n423) );
  MUX2X1 U406 ( .B(A2[3]), .A(N154), .S(n29), .Y(n310) );
  INVX2 U407 ( .A(n310), .Y(n424) );
  MUX2X1 U408 ( .B(A2[2]), .A(N153), .S(n29), .Y(n311) );
  INVX2 U409 ( .A(n311), .Y(n425) );
  MUX2X1 U410 ( .B(A2[1]), .A(N152), .S(n29), .Y(n312) );
  INVX2 U411 ( .A(n312), .Y(n426) );
  MUX2X1 U412 ( .B(A2[0]), .A(N151), .S(n29), .Y(n313) );
  INVX2 U413 ( .A(n313), .Y(n427) );
  MUX2X1 U414 ( .B(D2[8]), .A(N195), .S(n29), .Y(n314) );
  INVX2 U415 ( .A(n314), .Y(n486) );
  MUX2X1 U416 ( .B(D2[7]), .A(N194), .S(n29), .Y(n316) );
  INVX2 U417 ( .A(n316), .Y(n487) );
  MUX2X1 U418 ( .B(D2[6]), .A(N193), .S(n29), .Y(n317) );
  INVX2 U419 ( .A(n317), .Y(n488) );
  MUX2X1 U420 ( .B(D2[5]), .A(N192), .S(n29), .Y(n318) );
  INVX2 U421 ( .A(n318), .Y(n517) );
  MUX2X1 U422 ( .B(D2[4]), .A(N191), .S(n29), .Y(n319) );
  INVX2 U423 ( .A(n319), .Y(n518) );
  MUX2X1 U424 ( .B(D2[3]), .A(N190), .S(n29), .Y(n320) );
  INVX2 U425 ( .A(n320), .Y(n520) );
  MUX2X1 U426 ( .B(D2[2]), .A(N189), .S(n29), .Y(n321) );
  INVX2 U427 ( .A(n321), .Y(n523) );
  MUX2X1 U428 ( .B(D2[1]), .A(N188), .S(n30), .Y(n322) );
  INVX2 U429 ( .A(n322), .Y(n524) );
  MUX2X1 U430 ( .B(D2[0]), .A(N187), .S(n30), .Y(n324) );
  INVX2 U431 ( .A(n324), .Y(n525) );
  MUX2X1 U432 ( .B(E2[9]), .A(N235), .S(n25), .Y(n325) );
  INVX2 U433 ( .A(n325), .Y(n554) );
  MUX2X1 U434 ( .B(E2[8]), .A(N234), .S(n25), .Y(n326) );
  INVX2 U435 ( .A(n326), .Y(n555) );
  MUX2X1 U436 ( .B(E2[7]), .A(N233), .S(n25), .Y(n327) );
  INVX2 U437 ( .A(n327), .Y(n556) );
  MUX2X1 U438 ( .B(E2[6]), .A(N232), .S(n25), .Y(n328) );
  INVX2 U439 ( .A(n328), .Y(n557) );
  MUX2X1 U440 ( .B(E2[5]), .A(N231), .S(n25), .Y(n329) );
  INVX2 U441 ( .A(n329), .Y(n558) );
  MUX2X1 U442 ( .B(E2[4]), .A(N230), .S(n25), .Y(n330) );
  INVX2 U443 ( .A(n330), .Y(n559) );
  MUX2X1 U444 ( .B(E2[3]), .A(N229), .S(n25), .Y(n331) );
  INVX2 U445 ( .A(n331), .Y(n560) );
  MUX2X1 U446 ( .B(E2[2]), .A(N228), .S(n25), .Y(n332) );
  INVX2 U447 ( .A(n332), .Y(n561) );
  MUX2X1 U448 ( .B(E2[1]), .A(N227), .S(n25), .Y(n333) );
  INVX2 U449 ( .A(n333), .Y(n562) );
  MUX2X1 U450 ( .B(E2[0]), .A(N226), .S(n25), .Y(n334) );
  INVX2 U451 ( .A(n334), .Y(n563) );
  INVX2 U452 ( .A(N247), .Y(n336) );
  NAND2X1 U453 ( .A(n1), .B(n615), .Y(n389) );
  INVX2 U454 ( .A(n389), .Y(n408) );
  OAI21X1 U455 ( .A(n385), .B(n408), .C(N269), .Y(n335) );
  OAI21X1 U456 ( .A(n1), .B(n336), .C(n335), .Y(n567) );
  INVX2 U457 ( .A(Gy[1]), .Y(n339) );
  XOR2X1 U460 ( .A(Gy[1]), .B(N269), .Y(n337) );
  AOI22X1 U461 ( .A(n337), .B(n385), .C(N248), .D(n384), .Y(n338) );
  OAI21X1 U463 ( .A(n389), .B(n339), .C(n338), .Y(n589) );
  INVX2 U466 ( .A(Gy[2]), .Y(n345) );
  INVX2 U468 ( .A(N269), .Y(n340) );
  NAND2X1 U470 ( .A(n340), .B(n339), .Y(n344) );
  XOR2X1 U471 ( .A(n344), .B(Gy[2]), .Y(n342) );
  AOI22X1 U473 ( .A(n342), .B(n385), .C(N249), .D(n384), .Y(n343) );
  OAI21X1 U474 ( .A(n389), .B(n345), .C(n343), .Y(n588) );
  INVX2 U480 ( .A(Gy[3]), .Y(n350) );
  INVX2 U481 ( .A(n344), .Y(n346) );
  NAND2X1 U483 ( .A(n346), .B(n345), .Y(n349) );
  XOR2X1 U485 ( .A(n349), .B(Gy[3]), .Y(n347) );
  AOI22X1 U486 ( .A(n347), .B(n385), .C(N250), .D(n384), .Y(n348) );
  OAI21X1 U489 ( .A(n389), .B(n350), .C(n348), .Y(n587) );
  INVX2 U494 ( .A(Gy[4]), .Y(n355) );
  INVX2 U495 ( .A(n349), .Y(n351) );
  NAND2X1 U496 ( .A(n351), .B(n350), .Y(n354) );
  XOR2X1 U497 ( .A(n354), .B(Gy[4]), .Y(n352) );
  AOI22X1 U498 ( .A(n352), .B(n385), .C(N251), .D(n384), .Y(n353) );
  OAI21X1 U499 ( .A(n389), .B(n355), .C(n353), .Y(n586) );
  INVX2 U500 ( .A(Gy[5]), .Y(n360) );
  INVX2 U501 ( .A(n354), .Y(n356) );
  NAND2X1 U502 ( .A(n356), .B(n355), .Y(n359) );
  XOR2X1 U503 ( .A(n359), .B(Gy[5]), .Y(n357) );
  AOI22X1 U504 ( .A(n357), .B(n385), .C(N252), .D(n384), .Y(n358) );
  OAI21X1 U505 ( .A(n389), .B(n360), .C(n358), .Y(n585) );
  INVX2 U506 ( .A(Gy[6]), .Y(n366) );
  INVX2 U507 ( .A(n359), .Y(n361) );
  NAND2X1 U508 ( .A(n361), .B(n360), .Y(n365) );
  XOR2X1 U509 ( .A(n365), .B(Gy[6]), .Y(n362) );
  AOI22X1 U510 ( .A(n362), .B(n385), .C(N253), .D(n384), .Y(n363) );
  OAI21X1 U511 ( .A(n389), .B(n366), .C(n363), .Y(n584) );
  INVX2 U512 ( .A(Gy[7]), .Y(n371) );
  INVX2 U513 ( .A(n365), .Y(n367) );
  NAND2X1 U514 ( .A(n367), .B(n366), .Y(n370) );
  XOR2X1 U515 ( .A(n370), .B(Gy[7]), .Y(n368) );
  AOI22X1 U516 ( .A(n368), .B(n385), .C(N254), .D(n384), .Y(n369) );
  OAI21X1 U517 ( .A(n389), .B(n371), .C(n369), .Y(n583) );
  INVX2 U518 ( .A(Gy[8]), .Y(n376) );
  INVX2 U519 ( .A(n370), .Y(n372) );
  NAND2X1 U520 ( .A(n372), .B(n371), .Y(n375) );
  XOR2X1 U521 ( .A(n375), .B(Gy[8]), .Y(n373) );
  AOI22X1 U522 ( .A(n373), .B(n385), .C(N255), .D(n384), .Y(n374) );
  OAI21X1 U523 ( .A(n389), .B(n376), .C(n374), .Y(n582) );
  INVX2 U524 ( .A(Gy[9]), .Y(n381) );
  INVX2 U525 ( .A(n375), .Y(n377) );
  NAND2X1 U526 ( .A(n377), .B(n376), .Y(n380) );
  XOR2X1 U527 ( .A(n380), .B(Gy[9]), .Y(n378) );
  AOI22X1 U528 ( .A(n378), .B(n385), .C(N256), .D(n384), .Y(n379) );
  OAI21X1 U529 ( .A(n389), .B(n381), .C(n379), .Y(n581) );
  INVX2 U530 ( .A(Gy[10]), .Y(n406) );
  INVX2 U531 ( .A(n380), .Y(n382) );
  NAND2X1 U532 ( .A(n382), .B(n381), .Y(n383) );
  XOR2X1 U533 ( .A(n383), .B(Gy[10]), .Y(n387) );
  AOI22X1 U534 ( .A(n387), .B(n385), .C(N257), .D(n384), .Y(n388) );
  OAI21X1 U535 ( .A(n406), .B(n389), .C(n388), .Y(n568) );
  NOR2X1 U536 ( .A(N290), .B(N289), .Y(n391) );
  INVX2 U537 ( .A(N288), .Y(n390) );
  AOI21X1 U538 ( .A(n391), .B(n390), .C(n632), .Y(n392) );
  INVX2 U539 ( .A(n392), .Y(n402) );
  INVX2 U540 ( .A(n632), .Y(n400) );
  MUX2X1 U541 ( .B(temp_sum[0]), .A(N280), .S(n400), .Y(n393) );
  NAND2X1 U542 ( .A(n402), .B(n393), .Y(n590) );
  MUX2X1 U543 ( .B(temp_sum[1]), .A(N281), .S(n400), .Y(n394) );
  NAND2X1 U544 ( .A(n402), .B(n394), .Y(n591) );
  MUX2X1 U545 ( .B(temp_sum[2]), .A(N282), .S(n400), .Y(n395) );
  NAND2X1 U546 ( .A(n402), .B(n395), .Y(n592) );
  MUX2X1 U547 ( .B(temp_sum[3]), .A(N283), .S(n400), .Y(n396) );
  NAND2X1 U548 ( .A(n402), .B(n396), .Y(n593) );
  MUX2X1 U549 ( .B(temp_sum[4]), .A(N284), .S(n400), .Y(n397) );
  NAND2X1 U550 ( .A(n402), .B(n397), .Y(n594) );
  MUX2X1 U551 ( .B(temp_sum[5]), .A(N285), .S(n400), .Y(n398) );
  NAND2X1 U552 ( .A(n402), .B(n398), .Y(n595) );
  MUX2X1 U553 ( .B(temp_sum[6]), .A(N286), .S(n400), .Y(n399) );
  NAND2X1 U554 ( .A(n402), .B(n399), .Y(n596) );
  MUX2X1 U555 ( .B(temp_sum[7]), .A(N287), .S(n400), .Y(n401) );
  NAND2X1 U556 ( .A(n402), .B(n401), .Y(n597) );
  NAND2X1 U557 ( .A(n22), .B(n8), .Y(n617) );
  NAND2X1 U558 ( .A(n9), .B(n18), .Y(n616) );
  NAND2X1 U559 ( .A(n2), .B(n8), .Y(n610) );
  OAI21X1 U560 ( .A(Gx[10]), .B(n610), .C(n632), .Y(n619) );
  INVX2 U561 ( .A(n607), .Y(n403) );
  NOR2X1 U562 ( .A(n404), .B(n403), .Y(n405) );
  OAI21X1 U563 ( .A(n617), .B(n406), .C(n405), .Y(n625) );
  INVX2 U564 ( .A(Gx[10]), .Y(n407) );
  OAI21X1 U565 ( .A(n610), .B(n407), .C(n616), .Y(n624) );
  INVX2 U566 ( .A(n624), .Y(n564) );
  OAI21X1 U567 ( .A(Gy[10]), .B(n617), .C(n616), .Y(n618) );
  INVX2 U568 ( .A(n633), .Y(n565) );
  INVX2 U569 ( .A(n605), .Y(n566) );
  NOR2X1 U570 ( .A(n612), .B(n611), .Y(n613) );
endmodule


module edge_detection_3_DW01_add_0 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [10:1] carry;

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_3_DW01_add_1 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1;
  wire   [10:1] carry;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  XOR2X1 U1 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  NAND2X1 U2 ( .A(B[1]), .B(A[1]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(carry[2]) );
endmodule


module edge_detection_3_DW01_add_2 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1;
  wire   [10:1] carry;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  XOR2X1 U1 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  NAND2X1 U2 ( .A(B[1]), .B(A[1]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(carry[2]) );
endmodule


module edge_detection_3_DW01_add_3 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;

  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_3_DW01_add_4 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;

  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_3_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_3_DW01_sub_3 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  INVX1 U1 ( .A(B[3]), .Y(n5) );
  INVX1 U2 ( .A(B[2]), .Y(n6) );
  INVX1 U3 ( .A(B[1]), .Y(n7) );
  OR2X1 U4 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U5 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U6 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U7 ( .A(B[7]), .Y(n2) );
  INVX2 U8 ( .A(B[5]), .Y(n3) );
  INVX2 U9 ( .A(B[4]), .Y(n4) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_3_DW01_sub_4 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_3_DW01_sub_5 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X2 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_3_DW01_sub_6 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  INVX1 U1 ( .A(B[3]), .Y(n5) );
  INVX1 U2 ( .A(B[2]), .Y(n6) );
  INVX1 U3 ( .A(B[1]), .Y(n7) );
  OR2X2 U4 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U5 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U6 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U7 ( .A(B[7]), .Y(n2) );
  INVX2 U8 ( .A(B[5]), .Y(n3) );
  INVX2 U9 ( .A(B[4]), .Y(n4) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_3_DW01_sub_7 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  INVX1 U1 ( .A(B[0]), .Y(n8) );
  INVX1 U2 ( .A(B[7]), .Y(n2) );
  INVX1 U3 ( .A(B[6]), .Y(n9) );
  INVX1 U4 ( .A(B[5]), .Y(n3) );
  INVX1 U5 ( .A(B[4]), .Y(n4) );
  INVX1 U6 ( .A(B[2]), .Y(n6) );
  INVX1 U7 ( .A(B[3]), .Y(n5) );
  INVX1 U8 ( .A(B[1]), .Y(n7) );
  OR2X1 U9 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U10 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U11 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module edge_detection_3 ( clk, n_rst, i_gradient_start, P0, P1, P2, P3, P4, P5, 
        P6, P7, P8, o_gradient_data_ready, o_processed_sum );
  input [7:0] P0;
  input [7:0] P1;
  input [7:0] P2;
  input [7:0] P3;
  input [7:0] P4;
  input [7:0] P5;
  input [7:0] P6;
  input [7:0] P7;
  input [7:0] P8;
  output [7:0] o_processed_sum;
  input clk, n_rst, i_gradient_start;
  output o_gradient_data_ready;
  wire   N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152,
         N153, N154, N155, N156, N157, N158, N159, N160, N161, N162, N163,
         N164, N165, N166, N167, N168, N169, N170, N171, N172, N173, N174,
         N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N187, N188, N189, N190, N191, N192, N193, N194, N195, N197,
         N198, N199, N200, N201, N202, N203, N204, N205, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N269, N280, N281, N282, N283, N284,
         N285, N286, N287, N288, N289, N290, n1, n2, n8, n9, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n65, n141,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n443, n444, n451, n452, n461, n466,
         n469, n477, n478, n479, n480, n482, n483, n486, n487, n488, n517,
         n518, n520, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633;
  wire   [5:0] state;
  wire   [8:0] A1;
  wire   [9:0] C1;
  wire   [8:0] D1;
  wire   [9:0] E1;
  wire   [8:0] A2;
  wire   [9:0] C2;
  wire   [8:0] D2;
  wire   [9:0] E2;
  wire   [10:0] Gx;
  wire   [10:0] Gy;
  wire   [7:0] temp_sum;

  DFFSR \Gy_reg[0]  ( .D(n567), .CLK(clk), .R(n177), .S(1'b1), .Q(N269) );
  DFFSR \Gy_reg[10]  ( .D(n568), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[10]) );
  DFFSR \state_reg[0]  ( .D(n19), .CLK(clk), .R(n177), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n569), .CLK(clk), .R(n177), .S(1'b1), .Q(state[1])
         );
  DFFSR \C1_reg[9]  ( .D(n526), .CLK(clk), .R(n177), .S(1'b1), .Q(C1[9]) );
  DFFSR \Gx_reg[10]  ( .D(n580), .CLK(clk), .R(n176), .S(1'b1), .Q(Gx[10]) );
  DFFSR \state_reg[3]  ( .D(n21), .CLK(clk), .R(n176), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(n20), .CLK(clk), .R(n176), .S(1'b1), .Q(state[2])
         );
  DFFSR \A1_reg[0]  ( .D(n418), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[0]) );
  DFFSR \A1_reg[1]  ( .D(n417), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[1]) );
  DFFSR \A1_reg[2]  ( .D(n416), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[2]) );
  DFFSR \A1_reg[3]  ( .D(n415), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[3]) );
  DFFSR \A1_reg[4]  ( .D(n414), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[4]) );
  DFFSR \A1_reg[5]  ( .D(n413), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[5]) );
  DFFSR \A1_reg[6]  ( .D(n412), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[6]) );
  DFFSR \A1_reg[7]  ( .D(n411), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[7]) );
  DFFSR \A1_reg[8]  ( .D(n410), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[8]) );
  DFFSR \B1_reg[0]  ( .D(n436), .CLK(clk), .R(n175), .S(1'b1), .Q(N197) );
  DFFSR \B1_reg[1]  ( .D(n435), .CLK(clk), .R(n175), .S(1'b1), .Q(N198) );
  DFFSR \B1_reg[2]  ( .D(n434), .CLK(clk), .R(n175), .S(1'b1), .Q(N199) );
  DFFSR \B1_reg[3]  ( .D(n433), .CLK(clk), .R(n175), .S(1'b1), .Q(N200) );
  DFFSR \B1_reg[4]  ( .D(n432), .CLK(clk), .R(n175), .S(1'b1), .Q(N201) );
  DFFSR \B1_reg[5]  ( .D(n431), .CLK(clk), .R(n175), .S(1'b1), .Q(N202) );
  DFFSR \B1_reg[6]  ( .D(n430), .CLK(clk), .R(n175), .S(1'b1), .Q(N203) );
  DFFSR \B1_reg[7]  ( .D(n429), .CLK(clk), .R(n175), .S(1'b1), .Q(N204) );
  DFFSR \B1_reg[8]  ( .D(n428), .CLK(clk), .R(n175), .S(1'b1), .Q(N205) );
  DFFSR \C1_reg[1]  ( .D(n534), .CLK(clk), .R(n175), .S(1'b1), .Q(C1[1]) );
  DFFSR \C1_reg[2]  ( .D(n533), .CLK(clk), .R(n175), .S(1'b1), .Q(C1[2]) );
  DFFSR \C1_reg[3]  ( .D(n532), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[3]) );
  DFFSR \C1_reg[4]  ( .D(n531), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[4]) );
  DFFSR \C1_reg[5]  ( .D(n530), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[5]) );
  DFFSR \C1_reg[6]  ( .D(n529), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[6]) );
  DFFSR \C1_reg[7]  ( .D(n528), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[7]) );
  DFFSR \C1_reg[8]  ( .D(n527), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[8]) );
  DFFSR \D1_reg[0]  ( .D(n483), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[0]) );
  DFFSR \D1_reg[1]  ( .D(n482), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[1]) );
  DFFSR \D1_reg[2]  ( .D(n480), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[2]) );
  DFFSR \D1_reg[3]  ( .D(n479), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[3]) );
  DFFSR \D1_reg[4]  ( .D(n478), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[4]) );
  DFFSR \D1_reg[5]  ( .D(n477), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[5]) );
  DFFSR \D1_reg[6]  ( .D(n469), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[6]) );
  DFFSR \D1_reg[7]  ( .D(n466), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[7]) );
  DFFSR \D1_reg[8]  ( .D(n461), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[8]) );
  DFFSR \E1_reg[0]  ( .D(n553), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[0]) );
  DFFSR \E1_reg[1]  ( .D(n552), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[1]) );
  DFFSR \E1_reg[2]  ( .D(n551), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[2]) );
  DFFSR \E1_reg[3]  ( .D(n550), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[3]) );
  DFFSR \E1_reg[4]  ( .D(n549), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[4]) );
  DFFSR \E1_reg[5]  ( .D(n548), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[5]) );
  DFFSR \E1_reg[6]  ( .D(n547), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[6]) );
  DFFSR \E1_reg[7]  ( .D(n546), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[7]) );
  DFFSR \E1_reg[8]  ( .D(n545), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[8]) );
  DFFSR \E1_reg[9]  ( .D(n544), .CLK(clk), .R(n172), .S(1'b1), .Q(E1[9]) );
  DFFSR \A2_reg[0]  ( .D(n427), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[0]) );
  DFFSR \A2_reg[1]  ( .D(n426), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[1]) );
  DFFSR \A2_reg[2]  ( .D(n425), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[2]) );
  DFFSR \A2_reg[3]  ( .D(n424), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[3]) );
  DFFSR \A2_reg[4]  ( .D(n423), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[4]) );
  DFFSR \A2_reg[5]  ( .D(n422), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[5]) );
  DFFSR \A2_reg[6]  ( .D(n421), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[6]) );
  DFFSR \A2_reg[7]  ( .D(n420), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[7]) );
  DFFSR \A2_reg[8]  ( .D(n419), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[8]) );
  DFFSR \B2_reg[0]  ( .D(n452), .CLK(clk), .R(n172), .S(1'b1), .Q(N207) );
  DFFSR \B2_reg[1]  ( .D(n451), .CLK(clk), .R(n172), .S(1'b1), .Q(N208) );
  DFFSR \B2_reg[2]  ( .D(n444), .CLK(clk), .R(n171), .S(1'b1), .Q(N209) );
  DFFSR \B2_reg[3]  ( .D(n443), .CLK(clk), .R(n171), .S(1'b1), .Q(N210) );
  DFFSR \B2_reg[4]  ( .D(n441), .CLK(clk), .R(n171), .S(1'b1), .Q(N211) );
  DFFSR \B2_reg[5]  ( .D(n440), .CLK(clk), .R(n171), .S(1'b1), .Q(N212) );
  DFFSR \B2_reg[6]  ( .D(n439), .CLK(clk), .R(n171), .S(1'b1), .Q(N213) );
  DFFSR \B2_reg[7]  ( .D(n438), .CLK(clk), .R(n171), .S(1'b1), .Q(N214) );
  DFFSR \B2_reg[8]  ( .D(n437), .CLK(clk), .R(n171), .S(1'b1), .Q(N215) );
  DFFSR \D2_reg[0]  ( .D(n525), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[0]) );
  DFFSR \D2_reg[1]  ( .D(n524), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[1]) );
  DFFSR \D2_reg[2]  ( .D(n523), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[2]) );
  DFFSR \D2_reg[3]  ( .D(n520), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[3]) );
  DFFSR \D2_reg[4]  ( .D(n518), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[4]) );
  DFFSR \D2_reg[5]  ( .D(n517), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[5]) );
  DFFSR \D2_reg[6]  ( .D(n488), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[6]) );
  DFFSR \D2_reg[7]  ( .D(n487), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[7]) );
  DFFSR \D2_reg[8]  ( .D(n486), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[8]) );
  DFFSR \E2_reg[0]  ( .D(n563), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[0]) );
  DFFSR \E2_reg[1]  ( .D(n562), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[1]) );
  DFFSR \E2_reg[2]  ( .D(n561), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[2]) );
  DFFSR \E2_reg[3]  ( .D(n560), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[3]) );
  DFFSR \E2_reg[4]  ( .D(n559), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[4]) );
  DFFSR \E2_reg[5]  ( .D(n558), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[5]) );
  DFFSR \E2_reg[6]  ( .D(n557), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[6]) );
  DFFSR \E2_reg[7]  ( .D(n556), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[7]) );
  DFFSR \E2_reg[8]  ( .D(n555), .CLK(clk), .R(n169), .S(1'b1), .Q(E2[8]) );
  DFFSR \E2_reg[9]  ( .D(n554), .CLK(clk), .R(n169), .S(1'b1), .Q(E2[9]) );
  DFFSR o_gradient_data_ready_reg ( .D(n565), .CLK(clk), .R(n169), .S(1'b1), 
        .Q(o_gradient_data_ready) );
  DFFSR \Gx_reg[0]  ( .D(n570), .CLK(clk), .R(n169), .S(1'b1), .Q(N258) );
  DFFSR \Gx_reg[1]  ( .D(n571), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[1]) );
  DFFSR \Gx_reg[2]  ( .D(n572), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[2]) );
  DFFSR \Gx_reg[3]  ( .D(n573), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[3]) );
  DFFSR \Gx_reg[4]  ( .D(n574), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[4]) );
  DFFSR \Gx_reg[5]  ( .D(n575), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[5]) );
  DFFSR \Gx_reg[6]  ( .D(n576), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[6]) );
  DFFSR \Gx_reg[7]  ( .D(n577), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[7]) );
  DFFSR \Gx_reg[8]  ( .D(n578), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[8]) );
  DFFSR \Gx_reg[9]  ( .D(n579), .CLK(clk), .R(n168), .S(1'b1), .Q(Gx[9]) );
  DFFSR \C2_reg[1]  ( .D(n543), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[1]) );
  DFFSR \C2_reg[2]  ( .D(n542), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[2]) );
  DFFSR \C2_reg[3]  ( .D(n541), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[3]) );
  DFFSR \C2_reg[4]  ( .D(n540), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[4]) );
  DFFSR \C2_reg[5]  ( .D(n539), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[5]) );
  DFFSR \C2_reg[6]  ( .D(n538), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[6]) );
  DFFSR \C2_reg[7]  ( .D(n537), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[7]) );
  DFFSR \C2_reg[8]  ( .D(n536), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[8]) );
  DFFSR \C2_reg[9]  ( .D(n535), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[9]) );
  DFFSR \Gy_reg[1]  ( .D(n589), .CLK(clk), .R(n168), .S(1'b1), .Q(Gy[1]) );
  DFFSR \Gy_reg[2]  ( .D(n588), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[2]) );
  DFFSR \Gy_reg[3]  ( .D(n587), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[3]) );
  DFFSR \Gy_reg[4]  ( .D(n586), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[4]) );
  DFFSR \Gy_reg[5]  ( .D(n585), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[5]) );
  DFFSR \Gy_reg[6]  ( .D(n584), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[6]) );
  DFFSR \Gy_reg[7]  ( .D(n583), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[7]) );
  DFFSR \Gy_reg[8]  ( .D(n582), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[8]) );
  DFFSR \Gy_reg[9]  ( .D(n581), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[9]) );
  DFFSR \temp_sum_reg[0]  ( .D(n590), .CLK(clk), .R(n141), .S(1'b1), .Q(
        temp_sum[0]) );
  DFFSR \o_processed_sum_reg[0]  ( .D(temp_sum[0]), .CLK(clk), .R(n141), .S(
        1'b1), .Q(o_processed_sum[0]) );
  DFFSR \temp_sum_reg[1]  ( .D(n591), .CLK(clk), .R(n141), .S(1'b1), .Q(
        temp_sum[1]) );
  DFFSR \o_processed_sum_reg[1]  ( .D(temp_sum[1]), .CLK(clk), .R(n141), .S(
        1'b1), .Q(o_processed_sum[1]) );
  DFFSR \temp_sum_reg[2]  ( .D(n592), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[2]) );
  DFFSR \o_processed_sum_reg[2]  ( .D(temp_sum[2]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[2]) );
  DFFSR \temp_sum_reg[3]  ( .D(n593), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[3]) );
  DFFSR \o_processed_sum_reg[3]  ( .D(temp_sum[3]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[3]) );
  DFFSR \temp_sum_reg[4]  ( .D(n594), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[4]) );
  DFFSR \o_processed_sum_reg[4]  ( .D(temp_sum[4]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[4]) );
  DFFSR \temp_sum_reg[5]  ( .D(n595), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[5]) );
  DFFSR \o_processed_sum_reg[5]  ( .D(temp_sum[5]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[5]) );
  DFFSR \temp_sum_reg[6]  ( .D(n596), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[6]) );
  DFFSR \o_processed_sum_reg[6]  ( .D(temp_sum[6]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[6]) );
  DFFSR \temp_sum_reg[7]  ( .D(n597), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[7]) );
  DFFSR \o_processed_sum_reg[7]  ( .D(temp_sum[7]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[7]) );
  AND2X2 U157 ( .A(n630), .B(n623), .Y(n614) );
  AND2X2 U160 ( .A(n633), .B(n632), .Y(n600) );
  OR2X1 U458 ( .A(n625), .B(n624), .Y(n626) );
  NAND3X1 U459 ( .A(n623), .B(n622), .C(n408), .Y(n627) );
  OR2X1 U462 ( .A(n619), .B(n618), .Y(n620) );
  NAND3X1 U464 ( .A(n615), .B(n622), .C(n614), .Y(n621) );
  OAI21X1 U465 ( .A(n622), .B(n409), .C(n613), .Y(n569) );
  NAND2X1 U467 ( .A(n564), .B(n617), .Y(n611) );
  NAND3X1 U469 ( .A(n628), .B(n632), .C(n629), .Y(n612) );
  OR2X1 U472 ( .A(n619), .B(n625), .Y(n608) );
  NAND3X1 U475 ( .A(n629), .B(n622), .C(n606), .Y(n609) );
  NAND2X1 U476 ( .A(i_gradient_start), .B(n566), .Y(n606) );
  NAND2X1 U477 ( .A(n604), .B(n603), .Y(n622) );
  NOR2X1 U478 ( .A(n602), .B(n601), .Y(n603) );
  NAND3X1 U479 ( .A(n630), .B(n629), .C(n610), .Y(n601) );
  NAND3X1 U482 ( .A(n631), .B(n628), .C(n600), .Y(n602) );
  NAND3X1 U484 ( .A(state[2]), .B(n17), .C(state[3]), .Y(n633) );
  NOR2X1 U487 ( .A(n599), .B(n598), .Y(n604) );
  NAND3X1 U488 ( .A(n605), .B(n616), .C(n408), .Y(n598) );
  NAND2X1 U490 ( .A(n16), .B(n2), .Y(n605) );
  NAND3X1 U491 ( .A(n617), .B(n607), .C(n623), .Y(n599) );
  NAND2X1 U492 ( .A(n9), .B(n17), .Y(n623) );
  NAND2X1 U493 ( .A(n22), .B(n9), .Y(n607) );
  edge_detection_3_DW01_add_0 add_231 ( .A({Gx[10:1], N258}), .B({Gy[10:1], 
        N269}), .CI(1'b0), .SUM({N290, N289, N288, N287, N286, N285, N284, 
        N283, N282, N281, N280}) );
  edge_detection_3_DW01_add_1 add_219 ( .A({C2[9], C2[9:1], 1'b0}), .B({E2[9], 
        E2}), .CI(1'b0), .SUM({N257, N256, N255, N254, N253, N252, N251, N250, 
        N249, N248, N247}) );
  edge_detection_3_DW01_add_2 add_218 ( .A({C1[9], C1[9:1], 1'b0}), .B({E1[9], 
        E1}), .CI(1'b0), .SUM({N246, N245, N244, N243, N242, N241, N240, N239, 
        N238, N237, N236}) );
  edge_detection_3_DW01_add_3 add_214 ( .A({A2[8], A2}), .B({D2[8], D2}), .CI(
        1'b0), .SUM({N235, N234, N233, N232, N231, N230, N229, N228, N227, 
        N226}) );
  edge_detection_3_DW01_add_4 add_213 ( .A({A1[8], A1}), .B({D1[8], D1}), .CI(
        1'b0), .SUM({N225, N224, N223, N222, N221, N220, N219, N218, N217, 
        N216}) );
  edge_detection_3_DW01_sub_2 sub_204 ( .A({1'b0, P2}), .B({1'b0, P8}), .CI(
        1'b0), .DIFF({N195, N194, N193, N192, N191, N190, N189, N188, N187})
         );
  edge_detection_3_DW01_sub_3 sub_203 ( .A({1'b0, P8}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N186, N185, N184, N183, N182, N181, N180, N179, N178})
         );
  edge_detection_3_DW01_sub_4 sub_202 ( .A({1'b0, P1}), .B({1'b0, P7}), .CI(
        1'b0), .DIFF({N177, N176, N175, N174, N173, N172, N171, N170, N169})
         );
  edge_detection_3_DW01_sub_5 sub_201 ( .A({1'b0, P5}), .B({1'b0, P3}), .CI(
        1'b0), .DIFF({N168, N167, N166, N165, N164, N163, N162, N161, N160})
         );
  edge_detection_3_DW01_sub_6 sub_200 ( .A({1'b0, P0}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N159, N158, N157, N156, N155, N154, N153, N152, N151})
         );
  edge_detection_3_DW01_sub_7 sub_199 ( .A({1'b0, P2}), .B({1'b0, P0}), .CI(
        1'b0), .DIFF({N150, N149, N148, N147, N146, N145, N144, N143, N142})
         );
  NAND2X1 U5 ( .A(n2), .B(n9), .Y(n1) );
  AND2X2 U6 ( .A(n409), .B(n178), .Y(n2) );
  AND2X2 U12 ( .A(state[3]), .B(n179), .Y(n8) );
  AND2X2 U13 ( .A(state[2]), .B(n235), .Y(n9) );
  AND2X2 U52 ( .A(n235), .B(n179), .Y(n16) );
  AND2X2 U128 ( .A(state[1]), .B(n178), .Y(n17) );
  AND2X2 U155 ( .A(state[0]), .B(state[1]), .Y(n18) );
  OR2X2 U156 ( .A(n609), .B(n608), .Y(n19) );
  OR2X2 U158 ( .A(n621), .B(n620), .Y(n20) );
  OR2X2 U159 ( .A(n627), .B(n626), .Y(n21) );
  AND2X2 U161 ( .A(state[0]), .B(n409), .Y(n22) );
  OR2X2 U162 ( .A(n260), .B(Gx[6]), .Y(n264) );
  OR2X2 U163 ( .A(n268), .B(Gx[8]), .Y(n272) );
  OR2X2 U164 ( .A(N258), .B(Gx[1]), .Y(n244) );
  BUFX2 U165 ( .A(n323), .Y(n29) );
  BUFX2 U166 ( .A(n323), .Y(n28) );
  BUFX2 U167 ( .A(n323), .Y(n26) );
  BUFX2 U168 ( .A(n323), .Y(n27) );
  INVX2 U169 ( .A(n630), .Y(n25) );
  INVX2 U170 ( .A(n1), .Y(n384) );
  INVX2 U171 ( .A(n629), .Y(n24) );
  BUFX2 U172 ( .A(n323), .Y(n30) );
  INVX2 U173 ( .A(n631), .Y(n404) );
  AND2X2 U174 ( .A(n631), .B(n1), .Y(n23) );
  INVX2 U175 ( .A(n615), .Y(n385) );
  BUFX2 U176 ( .A(n_rst), .Y(n65) );
  BUFX2 U177 ( .A(n_rst), .Y(n141) );
  BUFX2 U178 ( .A(n_rst), .Y(n169) );
  BUFX2 U179 ( .A(n_rst), .Y(n170) );
  BUFX2 U180 ( .A(n_rst), .Y(n171) );
  BUFX2 U181 ( .A(n_rst), .Y(n172) );
  BUFX2 U182 ( .A(n_rst), .Y(n173) );
  BUFX2 U183 ( .A(n_rst), .Y(n174) );
  BUFX2 U184 ( .A(n_rst), .Y(n176) );
  BUFX2 U185 ( .A(n_rst), .Y(n168) );
  BUFX2 U186 ( .A(n_rst), .Y(n175) );
  BUFX2 U187 ( .A(n_rst), .Y(n177) );
  OR2X1 U188 ( .A(n244), .B(Gx[2]), .Y(n248) );
  OR2X1 U189 ( .A(n264), .B(Gx[7]), .Y(n268) );
  OR2X1 U190 ( .A(n256), .B(Gx[5]), .Y(n260) );
  OR2X1 U191 ( .A(n252), .B(Gx[4]), .Y(n256) );
  OR2X1 U192 ( .A(n248), .B(Gx[3]), .Y(n252) );
  INVX2 U195 ( .A(state[1]), .Y(n409) );
  INVX2 U196 ( .A(state[0]), .Y(n178) );
  NAND3X1 U197 ( .A(state[2]), .B(state[3]), .C(n2), .Y(n632) );
  INVX2 U198 ( .A(state[2]), .Y(n179) );
  NAND2X1 U199 ( .A(n17), .B(n8), .Y(n631) );
  INVX2 U200 ( .A(state[3]), .Y(n235) );
  NAND2X1 U201 ( .A(n16), .B(n22), .Y(n628) );
  INVX2 U202 ( .A(n628), .Y(n323) );
  MUX2X1 U203 ( .B(N205), .A(N168), .S(n26), .Y(n180) );
  INVX2 U204 ( .A(n180), .Y(n428) );
  NAND2X1 U205 ( .A(n16), .B(n17), .Y(n629) );
  INVX2 U206 ( .A(C1[9]), .Y(n182) );
  INVX2 U207 ( .A(N205), .Y(n181) );
  MUX2X1 U208 ( .B(n182), .A(n181), .S(n24), .Y(n526) );
  MUX2X1 U209 ( .B(N204), .A(N167), .S(n26), .Y(n183) );
  INVX2 U210 ( .A(n183), .Y(n429) );
  INVX2 U211 ( .A(C1[8]), .Y(n185) );
  INVX2 U212 ( .A(N204), .Y(n184) );
  MUX2X1 U213 ( .B(n185), .A(n184), .S(n24), .Y(n527) );
  MUX2X1 U214 ( .B(N203), .A(N166), .S(n26), .Y(n186) );
  INVX2 U215 ( .A(n186), .Y(n430) );
  INVX2 U216 ( .A(C1[7]), .Y(n188) );
  INVX2 U217 ( .A(N203), .Y(n187) );
  MUX2X1 U218 ( .B(n188), .A(n187), .S(n24), .Y(n528) );
  MUX2X1 U219 ( .B(N202), .A(N165), .S(n26), .Y(n189) );
  INVX2 U220 ( .A(n189), .Y(n431) );
  INVX2 U221 ( .A(C1[6]), .Y(n191) );
  INVX2 U222 ( .A(N202), .Y(n190) );
  MUX2X1 U223 ( .B(n191), .A(n190), .S(n24), .Y(n529) );
  MUX2X1 U224 ( .B(N201), .A(N164), .S(n26), .Y(n192) );
  INVX2 U225 ( .A(n192), .Y(n432) );
  INVX2 U226 ( .A(C1[5]), .Y(n194) );
  INVX2 U227 ( .A(N201), .Y(n193) );
  MUX2X1 U228 ( .B(n194), .A(n193), .S(n24), .Y(n530) );
  MUX2X1 U229 ( .B(N200), .A(N163), .S(n26), .Y(n195) );
  INVX2 U230 ( .A(n195), .Y(n433) );
  INVX2 U231 ( .A(C1[4]), .Y(n197) );
  INVX2 U232 ( .A(N200), .Y(n196) );
  MUX2X1 U233 ( .B(n197), .A(n196), .S(n24), .Y(n531) );
  MUX2X1 U234 ( .B(N199), .A(N162), .S(n26), .Y(n198) );
  INVX2 U235 ( .A(n198), .Y(n434) );
  INVX2 U236 ( .A(C1[3]), .Y(n200) );
  INVX2 U237 ( .A(N199), .Y(n199) );
  MUX2X1 U238 ( .B(n200), .A(n199), .S(n24), .Y(n532) );
  MUX2X1 U239 ( .B(N198), .A(N161), .S(n26), .Y(n201) );
  INVX2 U240 ( .A(n201), .Y(n435) );
  INVX2 U241 ( .A(C1[2]), .Y(n203) );
  INVX2 U242 ( .A(N198), .Y(n202) );
  MUX2X1 U243 ( .B(n203), .A(n202), .S(n24), .Y(n533) );
  MUX2X1 U244 ( .B(N197), .A(N160), .S(n26), .Y(n204) );
  INVX2 U245 ( .A(n204), .Y(n436) );
  INVX2 U246 ( .A(C1[1]), .Y(n206) );
  INVX2 U247 ( .A(N197), .Y(n205) );
  MUX2X1 U248 ( .B(n206), .A(n205), .S(n24), .Y(n534) );
  MUX2X1 U249 ( .B(A1[8]), .A(N150), .S(n26), .Y(n207) );
  INVX2 U250 ( .A(n207), .Y(n410) );
  MUX2X1 U251 ( .B(A1[7]), .A(N149), .S(n26), .Y(n208) );
  INVX2 U252 ( .A(n208), .Y(n411) );
  MUX2X1 U253 ( .B(A1[6]), .A(N148), .S(n26), .Y(n209) );
  INVX2 U254 ( .A(n209), .Y(n412) );
  MUX2X1 U255 ( .B(A1[5]), .A(N147), .S(n26), .Y(n210) );
  INVX2 U256 ( .A(n210), .Y(n413) );
  MUX2X1 U257 ( .B(A1[4]), .A(N146), .S(n27), .Y(n211) );
  INVX2 U258 ( .A(n211), .Y(n414) );
  MUX2X1 U259 ( .B(A1[3]), .A(N145), .S(n27), .Y(n212) );
  INVX2 U260 ( .A(n212), .Y(n415) );
  MUX2X1 U261 ( .B(A1[2]), .A(N144), .S(n27), .Y(n213) );
  INVX2 U262 ( .A(n213), .Y(n416) );
  MUX2X1 U263 ( .B(A1[1]), .A(N143), .S(n27), .Y(n214) );
  INVX2 U264 ( .A(n214), .Y(n417) );
  MUX2X1 U265 ( .B(A1[0]), .A(N142), .S(n27), .Y(n215) );
  INVX2 U266 ( .A(n215), .Y(n418) );
  MUX2X1 U267 ( .B(D1[8]), .A(N186), .S(n27), .Y(n216) );
  INVX2 U268 ( .A(n216), .Y(n461) );
  MUX2X1 U269 ( .B(D1[7]), .A(N185), .S(n27), .Y(n217) );
  INVX2 U270 ( .A(n217), .Y(n466) );
  MUX2X1 U271 ( .B(D1[6]), .A(N184), .S(n27), .Y(n218) );
  INVX2 U272 ( .A(n218), .Y(n469) );
  MUX2X1 U273 ( .B(D1[5]), .A(N183), .S(n27), .Y(n219) );
  INVX2 U274 ( .A(n219), .Y(n477) );
  MUX2X1 U275 ( .B(D1[4]), .A(N182), .S(n27), .Y(n220) );
  INVX2 U276 ( .A(n220), .Y(n478) );
  MUX2X1 U277 ( .B(D1[3]), .A(N181), .S(n27), .Y(n221) );
  INVX2 U278 ( .A(n221), .Y(n479) );
  MUX2X1 U279 ( .B(D1[2]), .A(N180), .S(n27), .Y(n222) );
  INVX2 U280 ( .A(n222), .Y(n480) );
  MUX2X1 U281 ( .B(D1[1]), .A(N179), .S(n27), .Y(n223) );
  INVX2 U282 ( .A(n223), .Y(n482) );
  MUX2X1 U283 ( .B(D1[0]), .A(N178), .S(n28), .Y(n224) );
  INVX2 U284 ( .A(n224), .Y(n483) );
  NAND2X1 U285 ( .A(n16), .B(n18), .Y(n630) );
  MUX2X1 U286 ( .B(E1[9]), .A(N225), .S(n25), .Y(n225) );
  INVX2 U287 ( .A(n225), .Y(n544) );
  MUX2X1 U288 ( .B(E1[8]), .A(N224), .S(n25), .Y(n226) );
  INVX2 U289 ( .A(n226), .Y(n545) );
  MUX2X1 U290 ( .B(E1[7]), .A(N223), .S(n25), .Y(n227) );
  INVX2 U291 ( .A(n227), .Y(n546) );
  MUX2X1 U292 ( .B(E1[6]), .A(N222), .S(n25), .Y(n228) );
  INVX2 U293 ( .A(n228), .Y(n547) );
  MUX2X1 U294 ( .B(E1[5]), .A(N221), .S(n25), .Y(n229) );
  INVX2 U295 ( .A(n229), .Y(n548) );
  MUX2X1 U296 ( .B(E1[4]), .A(N220), .S(n25), .Y(n230) );
  INVX2 U297 ( .A(n230), .Y(n549) );
  MUX2X1 U298 ( .B(E1[3]), .A(N219), .S(n25), .Y(n231) );
  INVX2 U299 ( .A(n231), .Y(n550) );
  MUX2X1 U300 ( .B(E1[2]), .A(N218), .S(n25), .Y(n232) );
  INVX2 U301 ( .A(n232), .Y(n551) );
  MUX2X1 U302 ( .B(E1[1]), .A(N217), .S(n25), .Y(n233) );
  INVX2 U303 ( .A(n233), .Y(n552) );
  MUX2X1 U304 ( .B(E1[0]), .A(N216), .S(n25), .Y(n234) );
  INVX2 U305 ( .A(n234), .Y(n553) );
  INVX2 U306 ( .A(N236), .Y(n237) );
  OAI21X1 U307 ( .A(n404), .B(n23), .C(N258), .Y(n236) );
  OAI21X1 U308 ( .A(n1), .B(n237), .C(n236), .Y(n570) );
  INVX2 U309 ( .A(N237), .Y(n240) );
  XOR2X1 U310 ( .A(Gx[1]), .B(N258), .Y(n238) );
  AOI22X1 U311 ( .A(n238), .B(n404), .C(Gx[1]), .D(n23), .Y(n239) );
  OAI21X1 U312 ( .A(n1), .B(n240), .C(n239), .Y(n571) );
  INVX2 U313 ( .A(N238), .Y(n243) );
  XOR2X1 U314 ( .A(n244), .B(Gx[2]), .Y(n241) );
  AOI22X1 U315 ( .A(n241), .B(n404), .C(Gx[2]), .D(n23), .Y(n242) );
  OAI21X1 U316 ( .A(n1), .B(n243), .C(n242), .Y(n572) );
  INVX2 U317 ( .A(N239), .Y(n247) );
  XOR2X1 U318 ( .A(n248), .B(Gx[3]), .Y(n245) );
  AOI22X1 U319 ( .A(n245), .B(n404), .C(Gx[3]), .D(n23), .Y(n246) );
  OAI21X1 U320 ( .A(n1), .B(n247), .C(n246), .Y(n573) );
  INVX2 U321 ( .A(N240), .Y(n251) );
  XOR2X1 U322 ( .A(n252), .B(Gx[4]), .Y(n249) );
  AOI22X1 U323 ( .A(n249), .B(n404), .C(Gx[4]), .D(n23), .Y(n250) );
  OAI21X1 U324 ( .A(n1), .B(n251), .C(n250), .Y(n574) );
  INVX2 U325 ( .A(N241), .Y(n255) );
  XOR2X1 U326 ( .A(n256), .B(Gx[5]), .Y(n253) );
  AOI22X1 U327 ( .A(n253), .B(n404), .C(Gx[5]), .D(n23), .Y(n254) );
  OAI21X1 U328 ( .A(n1), .B(n255), .C(n254), .Y(n575) );
  INVX2 U329 ( .A(N242), .Y(n259) );
  XOR2X1 U330 ( .A(n260), .B(Gx[6]), .Y(n257) );
  AOI22X1 U331 ( .A(n257), .B(n404), .C(Gx[6]), .D(n23), .Y(n258) );
  OAI21X1 U332 ( .A(n1), .B(n259), .C(n258), .Y(n576) );
  INVX2 U333 ( .A(N243), .Y(n263) );
  XOR2X1 U334 ( .A(n264), .B(Gx[7]), .Y(n261) );
  AOI22X1 U335 ( .A(n261), .B(n404), .C(Gx[7]), .D(n23), .Y(n262) );
  OAI21X1 U336 ( .A(n1), .B(n263), .C(n262), .Y(n577) );
  INVX2 U337 ( .A(N244), .Y(n267) );
  XOR2X1 U338 ( .A(n268), .B(Gx[8]), .Y(n265) );
  AOI22X1 U339 ( .A(n265), .B(n404), .C(Gx[8]), .D(n23), .Y(n266) );
  OAI21X1 U340 ( .A(n1), .B(n267), .C(n266), .Y(n578) );
  INVX2 U341 ( .A(N245), .Y(n271) );
  XOR2X1 U342 ( .A(n272), .B(Gx[9]), .Y(n269) );
  AOI22X1 U343 ( .A(n269), .B(n404), .C(Gx[9]), .D(n23), .Y(n270) );
  OAI21X1 U344 ( .A(n1), .B(n271), .C(n270), .Y(n579) );
  NOR2X1 U345 ( .A(Gx[9]), .B(n272), .Y(n273) );
  XNOR2X1 U346 ( .A(n273), .B(Gx[10]), .Y(n274) );
  AOI22X1 U347 ( .A(n23), .B(Gx[10]), .C(n274), .D(n404), .Y(n276) );
  NAND2X1 U348 ( .A(N246), .B(n384), .Y(n275) );
  NAND2X1 U349 ( .A(n276), .B(n275), .Y(n580) );
  NAND2X1 U350 ( .A(n8), .B(n18), .Y(n615) );
  MUX2X1 U351 ( .B(N215), .A(N177), .S(n28), .Y(n277) );
  INVX2 U352 ( .A(n277), .Y(n437) );
  INVX2 U353 ( .A(C2[9]), .Y(n279) );
  INVX2 U354 ( .A(N215), .Y(n278) );
  MUX2X1 U355 ( .B(n279), .A(n278), .S(n24), .Y(n535) );
  MUX2X1 U356 ( .B(N214), .A(N176), .S(n28), .Y(n280) );
  INVX2 U357 ( .A(n280), .Y(n438) );
  INVX2 U358 ( .A(C2[8]), .Y(n282) );
  INVX2 U359 ( .A(N214), .Y(n281) );
  MUX2X1 U360 ( .B(n282), .A(n281), .S(n24), .Y(n536) );
  MUX2X1 U361 ( .B(N213), .A(N175), .S(n28), .Y(n283) );
  INVX2 U362 ( .A(n283), .Y(n439) );
  INVX2 U363 ( .A(C2[7]), .Y(n285) );
  INVX2 U364 ( .A(N213), .Y(n284) );
  MUX2X1 U365 ( .B(n285), .A(n284), .S(n24), .Y(n537) );
  MUX2X1 U366 ( .B(N212), .A(N174), .S(n28), .Y(n286) );
  INVX2 U367 ( .A(n286), .Y(n440) );
  INVX2 U368 ( .A(C2[6]), .Y(n288) );
  INVX2 U369 ( .A(N212), .Y(n287) );
  MUX2X1 U370 ( .B(n288), .A(n287), .S(n24), .Y(n538) );
  MUX2X1 U371 ( .B(N211), .A(N173), .S(n28), .Y(n289) );
  INVX2 U372 ( .A(n289), .Y(n441) );
  INVX2 U373 ( .A(C2[5]), .Y(n291) );
  INVX2 U374 ( .A(N211), .Y(n290) );
  MUX2X1 U375 ( .B(n291), .A(n290), .S(n24), .Y(n539) );
  MUX2X1 U376 ( .B(N210), .A(N172), .S(n28), .Y(n292) );
  INVX2 U377 ( .A(n292), .Y(n443) );
  INVX2 U378 ( .A(C2[4]), .Y(n294) );
  INVX2 U379 ( .A(N210), .Y(n293) );
  MUX2X1 U380 ( .B(n294), .A(n293), .S(n24), .Y(n540) );
  MUX2X1 U381 ( .B(N209), .A(N171), .S(n28), .Y(n295) );
  INVX2 U382 ( .A(n295), .Y(n444) );
  INVX2 U383 ( .A(C2[3]), .Y(n297) );
  INVX2 U384 ( .A(N209), .Y(n296) );
  MUX2X1 U385 ( .B(n297), .A(n296), .S(n24), .Y(n541) );
  MUX2X1 U386 ( .B(N208), .A(N170), .S(n28), .Y(n298) );
  INVX2 U387 ( .A(n298), .Y(n451) );
  INVX2 U388 ( .A(C2[2]), .Y(n300) );
  INVX2 U389 ( .A(N208), .Y(n299) );
  MUX2X1 U390 ( .B(n300), .A(n299), .S(n24), .Y(n542) );
  MUX2X1 U391 ( .B(N207), .A(N169), .S(n28), .Y(n301) );
  INVX2 U392 ( .A(n301), .Y(n452) );
  INVX2 U393 ( .A(C2[1]), .Y(n304) );
  INVX2 U394 ( .A(N207), .Y(n302) );
  MUX2X1 U395 ( .B(n304), .A(n302), .S(n24), .Y(n543) );
  MUX2X1 U396 ( .B(A2[8]), .A(N159), .S(n28), .Y(n305) );
  INVX2 U397 ( .A(n305), .Y(n419) );
  MUX2X1 U398 ( .B(A2[7]), .A(N158), .S(n28), .Y(n306) );
  INVX2 U399 ( .A(n306), .Y(n420) );
  MUX2X1 U400 ( .B(A2[6]), .A(N157), .S(n28), .Y(n307) );
  INVX2 U401 ( .A(n307), .Y(n421) );
  MUX2X1 U402 ( .B(A2[5]), .A(N156), .S(n29), .Y(n308) );
  INVX2 U403 ( .A(n308), .Y(n422) );
  MUX2X1 U404 ( .B(A2[4]), .A(N155), .S(n29), .Y(n309) );
  INVX2 U405 ( .A(n309), .Y(n423) );
  MUX2X1 U406 ( .B(A2[3]), .A(N154), .S(n29), .Y(n310) );
  INVX2 U407 ( .A(n310), .Y(n424) );
  MUX2X1 U408 ( .B(A2[2]), .A(N153), .S(n29), .Y(n311) );
  INVX2 U409 ( .A(n311), .Y(n425) );
  MUX2X1 U410 ( .B(A2[1]), .A(N152), .S(n29), .Y(n312) );
  INVX2 U411 ( .A(n312), .Y(n426) );
  MUX2X1 U412 ( .B(A2[0]), .A(N151), .S(n29), .Y(n313) );
  INVX2 U413 ( .A(n313), .Y(n427) );
  MUX2X1 U414 ( .B(D2[8]), .A(N195), .S(n29), .Y(n314) );
  INVX2 U415 ( .A(n314), .Y(n486) );
  MUX2X1 U416 ( .B(D2[7]), .A(N194), .S(n29), .Y(n316) );
  INVX2 U417 ( .A(n316), .Y(n487) );
  MUX2X1 U418 ( .B(D2[6]), .A(N193), .S(n29), .Y(n317) );
  INVX2 U419 ( .A(n317), .Y(n488) );
  MUX2X1 U420 ( .B(D2[5]), .A(N192), .S(n29), .Y(n318) );
  INVX2 U421 ( .A(n318), .Y(n517) );
  MUX2X1 U422 ( .B(D2[4]), .A(N191), .S(n29), .Y(n319) );
  INVX2 U423 ( .A(n319), .Y(n518) );
  MUX2X1 U424 ( .B(D2[3]), .A(N190), .S(n29), .Y(n320) );
  INVX2 U425 ( .A(n320), .Y(n520) );
  MUX2X1 U426 ( .B(D2[2]), .A(N189), .S(n29), .Y(n321) );
  INVX2 U427 ( .A(n321), .Y(n523) );
  MUX2X1 U428 ( .B(D2[1]), .A(N188), .S(n30), .Y(n322) );
  INVX2 U429 ( .A(n322), .Y(n524) );
  MUX2X1 U430 ( .B(D2[0]), .A(N187), .S(n30), .Y(n324) );
  INVX2 U431 ( .A(n324), .Y(n525) );
  MUX2X1 U432 ( .B(E2[9]), .A(N235), .S(n25), .Y(n325) );
  INVX2 U433 ( .A(n325), .Y(n554) );
  MUX2X1 U434 ( .B(E2[8]), .A(N234), .S(n25), .Y(n326) );
  INVX2 U435 ( .A(n326), .Y(n555) );
  MUX2X1 U436 ( .B(E2[7]), .A(N233), .S(n25), .Y(n327) );
  INVX2 U437 ( .A(n327), .Y(n556) );
  MUX2X1 U438 ( .B(E2[6]), .A(N232), .S(n25), .Y(n328) );
  INVX2 U439 ( .A(n328), .Y(n557) );
  MUX2X1 U440 ( .B(E2[5]), .A(N231), .S(n25), .Y(n329) );
  INVX2 U441 ( .A(n329), .Y(n558) );
  MUX2X1 U442 ( .B(E2[4]), .A(N230), .S(n25), .Y(n330) );
  INVX2 U443 ( .A(n330), .Y(n559) );
  MUX2X1 U444 ( .B(E2[3]), .A(N229), .S(n25), .Y(n331) );
  INVX2 U445 ( .A(n331), .Y(n560) );
  MUX2X1 U446 ( .B(E2[2]), .A(N228), .S(n25), .Y(n332) );
  INVX2 U447 ( .A(n332), .Y(n561) );
  MUX2X1 U448 ( .B(E2[1]), .A(N227), .S(n25), .Y(n333) );
  INVX2 U449 ( .A(n333), .Y(n562) );
  MUX2X1 U450 ( .B(E2[0]), .A(N226), .S(n25), .Y(n334) );
  INVX2 U451 ( .A(n334), .Y(n563) );
  INVX2 U452 ( .A(N247), .Y(n336) );
  NAND2X1 U453 ( .A(n1), .B(n615), .Y(n389) );
  INVX2 U454 ( .A(n389), .Y(n408) );
  OAI21X1 U455 ( .A(n385), .B(n408), .C(N269), .Y(n335) );
  OAI21X1 U456 ( .A(n1), .B(n336), .C(n335), .Y(n567) );
  INVX2 U457 ( .A(Gy[1]), .Y(n339) );
  XOR2X1 U460 ( .A(Gy[1]), .B(N269), .Y(n337) );
  AOI22X1 U461 ( .A(n337), .B(n385), .C(N248), .D(n384), .Y(n338) );
  OAI21X1 U463 ( .A(n389), .B(n339), .C(n338), .Y(n589) );
  INVX2 U466 ( .A(Gy[2]), .Y(n345) );
  INVX2 U468 ( .A(N269), .Y(n340) );
  NAND2X1 U470 ( .A(n340), .B(n339), .Y(n344) );
  XOR2X1 U471 ( .A(n344), .B(Gy[2]), .Y(n342) );
  AOI22X1 U473 ( .A(n342), .B(n385), .C(N249), .D(n384), .Y(n343) );
  OAI21X1 U474 ( .A(n389), .B(n345), .C(n343), .Y(n588) );
  INVX2 U480 ( .A(Gy[3]), .Y(n350) );
  INVX2 U481 ( .A(n344), .Y(n346) );
  NAND2X1 U483 ( .A(n346), .B(n345), .Y(n349) );
  XOR2X1 U485 ( .A(n349), .B(Gy[3]), .Y(n347) );
  AOI22X1 U486 ( .A(n347), .B(n385), .C(N250), .D(n384), .Y(n348) );
  OAI21X1 U489 ( .A(n389), .B(n350), .C(n348), .Y(n587) );
  INVX2 U494 ( .A(Gy[4]), .Y(n355) );
  INVX2 U495 ( .A(n349), .Y(n351) );
  NAND2X1 U496 ( .A(n351), .B(n350), .Y(n354) );
  XOR2X1 U497 ( .A(n354), .B(Gy[4]), .Y(n352) );
  AOI22X1 U498 ( .A(n352), .B(n385), .C(N251), .D(n384), .Y(n353) );
  OAI21X1 U499 ( .A(n389), .B(n355), .C(n353), .Y(n586) );
  INVX2 U500 ( .A(Gy[5]), .Y(n360) );
  INVX2 U501 ( .A(n354), .Y(n356) );
  NAND2X1 U502 ( .A(n356), .B(n355), .Y(n359) );
  XOR2X1 U503 ( .A(n359), .B(Gy[5]), .Y(n357) );
  AOI22X1 U504 ( .A(n357), .B(n385), .C(N252), .D(n384), .Y(n358) );
  OAI21X1 U505 ( .A(n389), .B(n360), .C(n358), .Y(n585) );
  INVX2 U506 ( .A(Gy[6]), .Y(n366) );
  INVX2 U507 ( .A(n359), .Y(n361) );
  NAND2X1 U508 ( .A(n361), .B(n360), .Y(n365) );
  XOR2X1 U509 ( .A(n365), .B(Gy[6]), .Y(n362) );
  AOI22X1 U510 ( .A(n362), .B(n385), .C(N253), .D(n384), .Y(n363) );
  OAI21X1 U511 ( .A(n389), .B(n366), .C(n363), .Y(n584) );
  INVX2 U512 ( .A(Gy[7]), .Y(n371) );
  INVX2 U513 ( .A(n365), .Y(n367) );
  NAND2X1 U514 ( .A(n367), .B(n366), .Y(n370) );
  XOR2X1 U515 ( .A(n370), .B(Gy[7]), .Y(n368) );
  AOI22X1 U516 ( .A(n368), .B(n385), .C(N254), .D(n384), .Y(n369) );
  OAI21X1 U517 ( .A(n389), .B(n371), .C(n369), .Y(n583) );
  INVX2 U518 ( .A(Gy[8]), .Y(n376) );
  INVX2 U519 ( .A(n370), .Y(n372) );
  NAND2X1 U520 ( .A(n372), .B(n371), .Y(n375) );
  XOR2X1 U521 ( .A(n375), .B(Gy[8]), .Y(n373) );
  AOI22X1 U522 ( .A(n373), .B(n385), .C(N255), .D(n384), .Y(n374) );
  OAI21X1 U523 ( .A(n389), .B(n376), .C(n374), .Y(n582) );
  INVX2 U524 ( .A(Gy[9]), .Y(n381) );
  INVX2 U525 ( .A(n375), .Y(n377) );
  NAND2X1 U526 ( .A(n377), .B(n376), .Y(n380) );
  XOR2X1 U527 ( .A(n380), .B(Gy[9]), .Y(n378) );
  AOI22X1 U528 ( .A(n378), .B(n385), .C(N256), .D(n384), .Y(n379) );
  OAI21X1 U529 ( .A(n389), .B(n381), .C(n379), .Y(n581) );
  INVX2 U530 ( .A(Gy[10]), .Y(n406) );
  INVX2 U531 ( .A(n380), .Y(n382) );
  NAND2X1 U532 ( .A(n382), .B(n381), .Y(n383) );
  XOR2X1 U533 ( .A(n383), .B(Gy[10]), .Y(n387) );
  AOI22X1 U534 ( .A(n387), .B(n385), .C(N257), .D(n384), .Y(n388) );
  OAI21X1 U535 ( .A(n406), .B(n389), .C(n388), .Y(n568) );
  NOR2X1 U536 ( .A(N290), .B(N289), .Y(n391) );
  INVX2 U537 ( .A(N288), .Y(n390) );
  AOI21X1 U538 ( .A(n391), .B(n390), .C(n632), .Y(n392) );
  INVX2 U539 ( .A(n392), .Y(n402) );
  INVX2 U540 ( .A(n632), .Y(n400) );
  MUX2X1 U541 ( .B(temp_sum[0]), .A(N280), .S(n400), .Y(n393) );
  NAND2X1 U542 ( .A(n402), .B(n393), .Y(n590) );
  MUX2X1 U543 ( .B(temp_sum[1]), .A(N281), .S(n400), .Y(n394) );
  NAND2X1 U544 ( .A(n402), .B(n394), .Y(n591) );
  MUX2X1 U545 ( .B(temp_sum[2]), .A(N282), .S(n400), .Y(n395) );
  NAND2X1 U546 ( .A(n402), .B(n395), .Y(n592) );
  MUX2X1 U547 ( .B(temp_sum[3]), .A(N283), .S(n400), .Y(n396) );
  NAND2X1 U548 ( .A(n402), .B(n396), .Y(n593) );
  MUX2X1 U549 ( .B(temp_sum[4]), .A(N284), .S(n400), .Y(n397) );
  NAND2X1 U550 ( .A(n402), .B(n397), .Y(n594) );
  MUX2X1 U551 ( .B(temp_sum[5]), .A(N285), .S(n400), .Y(n398) );
  NAND2X1 U552 ( .A(n402), .B(n398), .Y(n595) );
  MUX2X1 U553 ( .B(temp_sum[6]), .A(N286), .S(n400), .Y(n399) );
  NAND2X1 U554 ( .A(n402), .B(n399), .Y(n596) );
  MUX2X1 U555 ( .B(temp_sum[7]), .A(N287), .S(n400), .Y(n401) );
  NAND2X1 U556 ( .A(n402), .B(n401), .Y(n597) );
  NAND2X1 U557 ( .A(n22), .B(n8), .Y(n617) );
  NAND2X1 U558 ( .A(n9), .B(n18), .Y(n616) );
  NAND2X1 U559 ( .A(n2), .B(n8), .Y(n610) );
  OAI21X1 U560 ( .A(Gx[10]), .B(n610), .C(n632), .Y(n619) );
  INVX2 U561 ( .A(n607), .Y(n403) );
  NOR2X1 U562 ( .A(n404), .B(n403), .Y(n405) );
  OAI21X1 U563 ( .A(n617), .B(n406), .C(n405), .Y(n625) );
  INVX2 U564 ( .A(Gx[10]), .Y(n407) );
  OAI21X1 U565 ( .A(n610), .B(n407), .C(n616), .Y(n624) );
  INVX2 U566 ( .A(n624), .Y(n564) );
  OAI21X1 U567 ( .A(Gy[10]), .B(n617), .C(n616), .Y(n618) );
  INVX2 U568 ( .A(n633), .Y(n565) );
  INVX2 U569 ( .A(n605), .Y(n566) );
  NOR2X1 U570 ( .A(n612), .B(n611), .Y(n613) );
endmodule


module edge_detection_2_DW01_add_0 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [10:1] carry;

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_2_DW01_add_1 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1;
  wire   [10:1] carry;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  XOR2X1 U1 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  NAND2X1 U2 ( .A(B[1]), .B(A[1]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(carry[2]) );
endmodule


module edge_detection_2_DW01_add_2 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1;
  wire   [10:1] carry;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  XOR2X1 U1 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  NAND2X1 U2 ( .A(B[1]), .B(A[1]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(carry[2]) );
endmodule


module edge_detection_2_DW01_add_3 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;

  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_2_DW01_add_4 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;

  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_2_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_2_DW01_sub_3 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_2_DW01_sub_4 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_2_DW01_sub_5 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_2_DW01_sub_6 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_2_DW01_sub_7 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n3), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n4), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n5), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n6), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n7), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n9), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[6]), .Y(n3) );
  INVX2 U6 ( .A(B[5]), .Y(n4) );
  INVX2 U7 ( .A(B[4]), .Y(n5) );
  INVX2 U8 ( .A(B[3]), .Y(n6) );
  INVX2 U9 ( .A(B[2]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[1]), .Y(n9) );
endmodule


module edge_detection_2 ( clk, n_rst, i_gradient_start, P0, P1, P2, P3, P4, P5, 
        P6, P7, P8, o_gradient_data_ready, o_processed_sum );
  input [7:0] P0;
  input [7:0] P1;
  input [7:0] P2;
  input [7:0] P3;
  input [7:0] P4;
  input [7:0] P5;
  input [7:0] P6;
  input [7:0] P7;
  input [7:0] P8;
  output [7:0] o_processed_sum;
  input clk, n_rst, i_gradient_start;
  output o_gradient_data_ready;
  wire   N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152,
         N153, N154, N155, N156, N157, N158, N159, N160, N161, N162, N163,
         N164, N165, N166, N167, N168, N169, N170, N171, N172, N173, N174,
         N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N187, N188, N189, N190, N191, N192, N193, N194, N195, N197,
         N198, N199, N200, N201, N202, N203, N204, N205, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N269, N280, N281, N282, N283, N284,
         N285, N286, N287, N288, N289, N290, n1, n2, n8, n9, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n65, n141,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n443, n444, n451, n452, n461, n466,
         n469, n477, n478, n479, n480, n482, n483, n486, n487, n488, n517,
         n518, n520, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633;
  wire   [5:0] state;
  wire   [8:0] A1;
  wire   [9:0] C1;
  wire   [8:0] D1;
  wire   [9:0] E1;
  wire   [8:0] A2;
  wire   [9:0] C2;
  wire   [8:0] D2;
  wire   [9:0] E2;
  wire   [10:0] Gx;
  wire   [10:0] Gy;
  wire   [7:0] temp_sum;

  DFFSR \Gy_reg[0]  ( .D(n567), .CLK(clk), .R(n177), .S(1'b1), .Q(N269) );
  DFFSR \Gy_reg[10]  ( .D(n568), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[10]) );
  DFFSR \state_reg[0]  ( .D(n19), .CLK(clk), .R(n177), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n569), .CLK(clk), .R(n177), .S(1'b1), .Q(state[1])
         );
  DFFSR \C1_reg[9]  ( .D(n526), .CLK(clk), .R(n177), .S(1'b1), .Q(C1[9]) );
  DFFSR \Gx_reg[10]  ( .D(n580), .CLK(clk), .R(n176), .S(1'b1), .Q(Gx[10]) );
  DFFSR \state_reg[3]  ( .D(n21), .CLK(clk), .R(n176), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(n20), .CLK(clk), .R(n176), .S(1'b1), .Q(state[2])
         );
  DFFSR \A1_reg[0]  ( .D(n418), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[0]) );
  DFFSR \A1_reg[1]  ( .D(n417), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[1]) );
  DFFSR \A1_reg[2]  ( .D(n416), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[2]) );
  DFFSR \A1_reg[3]  ( .D(n415), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[3]) );
  DFFSR \A1_reg[4]  ( .D(n414), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[4]) );
  DFFSR \A1_reg[5]  ( .D(n413), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[5]) );
  DFFSR \A1_reg[6]  ( .D(n412), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[6]) );
  DFFSR \A1_reg[7]  ( .D(n411), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[7]) );
  DFFSR \A1_reg[8]  ( .D(n410), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[8]) );
  DFFSR \B1_reg[0]  ( .D(n436), .CLK(clk), .R(n175), .S(1'b1), .Q(N197) );
  DFFSR \B1_reg[1]  ( .D(n435), .CLK(clk), .R(n175), .S(1'b1), .Q(N198) );
  DFFSR \B1_reg[2]  ( .D(n434), .CLK(clk), .R(n175), .S(1'b1), .Q(N199) );
  DFFSR \B1_reg[3]  ( .D(n433), .CLK(clk), .R(n175), .S(1'b1), .Q(N200) );
  DFFSR \B1_reg[4]  ( .D(n432), .CLK(clk), .R(n175), .S(1'b1), .Q(N201) );
  DFFSR \B1_reg[5]  ( .D(n431), .CLK(clk), .R(n175), .S(1'b1), .Q(N202) );
  DFFSR \B1_reg[6]  ( .D(n430), .CLK(clk), .R(n175), .S(1'b1), .Q(N203) );
  DFFSR \B1_reg[7]  ( .D(n429), .CLK(clk), .R(n175), .S(1'b1), .Q(N204) );
  DFFSR \B1_reg[8]  ( .D(n428), .CLK(clk), .R(n175), .S(1'b1), .Q(N205) );
  DFFSR \C1_reg[1]  ( .D(n534), .CLK(clk), .R(n175), .S(1'b1), .Q(C1[1]) );
  DFFSR \C1_reg[2]  ( .D(n533), .CLK(clk), .R(n175), .S(1'b1), .Q(C1[2]) );
  DFFSR \C1_reg[3]  ( .D(n532), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[3]) );
  DFFSR \C1_reg[4]  ( .D(n531), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[4]) );
  DFFSR \C1_reg[5]  ( .D(n530), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[5]) );
  DFFSR \C1_reg[6]  ( .D(n529), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[6]) );
  DFFSR \C1_reg[7]  ( .D(n528), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[7]) );
  DFFSR \C1_reg[8]  ( .D(n527), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[8]) );
  DFFSR \D1_reg[0]  ( .D(n483), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[0]) );
  DFFSR \D1_reg[1]  ( .D(n482), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[1]) );
  DFFSR \D1_reg[2]  ( .D(n480), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[2]) );
  DFFSR \D1_reg[3]  ( .D(n479), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[3]) );
  DFFSR \D1_reg[4]  ( .D(n478), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[4]) );
  DFFSR \D1_reg[5]  ( .D(n477), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[5]) );
  DFFSR \D1_reg[6]  ( .D(n469), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[6]) );
  DFFSR \D1_reg[7]  ( .D(n466), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[7]) );
  DFFSR \D1_reg[8]  ( .D(n461), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[8]) );
  DFFSR \E1_reg[0]  ( .D(n553), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[0]) );
  DFFSR \E1_reg[1]  ( .D(n552), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[1]) );
  DFFSR \E1_reg[2]  ( .D(n551), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[2]) );
  DFFSR \E1_reg[3]  ( .D(n550), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[3]) );
  DFFSR \E1_reg[4]  ( .D(n549), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[4]) );
  DFFSR \E1_reg[5]  ( .D(n548), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[5]) );
  DFFSR \E1_reg[6]  ( .D(n547), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[6]) );
  DFFSR \E1_reg[7]  ( .D(n546), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[7]) );
  DFFSR \E1_reg[8]  ( .D(n545), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[8]) );
  DFFSR \E1_reg[9]  ( .D(n544), .CLK(clk), .R(n172), .S(1'b1), .Q(E1[9]) );
  DFFSR \A2_reg[0]  ( .D(n427), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[0]) );
  DFFSR \A2_reg[1]  ( .D(n426), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[1]) );
  DFFSR \A2_reg[2]  ( .D(n425), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[2]) );
  DFFSR \A2_reg[3]  ( .D(n424), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[3]) );
  DFFSR \A2_reg[4]  ( .D(n423), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[4]) );
  DFFSR \A2_reg[5]  ( .D(n422), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[5]) );
  DFFSR \A2_reg[6]  ( .D(n421), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[6]) );
  DFFSR \A2_reg[7]  ( .D(n420), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[7]) );
  DFFSR \A2_reg[8]  ( .D(n419), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[8]) );
  DFFSR \B2_reg[0]  ( .D(n452), .CLK(clk), .R(n172), .S(1'b1), .Q(N207) );
  DFFSR \B2_reg[1]  ( .D(n451), .CLK(clk), .R(n172), .S(1'b1), .Q(N208) );
  DFFSR \B2_reg[2]  ( .D(n444), .CLK(clk), .R(n171), .S(1'b1), .Q(N209) );
  DFFSR \B2_reg[3]  ( .D(n443), .CLK(clk), .R(n171), .S(1'b1), .Q(N210) );
  DFFSR \B2_reg[4]  ( .D(n441), .CLK(clk), .R(n171), .S(1'b1), .Q(N211) );
  DFFSR \B2_reg[5]  ( .D(n440), .CLK(clk), .R(n171), .S(1'b1), .Q(N212) );
  DFFSR \B2_reg[6]  ( .D(n439), .CLK(clk), .R(n171), .S(1'b1), .Q(N213) );
  DFFSR \B2_reg[7]  ( .D(n438), .CLK(clk), .R(n171), .S(1'b1), .Q(N214) );
  DFFSR \B2_reg[8]  ( .D(n437), .CLK(clk), .R(n171), .S(1'b1), .Q(N215) );
  DFFSR \D2_reg[0]  ( .D(n525), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[0]) );
  DFFSR \D2_reg[1]  ( .D(n524), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[1]) );
  DFFSR \D2_reg[2]  ( .D(n523), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[2]) );
  DFFSR \D2_reg[3]  ( .D(n520), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[3]) );
  DFFSR \D2_reg[4]  ( .D(n518), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[4]) );
  DFFSR \D2_reg[5]  ( .D(n517), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[5]) );
  DFFSR \D2_reg[6]  ( .D(n488), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[6]) );
  DFFSR \D2_reg[7]  ( .D(n487), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[7]) );
  DFFSR \D2_reg[8]  ( .D(n486), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[8]) );
  DFFSR \E2_reg[0]  ( .D(n563), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[0]) );
  DFFSR \E2_reg[1]  ( .D(n562), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[1]) );
  DFFSR \E2_reg[2]  ( .D(n561), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[2]) );
  DFFSR \E2_reg[3]  ( .D(n560), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[3]) );
  DFFSR \E2_reg[4]  ( .D(n559), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[4]) );
  DFFSR \E2_reg[5]  ( .D(n558), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[5]) );
  DFFSR \E2_reg[6]  ( .D(n557), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[6]) );
  DFFSR \E2_reg[7]  ( .D(n556), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[7]) );
  DFFSR \E2_reg[8]  ( .D(n555), .CLK(clk), .R(n169), .S(1'b1), .Q(E2[8]) );
  DFFSR \E2_reg[9]  ( .D(n554), .CLK(clk), .R(n169), .S(1'b1), .Q(E2[9]) );
  DFFSR o_gradient_data_ready_reg ( .D(n565), .CLK(clk), .R(n169), .S(1'b1), 
        .Q(o_gradient_data_ready) );
  DFFSR \Gx_reg[0]  ( .D(n570), .CLK(clk), .R(n169), .S(1'b1), .Q(N258) );
  DFFSR \Gx_reg[1]  ( .D(n571), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[1]) );
  DFFSR \Gx_reg[2]  ( .D(n572), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[2]) );
  DFFSR \Gx_reg[3]  ( .D(n573), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[3]) );
  DFFSR \Gx_reg[4]  ( .D(n574), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[4]) );
  DFFSR \Gx_reg[5]  ( .D(n575), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[5]) );
  DFFSR \Gx_reg[6]  ( .D(n576), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[6]) );
  DFFSR \Gx_reg[7]  ( .D(n577), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[7]) );
  DFFSR \Gx_reg[8]  ( .D(n578), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[8]) );
  DFFSR \Gx_reg[9]  ( .D(n579), .CLK(clk), .R(n168), .S(1'b1), .Q(Gx[9]) );
  DFFSR \C2_reg[1]  ( .D(n543), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[1]) );
  DFFSR \C2_reg[2]  ( .D(n542), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[2]) );
  DFFSR \C2_reg[3]  ( .D(n541), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[3]) );
  DFFSR \C2_reg[4]  ( .D(n540), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[4]) );
  DFFSR \C2_reg[5]  ( .D(n539), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[5]) );
  DFFSR \C2_reg[6]  ( .D(n538), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[6]) );
  DFFSR \C2_reg[7]  ( .D(n537), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[7]) );
  DFFSR \C2_reg[8]  ( .D(n536), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[8]) );
  DFFSR \C2_reg[9]  ( .D(n535), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[9]) );
  DFFSR \Gy_reg[1]  ( .D(n589), .CLK(clk), .R(n168), .S(1'b1), .Q(Gy[1]) );
  DFFSR \Gy_reg[2]  ( .D(n588), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[2]) );
  DFFSR \Gy_reg[3]  ( .D(n587), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[3]) );
  DFFSR \Gy_reg[4]  ( .D(n586), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[4]) );
  DFFSR \Gy_reg[5]  ( .D(n585), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[5]) );
  DFFSR \Gy_reg[6]  ( .D(n584), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[6]) );
  DFFSR \Gy_reg[7]  ( .D(n583), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[7]) );
  DFFSR \Gy_reg[8]  ( .D(n582), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[8]) );
  DFFSR \Gy_reg[9]  ( .D(n581), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[9]) );
  DFFSR \temp_sum_reg[0]  ( .D(n590), .CLK(clk), .R(n141), .S(1'b1), .Q(
        temp_sum[0]) );
  DFFSR \o_processed_sum_reg[0]  ( .D(temp_sum[0]), .CLK(clk), .R(n141), .S(
        1'b1), .Q(o_processed_sum[0]) );
  DFFSR \temp_sum_reg[1]  ( .D(n591), .CLK(clk), .R(n141), .S(1'b1), .Q(
        temp_sum[1]) );
  DFFSR \o_processed_sum_reg[1]  ( .D(temp_sum[1]), .CLK(clk), .R(n141), .S(
        1'b1), .Q(o_processed_sum[1]) );
  DFFSR \temp_sum_reg[2]  ( .D(n592), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[2]) );
  DFFSR \o_processed_sum_reg[2]  ( .D(temp_sum[2]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[2]) );
  DFFSR \temp_sum_reg[3]  ( .D(n593), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[3]) );
  DFFSR \o_processed_sum_reg[3]  ( .D(temp_sum[3]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[3]) );
  DFFSR \temp_sum_reg[4]  ( .D(n594), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[4]) );
  DFFSR \o_processed_sum_reg[4]  ( .D(temp_sum[4]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[4]) );
  DFFSR \temp_sum_reg[5]  ( .D(n595), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[5]) );
  DFFSR \o_processed_sum_reg[5]  ( .D(temp_sum[5]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[5]) );
  DFFSR \temp_sum_reg[6]  ( .D(n596), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[6]) );
  DFFSR \o_processed_sum_reg[6]  ( .D(temp_sum[6]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[6]) );
  DFFSR \temp_sum_reg[7]  ( .D(n597), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[7]) );
  DFFSR \o_processed_sum_reg[7]  ( .D(temp_sum[7]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[7]) );
  AND2X2 U157 ( .A(n630), .B(n623), .Y(n614) );
  AND2X2 U160 ( .A(n633), .B(n632), .Y(n600) );
  OR2X1 U458 ( .A(n625), .B(n624), .Y(n626) );
  NAND3X1 U459 ( .A(n623), .B(n622), .C(n408), .Y(n627) );
  OR2X1 U462 ( .A(n619), .B(n618), .Y(n620) );
  NAND3X1 U464 ( .A(n615), .B(n622), .C(n614), .Y(n621) );
  OAI21X1 U465 ( .A(n622), .B(n409), .C(n613), .Y(n569) );
  NAND2X1 U467 ( .A(n564), .B(n617), .Y(n611) );
  NAND3X1 U469 ( .A(n628), .B(n632), .C(n629), .Y(n612) );
  OR2X1 U472 ( .A(n619), .B(n625), .Y(n608) );
  NAND3X1 U475 ( .A(n629), .B(n622), .C(n606), .Y(n609) );
  NAND2X1 U476 ( .A(i_gradient_start), .B(n566), .Y(n606) );
  NAND2X1 U477 ( .A(n604), .B(n603), .Y(n622) );
  NOR2X1 U478 ( .A(n602), .B(n601), .Y(n603) );
  NAND3X1 U479 ( .A(n630), .B(n629), .C(n610), .Y(n601) );
  NAND3X1 U482 ( .A(n631), .B(n628), .C(n600), .Y(n602) );
  NAND3X1 U484 ( .A(state[2]), .B(n17), .C(state[3]), .Y(n633) );
  NOR2X1 U487 ( .A(n599), .B(n598), .Y(n604) );
  NAND3X1 U488 ( .A(n605), .B(n616), .C(n408), .Y(n598) );
  NAND2X1 U490 ( .A(n16), .B(n2), .Y(n605) );
  NAND3X1 U491 ( .A(n617), .B(n607), .C(n623), .Y(n599) );
  NAND2X1 U492 ( .A(n9), .B(n17), .Y(n623) );
  NAND2X1 U493 ( .A(n22), .B(n9), .Y(n607) );
  edge_detection_2_DW01_add_0 add_231 ( .A({Gx[10:1], N258}), .B({Gy[10:1], 
        N269}), .CI(1'b0), .SUM({N290, N289, N288, N287, N286, N285, N284, 
        N283, N282, N281, N280}) );
  edge_detection_2_DW01_add_1 add_219 ( .A({C2[9], C2[9:1], 1'b0}), .B({E2[9], 
        E2}), .CI(1'b0), .SUM({N257, N256, N255, N254, N253, N252, N251, N250, 
        N249, N248, N247}) );
  edge_detection_2_DW01_add_2 add_218 ( .A({C1[9], C1[9:1], 1'b0}), .B({E1[9], 
        E1}), .CI(1'b0), .SUM({N246, N245, N244, N243, N242, N241, N240, N239, 
        N238, N237, N236}) );
  edge_detection_2_DW01_add_3 add_214 ( .A({A2[8], A2}), .B({D2[8], D2}), .CI(
        1'b0), .SUM({N235, N234, N233, N232, N231, N230, N229, N228, N227, 
        N226}) );
  edge_detection_2_DW01_add_4 add_213 ( .A({A1[8], A1}), .B({D1[8], D1}), .CI(
        1'b0), .SUM({N225, N224, N223, N222, N221, N220, N219, N218, N217, 
        N216}) );
  edge_detection_2_DW01_sub_2 sub_204 ( .A({1'b0, P2}), .B({1'b0, P8}), .CI(
        1'b0), .DIFF({N195, N194, N193, N192, N191, N190, N189, N188, N187})
         );
  edge_detection_2_DW01_sub_3 sub_203 ( .A({1'b0, P8}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N186, N185, N184, N183, N182, N181, N180, N179, N178})
         );
  edge_detection_2_DW01_sub_4 sub_202 ( .A({1'b0, P1}), .B({1'b0, P7}), .CI(
        1'b0), .DIFF({N177, N176, N175, N174, N173, N172, N171, N170, N169})
         );
  edge_detection_2_DW01_sub_5 sub_201 ( .A({1'b0, P5}), .B({1'b0, P3}), .CI(
        1'b0), .DIFF({N168, N167, N166, N165, N164, N163, N162, N161, N160})
         );
  edge_detection_2_DW01_sub_6 sub_200 ( .A({1'b0, P0}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N159, N158, N157, N156, N155, N154, N153, N152, N151})
         );
  edge_detection_2_DW01_sub_7 sub_199 ( .A({1'b0, P2}), .B({1'b0, P0}), .CI(
        1'b0), .DIFF({N150, N149, N148, N147, N146, N145, N144, N143, N142})
         );
  NAND2X1 U5 ( .A(n2), .B(n9), .Y(n1) );
  AND2X2 U6 ( .A(n409), .B(n178), .Y(n2) );
  AND2X2 U12 ( .A(state[3]), .B(n179), .Y(n8) );
  AND2X2 U13 ( .A(state[2]), .B(n235), .Y(n9) );
  AND2X2 U52 ( .A(n235), .B(n179), .Y(n16) );
  AND2X2 U128 ( .A(state[1]), .B(n178), .Y(n17) );
  AND2X2 U155 ( .A(state[0]), .B(state[1]), .Y(n18) );
  OR2X2 U156 ( .A(n609), .B(n608), .Y(n19) );
  OR2X2 U158 ( .A(n621), .B(n620), .Y(n20) );
  OR2X2 U159 ( .A(n627), .B(n626), .Y(n21) );
  AND2X2 U161 ( .A(state[0]), .B(n409), .Y(n22) );
  OR2X2 U162 ( .A(n260), .B(Gx[6]), .Y(n264) );
  OR2X2 U163 ( .A(n268), .B(Gx[8]), .Y(n272) );
  OR2X2 U164 ( .A(N258), .B(Gx[1]), .Y(n244) );
  BUFX2 U165 ( .A(n323), .Y(n29) );
  BUFX2 U166 ( .A(n323), .Y(n28) );
  BUFX2 U167 ( .A(n323), .Y(n26) );
  BUFX2 U168 ( .A(n323), .Y(n27) );
  INVX2 U169 ( .A(n630), .Y(n25) );
  INVX2 U170 ( .A(n1), .Y(n384) );
  INVX2 U171 ( .A(n629), .Y(n24) );
  BUFX2 U172 ( .A(n323), .Y(n30) );
  INVX2 U173 ( .A(n631), .Y(n404) );
  AND2X2 U174 ( .A(n631), .B(n1), .Y(n23) );
  INVX2 U175 ( .A(n615), .Y(n385) );
  BUFX2 U176 ( .A(n_rst), .Y(n65) );
  BUFX2 U177 ( .A(n_rst), .Y(n141) );
  BUFX2 U178 ( .A(n_rst), .Y(n169) );
  BUFX2 U179 ( .A(n_rst), .Y(n170) );
  BUFX2 U180 ( .A(n_rst), .Y(n171) );
  BUFX2 U181 ( .A(n_rst), .Y(n172) );
  BUFX2 U182 ( .A(n_rst), .Y(n173) );
  BUFX2 U183 ( .A(n_rst), .Y(n174) );
  BUFX2 U184 ( .A(n_rst), .Y(n176) );
  BUFX2 U185 ( .A(n_rst), .Y(n168) );
  BUFX2 U186 ( .A(n_rst), .Y(n175) );
  BUFX2 U187 ( .A(n_rst), .Y(n177) );
  OR2X1 U188 ( .A(n244), .B(Gx[2]), .Y(n248) );
  OR2X1 U189 ( .A(n264), .B(Gx[7]), .Y(n268) );
  OR2X1 U190 ( .A(n256), .B(Gx[5]), .Y(n260) );
  OR2X1 U191 ( .A(n252), .B(Gx[4]), .Y(n256) );
  OR2X1 U192 ( .A(n248), .B(Gx[3]), .Y(n252) );
  INVX2 U195 ( .A(state[1]), .Y(n409) );
  INVX2 U196 ( .A(state[0]), .Y(n178) );
  NAND3X1 U197 ( .A(state[2]), .B(state[3]), .C(n2), .Y(n632) );
  INVX2 U198 ( .A(state[2]), .Y(n179) );
  NAND2X1 U199 ( .A(n17), .B(n8), .Y(n631) );
  INVX2 U200 ( .A(state[3]), .Y(n235) );
  NAND2X1 U201 ( .A(n16), .B(n22), .Y(n628) );
  INVX2 U202 ( .A(n628), .Y(n323) );
  MUX2X1 U203 ( .B(N205), .A(N168), .S(n26), .Y(n180) );
  INVX2 U204 ( .A(n180), .Y(n428) );
  NAND2X1 U205 ( .A(n16), .B(n17), .Y(n629) );
  INVX2 U206 ( .A(C1[9]), .Y(n182) );
  INVX2 U207 ( .A(N205), .Y(n181) );
  MUX2X1 U208 ( .B(n182), .A(n181), .S(n24), .Y(n526) );
  MUX2X1 U209 ( .B(N204), .A(N167), .S(n26), .Y(n183) );
  INVX2 U210 ( .A(n183), .Y(n429) );
  INVX2 U211 ( .A(C1[8]), .Y(n185) );
  INVX2 U212 ( .A(N204), .Y(n184) );
  MUX2X1 U213 ( .B(n185), .A(n184), .S(n24), .Y(n527) );
  MUX2X1 U214 ( .B(N203), .A(N166), .S(n26), .Y(n186) );
  INVX2 U215 ( .A(n186), .Y(n430) );
  INVX2 U216 ( .A(C1[7]), .Y(n188) );
  INVX2 U217 ( .A(N203), .Y(n187) );
  MUX2X1 U218 ( .B(n188), .A(n187), .S(n24), .Y(n528) );
  MUX2X1 U219 ( .B(N202), .A(N165), .S(n26), .Y(n189) );
  INVX2 U220 ( .A(n189), .Y(n431) );
  INVX2 U221 ( .A(C1[6]), .Y(n191) );
  INVX2 U222 ( .A(N202), .Y(n190) );
  MUX2X1 U223 ( .B(n191), .A(n190), .S(n24), .Y(n529) );
  MUX2X1 U224 ( .B(N201), .A(N164), .S(n26), .Y(n192) );
  INVX2 U225 ( .A(n192), .Y(n432) );
  INVX2 U226 ( .A(C1[5]), .Y(n194) );
  INVX2 U227 ( .A(N201), .Y(n193) );
  MUX2X1 U228 ( .B(n194), .A(n193), .S(n24), .Y(n530) );
  MUX2X1 U229 ( .B(N200), .A(N163), .S(n26), .Y(n195) );
  INVX2 U230 ( .A(n195), .Y(n433) );
  INVX2 U231 ( .A(C1[4]), .Y(n197) );
  INVX2 U232 ( .A(N200), .Y(n196) );
  MUX2X1 U233 ( .B(n197), .A(n196), .S(n24), .Y(n531) );
  MUX2X1 U234 ( .B(N199), .A(N162), .S(n26), .Y(n198) );
  INVX2 U235 ( .A(n198), .Y(n434) );
  INVX2 U236 ( .A(C1[3]), .Y(n200) );
  INVX2 U237 ( .A(N199), .Y(n199) );
  MUX2X1 U238 ( .B(n200), .A(n199), .S(n24), .Y(n532) );
  MUX2X1 U239 ( .B(N198), .A(N161), .S(n26), .Y(n201) );
  INVX2 U240 ( .A(n201), .Y(n435) );
  INVX2 U241 ( .A(C1[2]), .Y(n203) );
  INVX2 U242 ( .A(N198), .Y(n202) );
  MUX2X1 U243 ( .B(n203), .A(n202), .S(n24), .Y(n533) );
  MUX2X1 U244 ( .B(N197), .A(N160), .S(n26), .Y(n204) );
  INVX2 U245 ( .A(n204), .Y(n436) );
  INVX2 U246 ( .A(C1[1]), .Y(n206) );
  INVX2 U247 ( .A(N197), .Y(n205) );
  MUX2X1 U248 ( .B(n206), .A(n205), .S(n24), .Y(n534) );
  MUX2X1 U249 ( .B(A1[8]), .A(N150), .S(n26), .Y(n207) );
  INVX2 U250 ( .A(n207), .Y(n410) );
  MUX2X1 U251 ( .B(A1[7]), .A(N149), .S(n26), .Y(n208) );
  INVX2 U252 ( .A(n208), .Y(n411) );
  MUX2X1 U253 ( .B(A1[6]), .A(N148), .S(n26), .Y(n209) );
  INVX2 U254 ( .A(n209), .Y(n412) );
  MUX2X1 U255 ( .B(A1[5]), .A(N147), .S(n26), .Y(n210) );
  INVX2 U256 ( .A(n210), .Y(n413) );
  MUX2X1 U257 ( .B(A1[4]), .A(N146), .S(n27), .Y(n211) );
  INVX2 U258 ( .A(n211), .Y(n414) );
  MUX2X1 U259 ( .B(A1[3]), .A(N145), .S(n27), .Y(n212) );
  INVX2 U260 ( .A(n212), .Y(n415) );
  MUX2X1 U261 ( .B(A1[2]), .A(N144), .S(n27), .Y(n213) );
  INVX2 U262 ( .A(n213), .Y(n416) );
  MUX2X1 U263 ( .B(A1[1]), .A(N143), .S(n27), .Y(n214) );
  INVX2 U264 ( .A(n214), .Y(n417) );
  MUX2X1 U265 ( .B(A1[0]), .A(N142), .S(n27), .Y(n215) );
  INVX2 U266 ( .A(n215), .Y(n418) );
  MUX2X1 U267 ( .B(D1[8]), .A(N186), .S(n27), .Y(n216) );
  INVX2 U268 ( .A(n216), .Y(n461) );
  MUX2X1 U269 ( .B(D1[7]), .A(N185), .S(n27), .Y(n217) );
  INVX2 U270 ( .A(n217), .Y(n466) );
  MUX2X1 U271 ( .B(D1[6]), .A(N184), .S(n27), .Y(n218) );
  INVX2 U272 ( .A(n218), .Y(n469) );
  MUX2X1 U273 ( .B(D1[5]), .A(N183), .S(n27), .Y(n219) );
  INVX2 U274 ( .A(n219), .Y(n477) );
  MUX2X1 U275 ( .B(D1[4]), .A(N182), .S(n27), .Y(n220) );
  INVX2 U276 ( .A(n220), .Y(n478) );
  MUX2X1 U277 ( .B(D1[3]), .A(N181), .S(n27), .Y(n221) );
  INVX2 U278 ( .A(n221), .Y(n479) );
  MUX2X1 U279 ( .B(D1[2]), .A(N180), .S(n27), .Y(n222) );
  INVX2 U280 ( .A(n222), .Y(n480) );
  MUX2X1 U281 ( .B(D1[1]), .A(N179), .S(n27), .Y(n223) );
  INVX2 U282 ( .A(n223), .Y(n482) );
  MUX2X1 U283 ( .B(D1[0]), .A(N178), .S(n28), .Y(n224) );
  INVX2 U284 ( .A(n224), .Y(n483) );
  NAND2X1 U285 ( .A(n16), .B(n18), .Y(n630) );
  MUX2X1 U286 ( .B(E1[9]), .A(N225), .S(n25), .Y(n225) );
  INVX2 U287 ( .A(n225), .Y(n544) );
  MUX2X1 U288 ( .B(E1[8]), .A(N224), .S(n25), .Y(n226) );
  INVX2 U289 ( .A(n226), .Y(n545) );
  MUX2X1 U290 ( .B(E1[7]), .A(N223), .S(n25), .Y(n227) );
  INVX2 U291 ( .A(n227), .Y(n546) );
  MUX2X1 U292 ( .B(E1[6]), .A(N222), .S(n25), .Y(n228) );
  INVX2 U293 ( .A(n228), .Y(n547) );
  MUX2X1 U294 ( .B(E1[5]), .A(N221), .S(n25), .Y(n229) );
  INVX2 U295 ( .A(n229), .Y(n548) );
  MUX2X1 U296 ( .B(E1[4]), .A(N220), .S(n25), .Y(n230) );
  INVX2 U297 ( .A(n230), .Y(n549) );
  MUX2X1 U298 ( .B(E1[3]), .A(N219), .S(n25), .Y(n231) );
  INVX2 U299 ( .A(n231), .Y(n550) );
  MUX2X1 U300 ( .B(E1[2]), .A(N218), .S(n25), .Y(n232) );
  INVX2 U301 ( .A(n232), .Y(n551) );
  MUX2X1 U302 ( .B(E1[1]), .A(N217), .S(n25), .Y(n233) );
  INVX2 U303 ( .A(n233), .Y(n552) );
  MUX2X1 U304 ( .B(E1[0]), .A(N216), .S(n25), .Y(n234) );
  INVX2 U305 ( .A(n234), .Y(n553) );
  INVX2 U306 ( .A(N236), .Y(n237) );
  OAI21X1 U307 ( .A(n404), .B(n23), .C(N258), .Y(n236) );
  OAI21X1 U308 ( .A(n1), .B(n237), .C(n236), .Y(n570) );
  INVX2 U309 ( .A(N237), .Y(n240) );
  XOR2X1 U310 ( .A(Gx[1]), .B(N258), .Y(n238) );
  AOI22X1 U311 ( .A(n238), .B(n404), .C(Gx[1]), .D(n23), .Y(n239) );
  OAI21X1 U312 ( .A(n1), .B(n240), .C(n239), .Y(n571) );
  INVX2 U313 ( .A(N238), .Y(n243) );
  XOR2X1 U314 ( .A(n244), .B(Gx[2]), .Y(n241) );
  AOI22X1 U315 ( .A(n241), .B(n404), .C(Gx[2]), .D(n23), .Y(n242) );
  OAI21X1 U316 ( .A(n1), .B(n243), .C(n242), .Y(n572) );
  INVX2 U317 ( .A(N239), .Y(n247) );
  XOR2X1 U318 ( .A(n248), .B(Gx[3]), .Y(n245) );
  AOI22X1 U319 ( .A(n245), .B(n404), .C(Gx[3]), .D(n23), .Y(n246) );
  OAI21X1 U320 ( .A(n1), .B(n247), .C(n246), .Y(n573) );
  INVX2 U321 ( .A(N240), .Y(n251) );
  XOR2X1 U322 ( .A(n252), .B(Gx[4]), .Y(n249) );
  AOI22X1 U323 ( .A(n249), .B(n404), .C(Gx[4]), .D(n23), .Y(n250) );
  OAI21X1 U324 ( .A(n1), .B(n251), .C(n250), .Y(n574) );
  INVX2 U325 ( .A(N241), .Y(n255) );
  XOR2X1 U326 ( .A(n256), .B(Gx[5]), .Y(n253) );
  AOI22X1 U327 ( .A(n253), .B(n404), .C(Gx[5]), .D(n23), .Y(n254) );
  OAI21X1 U328 ( .A(n1), .B(n255), .C(n254), .Y(n575) );
  INVX2 U329 ( .A(N242), .Y(n259) );
  XOR2X1 U330 ( .A(n260), .B(Gx[6]), .Y(n257) );
  AOI22X1 U331 ( .A(n257), .B(n404), .C(Gx[6]), .D(n23), .Y(n258) );
  OAI21X1 U332 ( .A(n1), .B(n259), .C(n258), .Y(n576) );
  INVX2 U333 ( .A(N243), .Y(n263) );
  XOR2X1 U334 ( .A(n264), .B(Gx[7]), .Y(n261) );
  AOI22X1 U335 ( .A(n261), .B(n404), .C(Gx[7]), .D(n23), .Y(n262) );
  OAI21X1 U336 ( .A(n1), .B(n263), .C(n262), .Y(n577) );
  INVX2 U337 ( .A(N244), .Y(n267) );
  XOR2X1 U338 ( .A(n268), .B(Gx[8]), .Y(n265) );
  AOI22X1 U339 ( .A(n265), .B(n404), .C(Gx[8]), .D(n23), .Y(n266) );
  OAI21X1 U340 ( .A(n1), .B(n267), .C(n266), .Y(n578) );
  INVX2 U341 ( .A(N245), .Y(n271) );
  XOR2X1 U342 ( .A(n272), .B(Gx[9]), .Y(n269) );
  AOI22X1 U343 ( .A(n269), .B(n404), .C(Gx[9]), .D(n23), .Y(n270) );
  OAI21X1 U344 ( .A(n1), .B(n271), .C(n270), .Y(n579) );
  NOR2X1 U345 ( .A(Gx[9]), .B(n272), .Y(n273) );
  XNOR2X1 U346 ( .A(n273), .B(Gx[10]), .Y(n274) );
  AOI22X1 U347 ( .A(n23), .B(Gx[10]), .C(n274), .D(n404), .Y(n276) );
  NAND2X1 U348 ( .A(N246), .B(n384), .Y(n275) );
  NAND2X1 U349 ( .A(n276), .B(n275), .Y(n580) );
  NAND2X1 U350 ( .A(n8), .B(n18), .Y(n615) );
  MUX2X1 U351 ( .B(N215), .A(N177), .S(n28), .Y(n277) );
  INVX2 U352 ( .A(n277), .Y(n437) );
  INVX2 U353 ( .A(C2[9]), .Y(n279) );
  INVX2 U354 ( .A(N215), .Y(n278) );
  MUX2X1 U355 ( .B(n279), .A(n278), .S(n24), .Y(n535) );
  MUX2X1 U356 ( .B(N214), .A(N176), .S(n28), .Y(n280) );
  INVX2 U357 ( .A(n280), .Y(n438) );
  INVX2 U358 ( .A(C2[8]), .Y(n282) );
  INVX2 U359 ( .A(N214), .Y(n281) );
  MUX2X1 U360 ( .B(n282), .A(n281), .S(n24), .Y(n536) );
  MUX2X1 U361 ( .B(N213), .A(N175), .S(n28), .Y(n283) );
  INVX2 U362 ( .A(n283), .Y(n439) );
  INVX2 U363 ( .A(C2[7]), .Y(n285) );
  INVX2 U364 ( .A(N213), .Y(n284) );
  MUX2X1 U365 ( .B(n285), .A(n284), .S(n24), .Y(n537) );
  MUX2X1 U366 ( .B(N212), .A(N174), .S(n28), .Y(n286) );
  INVX2 U367 ( .A(n286), .Y(n440) );
  INVX2 U368 ( .A(C2[6]), .Y(n288) );
  INVX2 U369 ( .A(N212), .Y(n287) );
  MUX2X1 U370 ( .B(n288), .A(n287), .S(n24), .Y(n538) );
  MUX2X1 U371 ( .B(N211), .A(N173), .S(n28), .Y(n289) );
  INVX2 U372 ( .A(n289), .Y(n441) );
  INVX2 U373 ( .A(C2[5]), .Y(n291) );
  INVX2 U374 ( .A(N211), .Y(n290) );
  MUX2X1 U375 ( .B(n291), .A(n290), .S(n24), .Y(n539) );
  MUX2X1 U376 ( .B(N210), .A(N172), .S(n28), .Y(n292) );
  INVX2 U377 ( .A(n292), .Y(n443) );
  INVX2 U378 ( .A(C2[4]), .Y(n294) );
  INVX2 U379 ( .A(N210), .Y(n293) );
  MUX2X1 U380 ( .B(n294), .A(n293), .S(n24), .Y(n540) );
  MUX2X1 U381 ( .B(N209), .A(N171), .S(n28), .Y(n295) );
  INVX2 U382 ( .A(n295), .Y(n444) );
  INVX2 U383 ( .A(C2[3]), .Y(n297) );
  INVX2 U384 ( .A(N209), .Y(n296) );
  MUX2X1 U385 ( .B(n297), .A(n296), .S(n24), .Y(n541) );
  MUX2X1 U386 ( .B(N208), .A(N170), .S(n28), .Y(n298) );
  INVX2 U387 ( .A(n298), .Y(n451) );
  INVX2 U388 ( .A(C2[2]), .Y(n300) );
  INVX2 U389 ( .A(N208), .Y(n299) );
  MUX2X1 U390 ( .B(n300), .A(n299), .S(n24), .Y(n542) );
  MUX2X1 U391 ( .B(N207), .A(N169), .S(n28), .Y(n301) );
  INVX2 U392 ( .A(n301), .Y(n452) );
  INVX2 U393 ( .A(C2[1]), .Y(n304) );
  INVX2 U394 ( .A(N207), .Y(n302) );
  MUX2X1 U395 ( .B(n304), .A(n302), .S(n24), .Y(n543) );
  MUX2X1 U396 ( .B(A2[8]), .A(N159), .S(n28), .Y(n305) );
  INVX2 U397 ( .A(n305), .Y(n419) );
  MUX2X1 U398 ( .B(A2[7]), .A(N158), .S(n28), .Y(n306) );
  INVX2 U399 ( .A(n306), .Y(n420) );
  MUX2X1 U400 ( .B(A2[6]), .A(N157), .S(n28), .Y(n307) );
  INVX2 U401 ( .A(n307), .Y(n421) );
  MUX2X1 U402 ( .B(A2[5]), .A(N156), .S(n29), .Y(n308) );
  INVX2 U403 ( .A(n308), .Y(n422) );
  MUX2X1 U404 ( .B(A2[4]), .A(N155), .S(n29), .Y(n309) );
  INVX2 U405 ( .A(n309), .Y(n423) );
  MUX2X1 U406 ( .B(A2[3]), .A(N154), .S(n29), .Y(n310) );
  INVX2 U407 ( .A(n310), .Y(n424) );
  MUX2X1 U408 ( .B(A2[2]), .A(N153), .S(n29), .Y(n311) );
  INVX2 U409 ( .A(n311), .Y(n425) );
  MUX2X1 U410 ( .B(A2[1]), .A(N152), .S(n29), .Y(n312) );
  INVX2 U411 ( .A(n312), .Y(n426) );
  MUX2X1 U412 ( .B(A2[0]), .A(N151), .S(n29), .Y(n313) );
  INVX2 U413 ( .A(n313), .Y(n427) );
  MUX2X1 U414 ( .B(D2[8]), .A(N195), .S(n29), .Y(n314) );
  INVX2 U415 ( .A(n314), .Y(n486) );
  MUX2X1 U416 ( .B(D2[7]), .A(N194), .S(n29), .Y(n316) );
  INVX2 U417 ( .A(n316), .Y(n487) );
  MUX2X1 U418 ( .B(D2[6]), .A(N193), .S(n29), .Y(n317) );
  INVX2 U419 ( .A(n317), .Y(n488) );
  MUX2X1 U420 ( .B(D2[5]), .A(N192), .S(n29), .Y(n318) );
  INVX2 U421 ( .A(n318), .Y(n517) );
  MUX2X1 U422 ( .B(D2[4]), .A(N191), .S(n29), .Y(n319) );
  INVX2 U423 ( .A(n319), .Y(n518) );
  MUX2X1 U424 ( .B(D2[3]), .A(N190), .S(n29), .Y(n320) );
  INVX2 U425 ( .A(n320), .Y(n520) );
  MUX2X1 U426 ( .B(D2[2]), .A(N189), .S(n29), .Y(n321) );
  INVX2 U427 ( .A(n321), .Y(n523) );
  MUX2X1 U428 ( .B(D2[1]), .A(N188), .S(n30), .Y(n322) );
  INVX2 U429 ( .A(n322), .Y(n524) );
  MUX2X1 U430 ( .B(D2[0]), .A(N187), .S(n30), .Y(n324) );
  INVX2 U431 ( .A(n324), .Y(n525) );
  MUX2X1 U432 ( .B(E2[9]), .A(N235), .S(n25), .Y(n325) );
  INVX2 U433 ( .A(n325), .Y(n554) );
  MUX2X1 U434 ( .B(E2[8]), .A(N234), .S(n25), .Y(n326) );
  INVX2 U435 ( .A(n326), .Y(n555) );
  MUX2X1 U436 ( .B(E2[7]), .A(N233), .S(n25), .Y(n327) );
  INVX2 U437 ( .A(n327), .Y(n556) );
  MUX2X1 U438 ( .B(E2[6]), .A(N232), .S(n25), .Y(n328) );
  INVX2 U439 ( .A(n328), .Y(n557) );
  MUX2X1 U440 ( .B(E2[5]), .A(N231), .S(n25), .Y(n329) );
  INVX2 U441 ( .A(n329), .Y(n558) );
  MUX2X1 U442 ( .B(E2[4]), .A(N230), .S(n25), .Y(n330) );
  INVX2 U443 ( .A(n330), .Y(n559) );
  MUX2X1 U444 ( .B(E2[3]), .A(N229), .S(n25), .Y(n331) );
  INVX2 U445 ( .A(n331), .Y(n560) );
  MUX2X1 U446 ( .B(E2[2]), .A(N228), .S(n25), .Y(n332) );
  INVX2 U447 ( .A(n332), .Y(n561) );
  MUX2X1 U448 ( .B(E2[1]), .A(N227), .S(n25), .Y(n333) );
  INVX2 U449 ( .A(n333), .Y(n562) );
  MUX2X1 U450 ( .B(E2[0]), .A(N226), .S(n25), .Y(n334) );
  INVX2 U451 ( .A(n334), .Y(n563) );
  INVX2 U452 ( .A(N247), .Y(n336) );
  NAND2X1 U453 ( .A(n1), .B(n615), .Y(n389) );
  INVX2 U454 ( .A(n389), .Y(n408) );
  OAI21X1 U455 ( .A(n385), .B(n408), .C(N269), .Y(n335) );
  OAI21X1 U456 ( .A(n1), .B(n336), .C(n335), .Y(n567) );
  INVX2 U457 ( .A(Gy[1]), .Y(n339) );
  XOR2X1 U460 ( .A(Gy[1]), .B(N269), .Y(n337) );
  AOI22X1 U461 ( .A(n337), .B(n385), .C(N248), .D(n384), .Y(n338) );
  OAI21X1 U463 ( .A(n389), .B(n339), .C(n338), .Y(n589) );
  INVX2 U466 ( .A(Gy[2]), .Y(n345) );
  INVX2 U468 ( .A(N269), .Y(n340) );
  NAND2X1 U470 ( .A(n340), .B(n339), .Y(n344) );
  XOR2X1 U471 ( .A(n344), .B(Gy[2]), .Y(n342) );
  AOI22X1 U473 ( .A(n342), .B(n385), .C(N249), .D(n384), .Y(n343) );
  OAI21X1 U474 ( .A(n389), .B(n345), .C(n343), .Y(n588) );
  INVX2 U480 ( .A(Gy[3]), .Y(n350) );
  INVX2 U481 ( .A(n344), .Y(n346) );
  NAND2X1 U483 ( .A(n346), .B(n345), .Y(n349) );
  XOR2X1 U485 ( .A(n349), .B(Gy[3]), .Y(n347) );
  AOI22X1 U486 ( .A(n347), .B(n385), .C(N250), .D(n384), .Y(n348) );
  OAI21X1 U489 ( .A(n389), .B(n350), .C(n348), .Y(n587) );
  INVX2 U494 ( .A(Gy[4]), .Y(n355) );
  INVX2 U495 ( .A(n349), .Y(n351) );
  NAND2X1 U496 ( .A(n351), .B(n350), .Y(n354) );
  XOR2X1 U497 ( .A(n354), .B(Gy[4]), .Y(n352) );
  AOI22X1 U498 ( .A(n352), .B(n385), .C(N251), .D(n384), .Y(n353) );
  OAI21X1 U499 ( .A(n389), .B(n355), .C(n353), .Y(n586) );
  INVX2 U500 ( .A(Gy[5]), .Y(n360) );
  INVX2 U501 ( .A(n354), .Y(n356) );
  NAND2X1 U502 ( .A(n356), .B(n355), .Y(n359) );
  XOR2X1 U503 ( .A(n359), .B(Gy[5]), .Y(n357) );
  AOI22X1 U504 ( .A(n357), .B(n385), .C(N252), .D(n384), .Y(n358) );
  OAI21X1 U505 ( .A(n389), .B(n360), .C(n358), .Y(n585) );
  INVX2 U506 ( .A(Gy[6]), .Y(n366) );
  INVX2 U507 ( .A(n359), .Y(n361) );
  NAND2X1 U508 ( .A(n361), .B(n360), .Y(n365) );
  XOR2X1 U509 ( .A(n365), .B(Gy[6]), .Y(n362) );
  AOI22X1 U510 ( .A(n362), .B(n385), .C(N253), .D(n384), .Y(n363) );
  OAI21X1 U511 ( .A(n389), .B(n366), .C(n363), .Y(n584) );
  INVX2 U512 ( .A(Gy[7]), .Y(n371) );
  INVX2 U513 ( .A(n365), .Y(n367) );
  NAND2X1 U514 ( .A(n367), .B(n366), .Y(n370) );
  XOR2X1 U515 ( .A(n370), .B(Gy[7]), .Y(n368) );
  AOI22X1 U516 ( .A(n368), .B(n385), .C(N254), .D(n384), .Y(n369) );
  OAI21X1 U517 ( .A(n389), .B(n371), .C(n369), .Y(n583) );
  INVX2 U518 ( .A(Gy[8]), .Y(n376) );
  INVX2 U519 ( .A(n370), .Y(n372) );
  NAND2X1 U520 ( .A(n372), .B(n371), .Y(n375) );
  XOR2X1 U521 ( .A(n375), .B(Gy[8]), .Y(n373) );
  AOI22X1 U522 ( .A(n373), .B(n385), .C(N255), .D(n384), .Y(n374) );
  OAI21X1 U523 ( .A(n389), .B(n376), .C(n374), .Y(n582) );
  INVX2 U524 ( .A(Gy[9]), .Y(n381) );
  INVX2 U525 ( .A(n375), .Y(n377) );
  NAND2X1 U526 ( .A(n377), .B(n376), .Y(n380) );
  XOR2X1 U527 ( .A(n380), .B(Gy[9]), .Y(n378) );
  AOI22X1 U528 ( .A(n378), .B(n385), .C(N256), .D(n384), .Y(n379) );
  OAI21X1 U529 ( .A(n389), .B(n381), .C(n379), .Y(n581) );
  INVX2 U530 ( .A(Gy[10]), .Y(n406) );
  INVX2 U531 ( .A(n380), .Y(n382) );
  NAND2X1 U532 ( .A(n382), .B(n381), .Y(n383) );
  XOR2X1 U533 ( .A(n383), .B(Gy[10]), .Y(n387) );
  AOI22X1 U534 ( .A(n387), .B(n385), .C(N257), .D(n384), .Y(n388) );
  OAI21X1 U535 ( .A(n406), .B(n389), .C(n388), .Y(n568) );
  NOR2X1 U536 ( .A(N290), .B(N289), .Y(n391) );
  INVX2 U537 ( .A(N288), .Y(n390) );
  AOI21X1 U538 ( .A(n391), .B(n390), .C(n632), .Y(n392) );
  INVX2 U539 ( .A(n392), .Y(n402) );
  INVX2 U540 ( .A(n632), .Y(n400) );
  MUX2X1 U541 ( .B(temp_sum[0]), .A(N280), .S(n400), .Y(n393) );
  NAND2X1 U542 ( .A(n402), .B(n393), .Y(n590) );
  MUX2X1 U543 ( .B(temp_sum[1]), .A(N281), .S(n400), .Y(n394) );
  NAND2X1 U544 ( .A(n402), .B(n394), .Y(n591) );
  MUX2X1 U545 ( .B(temp_sum[2]), .A(N282), .S(n400), .Y(n395) );
  NAND2X1 U546 ( .A(n402), .B(n395), .Y(n592) );
  MUX2X1 U547 ( .B(temp_sum[3]), .A(N283), .S(n400), .Y(n396) );
  NAND2X1 U548 ( .A(n402), .B(n396), .Y(n593) );
  MUX2X1 U549 ( .B(temp_sum[4]), .A(N284), .S(n400), .Y(n397) );
  NAND2X1 U550 ( .A(n402), .B(n397), .Y(n594) );
  MUX2X1 U551 ( .B(temp_sum[5]), .A(N285), .S(n400), .Y(n398) );
  NAND2X1 U552 ( .A(n402), .B(n398), .Y(n595) );
  MUX2X1 U553 ( .B(temp_sum[6]), .A(N286), .S(n400), .Y(n399) );
  NAND2X1 U554 ( .A(n402), .B(n399), .Y(n596) );
  MUX2X1 U555 ( .B(temp_sum[7]), .A(N287), .S(n400), .Y(n401) );
  NAND2X1 U556 ( .A(n402), .B(n401), .Y(n597) );
  NAND2X1 U557 ( .A(n22), .B(n8), .Y(n617) );
  NAND2X1 U558 ( .A(n9), .B(n18), .Y(n616) );
  NAND2X1 U559 ( .A(n2), .B(n8), .Y(n610) );
  OAI21X1 U560 ( .A(Gx[10]), .B(n610), .C(n632), .Y(n619) );
  INVX2 U561 ( .A(n607), .Y(n403) );
  NOR2X1 U562 ( .A(n404), .B(n403), .Y(n405) );
  OAI21X1 U563 ( .A(n617), .B(n406), .C(n405), .Y(n625) );
  INVX2 U564 ( .A(Gx[10]), .Y(n407) );
  OAI21X1 U565 ( .A(n610), .B(n407), .C(n616), .Y(n624) );
  INVX2 U566 ( .A(n624), .Y(n564) );
  OAI21X1 U567 ( .A(Gy[10]), .B(n617), .C(n616), .Y(n618) );
  INVX2 U568 ( .A(n633), .Y(n565) );
  INVX2 U569 ( .A(n605), .Y(n566) );
  NOR2X1 U570 ( .A(n612), .B(n611), .Y(n613) );
endmodule


module edge_detection_1_DW01_add_0 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [10:1] carry;

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_1_DW01_add_1 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1;
  wire   [10:1] carry;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  XOR2X1 U1 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  NAND2X1 U2 ( .A(B[1]), .B(A[1]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(carry[2]) );
endmodule


module edge_detection_1_DW01_add_2 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1;
  wire   [10:1] carry;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  XOR2X1 U1 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  NAND2X1 U2 ( .A(B[1]), .B(A[1]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(carry[2]) );
endmodule


module edge_detection_1_DW01_add_3 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;

  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_1_DW01_add_4 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;

  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_1_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X2 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_1_DW01_sub_3 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_1_DW01_sub_4 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_1_DW01_sub_5 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_1_DW01_sub_6 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_1_DW01_sub_7 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n3), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n4), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n5), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n6), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n7), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n9), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  INVX1 U1 ( .A(B[3]), .Y(n6) );
  INVX1 U2 ( .A(B[2]), .Y(n7) );
  INVX1 U3 ( .A(B[1]), .Y(n9) );
  OR2X2 U4 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U5 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U6 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U7 ( .A(B[7]), .Y(n2) );
  INVX2 U8 ( .A(B[6]), .Y(n3) );
  INVX2 U9 ( .A(B[5]), .Y(n4) );
  INVX2 U10 ( .A(B[4]), .Y(n5) );
  INVX2 U11 ( .A(B[0]), .Y(n8) );
endmodule


module edge_detection_1 ( clk, n_rst, i_gradient_start, P0, P1, P2, P3, P4, P5, 
        P6, P7, P8, o_gradient_data_ready, o_processed_sum );
  input [7:0] P0;
  input [7:0] P1;
  input [7:0] P2;
  input [7:0] P3;
  input [7:0] P4;
  input [7:0] P5;
  input [7:0] P6;
  input [7:0] P7;
  input [7:0] P8;
  output [7:0] o_processed_sum;
  input clk, n_rst, i_gradient_start;
  output o_gradient_data_ready;
  wire   N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152,
         N153, N154, N155, N156, N157, N158, N159, N160, N161, N162, N163,
         N164, N165, N166, N167, N168, N169, N170, N171, N172, N173, N174,
         N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N187, N188, N189, N190, N191, N192, N193, N194, N195, N197,
         N198, N199, N200, N201, N202, N203, N204, N205, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N269, N280, N281, N282, N283, N284,
         N285, N286, N287, N288, N289, N290, n1, n2, n8, n9, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n65, n141,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n443, n444, n451, n452, n461, n466,
         n469, n477, n478, n479, n480, n482, n483, n486, n487, n488, n517,
         n518, n520, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633;
  wire   [5:0] state;
  wire   [8:0] A1;
  wire   [9:0] C1;
  wire   [8:0] D1;
  wire   [9:0] E1;
  wire   [8:0] A2;
  wire   [9:0] C2;
  wire   [8:0] D2;
  wire   [9:0] E2;
  wire   [10:0] Gx;
  wire   [10:0] Gy;
  wire   [7:0] temp_sum;

  DFFSR \Gy_reg[0]  ( .D(n567), .CLK(clk), .R(n177), .S(1'b1), .Q(N269) );
  DFFSR \Gy_reg[10]  ( .D(n568), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[10]) );
  DFFSR \state_reg[0]  ( .D(n19), .CLK(clk), .R(n177), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n569), .CLK(clk), .R(n177), .S(1'b1), .Q(state[1])
         );
  DFFSR \C1_reg[9]  ( .D(n526), .CLK(clk), .R(n177), .S(1'b1), .Q(C1[9]) );
  DFFSR \Gx_reg[10]  ( .D(n580), .CLK(clk), .R(n176), .S(1'b1), .Q(Gx[10]) );
  DFFSR \state_reg[3]  ( .D(n21), .CLK(clk), .R(n176), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(n20), .CLK(clk), .R(n176), .S(1'b1), .Q(state[2])
         );
  DFFSR \A1_reg[0]  ( .D(n418), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[0]) );
  DFFSR \A1_reg[1]  ( .D(n417), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[1]) );
  DFFSR \A1_reg[2]  ( .D(n416), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[2]) );
  DFFSR \A1_reg[3]  ( .D(n415), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[3]) );
  DFFSR \A1_reg[4]  ( .D(n414), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[4]) );
  DFFSR \A1_reg[5]  ( .D(n413), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[5]) );
  DFFSR \A1_reg[6]  ( .D(n412), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[6]) );
  DFFSR \A1_reg[7]  ( .D(n411), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[7]) );
  DFFSR \A1_reg[8]  ( .D(n410), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[8]) );
  DFFSR \B1_reg[0]  ( .D(n436), .CLK(clk), .R(n175), .S(1'b1), .Q(N197) );
  DFFSR \B1_reg[1]  ( .D(n435), .CLK(clk), .R(n175), .S(1'b1), .Q(N198) );
  DFFSR \B1_reg[2]  ( .D(n434), .CLK(clk), .R(n175), .S(1'b1), .Q(N199) );
  DFFSR \B1_reg[3]  ( .D(n433), .CLK(clk), .R(n175), .S(1'b1), .Q(N200) );
  DFFSR \B1_reg[4]  ( .D(n432), .CLK(clk), .R(n175), .S(1'b1), .Q(N201) );
  DFFSR \B1_reg[5]  ( .D(n431), .CLK(clk), .R(n175), .S(1'b1), .Q(N202) );
  DFFSR \B1_reg[6]  ( .D(n430), .CLK(clk), .R(n175), .S(1'b1), .Q(N203) );
  DFFSR \B1_reg[7]  ( .D(n429), .CLK(clk), .R(n175), .S(1'b1), .Q(N204) );
  DFFSR \B1_reg[8]  ( .D(n428), .CLK(clk), .R(n175), .S(1'b1), .Q(N205) );
  DFFSR \C1_reg[1]  ( .D(n534), .CLK(clk), .R(n175), .S(1'b1), .Q(C1[1]) );
  DFFSR \C1_reg[2]  ( .D(n533), .CLK(clk), .R(n175), .S(1'b1), .Q(C1[2]) );
  DFFSR \C1_reg[3]  ( .D(n532), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[3]) );
  DFFSR \C1_reg[4]  ( .D(n531), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[4]) );
  DFFSR \C1_reg[5]  ( .D(n530), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[5]) );
  DFFSR \C1_reg[6]  ( .D(n529), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[6]) );
  DFFSR \C1_reg[7]  ( .D(n528), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[7]) );
  DFFSR \C1_reg[8]  ( .D(n527), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[8]) );
  DFFSR \D1_reg[0]  ( .D(n483), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[0]) );
  DFFSR \D1_reg[1]  ( .D(n482), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[1]) );
  DFFSR \D1_reg[2]  ( .D(n480), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[2]) );
  DFFSR \D1_reg[3]  ( .D(n479), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[3]) );
  DFFSR \D1_reg[4]  ( .D(n478), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[4]) );
  DFFSR \D1_reg[5]  ( .D(n477), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[5]) );
  DFFSR \D1_reg[6]  ( .D(n469), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[6]) );
  DFFSR \D1_reg[7]  ( .D(n466), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[7]) );
  DFFSR \D1_reg[8]  ( .D(n461), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[8]) );
  DFFSR \E1_reg[0]  ( .D(n553), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[0]) );
  DFFSR \E1_reg[1]  ( .D(n552), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[1]) );
  DFFSR \E1_reg[2]  ( .D(n551), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[2]) );
  DFFSR \E1_reg[3]  ( .D(n550), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[3]) );
  DFFSR \E1_reg[4]  ( .D(n549), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[4]) );
  DFFSR \E1_reg[5]  ( .D(n548), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[5]) );
  DFFSR \E1_reg[6]  ( .D(n547), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[6]) );
  DFFSR \E1_reg[7]  ( .D(n546), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[7]) );
  DFFSR \E1_reg[8]  ( .D(n545), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[8]) );
  DFFSR \E1_reg[9]  ( .D(n544), .CLK(clk), .R(n172), .S(1'b1), .Q(E1[9]) );
  DFFSR \A2_reg[0]  ( .D(n427), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[0]) );
  DFFSR \A2_reg[1]  ( .D(n426), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[1]) );
  DFFSR \A2_reg[2]  ( .D(n425), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[2]) );
  DFFSR \A2_reg[3]  ( .D(n424), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[3]) );
  DFFSR \A2_reg[4]  ( .D(n423), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[4]) );
  DFFSR \A2_reg[5]  ( .D(n422), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[5]) );
  DFFSR \A2_reg[6]  ( .D(n421), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[6]) );
  DFFSR \A2_reg[7]  ( .D(n420), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[7]) );
  DFFSR \A2_reg[8]  ( .D(n419), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[8]) );
  DFFSR \B2_reg[0]  ( .D(n452), .CLK(clk), .R(n172), .S(1'b1), .Q(N207) );
  DFFSR \B2_reg[1]  ( .D(n451), .CLK(clk), .R(n172), .S(1'b1), .Q(N208) );
  DFFSR \B2_reg[2]  ( .D(n444), .CLK(clk), .R(n171), .S(1'b1), .Q(N209) );
  DFFSR \B2_reg[3]  ( .D(n443), .CLK(clk), .R(n171), .S(1'b1), .Q(N210) );
  DFFSR \B2_reg[4]  ( .D(n441), .CLK(clk), .R(n171), .S(1'b1), .Q(N211) );
  DFFSR \B2_reg[5]  ( .D(n440), .CLK(clk), .R(n171), .S(1'b1), .Q(N212) );
  DFFSR \B2_reg[6]  ( .D(n439), .CLK(clk), .R(n171), .S(1'b1), .Q(N213) );
  DFFSR \B2_reg[7]  ( .D(n438), .CLK(clk), .R(n171), .S(1'b1), .Q(N214) );
  DFFSR \B2_reg[8]  ( .D(n437), .CLK(clk), .R(n171), .S(1'b1), .Q(N215) );
  DFFSR \D2_reg[0]  ( .D(n525), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[0]) );
  DFFSR \D2_reg[1]  ( .D(n524), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[1]) );
  DFFSR \D2_reg[2]  ( .D(n523), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[2]) );
  DFFSR \D2_reg[3]  ( .D(n520), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[3]) );
  DFFSR \D2_reg[4]  ( .D(n518), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[4]) );
  DFFSR \D2_reg[5]  ( .D(n517), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[5]) );
  DFFSR \D2_reg[6]  ( .D(n488), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[6]) );
  DFFSR \D2_reg[7]  ( .D(n487), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[7]) );
  DFFSR \D2_reg[8]  ( .D(n486), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[8]) );
  DFFSR \E2_reg[0]  ( .D(n563), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[0]) );
  DFFSR \E2_reg[1]  ( .D(n562), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[1]) );
  DFFSR \E2_reg[2]  ( .D(n561), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[2]) );
  DFFSR \E2_reg[3]  ( .D(n560), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[3]) );
  DFFSR \E2_reg[4]  ( .D(n559), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[4]) );
  DFFSR \E2_reg[5]  ( .D(n558), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[5]) );
  DFFSR \E2_reg[6]  ( .D(n557), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[6]) );
  DFFSR \E2_reg[7]  ( .D(n556), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[7]) );
  DFFSR \E2_reg[8]  ( .D(n555), .CLK(clk), .R(n169), .S(1'b1), .Q(E2[8]) );
  DFFSR \E2_reg[9]  ( .D(n554), .CLK(clk), .R(n169), .S(1'b1), .Q(E2[9]) );
  DFFSR o_gradient_data_ready_reg ( .D(n565), .CLK(clk), .R(n169), .S(1'b1), 
        .Q(o_gradient_data_ready) );
  DFFSR \Gx_reg[0]  ( .D(n570), .CLK(clk), .R(n169), .S(1'b1), .Q(N258) );
  DFFSR \Gx_reg[1]  ( .D(n571), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[1]) );
  DFFSR \Gx_reg[2]  ( .D(n572), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[2]) );
  DFFSR \Gx_reg[3]  ( .D(n573), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[3]) );
  DFFSR \Gx_reg[4]  ( .D(n574), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[4]) );
  DFFSR \Gx_reg[5]  ( .D(n575), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[5]) );
  DFFSR \Gx_reg[6]  ( .D(n576), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[6]) );
  DFFSR \Gx_reg[7]  ( .D(n577), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[7]) );
  DFFSR \Gx_reg[8]  ( .D(n578), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[8]) );
  DFFSR \Gx_reg[9]  ( .D(n579), .CLK(clk), .R(n168), .S(1'b1), .Q(Gx[9]) );
  DFFSR \C2_reg[1]  ( .D(n543), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[1]) );
  DFFSR \C2_reg[2]  ( .D(n542), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[2]) );
  DFFSR \C2_reg[3]  ( .D(n541), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[3]) );
  DFFSR \C2_reg[4]  ( .D(n540), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[4]) );
  DFFSR \C2_reg[5]  ( .D(n539), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[5]) );
  DFFSR \C2_reg[6]  ( .D(n538), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[6]) );
  DFFSR \C2_reg[7]  ( .D(n537), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[7]) );
  DFFSR \C2_reg[8]  ( .D(n536), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[8]) );
  DFFSR \C2_reg[9]  ( .D(n535), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[9]) );
  DFFSR \Gy_reg[1]  ( .D(n589), .CLK(clk), .R(n168), .S(1'b1), .Q(Gy[1]) );
  DFFSR \Gy_reg[2]  ( .D(n588), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[2]) );
  DFFSR \Gy_reg[3]  ( .D(n587), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[3]) );
  DFFSR \Gy_reg[4]  ( .D(n586), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[4]) );
  DFFSR \Gy_reg[5]  ( .D(n585), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[5]) );
  DFFSR \Gy_reg[6]  ( .D(n584), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[6]) );
  DFFSR \Gy_reg[7]  ( .D(n583), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[7]) );
  DFFSR \Gy_reg[8]  ( .D(n582), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[8]) );
  DFFSR \Gy_reg[9]  ( .D(n581), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[9]) );
  DFFSR \temp_sum_reg[0]  ( .D(n590), .CLK(clk), .R(n141), .S(1'b1), .Q(
        temp_sum[0]) );
  DFFSR \o_processed_sum_reg[0]  ( .D(temp_sum[0]), .CLK(clk), .R(n141), .S(
        1'b1), .Q(o_processed_sum[0]) );
  DFFSR \temp_sum_reg[1]  ( .D(n591), .CLK(clk), .R(n141), .S(1'b1), .Q(
        temp_sum[1]) );
  DFFSR \o_processed_sum_reg[1]  ( .D(temp_sum[1]), .CLK(clk), .R(n141), .S(
        1'b1), .Q(o_processed_sum[1]) );
  DFFSR \temp_sum_reg[2]  ( .D(n592), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[2]) );
  DFFSR \o_processed_sum_reg[2]  ( .D(temp_sum[2]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[2]) );
  DFFSR \temp_sum_reg[3]  ( .D(n593), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[3]) );
  DFFSR \o_processed_sum_reg[3]  ( .D(temp_sum[3]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[3]) );
  DFFSR \temp_sum_reg[4]  ( .D(n594), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[4]) );
  DFFSR \o_processed_sum_reg[4]  ( .D(temp_sum[4]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[4]) );
  DFFSR \temp_sum_reg[5]  ( .D(n595), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[5]) );
  DFFSR \o_processed_sum_reg[5]  ( .D(temp_sum[5]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[5]) );
  DFFSR \temp_sum_reg[6]  ( .D(n596), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[6]) );
  DFFSR \o_processed_sum_reg[6]  ( .D(temp_sum[6]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[6]) );
  DFFSR \temp_sum_reg[7]  ( .D(n597), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[7]) );
  DFFSR \o_processed_sum_reg[7]  ( .D(temp_sum[7]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[7]) );
  AND2X2 U157 ( .A(n630), .B(n623), .Y(n614) );
  AND2X2 U160 ( .A(n633), .B(n632), .Y(n600) );
  OR2X1 U458 ( .A(n625), .B(n624), .Y(n626) );
  NAND3X1 U459 ( .A(n623), .B(n622), .C(n408), .Y(n627) );
  OR2X1 U462 ( .A(n619), .B(n618), .Y(n620) );
  NAND3X1 U464 ( .A(n615), .B(n622), .C(n614), .Y(n621) );
  OAI21X1 U465 ( .A(n622), .B(n409), .C(n613), .Y(n569) );
  NAND2X1 U467 ( .A(n564), .B(n617), .Y(n611) );
  NAND3X1 U469 ( .A(n628), .B(n632), .C(n629), .Y(n612) );
  OR2X1 U472 ( .A(n619), .B(n625), .Y(n608) );
  NAND3X1 U475 ( .A(n629), .B(n622), .C(n606), .Y(n609) );
  NAND2X1 U476 ( .A(i_gradient_start), .B(n566), .Y(n606) );
  NAND2X1 U477 ( .A(n604), .B(n603), .Y(n622) );
  NOR2X1 U478 ( .A(n602), .B(n601), .Y(n603) );
  NAND3X1 U479 ( .A(n630), .B(n629), .C(n610), .Y(n601) );
  NAND3X1 U482 ( .A(n631), .B(n628), .C(n600), .Y(n602) );
  NAND3X1 U484 ( .A(state[2]), .B(n17), .C(state[3]), .Y(n633) );
  NOR2X1 U487 ( .A(n599), .B(n598), .Y(n604) );
  NAND3X1 U488 ( .A(n605), .B(n616), .C(n408), .Y(n598) );
  NAND2X1 U490 ( .A(n16), .B(n2), .Y(n605) );
  NAND3X1 U491 ( .A(n617), .B(n607), .C(n623), .Y(n599) );
  NAND2X1 U492 ( .A(n9), .B(n17), .Y(n623) );
  NAND2X1 U493 ( .A(n22), .B(n9), .Y(n607) );
  edge_detection_1_DW01_add_0 add_231 ( .A({Gx[10:1], N258}), .B({Gy[10:1], 
        N269}), .CI(1'b0), .SUM({N290, N289, N288, N287, N286, N285, N284, 
        N283, N282, N281, N280}) );
  edge_detection_1_DW01_add_1 add_219 ( .A({C2[9], C2[9:1], 1'b0}), .B({E2[9], 
        E2}), .CI(1'b0), .SUM({N257, N256, N255, N254, N253, N252, N251, N250, 
        N249, N248, N247}) );
  edge_detection_1_DW01_add_2 add_218 ( .A({C1[9], C1[9:1], 1'b0}), .B({E1[9], 
        E1}), .CI(1'b0), .SUM({N246, N245, N244, N243, N242, N241, N240, N239, 
        N238, N237, N236}) );
  edge_detection_1_DW01_add_3 add_214 ( .A({A2[8], A2}), .B({D2[8], D2}), .CI(
        1'b0), .SUM({N235, N234, N233, N232, N231, N230, N229, N228, N227, 
        N226}) );
  edge_detection_1_DW01_add_4 add_213 ( .A({A1[8], A1}), .B({D1[8], D1}), .CI(
        1'b0), .SUM({N225, N224, N223, N222, N221, N220, N219, N218, N217, 
        N216}) );
  edge_detection_1_DW01_sub_2 sub_204 ( .A({1'b0, P2}), .B({1'b0, P8}), .CI(
        1'b0), .DIFF({N195, N194, N193, N192, N191, N190, N189, N188, N187})
         );
  edge_detection_1_DW01_sub_3 sub_203 ( .A({1'b0, P8}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N186, N185, N184, N183, N182, N181, N180, N179, N178})
         );
  edge_detection_1_DW01_sub_4 sub_202 ( .A({1'b0, P1}), .B({1'b0, P7}), .CI(
        1'b0), .DIFF({N177, N176, N175, N174, N173, N172, N171, N170, N169})
         );
  edge_detection_1_DW01_sub_5 sub_201 ( .A({1'b0, P5}), .B({1'b0, P3}), .CI(
        1'b0), .DIFF({N168, N167, N166, N165, N164, N163, N162, N161, N160})
         );
  edge_detection_1_DW01_sub_6 sub_200 ( .A({1'b0, P0}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N159, N158, N157, N156, N155, N154, N153, N152, N151})
         );
  edge_detection_1_DW01_sub_7 sub_199 ( .A({1'b0, P2}), .B({1'b0, P0}), .CI(
        1'b0), .DIFF({N150, N149, N148, N147, N146, N145, N144, N143, N142})
         );
  NAND2X1 U5 ( .A(n2), .B(n9), .Y(n1) );
  AND2X2 U6 ( .A(n409), .B(n178), .Y(n2) );
  AND2X2 U12 ( .A(state[3]), .B(n179), .Y(n8) );
  AND2X2 U13 ( .A(state[2]), .B(n235), .Y(n9) );
  AND2X2 U52 ( .A(n235), .B(n179), .Y(n16) );
  AND2X2 U128 ( .A(state[1]), .B(n178), .Y(n17) );
  AND2X2 U155 ( .A(state[0]), .B(state[1]), .Y(n18) );
  OR2X2 U156 ( .A(n609), .B(n608), .Y(n19) );
  OR2X2 U158 ( .A(n621), .B(n620), .Y(n20) );
  OR2X2 U159 ( .A(n627), .B(n626), .Y(n21) );
  AND2X2 U161 ( .A(state[0]), .B(n409), .Y(n22) );
  OR2X2 U162 ( .A(n260), .B(Gx[6]), .Y(n264) );
  OR2X2 U163 ( .A(n268), .B(Gx[8]), .Y(n272) );
  OR2X2 U164 ( .A(N258), .B(Gx[1]), .Y(n244) );
  BUFX2 U165 ( .A(n323), .Y(n29) );
  BUFX2 U166 ( .A(n323), .Y(n28) );
  BUFX2 U167 ( .A(n323), .Y(n26) );
  BUFX2 U168 ( .A(n323), .Y(n27) );
  INVX2 U169 ( .A(n630), .Y(n25) );
  INVX2 U170 ( .A(n1), .Y(n384) );
  INVX2 U171 ( .A(n629), .Y(n24) );
  BUFX2 U172 ( .A(n323), .Y(n30) );
  INVX2 U173 ( .A(n631), .Y(n404) );
  AND2X2 U174 ( .A(n631), .B(n1), .Y(n23) );
  INVX2 U175 ( .A(n615), .Y(n385) );
  BUFX2 U176 ( .A(n_rst), .Y(n65) );
  BUFX2 U177 ( .A(n_rst), .Y(n141) );
  BUFX2 U178 ( .A(n_rst), .Y(n169) );
  BUFX2 U179 ( .A(n_rst), .Y(n170) );
  BUFX2 U180 ( .A(n_rst), .Y(n171) );
  BUFX2 U181 ( .A(n_rst), .Y(n172) );
  BUFX2 U182 ( .A(n_rst), .Y(n173) );
  BUFX2 U183 ( .A(n_rst), .Y(n174) );
  BUFX2 U184 ( .A(n_rst), .Y(n176) );
  BUFX2 U185 ( .A(n_rst), .Y(n168) );
  BUFX2 U186 ( .A(n_rst), .Y(n175) );
  BUFX2 U187 ( .A(n_rst), .Y(n177) );
  OR2X1 U188 ( .A(n244), .B(Gx[2]), .Y(n248) );
  OR2X1 U189 ( .A(n264), .B(Gx[7]), .Y(n268) );
  OR2X1 U190 ( .A(n256), .B(Gx[5]), .Y(n260) );
  OR2X1 U191 ( .A(n252), .B(Gx[4]), .Y(n256) );
  OR2X1 U192 ( .A(n248), .B(Gx[3]), .Y(n252) );
  INVX2 U195 ( .A(state[1]), .Y(n409) );
  INVX2 U196 ( .A(state[0]), .Y(n178) );
  NAND3X1 U197 ( .A(state[2]), .B(state[3]), .C(n2), .Y(n632) );
  INVX2 U198 ( .A(state[2]), .Y(n179) );
  NAND2X1 U199 ( .A(n17), .B(n8), .Y(n631) );
  INVX2 U200 ( .A(state[3]), .Y(n235) );
  NAND2X1 U201 ( .A(n16), .B(n22), .Y(n628) );
  INVX2 U202 ( .A(n628), .Y(n323) );
  MUX2X1 U203 ( .B(N205), .A(N168), .S(n26), .Y(n180) );
  INVX2 U204 ( .A(n180), .Y(n428) );
  NAND2X1 U205 ( .A(n16), .B(n17), .Y(n629) );
  INVX2 U206 ( .A(C1[9]), .Y(n182) );
  INVX2 U207 ( .A(N205), .Y(n181) );
  MUX2X1 U208 ( .B(n182), .A(n181), .S(n24), .Y(n526) );
  MUX2X1 U209 ( .B(N204), .A(N167), .S(n26), .Y(n183) );
  INVX2 U210 ( .A(n183), .Y(n429) );
  INVX2 U211 ( .A(C1[8]), .Y(n185) );
  INVX2 U212 ( .A(N204), .Y(n184) );
  MUX2X1 U213 ( .B(n185), .A(n184), .S(n24), .Y(n527) );
  MUX2X1 U214 ( .B(N203), .A(N166), .S(n26), .Y(n186) );
  INVX2 U215 ( .A(n186), .Y(n430) );
  INVX2 U216 ( .A(C1[7]), .Y(n188) );
  INVX2 U217 ( .A(N203), .Y(n187) );
  MUX2X1 U218 ( .B(n188), .A(n187), .S(n24), .Y(n528) );
  MUX2X1 U219 ( .B(N202), .A(N165), .S(n26), .Y(n189) );
  INVX2 U220 ( .A(n189), .Y(n431) );
  INVX2 U221 ( .A(C1[6]), .Y(n191) );
  INVX2 U222 ( .A(N202), .Y(n190) );
  MUX2X1 U223 ( .B(n191), .A(n190), .S(n24), .Y(n529) );
  MUX2X1 U224 ( .B(N201), .A(N164), .S(n26), .Y(n192) );
  INVX2 U225 ( .A(n192), .Y(n432) );
  INVX2 U226 ( .A(C1[5]), .Y(n194) );
  INVX2 U227 ( .A(N201), .Y(n193) );
  MUX2X1 U228 ( .B(n194), .A(n193), .S(n24), .Y(n530) );
  MUX2X1 U229 ( .B(N200), .A(N163), .S(n26), .Y(n195) );
  INVX2 U230 ( .A(n195), .Y(n433) );
  INVX2 U231 ( .A(C1[4]), .Y(n197) );
  INVX2 U232 ( .A(N200), .Y(n196) );
  MUX2X1 U233 ( .B(n197), .A(n196), .S(n24), .Y(n531) );
  MUX2X1 U234 ( .B(N199), .A(N162), .S(n26), .Y(n198) );
  INVX2 U235 ( .A(n198), .Y(n434) );
  INVX2 U236 ( .A(C1[3]), .Y(n200) );
  INVX2 U237 ( .A(N199), .Y(n199) );
  MUX2X1 U238 ( .B(n200), .A(n199), .S(n24), .Y(n532) );
  MUX2X1 U239 ( .B(N198), .A(N161), .S(n26), .Y(n201) );
  INVX2 U240 ( .A(n201), .Y(n435) );
  INVX2 U241 ( .A(C1[2]), .Y(n203) );
  INVX2 U242 ( .A(N198), .Y(n202) );
  MUX2X1 U243 ( .B(n203), .A(n202), .S(n24), .Y(n533) );
  MUX2X1 U244 ( .B(N197), .A(N160), .S(n26), .Y(n204) );
  INVX2 U245 ( .A(n204), .Y(n436) );
  INVX2 U246 ( .A(C1[1]), .Y(n206) );
  INVX2 U247 ( .A(N197), .Y(n205) );
  MUX2X1 U248 ( .B(n206), .A(n205), .S(n24), .Y(n534) );
  MUX2X1 U249 ( .B(A1[8]), .A(N150), .S(n26), .Y(n207) );
  INVX2 U250 ( .A(n207), .Y(n410) );
  MUX2X1 U251 ( .B(A1[7]), .A(N149), .S(n26), .Y(n208) );
  INVX2 U252 ( .A(n208), .Y(n411) );
  MUX2X1 U253 ( .B(A1[6]), .A(N148), .S(n26), .Y(n209) );
  INVX2 U254 ( .A(n209), .Y(n412) );
  MUX2X1 U255 ( .B(A1[5]), .A(N147), .S(n26), .Y(n210) );
  INVX2 U256 ( .A(n210), .Y(n413) );
  MUX2X1 U257 ( .B(A1[4]), .A(N146), .S(n27), .Y(n211) );
  INVX2 U258 ( .A(n211), .Y(n414) );
  MUX2X1 U259 ( .B(A1[3]), .A(N145), .S(n27), .Y(n212) );
  INVX2 U260 ( .A(n212), .Y(n415) );
  MUX2X1 U261 ( .B(A1[2]), .A(N144), .S(n27), .Y(n213) );
  INVX2 U262 ( .A(n213), .Y(n416) );
  MUX2X1 U263 ( .B(A1[1]), .A(N143), .S(n27), .Y(n214) );
  INVX2 U264 ( .A(n214), .Y(n417) );
  MUX2X1 U265 ( .B(A1[0]), .A(N142), .S(n27), .Y(n215) );
  INVX2 U266 ( .A(n215), .Y(n418) );
  MUX2X1 U267 ( .B(D1[8]), .A(N186), .S(n27), .Y(n216) );
  INVX2 U268 ( .A(n216), .Y(n461) );
  MUX2X1 U269 ( .B(D1[7]), .A(N185), .S(n27), .Y(n217) );
  INVX2 U270 ( .A(n217), .Y(n466) );
  MUX2X1 U271 ( .B(D1[6]), .A(N184), .S(n27), .Y(n218) );
  INVX2 U272 ( .A(n218), .Y(n469) );
  MUX2X1 U273 ( .B(D1[5]), .A(N183), .S(n27), .Y(n219) );
  INVX2 U274 ( .A(n219), .Y(n477) );
  MUX2X1 U275 ( .B(D1[4]), .A(N182), .S(n27), .Y(n220) );
  INVX2 U276 ( .A(n220), .Y(n478) );
  MUX2X1 U277 ( .B(D1[3]), .A(N181), .S(n27), .Y(n221) );
  INVX2 U278 ( .A(n221), .Y(n479) );
  MUX2X1 U279 ( .B(D1[2]), .A(N180), .S(n27), .Y(n222) );
  INVX2 U280 ( .A(n222), .Y(n480) );
  MUX2X1 U281 ( .B(D1[1]), .A(N179), .S(n27), .Y(n223) );
  INVX2 U282 ( .A(n223), .Y(n482) );
  MUX2X1 U283 ( .B(D1[0]), .A(N178), .S(n28), .Y(n224) );
  INVX2 U284 ( .A(n224), .Y(n483) );
  NAND2X1 U285 ( .A(n16), .B(n18), .Y(n630) );
  MUX2X1 U286 ( .B(E1[9]), .A(N225), .S(n25), .Y(n225) );
  INVX2 U287 ( .A(n225), .Y(n544) );
  MUX2X1 U288 ( .B(E1[8]), .A(N224), .S(n25), .Y(n226) );
  INVX2 U289 ( .A(n226), .Y(n545) );
  MUX2X1 U290 ( .B(E1[7]), .A(N223), .S(n25), .Y(n227) );
  INVX2 U291 ( .A(n227), .Y(n546) );
  MUX2X1 U292 ( .B(E1[6]), .A(N222), .S(n25), .Y(n228) );
  INVX2 U293 ( .A(n228), .Y(n547) );
  MUX2X1 U294 ( .B(E1[5]), .A(N221), .S(n25), .Y(n229) );
  INVX2 U295 ( .A(n229), .Y(n548) );
  MUX2X1 U296 ( .B(E1[4]), .A(N220), .S(n25), .Y(n230) );
  INVX2 U297 ( .A(n230), .Y(n549) );
  MUX2X1 U298 ( .B(E1[3]), .A(N219), .S(n25), .Y(n231) );
  INVX2 U299 ( .A(n231), .Y(n550) );
  MUX2X1 U300 ( .B(E1[2]), .A(N218), .S(n25), .Y(n232) );
  INVX2 U301 ( .A(n232), .Y(n551) );
  MUX2X1 U302 ( .B(E1[1]), .A(N217), .S(n25), .Y(n233) );
  INVX2 U303 ( .A(n233), .Y(n552) );
  MUX2X1 U304 ( .B(E1[0]), .A(N216), .S(n25), .Y(n234) );
  INVX2 U305 ( .A(n234), .Y(n553) );
  INVX2 U306 ( .A(N236), .Y(n237) );
  OAI21X1 U307 ( .A(n404), .B(n23), .C(N258), .Y(n236) );
  OAI21X1 U308 ( .A(n1), .B(n237), .C(n236), .Y(n570) );
  INVX2 U309 ( .A(N237), .Y(n240) );
  XOR2X1 U310 ( .A(Gx[1]), .B(N258), .Y(n238) );
  AOI22X1 U311 ( .A(n238), .B(n404), .C(Gx[1]), .D(n23), .Y(n239) );
  OAI21X1 U312 ( .A(n1), .B(n240), .C(n239), .Y(n571) );
  INVX2 U313 ( .A(N238), .Y(n243) );
  XOR2X1 U314 ( .A(n244), .B(Gx[2]), .Y(n241) );
  AOI22X1 U315 ( .A(n241), .B(n404), .C(Gx[2]), .D(n23), .Y(n242) );
  OAI21X1 U316 ( .A(n1), .B(n243), .C(n242), .Y(n572) );
  INVX2 U317 ( .A(N239), .Y(n247) );
  XOR2X1 U318 ( .A(n248), .B(Gx[3]), .Y(n245) );
  AOI22X1 U319 ( .A(n245), .B(n404), .C(Gx[3]), .D(n23), .Y(n246) );
  OAI21X1 U320 ( .A(n1), .B(n247), .C(n246), .Y(n573) );
  INVX2 U321 ( .A(N240), .Y(n251) );
  XOR2X1 U322 ( .A(n252), .B(Gx[4]), .Y(n249) );
  AOI22X1 U323 ( .A(n249), .B(n404), .C(Gx[4]), .D(n23), .Y(n250) );
  OAI21X1 U324 ( .A(n1), .B(n251), .C(n250), .Y(n574) );
  INVX2 U325 ( .A(N241), .Y(n255) );
  XOR2X1 U326 ( .A(n256), .B(Gx[5]), .Y(n253) );
  AOI22X1 U327 ( .A(n253), .B(n404), .C(Gx[5]), .D(n23), .Y(n254) );
  OAI21X1 U328 ( .A(n1), .B(n255), .C(n254), .Y(n575) );
  INVX2 U329 ( .A(N242), .Y(n259) );
  XOR2X1 U330 ( .A(n260), .B(Gx[6]), .Y(n257) );
  AOI22X1 U331 ( .A(n257), .B(n404), .C(Gx[6]), .D(n23), .Y(n258) );
  OAI21X1 U332 ( .A(n1), .B(n259), .C(n258), .Y(n576) );
  INVX2 U333 ( .A(N243), .Y(n263) );
  XOR2X1 U334 ( .A(n264), .B(Gx[7]), .Y(n261) );
  AOI22X1 U335 ( .A(n261), .B(n404), .C(Gx[7]), .D(n23), .Y(n262) );
  OAI21X1 U336 ( .A(n1), .B(n263), .C(n262), .Y(n577) );
  INVX2 U337 ( .A(N244), .Y(n267) );
  XOR2X1 U338 ( .A(n268), .B(Gx[8]), .Y(n265) );
  AOI22X1 U339 ( .A(n265), .B(n404), .C(Gx[8]), .D(n23), .Y(n266) );
  OAI21X1 U340 ( .A(n1), .B(n267), .C(n266), .Y(n578) );
  INVX2 U341 ( .A(N245), .Y(n271) );
  XOR2X1 U342 ( .A(n272), .B(Gx[9]), .Y(n269) );
  AOI22X1 U343 ( .A(n269), .B(n404), .C(Gx[9]), .D(n23), .Y(n270) );
  OAI21X1 U344 ( .A(n1), .B(n271), .C(n270), .Y(n579) );
  NOR2X1 U345 ( .A(Gx[9]), .B(n272), .Y(n273) );
  XNOR2X1 U346 ( .A(n273), .B(Gx[10]), .Y(n274) );
  AOI22X1 U347 ( .A(n23), .B(Gx[10]), .C(n274), .D(n404), .Y(n276) );
  NAND2X1 U348 ( .A(N246), .B(n384), .Y(n275) );
  NAND2X1 U349 ( .A(n276), .B(n275), .Y(n580) );
  NAND2X1 U350 ( .A(n8), .B(n18), .Y(n615) );
  MUX2X1 U351 ( .B(N215), .A(N177), .S(n28), .Y(n277) );
  INVX2 U352 ( .A(n277), .Y(n437) );
  INVX2 U353 ( .A(C2[9]), .Y(n279) );
  INVX2 U354 ( .A(N215), .Y(n278) );
  MUX2X1 U355 ( .B(n279), .A(n278), .S(n24), .Y(n535) );
  MUX2X1 U356 ( .B(N214), .A(N176), .S(n28), .Y(n280) );
  INVX2 U357 ( .A(n280), .Y(n438) );
  INVX2 U358 ( .A(C2[8]), .Y(n282) );
  INVX2 U359 ( .A(N214), .Y(n281) );
  MUX2X1 U360 ( .B(n282), .A(n281), .S(n24), .Y(n536) );
  MUX2X1 U361 ( .B(N213), .A(N175), .S(n28), .Y(n283) );
  INVX2 U362 ( .A(n283), .Y(n439) );
  INVX2 U363 ( .A(C2[7]), .Y(n285) );
  INVX2 U364 ( .A(N213), .Y(n284) );
  MUX2X1 U365 ( .B(n285), .A(n284), .S(n24), .Y(n537) );
  MUX2X1 U366 ( .B(N212), .A(N174), .S(n28), .Y(n286) );
  INVX2 U367 ( .A(n286), .Y(n440) );
  INVX2 U368 ( .A(C2[6]), .Y(n288) );
  INVX2 U369 ( .A(N212), .Y(n287) );
  MUX2X1 U370 ( .B(n288), .A(n287), .S(n24), .Y(n538) );
  MUX2X1 U371 ( .B(N211), .A(N173), .S(n28), .Y(n289) );
  INVX2 U372 ( .A(n289), .Y(n441) );
  INVX2 U373 ( .A(C2[5]), .Y(n291) );
  INVX2 U374 ( .A(N211), .Y(n290) );
  MUX2X1 U375 ( .B(n291), .A(n290), .S(n24), .Y(n539) );
  MUX2X1 U376 ( .B(N210), .A(N172), .S(n28), .Y(n292) );
  INVX2 U377 ( .A(n292), .Y(n443) );
  INVX2 U378 ( .A(C2[4]), .Y(n294) );
  INVX2 U379 ( .A(N210), .Y(n293) );
  MUX2X1 U380 ( .B(n294), .A(n293), .S(n24), .Y(n540) );
  MUX2X1 U381 ( .B(N209), .A(N171), .S(n28), .Y(n295) );
  INVX2 U382 ( .A(n295), .Y(n444) );
  INVX2 U383 ( .A(C2[3]), .Y(n297) );
  INVX2 U384 ( .A(N209), .Y(n296) );
  MUX2X1 U385 ( .B(n297), .A(n296), .S(n24), .Y(n541) );
  MUX2X1 U386 ( .B(N208), .A(N170), .S(n28), .Y(n298) );
  INVX2 U387 ( .A(n298), .Y(n451) );
  INVX2 U388 ( .A(C2[2]), .Y(n300) );
  INVX2 U389 ( .A(N208), .Y(n299) );
  MUX2X1 U390 ( .B(n300), .A(n299), .S(n24), .Y(n542) );
  MUX2X1 U391 ( .B(N207), .A(N169), .S(n28), .Y(n301) );
  INVX2 U392 ( .A(n301), .Y(n452) );
  INVX2 U393 ( .A(C2[1]), .Y(n304) );
  INVX2 U394 ( .A(N207), .Y(n302) );
  MUX2X1 U395 ( .B(n304), .A(n302), .S(n24), .Y(n543) );
  MUX2X1 U396 ( .B(A2[8]), .A(N159), .S(n28), .Y(n305) );
  INVX2 U397 ( .A(n305), .Y(n419) );
  MUX2X1 U398 ( .B(A2[7]), .A(N158), .S(n28), .Y(n306) );
  INVX2 U399 ( .A(n306), .Y(n420) );
  MUX2X1 U400 ( .B(A2[6]), .A(N157), .S(n28), .Y(n307) );
  INVX2 U401 ( .A(n307), .Y(n421) );
  MUX2X1 U402 ( .B(A2[5]), .A(N156), .S(n29), .Y(n308) );
  INVX2 U403 ( .A(n308), .Y(n422) );
  MUX2X1 U404 ( .B(A2[4]), .A(N155), .S(n29), .Y(n309) );
  INVX2 U405 ( .A(n309), .Y(n423) );
  MUX2X1 U406 ( .B(A2[3]), .A(N154), .S(n29), .Y(n310) );
  INVX2 U407 ( .A(n310), .Y(n424) );
  MUX2X1 U408 ( .B(A2[2]), .A(N153), .S(n29), .Y(n311) );
  INVX2 U409 ( .A(n311), .Y(n425) );
  MUX2X1 U410 ( .B(A2[1]), .A(N152), .S(n29), .Y(n312) );
  INVX2 U411 ( .A(n312), .Y(n426) );
  MUX2X1 U412 ( .B(A2[0]), .A(N151), .S(n29), .Y(n313) );
  INVX2 U413 ( .A(n313), .Y(n427) );
  MUX2X1 U414 ( .B(D2[8]), .A(N195), .S(n29), .Y(n314) );
  INVX2 U415 ( .A(n314), .Y(n486) );
  MUX2X1 U416 ( .B(D2[7]), .A(N194), .S(n29), .Y(n316) );
  INVX2 U417 ( .A(n316), .Y(n487) );
  MUX2X1 U418 ( .B(D2[6]), .A(N193), .S(n29), .Y(n317) );
  INVX2 U419 ( .A(n317), .Y(n488) );
  MUX2X1 U420 ( .B(D2[5]), .A(N192), .S(n29), .Y(n318) );
  INVX2 U421 ( .A(n318), .Y(n517) );
  MUX2X1 U422 ( .B(D2[4]), .A(N191), .S(n29), .Y(n319) );
  INVX2 U423 ( .A(n319), .Y(n518) );
  MUX2X1 U424 ( .B(D2[3]), .A(N190), .S(n29), .Y(n320) );
  INVX2 U425 ( .A(n320), .Y(n520) );
  MUX2X1 U426 ( .B(D2[2]), .A(N189), .S(n29), .Y(n321) );
  INVX2 U427 ( .A(n321), .Y(n523) );
  MUX2X1 U428 ( .B(D2[1]), .A(N188), .S(n30), .Y(n322) );
  INVX2 U429 ( .A(n322), .Y(n524) );
  MUX2X1 U430 ( .B(D2[0]), .A(N187), .S(n30), .Y(n324) );
  INVX2 U431 ( .A(n324), .Y(n525) );
  MUX2X1 U432 ( .B(E2[9]), .A(N235), .S(n25), .Y(n325) );
  INVX2 U433 ( .A(n325), .Y(n554) );
  MUX2X1 U434 ( .B(E2[8]), .A(N234), .S(n25), .Y(n326) );
  INVX2 U435 ( .A(n326), .Y(n555) );
  MUX2X1 U436 ( .B(E2[7]), .A(N233), .S(n25), .Y(n327) );
  INVX2 U437 ( .A(n327), .Y(n556) );
  MUX2X1 U438 ( .B(E2[6]), .A(N232), .S(n25), .Y(n328) );
  INVX2 U439 ( .A(n328), .Y(n557) );
  MUX2X1 U440 ( .B(E2[5]), .A(N231), .S(n25), .Y(n329) );
  INVX2 U441 ( .A(n329), .Y(n558) );
  MUX2X1 U442 ( .B(E2[4]), .A(N230), .S(n25), .Y(n330) );
  INVX2 U443 ( .A(n330), .Y(n559) );
  MUX2X1 U444 ( .B(E2[3]), .A(N229), .S(n25), .Y(n331) );
  INVX2 U445 ( .A(n331), .Y(n560) );
  MUX2X1 U446 ( .B(E2[2]), .A(N228), .S(n25), .Y(n332) );
  INVX2 U447 ( .A(n332), .Y(n561) );
  MUX2X1 U448 ( .B(E2[1]), .A(N227), .S(n25), .Y(n333) );
  INVX2 U449 ( .A(n333), .Y(n562) );
  MUX2X1 U450 ( .B(E2[0]), .A(N226), .S(n25), .Y(n334) );
  INVX2 U451 ( .A(n334), .Y(n563) );
  INVX2 U452 ( .A(N247), .Y(n336) );
  NAND2X1 U453 ( .A(n1), .B(n615), .Y(n389) );
  INVX2 U454 ( .A(n389), .Y(n408) );
  OAI21X1 U455 ( .A(n385), .B(n408), .C(N269), .Y(n335) );
  OAI21X1 U456 ( .A(n1), .B(n336), .C(n335), .Y(n567) );
  INVX2 U457 ( .A(Gy[1]), .Y(n339) );
  XOR2X1 U460 ( .A(Gy[1]), .B(N269), .Y(n337) );
  AOI22X1 U461 ( .A(n337), .B(n385), .C(N248), .D(n384), .Y(n338) );
  OAI21X1 U463 ( .A(n389), .B(n339), .C(n338), .Y(n589) );
  INVX2 U466 ( .A(Gy[2]), .Y(n345) );
  INVX2 U468 ( .A(N269), .Y(n340) );
  NAND2X1 U470 ( .A(n340), .B(n339), .Y(n344) );
  XOR2X1 U471 ( .A(n344), .B(Gy[2]), .Y(n342) );
  AOI22X1 U473 ( .A(n342), .B(n385), .C(N249), .D(n384), .Y(n343) );
  OAI21X1 U474 ( .A(n389), .B(n345), .C(n343), .Y(n588) );
  INVX2 U480 ( .A(Gy[3]), .Y(n350) );
  INVX2 U481 ( .A(n344), .Y(n346) );
  NAND2X1 U483 ( .A(n346), .B(n345), .Y(n349) );
  XOR2X1 U485 ( .A(n349), .B(Gy[3]), .Y(n347) );
  AOI22X1 U486 ( .A(n347), .B(n385), .C(N250), .D(n384), .Y(n348) );
  OAI21X1 U489 ( .A(n389), .B(n350), .C(n348), .Y(n587) );
  INVX2 U494 ( .A(Gy[4]), .Y(n355) );
  INVX2 U495 ( .A(n349), .Y(n351) );
  NAND2X1 U496 ( .A(n351), .B(n350), .Y(n354) );
  XOR2X1 U497 ( .A(n354), .B(Gy[4]), .Y(n352) );
  AOI22X1 U498 ( .A(n352), .B(n385), .C(N251), .D(n384), .Y(n353) );
  OAI21X1 U499 ( .A(n389), .B(n355), .C(n353), .Y(n586) );
  INVX2 U500 ( .A(Gy[5]), .Y(n360) );
  INVX2 U501 ( .A(n354), .Y(n356) );
  NAND2X1 U502 ( .A(n356), .B(n355), .Y(n359) );
  XOR2X1 U503 ( .A(n359), .B(Gy[5]), .Y(n357) );
  AOI22X1 U504 ( .A(n357), .B(n385), .C(N252), .D(n384), .Y(n358) );
  OAI21X1 U505 ( .A(n389), .B(n360), .C(n358), .Y(n585) );
  INVX2 U506 ( .A(Gy[6]), .Y(n366) );
  INVX2 U507 ( .A(n359), .Y(n361) );
  NAND2X1 U508 ( .A(n361), .B(n360), .Y(n365) );
  XOR2X1 U509 ( .A(n365), .B(Gy[6]), .Y(n362) );
  AOI22X1 U510 ( .A(n362), .B(n385), .C(N253), .D(n384), .Y(n363) );
  OAI21X1 U511 ( .A(n389), .B(n366), .C(n363), .Y(n584) );
  INVX2 U512 ( .A(Gy[7]), .Y(n371) );
  INVX2 U513 ( .A(n365), .Y(n367) );
  NAND2X1 U514 ( .A(n367), .B(n366), .Y(n370) );
  XOR2X1 U515 ( .A(n370), .B(Gy[7]), .Y(n368) );
  AOI22X1 U516 ( .A(n368), .B(n385), .C(N254), .D(n384), .Y(n369) );
  OAI21X1 U517 ( .A(n389), .B(n371), .C(n369), .Y(n583) );
  INVX2 U518 ( .A(Gy[8]), .Y(n376) );
  INVX2 U519 ( .A(n370), .Y(n372) );
  NAND2X1 U520 ( .A(n372), .B(n371), .Y(n375) );
  XOR2X1 U521 ( .A(n375), .B(Gy[8]), .Y(n373) );
  AOI22X1 U522 ( .A(n373), .B(n385), .C(N255), .D(n384), .Y(n374) );
  OAI21X1 U523 ( .A(n389), .B(n376), .C(n374), .Y(n582) );
  INVX2 U524 ( .A(Gy[9]), .Y(n381) );
  INVX2 U525 ( .A(n375), .Y(n377) );
  NAND2X1 U526 ( .A(n377), .B(n376), .Y(n380) );
  XOR2X1 U527 ( .A(n380), .B(Gy[9]), .Y(n378) );
  AOI22X1 U528 ( .A(n378), .B(n385), .C(N256), .D(n384), .Y(n379) );
  OAI21X1 U529 ( .A(n389), .B(n381), .C(n379), .Y(n581) );
  INVX2 U530 ( .A(Gy[10]), .Y(n406) );
  INVX2 U531 ( .A(n380), .Y(n382) );
  NAND2X1 U532 ( .A(n382), .B(n381), .Y(n383) );
  XOR2X1 U533 ( .A(n383), .B(Gy[10]), .Y(n387) );
  AOI22X1 U534 ( .A(n387), .B(n385), .C(N257), .D(n384), .Y(n388) );
  OAI21X1 U535 ( .A(n406), .B(n389), .C(n388), .Y(n568) );
  NOR2X1 U536 ( .A(N290), .B(N289), .Y(n391) );
  INVX2 U537 ( .A(N288), .Y(n390) );
  AOI21X1 U538 ( .A(n391), .B(n390), .C(n632), .Y(n392) );
  INVX2 U539 ( .A(n392), .Y(n402) );
  INVX2 U540 ( .A(n632), .Y(n400) );
  MUX2X1 U541 ( .B(temp_sum[0]), .A(N280), .S(n400), .Y(n393) );
  NAND2X1 U542 ( .A(n402), .B(n393), .Y(n590) );
  MUX2X1 U543 ( .B(temp_sum[1]), .A(N281), .S(n400), .Y(n394) );
  NAND2X1 U544 ( .A(n402), .B(n394), .Y(n591) );
  MUX2X1 U545 ( .B(temp_sum[2]), .A(N282), .S(n400), .Y(n395) );
  NAND2X1 U546 ( .A(n402), .B(n395), .Y(n592) );
  MUX2X1 U547 ( .B(temp_sum[3]), .A(N283), .S(n400), .Y(n396) );
  NAND2X1 U548 ( .A(n402), .B(n396), .Y(n593) );
  MUX2X1 U549 ( .B(temp_sum[4]), .A(N284), .S(n400), .Y(n397) );
  NAND2X1 U550 ( .A(n402), .B(n397), .Y(n594) );
  MUX2X1 U551 ( .B(temp_sum[5]), .A(N285), .S(n400), .Y(n398) );
  NAND2X1 U552 ( .A(n402), .B(n398), .Y(n595) );
  MUX2X1 U553 ( .B(temp_sum[6]), .A(N286), .S(n400), .Y(n399) );
  NAND2X1 U554 ( .A(n402), .B(n399), .Y(n596) );
  MUX2X1 U555 ( .B(temp_sum[7]), .A(N287), .S(n400), .Y(n401) );
  NAND2X1 U556 ( .A(n402), .B(n401), .Y(n597) );
  NAND2X1 U557 ( .A(n22), .B(n8), .Y(n617) );
  NAND2X1 U558 ( .A(n9), .B(n18), .Y(n616) );
  NAND2X1 U559 ( .A(n2), .B(n8), .Y(n610) );
  OAI21X1 U560 ( .A(Gx[10]), .B(n610), .C(n632), .Y(n619) );
  INVX2 U561 ( .A(n607), .Y(n403) );
  NOR2X1 U562 ( .A(n404), .B(n403), .Y(n405) );
  OAI21X1 U563 ( .A(n617), .B(n406), .C(n405), .Y(n625) );
  INVX2 U564 ( .A(Gx[10]), .Y(n407) );
  OAI21X1 U565 ( .A(n610), .B(n407), .C(n616), .Y(n624) );
  INVX2 U566 ( .A(n624), .Y(n564) );
  OAI21X1 U567 ( .A(Gy[10]), .B(n617), .C(n616), .Y(n618) );
  INVX2 U568 ( .A(n633), .Y(n565) );
  INVX2 U569 ( .A(n605), .Y(n566) );
  NOR2X1 U570 ( .A(n612), .B(n611), .Y(n613) );
endmodule


module edge_detection_0_DW01_add_0 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [10:1] carry;

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_0_DW01_add_1 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1;
  wire   [10:1] carry;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  XOR2X1 U1 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  NAND2X1 U2 ( .A(B[1]), .B(A[1]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(carry[2]) );
endmodule


module edge_detection_0_DW01_add_2 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1;
  wire   [10:1] carry;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YS(SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  XOR2X1 U1 ( .A(B[1]), .B(A[1]), .Y(SUM[1]) );
  NAND2X1 U2 ( .A(B[1]), .B(A[1]), .Y(n1) );
  INVX2 U3 ( .A(n1), .Y(carry[2]) );
endmodule


module edge_detection_0_DW01_add_3 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;

  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_0_DW01_add_4 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [9:1] carry;

  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module edge_detection_0_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n3), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n9), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X2 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[6]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[5]), .Y(n9) );
endmodule


module edge_detection_0_DW01_sub_3 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_0_DW01_sub_4 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X2 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_0_DW01_sub_5 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  INVX1 U1 ( .A(B[5]), .Y(n3) );
  INVX1 U2 ( .A(B[3]), .Y(n5) );
  INVX1 U3 ( .A(B[7]), .Y(n2) );
  INVX1 U4 ( .A(B[6]), .Y(n9) );
  INVX1 U5 ( .A(B[4]), .Y(n4) );
  INVX1 U6 ( .A(B[2]), .Y(n6) );
  INVX1 U7 ( .A(B[1]), .Y(n7) );
  OR2X1 U8 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U9 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U10 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U11 ( .A(B[0]), .Y(n8) );
endmodule


module edge_detection_0_DW01_sub_6 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X1 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_0_DW01_sub_7 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  FAX1 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .YC(carry[8]), .YS(DIFF[7]) );
  FAX1 U2_6 ( .A(A[6]), .B(n9), .C(carry[6]), .YC(carry[7]), .YS(DIFF[6]) );
  FAX1 U2_5 ( .A(A[5]), .B(n3), .C(carry[5]), .YC(carry[6]), .YS(DIFF[5]) );
  FAX1 U2_4 ( .A(A[4]), .B(n4), .C(carry[4]), .YC(carry[5]), .YS(DIFF[4]) );
  FAX1 U2_3 ( .A(A[3]), .B(n5), .C(carry[3]), .YC(carry[4]), .YS(DIFF[3]) );
  FAX1 U2_2 ( .A(A[2]), .B(n6), .C(carry[2]), .YC(carry[3]), .YS(DIFF[2]) );
  FAX1 U2_1 ( .A(A[1]), .B(n7), .C(carry[1]), .YC(carry[2]), .YS(DIFF[1]) );
  OR2X2 U1 ( .A(A[0]), .B(n8), .Y(carry[1]) );
  XNOR2X1 U2 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX2 U3 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2 U4 ( .A(B[7]), .Y(n2) );
  INVX2 U5 ( .A(B[5]), .Y(n3) );
  INVX2 U6 ( .A(B[4]), .Y(n4) );
  INVX2 U7 ( .A(B[3]), .Y(n5) );
  INVX2 U8 ( .A(B[2]), .Y(n6) );
  INVX2 U9 ( .A(B[1]), .Y(n7) );
  INVX2 U10 ( .A(B[0]), .Y(n8) );
  INVX2 U11 ( .A(B[6]), .Y(n9) );
endmodule


module edge_detection_0 ( clk, n_rst, i_gradient_start, P0, P1, P2, P3, P4, P5, 
        P6, P7, P8, o_gradient_data_ready, o_processed_sum );
  input [7:0] P0;
  input [7:0] P1;
  input [7:0] P2;
  input [7:0] P3;
  input [7:0] P4;
  input [7:0] P5;
  input [7:0] P6;
  input [7:0] P7;
  input [7:0] P8;
  output [7:0] o_processed_sum;
  input clk, n_rst, i_gradient_start;
  output o_gradient_data_ready;
  wire   N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152,
         N153, N154, N155, N156, N157, N158, N159, N160, N161, N162, N163,
         N164, N165, N166, N167, N168, N169, N170, N171, N172, N173, N174,
         N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N187, N188, N189, N190, N191, N192, N193, N194, N195, N197,
         N198, N199, N200, N201, N202, N203, N204, N205, N207, N208, N209,
         N210, N211, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N225, N226, N227, N228, N229, N230, N231,
         N232, N233, N234, N235, N236, N237, N238, N239, N240, N241, N242,
         N243, N244, N245, N246, N247, N248, N249, N250, N251, N252, N253,
         N254, N255, N256, N257, N258, N269, N280, N281, N282, N283, N284,
         N285, N286, N287, N288, N289, N290, n1, n2, n8, n9, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n65, n141,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n443, n444, n451, n452, n461, n466,
         n469, n477, n478, n479, n480, n482, n483, n486, n487, n488, n517,
         n518, n520, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633;
  wire   [5:0] state;
  wire   [8:0] A1;
  wire   [9:0] C1;
  wire   [8:0] D1;
  wire   [9:0] E1;
  wire   [8:0] A2;
  wire   [9:0] C2;
  wire   [8:0] D2;
  wire   [9:0] E2;
  wire   [10:0] Gx;
  wire   [10:0] Gy;
  wire   [7:0] temp_sum;

  DFFSR \Gy_reg[0]  ( .D(n567), .CLK(clk), .R(n177), .S(1'b1), .Q(N269) );
  DFFSR \Gy_reg[10]  ( .D(n568), .CLK(clk), .R(n177), .S(1'b1), .Q(Gy[10]) );
  DFFSR \state_reg[0]  ( .D(n19), .CLK(clk), .R(n177), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n569), .CLK(clk), .R(n177), .S(1'b1), .Q(state[1])
         );
  DFFSR \C1_reg[9]  ( .D(n526), .CLK(clk), .R(n177), .S(1'b1), .Q(C1[9]) );
  DFFSR \Gx_reg[10]  ( .D(n580), .CLK(clk), .R(n176), .S(1'b1), .Q(Gx[10]) );
  DFFSR \state_reg[3]  ( .D(n21), .CLK(clk), .R(n176), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(n20), .CLK(clk), .R(n176), .S(1'b1), .Q(state[2])
         );
  DFFSR \A1_reg[0]  ( .D(n418), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[0]) );
  DFFSR \A1_reg[1]  ( .D(n417), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[1]) );
  DFFSR \A1_reg[2]  ( .D(n416), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[2]) );
  DFFSR \A1_reg[3]  ( .D(n415), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[3]) );
  DFFSR \A1_reg[4]  ( .D(n414), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[4]) );
  DFFSR \A1_reg[5]  ( .D(n413), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[5]) );
  DFFSR \A1_reg[6]  ( .D(n412), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[6]) );
  DFFSR \A1_reg[7]  ( .D(n411), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[7]) );
  DFFSR \A1_reg[8]  ( .D(n410), .CLK(clk), .R(n176), .S(1'b1), .Q(A1[8]) );
  DFFSR \B1_reg[0]  ( .D(n436), .CLK(clk), .R(n175), .S(1'b1), .Q(N197) );
  DFFSR \B1_reg[1]  ( .D(n435), .CLK(clk), .R(n175), .S(1'b1), .Q(N198) );
  DFFSR \B1_reg[2]  ( .D(n434), .CLK(clk), .R(n175), .S(1'b1), .Q(N199) );
  DFFSR \B1_reg[3]  ( .D(n433), .CLK(clk), .R(n175), .S(1'b1), .Q(N200) );
  DFFSR \B1_reg[4]  ( .D(n432), .CLK(clk), .R(n175), .S(1'b1), .Q(N201) );
  DFFSR \B1_reg[5]  ( .D(n431), .CLK(clk), .R(n175), .S(1'b1), .Q(N202) );
  DFFSR \B1_reg[6]  ( .D(n430), .CLK(clk), .R(n175), .S(1'b1), .Q(N203) );
  DFFSR \B1_reg[7]  ( .D(n429), .CLK(clk), .R(n175), .S(1'b1), .Q(N204) );
  DFFSR \B1_reg[8]  ( .D(n428), .CLK(clk), .R(n175), .S(1'b1), .Q(N205) );
  DFFSR \C1_reg[1]  ( .D(n534), .CLK(clk), .R(n175), .S(1'b1), .Q(C1[1]) );
  DFFSR \C1_reg[2]  ( .D(n533), .CLK(clk), .R(n175), .S(1'b1), .Q(C1[2]) );
  DFFSR \C1_reg[3]  ( .D(n532), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[3]) );
  DFFSR \C1_reg[4]  ( .D(n531), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[4]) );
  DFFSR \C1_reg[5]  ( .D(n530), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[5]) );
  DFFSR \C1_reg[6]  ( .D(n529), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[6]) );
  DFFSR \C1_reg[7]  ( .D(n528), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[7]) );
  DFFSR \C1_reg[8]  ( .D(n527), .CLK(clk), .R(n174), .S(1'b1), .Q(C1[8]) );
  DFFSR \D1_reg[0]  ( .D(n483), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[0]) );
  DFFSR \D1_reg[1]  ( .D(n482), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[1]) );
  DFFSR \D1_reg[2]  ( .D(n480), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[2]) );
  DFFSR \D1_reg[3]  ( .D(n479), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[3]) );
  DFFSR \D1_reg[4]  ( .D(n478), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[4]) );
  DFFSR \D1_reg[5]  ( .D(n477), .CLK(clk), .R(n174), .S(1'b1), .Q(D1[5]) );
  DFFSR \D1_reg[6]  ( .D(n469), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[6]) );
  DFFSR \D1_reg[7]  ( .D(n466), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[7]) );
  DFFSR \D1_reg[8]  ( .D(n461), .CLK(clk), .R(n173), .S(1'b1), .Q(D1[8]) );
  DFFSR \E1_reg[0]  ( .D(n553), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[0]) );
  DFFSR \E1_reg[1]  ( .D(n552), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[1]) );
  DFFSR \E1_reg[2]  ( .D(n551), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[2]) );
  DFFSR \E1_reg[3]  ( .D(n550), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[3]) );
  DFFSR \E1_reg[4]  ( .D(n549), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[4]) );
  DFFSR \E1_reg[5]  ( .D(n548), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[5]) );
  DFFSR \E1_reg[6]  ( .D(n547), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[6]) );
  DFFSR \E1_reg[7]  ( .D(n546), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[7]) );
  DFFSR \E1_reg[8]  ( .D(n545), .CLK(clk), .R(n173), .S(1'b1), .Q(E1[8]) );
  DFFSR \E1_reg[9]  ( .D(n544), .CLK(clk), .R(n172), .S(1'b1), .Q(E1[9]) );
  DFFSR \A2_reg[0]  ( .D(n427), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[0]) );
  DFFSR \A2_reg[1]  ( .D(n426), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[1]) );
  DFFSR \A2_reg[2]  ( .D(n425), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[2]) );
  DFFSR \A2_reg[3]  ( .D(n424), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[3]) );
  DFFSR \A2_reg[4]  ( .D(n423), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[4]) );
  DFFSR \A2_reg[5]  ( .D(n422), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[5]) );
  DFFSR \A2_reg[6]  ( .D(n421), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[6]) );
  DFFSR \A2_reg[7]  ( .D(n420), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[7]) );
  DFFSR \A2_reg[8]  ( .D(n419), .CLK(clk), .R(n172), .S(1'b1), .Q(A2[8]) );
  DFFSR \B2_reg[0]  ( .D(n452), .CLK(clk), .R(n172), .S(1'b1), .Q(N207) );
  DFFSR \B2_reg[1]  ( .D(n451), .CLK(clk), .R(n172), .S(1'b1), .Q(N208) );
  DFFSR \B2_reg[2]  ( .D(n444), .CLK(clk), .R(n171), .S(1'b1), .Q(N209) );
  DFFSR \B2_reg[3]  ( .D(n443), .CLK(clk), .R(n171), .S(1'b1), .Q(N210) );
  DFFSR \B2_reg[4]  ( .D(n441), .CLK(clk), .R(n171), .S(1'b1), .Q(N211) );
  DFFSR \B2_reg[5]  ( .D(n440), .CLK(clk), .R(n171), .S(1'b1), .Q(N212) );
  DFFSR \B2_reg[6]  ( .D(n439), .CLK(clk), .R(n171), .S(1'b1), .Q(N213) );
  DFFSR \B2_reg[7]  ( .D(n438), .CLK(clk), .R(n171), .S(1'b1), .Q(N214) );
  DFFSR \B2_reg[8]  ( .D(n437), .CLK(clk), .R(n171), .S(1'b1), .Q(N215) );
  DFFSR \D2_reg[0]  ( .D(n525), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[0]) );
  DFFSR \D2_reg[1]  ( .D(n524), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[1]) );
  DFFSR \D2_reg[2]  ( .D(n523), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[2]) );
  DFFSR \D2_reg[3]  ( .D(n520), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[3]) );
  DFFSR \D2_reg[4]  ( .D(n518), .CLK(clk), .R(n171), .S(1'b1), .Q(D2[4]) );
  DFFSR \D2_reg[5]  ( .D(n517), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[5]) );
  DFFSR \D2_reg[6]  ( .D(n488), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[6]) );
  DFFSR \D2_reg[7]  ( .D(n487), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[7]) );
  DFFSR \D2_reg[8]  ( .D(n486), .CLK(clk), .R(n170), .S(1'b1), .Q(D2[8]) );
  DFFSR \E2_reg[0]  ( .D(n563), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[0]) );
  DFFSR \E2_reg[1]  ( .D(n562), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[1]) );
  DFFSR \E2_reg[2]  ( .D(n561), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[2]) );
  DFFSR \E2_reg[3]  ( .D(n560), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[3]) );
  DFFSR \E2_reg[4]  ( .D(n559), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[4]) );
  DFFSR \E2_reg[5]  ( .D(n558), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[5]) );
  DFFSR \E2_reg[6]  ( .D(n557), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[6]) );
  DFFSR \E2_reg[7]  ( .D(n556), .CLK(clk), .R(n170), .S(1'b1), .Q(E2[7]) );
  DFFSR \E2_reg[8]  ( .D(n555), .CLK(clk), .R(n169), .S(1'b1), .Q(E2[8]) );
  DFFSR \E2_reg[9]  ( .D(n554), .CLK(clk), .R(n169), .S(1'b1), .Q(E2[9]) );
  DFFSR o_gradient_data_ready_reg ( .D(n565), .CLK(clk), .R(n169), .S(1'b1), 
        .Q(o_gradient_data_ready) );
  DFFSR \Gx_reg[0]  ( .D(n570), .CLK(clk), .R(n169), .S(1'b1), .Q(N258) );
  DFFSR \Gx_reg[1]  ( .D(n571), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[1]) );
  DFFSR \Gx_reg[2]  ( .D(n572), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[2]) );
  DFFSR \Gx_reg[3]  ( .D(n573), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[3]) );
  DFFSR \Gx_reg[4]  ( .D(n574), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[4]) );
  DFFSR \Gx_reg[5]  ( .D(n575), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[5]) );
  DFFSR \Gx_reg[6]  ( .D(n576), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[6]) );
  DFFSR \Gx_reg[7]  ( .D(n577), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[7]) );
  DFFSR \Gx_reg[8]  ( .D(n578), .CLK(clk), .R(n169), .S(1'b1), .Q(Gx[8]) );
  DFFSR \Gx_reg[9]  ( .D(n579), .CLK(clk), .R(n168), .S(1'b1), .Q(Gx[9]) );
  DFFSR \C2_reg[1]  ( .D(n543), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[1]) );
  DFFSR \C2_reg[2]  ( .D(n542), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[2]) );
  DFFSR \C2_reg[3]  ( .D(n541), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[3]) );
  DFFSR \C2_reg[4]  ( .D(n540), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[4]) );
  DFFSR \C2_reg[5]  ( .D(n539), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[5]) );
  DFFSR \C2_reg[6]  ( .D(n538), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[6]) );
  DFFSR \C2_reg[7]  ( .D(n537), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[7]) );
  DFFSR \C2_reg[8]  ( .D(n536), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[8]) );
  DFFSR \C2_reg[9]  ( .D(n535), .CLK(clk), .R(n168), .S(1'b1), .Q(C2[9]) );
  DFFSR \Gy_reg[1]  ( .D(n589), .CLK(clk), .R(n168), .S(1'b1), .Q(Gy[1]) );
  DFFSR \Gy_reg[2]  ( .D(n588), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[2]) );
  DFFSR \Gy_reg[3]  ( .D(n587), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[3]) );
  DFFSR \Gy_reg[4]  ( .D(n586), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[4]) );
  DFFSR \Gy_reg[5]  ( .D(n585), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[5]) );
  DFFSR \Gy_reg[6]  ( .D(n584), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[6]) );
  DFFSR \Gy_reg[7]  ( .D(n583), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[7]) );
  DFFSR \Gy_reg[8]  ( .D(n582), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[8]) );
  DFFSR \Gy_reg[9]  ( .D(n581), .CLK(clk), .R(n141), .S(1'b1), .Q(Gy[9]) );
  DFFSR \temp_sum_reg[0]  ( .D(n590), .CLK(clk), .R(n141), .S(1'b1), .Q(
        temp_sum[0]) );
  DFFSR \o_processed_sum_reg[0]  ( .D(temp_sum[0]), .CLK(clk), .R(n141), .S(
        1'b1), .Q(o_processed_sum[0]) );
  DFFSR \temp_sum_reg[1]  ( .D(n591), .CLK(clk), .R(n141), .S(1'b1), .Q(
        temp_sum[1]) );
  DFFSR \o_processed_sum_reg[1]  ( .D(temp_sum[1]), .CLK(clk), .R(n141), .S(
        1'b1), .Q(o_processed_sum[1]) );
  DFFSR \temp_sum_reg[2]  ( .D(n592), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[2]) );
  DFFSR \o_processed_sum_reg[2]  ( .D(temp_sum[2]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[2]) );
  DFFSR \temp_sum_reg[3]  ( .D(n593), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[3]) );
  DFFSR \o_processed_sum_reg[3]  ( .D(temp_sum[3]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[3]) );
  DFFSR \temp_sum_reg[4]  ( .D(n594), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[4]) );
  DFFSR \o_processed_sum_reg[4]  ( .D(temp_sum[4]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[4]) );
  DFFSR \temp_sum_reg[5]  ( .D(n595), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[5]) );
  DFFSR \o_processed_sum_reg[5]  ( .D(temp_sum[5]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[5]) );
  DFFSR \temp_sum_reg[6]  ( .D(n596), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[6]) );
  DFFSR \o_processed_sum_reg[6]  ( .D(temp_sum[6]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[6]) );
  DFFSR \temp_sum_reg[7]  ( .D(n597), .CLK(clk), .R(n65), .S(1'b1), .Q(
        temp_sum[7]) );
  DFFSR \o_processed_sum_reg[7]  ( .D(temp_sum[7]), .CLK(clk), .R(n65), .S(
        1'b1), .Q(o_processed_sum[7]) );
  AND2X2 U157 ( .A(n630), .B(n623), .Y(n614) );
  AND2X2 U160 ( .A(n633), .B(n632), .Y(n600) );
  OR2X1 U458 ( .A(n625), .B(n624), .Y(n626) );
  NAND3X1 U459 ( .A(n623), .B(n622), .C(n408), .Y(n627) );
  OR2X1 U462 ( .A(n619), .B(n618), .Y(n620) );
  NAND3X1 U464 ( .A(n615), .B(n622), .C(n614), .Y(n621) );
  OAI21X1 U465 ( .A(n622), .B(n409), .C(n613), .Y(n569) );
  NAND2X1 U467 ( .A(n564), .B(n617), .Y(n611) );
  NAND3X1 U469 ( .A(n628), .B(n632), .C(n629), .Y(n612) );
  OR2X1 U472 ( .A(n619), .B(n625), .Y(n608) );
  NAND3X1 U475 ( .A(n629), .B(n622), .C(n606), .Y(n609) );
  NAND2X1 U476 ( .A(i_gradient_start), .B(n566), .Y(n606) );
  NAND2X1 U477 ( .A(n604), .B(n603), .Y(n622) );
  NOR2X1 U478 ( .A(n602), .B(n601), .Y(n603) );
  NAND3X1 U479 ( .A(n630), .B(n629), .C(n610), .Y(n601) );
  NAND3X1 U482 ( .A(n631), .B(n628), .C(n600), .Y(n602) );
  NAND3X1 U484 ( .A(state[2]), .B(n17), .C(state[3]), .Y(n633) );
  NOR2X1 U487 ( .A(n599), .B(n598), .Y(n604) );
  NAND3X1 U488 ( .A(n605), .B(n616), .C(n408), .Y(n598) );
  NAND2X1 U490 ( .A(n16), .B(n2), .Y(n605) );
  NAND3X1 U491 ( .A(n617), .B(n607), .C(n623), .Y(n599) );
  NAND2X1 U492 ( .A(n9), .B(n17), .Y(n623) );
  NAND2X1 U493 ( .A(n22), .B(n9), .Y(n607) );
  edge_detection_0_DW01_add_0 add_231 ( .A({Gx[10:1], N258}), .B({Gy[10:1], 
        N269}), .CI(1'b0), .SUM({N290, N289, N288, N287, N286, N285, N284, 
        N283, N282, N281, N280}) );
  edge_detection_0_DW01_add_1 add_219 ( .A({C2[9], C2[9:1], 1'b0}), .B({E2[9], 
        E2}), .CI(1'b0), .SUM({N257, N256, N255, N254, N253, N252, N251, N250, 
        N249, N248, N247}) );
  edge_detection_0_DW01_add_2 add_218 ( .A({C1[9], C1[9:1], 1'b0}), .B({E1[9], 
        E1}), .CI(1'b0), .SUM({N246, N245, N244, N243, N242, N241, N240, N239, 
        N238, N237, N236}) );
  edge_detection_0_DW01_add_3 add_214 ( .A({A2[8], A2}), .B({D2[8], D2}), .CI(
        1'b0), .SUM({N235, N234, N233, N232, N231, N230, N229, N228, N227, 
        N226}) );
  edge_detection_0_DW01_add_4 add_213 ( .A({A1[8], A1}), .B({D1[8], D1}), .CI(
        1'b0), .SUM({N225, N224, N223, N222, N221, N220, N219, N218, N217, 
        N216}) );
  edge_detection_0_DW01_sub_2 sub_204 ( .A({1'b0, P2}), .B({1'b0, P8}), .CI(
        1'b0), .DIFF({N195, N194, N193, N192, N191, N190, N189, N188, N187})
         );
  edge_detection_0_DW01_sub_3 sub_203 ( .A({1'b0, P8}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N186, N185, N184, N183, N182, N181, N180, N179, N178})
         );
  edge_detection_0_DW01_sub_4 sub_202 ( .A({1'b0, P1}), .B({1'b0, P7}), .CI(
        1'b0), .DIFF({N177, N176, N175, N174, N173, N172, N171, N170, N169})
         );
  edge_detection_0_DW01_sub_5 sub_201 ( .A({1'b0, P5}), .B({1'b0, P3}), .CI(
        1'b0), .DIFF({N168, N167, N166, N165, N164, N163, N162, N161, N160})
         );
  edge_detection_0_DW01_sub_6 sub_200 ( .A({1'b0, P0}), .B({1'b0, P6}), .CI(
        1'b0), .DIFF({N159, N158, N157, N156, N155, N154, N153, N152, N151})
         );
  edge_detection_0_DW01_sub_7 sub_199 ( .A({1'b0, P2}), .B({1'b0, P0}), .CI(
        1'b0), .DIFF({N150, N149, N148, N147, N146, N145, N144, N143, N142})
         );
  NAND2X1 U5 ( .A(n2), .B(n9), .Y(n1) );
  AND2X2 U6 ( .A(n409), .B(n178), .Y(n2) );
  AND2X2 U12 ( .A(state[3]), .B(n179), .Y(n8) );
  AND2X2 U13 ( .A(state[2]), .B(n235), .Y(n9) );
  AND2X2 U52 ( .A(n235), .B(n179), .Y(n16) );
  AND2X2 U128 ( .A(state[1]), .B(n178), .Y(n17) );
  AND2X2 U155 ( .A(state[0]), .B(state[1]), .Y(n18) );
  OR2X2 U156 ( .A(n609), .B(n608), .Y(n19) );
  OR2X2 U158 ( .A(n621), .B(n620), .Y(n20) );
  OR2X2 U159 ( .A(n627), .B(n626), .Y(n21) );
  AND2X2 U161 ( .A(state[0]), .B(n409), .Y(n22) );
  OR2X2 U162 ( .A(n260), .B(Gx[6]), .Y(n264) );
  OR2X2 U163 ( .A(n268), .B(Gx[8]), .Y(n272) );
  OR2X2 U164 ( .A(N258), .B(Gx[1]), .Y(n244) );
  BUFX2 U165 ( .A(n323), .Y(n29) );
  BUFX2 U166 ( .A(n323), .Y(n28) );
  BUFX2 U167 ( .A(n323), .Y(n26) );
  BUFX2 U168 ( .A(n323), .Y(n27) );
  INVX2 U169 ( .A(n630), .Y(n25) );
  INVX2 U170 ( .A(n1), .Y(n384) );
  INVX2 U171 ( .A(n629), .Y(n24) );
  BUFX2 U172 ( .A(n323), .Y(n30) );
  INVX2 U173 ( .A(n631), .Y(n404) );
  AND2X2 U174 ( .A(n631), .B(n1), .Y(n23) );
  INVX2 U175 ( .A(n615), .Y(n385) );
  BUFX2 U176 ( .A(n_rst), .Y(n65) );
  BUFX2 U177 ( .A(n_rst), .Y(n141) );
  BUFX2 U178 ( .A(n_rst), .Y(n169) );
  BUFX2 U179 ( .A(n_rst), .Y(n170) );
  BUFX2 U180 ( .A(n_rst), .Y(n171) );
  BUFX2 U181 ( .A(n_rst), .Y(n172) );
  BUFX2 U182 ( .A(n_rst), .Y(n173) );
  BUFX2 U183 ( .A(n_rst), .Y(n174) );
  BUFX2 U184 ( .A(n_rst), .Y(n176) );
  BUFX2 U185 ( .A(n_rst), .Y(n168) );
  BUFX2 U186 ( .A(n_rst), .Y(n175) );
  BUFX2 U187 ( .A(n_rst), .Y(n177) );
  OR2X1 U188 ( .A(n244), .B(Gx[2]), .Y(n248) );
  OR2X1 U189 ( .A(n264), .B(Gx[7]), .Y(n268) );
  OR2X1 U190 ( .A(n256), .B(Gx[5]), .Y(n260) );
  OR2X1 U191 ( .A(n252), .B(Gx[4]), .Y(n256) );
  OR2X1 U192 ( .A(n248), .B(Gx[3]), .Y(n252) );
  INVX2 U195 ( .A(state[1]), .Y(n409) );
  INVX2 U196 ( .A(state[0]), .Y(n178) );
  NAND3X1 U197 ( .A(state[2]), .B(state[3]), .C(n2), .Y(n632) );
  INVX2 U198 ( .A(state[2]), .Y(n179) );
  NAND2X1 U199 ( .A(n17), .B(n8), .Y(n631) );
  INVX2 U200 ( .A(state[3]), .Y(n235) );
  NAND2X1 U201 ( .A(n16), .B(n22), .Y(n628) );
  INVX2 U202 ( .A(n628), .Y(n323) );
  MUX2X1 U203 ( .B(N205), .A(N168), .S(n26), .Y(n180) );
  INVX2 U204 ( .A(n180), .Y(n428) );
  NAND2X1 U205 ( .A(n16), .B(n17), .Y(n629) );
  INVX2 U206 ( .A(C1[9]), .Y(n182) );
  INVX2 U207 ( .A(N205), .Y(n181) );
  MUX2X1 U208 ( .B(n182), .A(n181), .S(n24), .Y(n526) );
  MUX2X1 U209 ( .B(N204), .A(N167), .S(n26), .Y(n183) );
  INVX2 U210 ( .A(n183), .Y(n429) );
  INVX2 U211 ( .A(C1[8]), .Y(n185) );
  INVX2 U212 ( .A(N204), .Y(n184) );
  MUX2X1 U213 ( .B(n185), .A(n184), .S(n24), .Y(n527) );
  MUX2X1 U214 ( .B(N203), .A(N166), .S(n26), .Y(n186) );
  INVX2 U215 ( .A(n186), .Y(n430) );
  INVX2 U216 ( .A(C1[7]), .Y(n188) );
  INVX2 U217 ( .A(N203), .Y(n187) );
  MUX2X1 U218 ( .B(n188), .A(n187), .S(n24), .Y(n528) );
  MUX2X1 U219 ( .B(N202), .A(N165), .S(n26), .Y(n189) );
  INVX2 U220 ( .A(n189), .Y(n431) );
  INVX2 U221 ( .A(C1[6]), .Y(n191) );
  INVX2 U222 ( .A(N202), .Y(n190) );
  MUX2X1 U223 ( .B(n191), .A(n190), .S(n24), .Y(n529) );
  MUX2X1 U224 ( .B(N201), .A(N164), .S(n26), .Y(n192) );
  INVX2 U225 ( .A(n192), .Y(n432) );
  INVX2 U226 ( .A(C1[5]), .Y(n194) );
  INVX2 U227 ( .A(N201), .Y(n193) );
  MUX2X1 U228 ( .B(n194), .A(n193), .S(n24), .Y(n530) );
  MUX2X1 U229 ( .B(N200), .A(N163), .S(n26), .Y(n195) );
  INVX2 U230 ( .A(n195), .Y(n433) );
  INVX2 U231 ( .A(C1[4]), .Y(n197) );
  INVX2 U232 ( .A(N200), .Y(n196) );
  MUX2X1 U233 ( .B(n197), .A(n196), .S(n24), .Y(n531) );
  MUX2X1 U234 ( .B(N199), .A(N162), .S(n26), .Y(n198) );
  INVX2 U235 ( .A(n198), .Y(n434) );
  INVX2 U236 ( .A(C1[3]), .Y(n200) );
  INVX2 U237 ( .A(N199), .Y(n199) );
  MUX2X1 U238 ( .B(n200), .A(n199), .S(n24), .Y(n532) );
  MUX2X1 U239 ( .B(N198), .A(N161), .S(n26), .Y(n201) );
  INVX2 U240 ( .A(n201), .Y(n435) );
  INVX2 U241 ( .A(C1[2]), .Y(n203) );
  INVX2 U242 ( .A(N198), .Y(n202) );
  MUX2X1 U243 ( .B(n203), .A(n202), .S(n24), .Y(n533) );
  MUX2X1 U244 ( .B(N197), .A(N160), .S(n26), .Y(n204) );
  INVX2 U245 ( .A(n204), .Y(n436) );
  INVX2 U246 ( .A(C1[1]), .Y(n206) );
  INVX2 U247 ( .A(N197), .Y(n205) );
  MUX2X1 U248 ( .B(n206), .A(n205), .S(n24), .Y(n534) );
  MUX2X1 U249 ( .B(A1[8]), .A(N150), .S(n26), .Y(n207) );
  INVX2 U250 ( .A(n207), .Y(n410) );
  MUX2X1 U251 ( .B(A1[7]), .A(N149), .S(n26), .Y(n208) );
  INVX2 U252 ( .A(n208), .Y(n411) );
  MUX2X1 U253 ( .B(A1[6]), .A(N148), .S(n26), .Y(n209) );
  INVX2 U254 ( .A(n209), .Y(n412) );
  MUX2X1 U255 ( .B(A1[5]), .A(N147), .S(n26), .Y(n210) );
  INVX2 U256 ( .A(n210), .Y(n413) );
  MUX2X1 U257 ( .B(A1[4]), .A(N146), .S(n27), .Y(n211) );
  INVX2 U258 ( .A(n211), .Y(n414) );
  MUX2X1 U259 ( .B(A1[3]), .A(N145), .S(n27), .Y(n212) );
  INVX2 U260 ( .A(n212), .Y(n415) );
  MUX2X1 U261 ( .B(A1[2]), .A(N144), .S(n27), .Y(n213) );
  INVX2 U262 ( .A(n213), .Y(n416) );
  MUX2X1 U263 ( .B(A1[1]), .A(N143), .S(n27), .Y(n214) );
  INVX2 U264 ( .A(n214), .Y(n417) );
  MUX2X1 U265 ( .B(A1[0]), .A(N142), .S(n27), .Y(n215) );
  INVX2 U266 ( .A(n215), .Y(n418) );
  MUX2X1 U267 ( .B(D1[8]), .A(N186), .S(n27), .Y(n216) );
  INVX2 U268 ( .A(n216), .Y(n461) );
  MUX2X1 U269 ( .B(D1[7]), .A(N185), .S(n27), .Y(n217) );
  INVX2 U270 ( .A(n217), .Y(n466) );
  MUX2X1 U271 ( .B(D1[6]), .A(N184), .S(n27), .Y(n218) );
  INVX2 U272 ( .A(n218), .Y(n469) );
  MUX2X1 U273 ( .B(D1[5]), .A(N183), .S(n27), .Y(n219) );
  INVX2 U274 ( .A(n219), .Y(n477) );
  MUX2X1 U275 ( .B(D1[4]), .A(N182), .S(n27), .Y(n220) );
  INVX2 U276 ( .A(n220), .Y(n478) );
  MUX2X1 U277 ( .B(D1[3]), .A(N181), .S(n27), .Y(n221) );
  INVX2 U278 ( .A(n221), .Y(n479) );
  MUX2X1 U279 ( .B(D1[2]), .A(N180), .S(n27), .Y(n222) );
  INVX2 U280 ( .A(n222), .Y(n480) );
  MUX2X1 U281 ( .B(D1[1]), .A(N179), .S(n27), .Y(n223) );
  INVX2 U282 ( .A(n223), .Y(n482) );
  MUX2X1 U283 ( .B(D1[0]), .A(N178), .S(n28), .Y(n224) );
  INVX2 U284 ( .A(n224), .Y(n483) );
  NAND2X1 U285 ( .A(n16), .B(n18), .Y(n630) );
  MUX2X1 U286 ( .B(E1[9]), .A(N225), .S(n25), .Y(n225) );
  INVX2 U287 ( .A(n225), .Y(n544) );
  MUX2X1 U288 ( .B(E1[8]), .A(N224), .S(n25), .Y(n226) );
  INVX2 U289 ( .A(n226), .Y(n545) );
  MUX2X1 U290 ( .B(E1[7]), .A(N223), .S(n25), .Y(n227) );
  INVX2 U291 ( .A(n227), .Y(n546) );
  MUX2X1 U292 ( .B(E1[6]), .A(N222), .S(n25), .Y(n228) );
  INVX2 U293 ( .A(n228), .Y(n547) );
  MUX2X1 U294 ( .B(E1[5]), .A(N221), .S(n25), .Y(n229) );
  INVX2 U295 ( .A(n229), .Y(n548) );
  MUX2X1 U296 ( .B(E1[4]), .A(N220), .S(n25), .Y(n230) );
  INVX2 U297 ( .A(n230), .Y(n549) );
  MUX2X1 U298 ( .B(E1[3]), .A(N219), .S(n25), .Y(n231) );
  INVX2 U299 ( .A(n231), .Y(n550) );
  MUX2X1 U300 ( .B(E1[2]), .A(N218), .S(n25), .Y(n232) );
  INVX2 U301 ( .A(n232), .Y(n551) );
  MUX2X1 U302 ( .B(E1[1]), .A(N217), .S(n25), .Y(n233) );
  INVX2 U303 ( .A(n233), .Y(n552) );
  MUX2X1 U304 ( .B(E1[0]), .A(N216), .S(n25), .Y(n234) );
  INVX2 U305 ( .A(n234), .Y(n553) );
  INVX2 U306 ( .A(N236), .Y(n237) );
  OAI21X1 U307 ( .A(n404), .B(n23), .C(N258), .Y(n236) );
  OAI21X1 U308 ( .A(n1), .B(n237), .C(n236), .Y(n570) );
  INVX2 U309 ( .A(N237), .Y(n240) );
  XOR2X1 U310 ( .A(Gx[1]), .B(N258), .Y(n238) );
  AOI22X1 U311 ( .A(n238), .B(n404), .C(Gx[1]), .D(n23), .Y(n239) );
  OAI21X1 U312 ( .A(n1), .B(n240), .C(n239), .Y(n571) );
  INVX2 U313 ( .A(N238), .Y(n243) );
  XOR2X1 U314 ( .A(n244), .B(Gx[2]), .Y(n241) );
  AOI22X1 U315 ( .A(n241), .B(n404), .C(Gx[2]), .D(n23), .Y(n242) );
  OAI21X1 U316 ( .A(n1), .B(n243), .C(n242), .Y(n572) );
  INVX2 U317 ( .A(N239), .Y(n247) );
  XOR2X1 U318 ( .A(n248), .B(Gx[3]), .Y(n245) );
  AOI22X1 U319 ( .A(n245), .B(n404), .C(Gx[3]), .D(n23), .Y(n246) );
  OAI21X1 U320 ( .A(n1), .B(n247), .C(n246), .Y(n573) );
  INVX2 U321 ( .A(N240), .Y(n251) );
  XOR2X1 U322 ( .A(n252), .B(Gx[4]), .Y(n249) );
  AOI22X1 U323 ( .A(n249), .B(n404), .C(Gx[4]), .D(n23), .Y(n250) );
  OAI21X1 U324 ( .A(n1), .B(n251), .C(n250), .Y(n574) );
  INVX2 U325 ( .A(N241), .Y(n255) );
  XOR2X1 U326 ( .A(n256), .B(Gx[5]), .Y(n253) );
  AOI22X1 U327 ( .A(n253), .B(n404), .C(Gx[5]), .D(n23), .Y(n254) );
  OAI21X1 U328 ( .A(n1), .B(n255), .C(n254), .Y(n575) );
  INVX2 U329 ( .A(N242), .Y(n259) );
  XOR2X1 U330 ( .A(n260), .B(Gx[6]), .Y(n257) );
  AOI22X1 U331 ( .A(n257), .B(n404), .C(Gx[6]), .D(n23), .Y(n258) );
  OAI21X1 U332 ( .A(n1), .B(n259), .C(n258), .Y(n576) );
  INVX2 U333 ( .A(N243), .Y(n263) );
  XOR2X1 U334 ( .A(n264), .B(Gx[7]), .Y(n261) );
  AOI22X1 U335 ( .A(n261), .B(n404), .C(Gx[7]), .D(n23), .Y(n262) );
  OAI21X1 U336 ( .A(n1), .B(n263), .C(n262), .Y(n577) );
  INVX2 U337 ( .A(N244), .Y(n267) );
  XOR2X1 U338 ( .A(n268), .B(Gx[8]), .Y(n265) );
  AOI22X1 U339 ( .A(n265), .B(n404), .C(Gx[8]), .D(n23), .Y(n266) );
  OAI21X1 U340 ( .A(n1), .B(n267), .C(n266), .Y(n578) );
  INVX2 U341 ( .A(N245), .Y(n271) );
  XOR2X1 U342 ( .A(n272), .B(Gx[9]), .Y(n269) );
  AOI22X1 U343 ( .A(n269), .B(n404), .C(Gx[9]), .D(n23), .Y(n270) );
  OAI21X1 U344 ( .A(n1), .B(n271), .C(n270), .Y(n579) );
  NOR2X1 U345 ( .A(Gx[9]), .B(n272), .Y(n273) );
  XNOR2X1 U346 ( .A(n273), .B(Gx[10]), .Y(n274) );
  AOI22X1 U347 ( .A(n23), .B(Gx[10]), .C(n274), .D(n404), .Y(n276) );
  NAND2X1 U348 ( .A(N246), .B(n384), .Y(n275) );
  NAND2X1 U349 ( .A(n276), .B(n275), .Y(n580) );
  NAND2X1 U350 ( .A(n8), .B(n18), .Y(n615) );
  MUX2X1 U351 ( .B(N215), .A(N177), .S(n28), .Y(n277) );
  INVX2 U352 ( .A(n277), .Y(n437) );
  INVX2 U353 ( .A(C2[9]), .Y(n279) );
  INVX2 U354 ( .A(N215), .Y(n278) );
  MUX2X1 U355 ( .B(n279), .A(n278), .S(n24), .Y(n535) );
  MUX2X1 U356 ( .B(N214), .A(N176), .S(n28), .Y(n280) );
  INVX2 U357 ( .A(n280), .Y(n438) );
  INVX2 U358 ( .A(C2[8]), .Y(n282) );
  INVX2 U359 ( .A(N214), .Y(n281) );
  MUX2X1 U360 ( .B(n282), .A(n281), .S(n24), .Y(n536) );
  MUX2X1 U361 ( .B(N213), .A(N175), .S(n28), .Y(n283) );
  INVX2 U362 ( .A(n283), .Y(n439) );
  INVX2 U363 ( .A(C2[7]), .Y(n285) );
  INVX2 U364 ( .A(N213), .Y(n284) );
  MUX2X1 U365 ( .B(n285), .A(n284), .S(n24), .Y(n537) );
  MUX2X1 U366 ( .B(N212), .A(N174), .S(n28), .Y(n286) );
  INVX2 U367 ( .A(n286), .Y(n440) );
  INVX2 U368 ( .A(C2[6]), .Y(n288) );
  INVX2 U369 ( .A(N212), .Y(n287) );
  MUX2X1 U370 ( .B(n288), .A(n287), .S(n24), .Y(n538) );
  MUX2X1 U371 ( .B(N211), .A(N173), .S(n28), .Y(n289) );
  INVX2 U372 ( .A(n289), .Y(n441) );
  INVX2 U373 ( .A(C2[5]), .Y(n291) );
  INVX2 U374 ( .A(N211), .Y(n290) );
  MUX2X1 U375 ( .B(n291), .A(n290), .S(n24), .Y(n539) );
  MUX2X1 U376 ( .B(N210), .A(N172), .S(n28), .Y(n292) );
  INVX2 U377 ( .A(n292), .Y(n443) );
  INVX2 U378 ( .A(C2[4]), .Y(n294) );
  INVX2 U379 ( .A(N210), .Y(n293) );
  MUX2X1 U380 ( .B(n294), .A(n293), .S(n24), .Y(n540) );
  MUX2X1 U381 ( .B(N209), .A(N171), .S(n28), .Y(n295) );
  INVX2 U382 ( .A(n295), .Y(n444) );
  INVX2 U383 ( .A(C2[3]), .Y(n297) );
  INVX2 U384 ( .A(N209), .Y(n296) );
  MUX2X1 U385 ( .B(n297), .A(n296), .S(n24), .Y(n541) );
  MUX2X1 U386 ( .B(N208), .A(N170), .S(n28), .Y(n298) );
  INVX2 U387 ( .A(n298), .Y(n451) );
  INVX2 U388 ( .A(C2[2]), .Y(n300) );
  INVX2 U389 ( .A(N208), .Y(n299) );
  MUX2X1 U390 ( .B(n300), .A(n299), .S(n24), .Y(n542) );
  MUX2X1 U391 ( .B(N207), .A(N169), .S(n28), .Y(n301) );
  INVX2 U392 ( .A(n301), .Y(n452) );
  INVX2 U393 ( .A(C2[1]), .Y(n304) );
  INVX2 U394 ( .A(N207), .Y(n302) );
  MUX2X1 U395 ( .B(n304), .A(n302), .S(n24), .Y(n543) );
  MUX2X1 U396 ( .B(A2[8]), .A(N159), .S(n28), .Y(n305) );
  INVX2 U397 ( .A(n305), .Y(n419) );
  MUX2X1 U398 ( .B(A2[7]), .A(N158), .S(n28), .Y(n306) );
  INVX2 U399 ( .A(n306), .Y(n420) );
  MUX2X1 U400 ( .B(A2[6]), .A(N157), .S(n28), .Y(n307) );
  INVX2 U401 ( .A(n307), .Y(n421) );
  MUX2X1 U402 ( .B(A2[5]), .A(N156), .S(n29), .Y(n308) );
  INVX2 U403 ( .A(n308), .Y(n422) );
  MUX2X1 U404 ( .B(A2[4]), .A(N155), .S(n29), .Y(n309) );
  INVX2 U405 ( .A(n309), .Y(n423) );
  MUX2X1 U406 ( .B(A2[3]), .A(N154), .S(n29), .Y(n310) );
  INVX2 U407 ( .A(n310), .Y(n424) );
  MUX2X1 U408 ( .B(A2[2]), .A(N153), .S(n29), .Y(n311) );
  INVX2 U409 ( .A(n311), .Y(n425) );
  MUX2X1 U410 ( .B(A2[1]), .A(N152), .S(n29), .Y(n312) );
  INVX2 U411 ( .A(n312), .Y(n426) );
  MUX2X1 U412 ( .B(A2[0]), .A(N151), .S(n29), .Y(n313) );
  INVX2 U413 ( .A(n313), .Y(n427) );
  MUX2X1 U414 ( .B(D2[8]), .A(N195), .S(n29), .Y(n314) );
  INVX2 U415 ( .A(n314), .Y(n486) );
  MUX2X1 U416 ( .B(D2[7]), .A(N194), .S(n29), .Y(n316) );
  INVX2 U417 ( .A(n316), .Y(n487) );
  MUX2X1 U418 ( .B(D2[6]), .A(N193), .S(n29), .Y(n317) );
  INVX2 U419 ( .A(n317), .Y(n488) );
  MUX2X1 U420 ( .B(D2[5]), .A(N192), .S(n29), .Y(n318) );
  INVX2 U421 ( .A(n318), .Y(n517) );
  MUX2X1 U422 ( .B(D2[4]), .A(N191), .S(n29), .Y(n319) );
  INVX2 U423 ( .A(n319), .Y(n518) );
  MUX2X1 U424 ( .B(D2[3]), .A(N190), .S(n29), .Y(n320) );
  INVX2 U425 ( .A(n320), .Y(n520) );
  MUX2X1 U426 ( .B(D2[2]), .A(N189), .S(n29), .Y(n321) );
  INVX2 U427 ( .A(n321), .Y(n523) );
  MUX2X1 U428 ( .B(D2[1]), .A(N188), .S(n30), .Y(n322) );
  INVX2 U429 ( .A(n322), .Y(n524) );
  MUX2X1 U430 ( .B(D2[0]), .A(N187), .S(n30), .Y(n324) );
  INVX2 U431 ( .A(n324), .Y(n525) );
  MUX2X1 U432 ( .B(E2[9]), .A(N235), .S(n25), .Y(n325) );
  INVX2 U433 ( .A(n325), .Y(n554) );
  MUX2X1 U434 ( .B(E2[8]), .A(N234), .S(n25), .Y(n326) );
  INVX2 U435 ( .A(n326), .Y(n555) );
  MUX2X1 U436 ( .B(E2[7]), .A(N233), .S(n25), .Y(n327) );
  INVX2 U437 ( .A(n327), .Y(n556) );
  MUX2X1 U438 ( .B(E2[6]), .A(N232), .S(n25), .Y(n328) );
  INVX2 U439 ( .A(n328), .Y(n557) );
  MUX2X1 U440 ( .B(E2[5]), .A(N231), .S(n25), .Y(n329) );
  INVX2 U441 ( .A(n329), .Y(n558) );
  MUX2X1 U442 ( .B(E2[4]), .A(N230), .S(n25), .Y(n330) );
  INVX2 U443 ( .A(n330), .Y(n559) );
  MUX2X1 U444 ( .B(E2[3]), .A(N229), .S(n25), .Y(n331) );
  INVX2 U445 ( .A(n331), .Y(n560) );
  MUX2X1 U446 ( .B(E2[2]), .A(N228), .S(n25), .Y(n332) );
  INVX2 U447 ( .A(n332), .Y(n561) );
  MUX2X1 U448 ( .B(E2[1]), .A(N227), .S(n25), .Y(n333) );
  INVX2 U449 ( .A(n333), .Y(n562) );
  MUX2X1 U450 ( .B(E2[0]), .A(N226), .S(n25), .Y(n334) );
  INVX2 U451 ( .A(n334), .Y(n563) );
  INVX2 U452 ( .A(N247), .Y(n336) );
  NAND2X1 U453 ( .A(n1), .B(n615), .Y(n389) );
  INVX2 U454 ( .A(n389), .Y(n408) );
  OAI21X1 U455 ( .A(n385), .B(n408), .C(N269), .Y(n335) );
  OAI21X1 U456 ( .A(n1), .B(n336), .C(n335), .Y(n567) );
  INVX2 U457 ( .A(Gy[1]), .Y(n339) );
  XOR2X1 U460 ( .A(Gy[1]), .B(N269), .Y(n337) );
  AOI22X1 U461 ( .A(n337), .B(n385), .C(N248), .D(n384), .Y(n338) );
  OAI21X1 U463 ( .A(n389), .B(n339), .C(n338), .Y(n589) );
  INVX2 U466 ( .A(Gy[2]), .Y(n345) );
  INVX2 U468 ( .A(N269), .Y(n340) );
  NAND2X1 U470 ( .A(n340), .B(n339), .Y(n344) );
  XOR2X1 U471 ( .A(n344), .B(Gy[2]), .Y(n342) );
  AOI22X1 U473 ( .A(n342), .B(n385), .C(N249), .D(n384), .Y(n343) );
  OAI21X1 U474 ( .A(n389), .B(n345), .C(n343), .Y(n588) );
  INVX2 U480 ( .A(Gy[3]), .Y(n350) );
  INVX2 U481 ( .A(n344), .Y(n346) );
  NAND2X1 U483 ( .A(n346), .B(n345), .Y(n349) );
  XOR2X1 U485 ( .A(n349), .B(Gy[3]), .Y(n347) );
  AOI22X1 U486 ( .A(n347), .B(n385), .C(N250), .D(n384), .Y(n348) );
  OAI21X1 U489 ( .A(n389), .B(n350), .C(n348), .Y(n587) );
  INVX2 U494 ( .A(Gy[4]), .Y(n355) );
  INVX2 U495 ( .A(n349), .Y(n351) );
  NAND2X1 U496 ( .A(n351), .B(n350), .Y(n354) );
  XOR2X1 U497 ( .A(n354), .B(Gy[4]), .Y(n352) );
  AOI22X1 U498 ( .A(n352), .B(n385), .C(N251), .D(n384), .Y(n353) );
  OAI21X1 U499 ( .A(n389), .B(n355), .C(n353), .Y(n586) );
  INVX2 U500 ( .A(Gy[5]), .Y(n360) );
  INVX2 U501 ( .A(n354), .Y(n356) );
  NAND2X1 U502 ( .A(n356), .B(n355), .Y(n359) );
  XOR2X1 U503 ( .A(n359), .B(Gy[5]), .Y(n357) );
  AOI22X1 U504 ( .A(n357), .B(n385), .C(N252), .D(n384), .Y(n358) );
  OAI21X1 U505 ( .A(n389), .B(n360), .C(n358), .Y(n585) );
  INVX2 U506 ( .A(Gy[6]), .Y(n366) );
  INVX2 U507 ( .A(n359), .Y(n361) );
  NAND2X1 U508 ( .A(n361), .B(n360), .Y(n365) );
  XOR2X1 U509 ( .A(n365), .B(Gy[6]), .Y(n362) );
  AOI22X1 U510 ( .A(n362), .B(n385), .C(N253), .D(n384), .Y(n363) );
  OAI21X1 U511 ( .A(n389), .B(n366), .C(n363), .Y(n584) );
  INVX2 U512 ( .A(Gy[7]), .Y(n371) );
  INVX2 U513 ( .A(n365), .Y(n367) );
  NAND2X1 U514 ( .A(n367), .B(n366), .Y(n370) );
  XOR2X1 U515 ( .A(n370), .B(Gy[7]), .Y(n368) );
  AOI22X1 U516 ( .A(n368), .B(n385), .C(N254), .D(n384), .Y(n369) );
  OAI21X1 U517 ( .A(n389), .B(n371), .C(n369), .Y(n583) );
  INVX2 U518 ( .A(Gy[8]), .Y(n376) );
  INVX2 U519 ( .A(n370), .Y(n372) );
  NAND2X1 U520 ( .A(n372), .B(n371), .Y(n375) );
  XOR2X1 U521 ( .A(n375), .B(Gy[8]), .Y(n373) );
  AOI22X1 U522 ( .A(n373), .B(n385), .C(N255), .D(n384), .Y(n374) );
  OAI21X1 U523 ( .A(n389), .B(n376), .C(n374), .Y(n582) );
  INVX2 U524 ( .A(Gy[9]), .Y(n381) );
  INVX2 U525 ( .A(n375), .Y(n377) );
  NAND2X1 U526 ( .A(n377), .B(n376), .Y(n380) );
  XOR2X1 U527 ( .A(n380), .B(Gy[9]), .Y(n378) );
  AOI22X1 U528 ( .A(n378), .B(n385), .C(N256), .D(n384), .Y(n379) );
  OAI21X1 U529 ( .A(n389), .B(n381), .C(n379), .Y(n581) );
  INVX2 U530 ( .A(Gy[10]), .Y(n406) );
  INVX2 U531 ( .A(n380), .Y(n382) );
  NAND2X1 U532 ( .A(n382), .B(n381), .Y(n383) );
  XOR2X1 U533 ( .A(n383), .B(Gy[10]), .Y(n387) );
  AOI22X1 U534 ( .A(n387), .B(n385), .C(N257), .D(n384), .Y(n388) );
  OAI21X1 U535 ( .A(n406), .B(n389), .C(n388), .Y(n568) );
  NOR2X1 U536 ( .A(N290), .B(N289), .Y(n391) );
  INVX2 U537 ( .A(N288), .Y(n390) );
  AOI21X1 U538 ( .A(n391), .B(n390), .C(n632), .Y(n392) );
  INVX2 U539 ( .A(n392), .Y(n402) );
  INVX2 U540 ( .A(n632), .Y(n400) );
  MUX2X1 U541 ( .B(temp_sum[0]), .A(N280), .S(n400), .Y(n393) );
  NAND2X1 U542 ( .A(n402), .B(n393), .Y(n590) );
  MUX2X1 U543 ( .B(temp_sum[1]), .A(N281), .S(n400), .Y(n394) );
  NAND2X1 U544 ( .A(n402), .B(n394), .Y(n591) );
  MUX2X1 U545 ( .B(temp_sum[2]), .A(N282), .S(n400), .Y(n395) );
  NAND2X1 U546 ( .A(n402), .B(n395), .Y(n592) );
  MUX2X1 U547 ( .B(temp_sum[3]), .A(N283), .S(n400), .Y(n396) );
  NAND2X1 U548 ( .A(n402), .B(n396), .Y(n593) );
  MUX2X1 U549 ( .B(temp_sum[4]), .A(N284), .S(n400), .Y(n397) );
  NAND2X1 U550 ( .A(n402), .B(n397), .Y(n594) );
  MUX2X1 U551 ( .B(temp_sum[5]), .A(N285), .S(n400), .Y(n398) );
  NAND2X1 U552 ( .A(n402), .B(n398), .Y(n595) );
  MUX2X1 U553 ( .B(temp_sum[6]), .A(N286), .S(n400), .Y(n399) );
  NAND2X1 U554 ( .A(n402), .B(n399), .Y(n596) );
  MUX2X1 U555 ( .B(temp_sum[7]), .A(N287), .S(n400), .Y(n401) );
  NAND2X1 U556 ( .A(n402), .B(n401), .Y(n597) );
  NAND2X1 U557 ( .A(n22), .B(n8), .Y(n617) );
  NAND2X1 U558 ( .A(n9), .B(n18), .Y(n616) );
  NAND2X1 U559 ( .A(n2), .B(n8), .Y(n610) );
  OAI21X1 U560 ( .A(Gx[10]), .B(n610), .C(n632), .Y(n619) );
  INVX2 U561 ( .A(n607), .Y(n403) );
  NOR2X1 U562 ( .A(n404), .B(n403), .Y(n405) );
  OAI21X1 U563 ( .A(n617), .B(n406), .C(n405), .Y(n625) );
  INVX2 U564 ( .A(Gx[10]), .Y(n407) );
  OAI21X1 U565 ( .A(n610), .B(n407), .C(n616), .Y(n624) );
  INVX2 U566 ( .A(n624), .Y(n564) );
  OAI21X1 U567 ( .A(Gy[10]), .B(n617), .C(n616), .Y(n618) );
  INVX2 U568 ( .A(n633), .Y(n565) );
  INVX2 U569 ( .A(n605), .Y(n566) );
  NOR2X1 U570 ( .A(n612), .B(n611), .Y(n613) );
endmodule


module edge_detection_core ( clk, n_rst, i_m1, i_m2, i_m3, i_m4, i_m5, i_m6, 
        i_m7, i_m8, i_m9, i_m10, i_m11, i_m12, i_m13, i_m14, i_m15, i_m16, 
        i_m17, i_m18, i_m19, i_m20, i_m21, i_m22, i_m23, i_m24, i_m25, 
        i_gradient_start, o_gradient_ready, o_processed_sum_1, 
        o_processed_sum_2, o_processed_sum_3, o_processed_sum_4, 
        o_processed_sum_5, o_processed_sum_6, o_processed_sum_7, 
        o_processed_sum_8, o_processed_sum_9 );
  input [7:0] i_m1;
  input [7:0] i_m2;
  input [7:0] i_m3;
  input [7:0] i_m4;
  input [7:0] i_m5;
  input [7:0] i_m6;
  input [7:0] i_m7;
  input [7:0] i_m8;
  input [7:0] i_m9;
  input [7:0] i_m10;
  input [7:0] i_m11;
  input [7:0] i_m12;
  input [7:0] i_m13;
  input [7:0] i_m14;
  input [7:0] i_m15;
  input [7:0] i_m16;
  input [7:0] i_m17;
  input [7:0] i_m18;
  input [7:0] i_m19;
  input [7:0] i_m20;
  input [7:0] i_m21;
  input [7:0] i_m22;
  input [7:0] i_m23;
  input [7:0] i_m24;
  input [7:0] i_m25;
  output [7:0] o_processed_sum_1;
  output [7:0] o_processed_sum_2;
  output [7:0] o_processed_sum_3;
  output [7:0] o_processed_sum_4;
  output [7:0] o_processed_sum_5;
  output [7:0] o_processed_sum_6;
  output [7:0] o_processed_sum_7;
  output [7:0] o_processed_sum_8;
  output [7:0] o_processed_sum_9;
  input clk, n_rst, i_gradient_start;
  output o_gradient_ready;
  wire   temp_gradient_ready_1, temp_gradient_ready_2, temp_gradient_ready_3,
         temp_gradient_ready_4, temp_gradient_ready_5, temp_gradient_ready_6,
         temp_gradient_ready_7, temp_gradient_ready_8, temp_gradient_ready_9,
         n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30;

  AND2X2 U1 ( .A(temp_gradient_ready_7), .B(temp_gradient_ready_6), .Y(n3) );
  NOR2X1 U2 ( .A(n1), .B(n2), .Y(o_gradient_ready) );
  NAND3X1 U3 ( .A(temp_gradient_ready_9), .B(temp_gradient_ready_8), .C(n3), 
        .Y(n2) );
  OR2X1 U4 ( .A(n4), .B(n5), .Y(n1) );
  NAND2X1 U5 ( .A(temp_gradient_ready_5), .B(temp_gradient_ready_4), .Y(n5) );
  NAND3X1 U6 ( .A(temp_gradient_ready_2), .B(temp_gradient_ready_1), .C(
        temp_gradient_ready_3), .Y(n4) );
  edge_detection_8 E1 ( .clk(clk), .n_rst(n30), .i_gradient_start(
        i_gradient_start), .P0(i_m1), .P1(i_m2), .P2(i_m3), .P3(i_m6), .P4(
        i_m7), .P5(i_m8), .P6(i_m11), .P7(i_m12), .P8({n26, n24, n22, n20, n17, 
        n14, n11, n8}), .o_gradient_data_ready(temp_gradient_ready_1), 
        .o_processed_sum(o_processed_sum_1) );
  edge_detection_7 E2 ( .clk(clk), .n_rst(n27), .i_gradient_start(
        i_gradient_start), .P0(i_m2), .P1(i_m3), .P2(i_m4), .P3(i_m7), .P4(
        i_m8), .P5(i_m9), .P6(i_m12), .P7({n26, n24, n22, n20, n17, n14, n11, 
        n8}), .P8(i_m14), .o_gradient_data_ready(temp_gradient_ready_2), 
        .o_processed_sum(o_processed_sum_2) );
  edge_detection_6 E3 ( .clk(clk), .n_rst(n27), .i_gradient_start(
        i_gradient_start), .P0(i_m3), .P1(i_m4), .P2(i_m5), .P3(i_m8), .P4(
        i_m9), .P5(i_m10), .P6({n26, n24, n22, n20, n17, n14, n11, n8}), .P7(
        i_m14), .P8(i_m15), .o_gradient_data_ready(temp_gradient_ready_3), 
        .o_processed_sum(o_processed_sum_3) );
  edge_detection_5 E4 ( .clk(clk), .n_rst(n28), .i_gradient_start(
        i_gradient_start), .P0(i_m6), .P1(i_m7), .P2(i_m8), .P3(i_m11), .P4(
        i_m12), .P5({n26, n24, n22, n20, n17, n14, n11, n8}), .P6(i_m16), .P7(
        i_m17), .P8(i_m18), .o_gradient_data_ready(temp_gradient_ready_4), 
        .o_processed_sum(o_processed_sum_4) );
  edge_detection_4 E5 ( .clk(clk), .n_rst(n28), .i_gradient_start(
        i_gradient_start), .P0(i_m7), .P1(i_m8), .P2(i_m9), .P3(i_m12), .P4({
        n26, n24, n22, n20, n17, n14, n11, n8}), .P5(i_m14), .P6(i_m17), .P7(
        i_m18), .P8(i_m19), .o_gradient_data_ready(temp_gradient_ready_5), 
        .o_processed_sum(o_processed_sum_5) );
  edge_detection_3 E6 ( .clk(clk), .n_rst(n29), .i_gradient_start(
        i_gradient_start), .P0(i_m8), .P1(i_m9), .P2(i_m10), .P3({n26, n24, 
        n22, n20, n17, n14, n11, n8}), .P4(i_m14), .P5(i_m15), .P6(i_m18), 
        .P7(i_m19), .P8(i_m20), .o_gradient_data_ready(temp_gradient_ready_6), 
        .o_processed_sum(o_processed_sum_6) );
  edge_detection_2 E7 ( .clk(clk), .n_rst(n29), .i_gradient_start(
        i_gradient_start), .P0(i_m11), .P1(i_m12), .P2({i_m13[7:5], n19, n16, 
        n13, n10, n7}), .P3(i_m16), .P4(i_m17), .P5(i_m18), .P6(i_m21), .P7(
        i_m22), .P8(i_m23), .o_gradient_data_ready(temp_gradient_ready_7), 
        .o_processed_sum(o_processed_sum_7) );
  edge_detection_1 E8 ( .clk(clk), .n_rst(n30), .i_gradient_start(
        i_gradient_start), .P0(i_m12), .P1({n26, n24, n22, n20, n17, n14, n11, 
        n8}), .P2(i_m14), .P3(i_m17), .P4(i_m18), .P5(i_m19), .P6(i_m22), .P7(
        i_m23), .P8(i_m24), .o_gradient_data_ready(temp_gradient_ready_8), 
        .o_processed_sum(o_processed_sum_8) );
  edge_detection_0 E9 ( .clk(clk), .n_rst(n30), .i_gradient_start(
        i_gradient_start), .P0({n26, n24, n22, n19, n16, n13, n10, n7}), .P1(
        i_m14), .P2(i_m15), .P3(i_m18), .P4(i_m19), .P5(i_m20), .P6(i_m23), 
        .P7(i_m24), .P8(i_m25), .o_gradient_data_ready(temp_gradient_ready_9), 
        .o_processed_sum(o_processed_sum_9) );
  INVX2 U7 ( .A(i_m13[0]), .Y(n6) );
  INVX2 U8 ( .A(n6), .Y(n8) );
  INVX2 U9 ( .A(n6), .Y(n7) );
  INVX2 U10 ( .A(n9), .Y(n11) );
  INVX2 U11 ( .A(n15), .Y(n17) );
  INVX2 U12 ( .A(n12), .Y(n14) );
  INVX2 U13 ( .A(n18), .Y(n20) );
  INVX2 U14 ( .A(n9), .Y(n10) );
  INVX2 U15 ( .A(n15), .Y(n16) );
  INVX2 U16 ( .A(n12), .Y(n13) );
  INVX2 U17 ( .A(n18), .Y(n19) );
  INVX2 U18 ( .A(n21), .Y(n22) );
  INVX2 U19 ( .A(n23), .Y(n24) );
  INVX2 U20 ( .A(n25), .Y(n26) );
  INVX2 U21 ( .A(i_m13[1]), .Y(n9) );
  INVX2 U22 ( .A(i_m13[3]), .Y(n15) );
  INVX2 U23 ( .A(i_m13[2]), .Y(n12) );
  INVX2 U24 ( .A(i_m13[4]), .Y(n18) );
  INVX2 U25 ( .A(i_m13[5]), .Y(n21) );
  INVX2 U26 ( .A(i_m13[6]), .Y(n23) );
  INVX2 U27 ( .A(i_m13[7]), .Y(n25) );
  BUFX2 U28 ( .A(n_rst), .Y(n27) );
  BUFX2 U29 ( .A(n_rst), .Y(n28) );
  BUFX2 U30 ( .A(n_rst), .Y(n29) );
  BUFX2 U31 ( .A(n_rst), .Y(n30) );
endmodule


module buffer_2 ( clk, n_rst, i_processed_sum_1, i_processed_sum_2, 
        i_processed_sum_3, i_processed_sum_4, i_processed_sum_5, 
        i_processed_sum_6, i_processed_sum_7, i_processed_sum_8, 
        i_processed_sum_9, i_save, i_write_complete, o_empty, o_full, 
        o_buffer2_data, o_write_enable );
  input [7:0] i_processed_sum_1;
  input [7:0] i_processed_sum_2;
  input [7:0] i_processed_sum_3;
  input [7:0] i_processed_sum_4;
  input [7:0] i_processed_sum_5;
  input [7:0] i_processed_sum_6;
  input [7:0] i_processed_sum_7;
  input [7:0] i_processed_sum_8;
  input [7:0] i_processed_sum_9;
  output [31:0] o_buffer2_data;
  input clk, n_rst, i_save, i_write_complete;
  output o_empty, o_full, o_write_enable;
  wire   next_empty, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n285, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
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
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n35, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n236, n284, n286,
         n321, n597, n598, n599, n600, n601, n602, n603, n604, n605, n606,
         n607, n608, n609, n610, n611, n612, n613, n614, n615, n616, n617,
         n618, n619, n620, n621, n622, n623, n624, n625, n626, n627, n628,
         n629, n630;
  wire   [7:0] m1;
  wire   [7:0] m2;
  wire   [7:0] m3;
  wire   [7:0] m4;
  wire   [7:0] m5;
  wire   [7:0] m6;
  wire   [7:0] m7;
  wire   [7:0] m8;
  wire   [7:0] m9;
  wire   [5:0] curr;

  DFFSR \curr_reg[0]  ( .D(n115), .CLK(clk), .R(n142), .S(1'b1), .Q(curr[0])
         );
  DFFSR \curr_reg[4]  ( .D(n226), .CLK(clk), .R(n142), .S(1'b1), .Q(curr[4])
         );
  DFFSR \curr_reg[3]  ( .D(n153), .CLK(clk), .R(n142), .S(1'b1), .Q(curr[3])
         );
  DFFSR \curr_reg[1]  ( .D(n273), .CLK(clk), .R(n142), .S(1'b1), .Q(curr[1])
         );
  DFFSR \curr_reg[2]  ( .D(n260), .CLK(clk), .R(n142), .S(1'b1), .Q(curr[2])
         );
  DFFSR \m9_reg[7]  ( .D(n525), .CLK(clk), .R(n142), .S(1'b1), .Q(m9[7]) );
  DFFSR \m9_reg[6]  ( .D(n526), .CLK(clk), .R(n142), .S(1'b1), .Q(m9[6]) );
  DFFSR \m9_reg[5]  ( .D(n527), .CLK(clk), .R(n142), .S(1'b1), .Q(m9[5]) );
  DFFSR \m9_reg[4]  ( .D(n528), .CLK(clk), .R(n142), .S(1'b1), .Q(m9[4]) );
  DFFSR \m9_reg[3]  ( .D(n529), .CLK(clk), .R(n142), .S(1'b1), .Q(m9[3]) );
  DFFSR \m9_reg[2]  ( .D(n530), .CLK(clk), .R(n142), .S(1'b1), .Q(m9[2]) );
  DFFSR \m9_reg[1]  ( .D(n531), .CLK(clk), .R(n142), .S(1'b1), .Q(m9[1]) );
  DFFSR \m9_reg[0]  ( .D(n532), .CLK(clk), .R(n143), .S(1'b1), .Q(m9[0]) );
  DFFSR \m8_reg[7]  ( .D(n533), .CLK(clk), .R(n143), .S(1'b1), .Q(m8[7]) );
  DFFSR \m8_reg[6]  ( .D(n534), .CLK(clk), .R(n143), .S(1'b1), .Q(m8[6]) );
  DFFSR \m8_reg[5]  ( .D(n535), .CLK(clk), .R(n143), .S(1'b1), .Q(m8[5]) );
  DFFSR \m8_reg[4]  ( .D(n536), .CLK(clk), .R(n143), .S(1'b1), .Q(m8[4]) );
  DFFSR \m8_reg[3]  ( .D(n537), .CLK(clk), .R(n143), .S(1'b1), .Q(m8[3]) );
  DFFSR \m8_reg[2]  ( .D(n538), .CLK(clk), .R(n143), .S(1'b1), .Q(m8[2]) );
  DFFSR \m8_reg[1]  ( .D(n539), .CLK(clk), .R(n143), .S(1'b1), .Q(m8[1]) );
  DFFSR \m8_reg[0]  ( .D(n540), .CLK(clk), .R(n143), .S(1'b1), .Q(m8[0]) );
  DFFSR \m7_reg[7]  ( .D(n541), .CLK(clk), .R(n143), .S(1'b1), .Q(m7[7]) );
  DFFSR \m7_reg[6]  ( .D(n542), .CLK(clk), .R(n143), .S(1'b1), .Q(m7[6]) );
  DFFSR \m7_reg[5]  ( .D(n543), .CLK(clk), .R(n143), .S(1'b1), .Q(m7[5]) );
  DFFSR \m7_reg[4]  ( .D(n544), .CLK(clk), .R(n144), .S(1'b1), .Q(m7[4]) );
  DFFSR \m7_reg[3]  ( .D(n545), .CLK(clk), .R(n144), .S(1'b1), .Q(m7[3]) );
  DFFSR \m7_reg[2]  ( .D(n546), .CLK(clk), .R(n144), .S(1'b1), .Q(m7[2]) );
  DFFSR \m7_reg[1]  ( .D(n547), .CLK(clk), .R(n144), .S(1'b1), .Q(m7[1]) );
  DFFSR \m7_reg[0]  ( .D(n548), .CLK(clk), .R(n144), .S(1'b1), .Q(m7[0]) );
  DFFSR \m6_reg[7]  ( .D(n549), .CLK(clk), .R(n144), .S(1'b1), .Q(m6[7]) );
  DFFSR \m6_reg[6]  ( .D(n550), .CLK(clk), .R(n144), .S(1'b1), .Q(m6[6]) );
  DFFSR \m6_reg[5]  ( .D(n551), .CLK(clk), .R(n144), .S(1'b1), .Q(m6[5]) );
  DFFSR \m6_reg[4]  ( .D(n552), .CLK(clk), .R(n144), .S(1'b1), .Q(m6[4]) );
  DFFSR \m6_reg[3]  ( .D(n553), .CLK(clk), .R(n144), .S(1'b1), .Q(m6[3]) );
  DFFSR \m6_reg[2]  ( .D(n554), .CLK(clk), .R(n144), .S(1'b1), .Q(m6[2]) );
  DFFSR \m6_reg[1]  ( .D(n555), .CLK(clk), .R(n144), .S(1'b1), .Q(m6[1]) );
  DFFSR \m6_reg[0]  ( .D(n556), .CLK(clk), .R(n145), .S(1'b1), .Q(m6[0]) );
  DFFSR \m5_reg[7]  ( .D(n557), .CLK(clk), .R(n145), .S(1'b1), .Q(m5[7]) );
  DFFSR \m5_reg[6]  ( .D(n558), .CLK(clk), .R(n145), .S(1'b1), .Q(m5[6]) );
  DFFSR \m5_reg[5]  ( .D(n559), .CLK(clk), .R(n145), .S(1'b1), .Q(m5[5]) );
  DFFSR \m5_reg[4]  ( .D(n560), .CLK(clk), .R(n145), .S(1'b1), .Q(m5[4]) );
  DFFSR \m5_reg[3]  ( .D(n561), .CLK(clk), .R(n145), .S(1'b1), .Q(m5[3]) );
  DFFSR \m5_reg[2]  ( .D(n562), .CLK(clk), .R(n145), .S(1'b1), .Q(m5[2]) );
  DFFSR \m5_reg[1]  ( .D(n563), .CLK(clk), .R(n145), .S(1'b1), .Q(m5[1]) );
  DFFSR \m5_reg[0]  ( .D(n564), .CLK(clk), .R(n145), .S(1'b1), .Q(m5[0]) );
  DFFSR \m4_reg[7]  ( .D(n565), .CLK(clk), .R(n145), .S(1'b1), .Q(m4[7]) );
  DFFSR \m4_reg[6]  ( .D(n566), .CLK(clk), .R(n145), .S(1'b1), .Q(m4[6]) );
  DFFSR \m4_reg[5]  ( .D(n567), .CLK(clk), .R(n145), .S(1'b1), .Q(m4[5]) );
  DFFSR \m4_reg[4]  ( .D(n568), .CLK(clk), .R(n146), .S(1'b1), .Q(m4[4]) );
  DFFSR \m4_reg[3]  ( .D(n569), .CLK(clk), .R(n146), .S(1'b1), .Q(m4[3]) );
  DFFSR \m4_reg[2]  ( .D(n570), .CLK(clk), .R(n146), .S(1'b1), .Q(m4[2]) );
  DFFSR \m4_reg[1]  ( .D(n571), .CLK(clk), .R(n146), .S(1'b1), .Q(m4[1]) );
  DFFSR \m4_reg[0]  ( .D(n572), .CLK(clk), .R(n146), .S(1'b1), .Q(m4[0]) );
  DFFSR \m3_reg[7]  ( .D(n573), .CLK(clk), .R(n146), .S(1'b1), .Q(m3[7]) );
  DFFSR \m3_reg[6]  ( .D(n574), .CLK(clk), .R(n146), .S(1'b1), .Q(m3[6]) );
  DFFSR \m3_reg[5]  ( .D(n575), .CLK(clk), .R(n146), .S(1'b1), .Q(m3[5]) );
  DFFSR \m3_reg[4]  ( .D(n576), .CLK(clk), .R(n146), .S(1'b1), .Q(m3[4]) );
  DFFSR \m3_reg[3]  ( .D(n577), .CLK(clk), .R(n146), .S(1'b1), .Q(m3[3]) );
  DFFSR \m3_reg[2]  ( .D(n578), .CLK(clk), .R(n146), .S(1'b1), .Q(m3[2]) );
  DFFSR \m3_reg[1]  ( .D(n579), .CLK(clk), .R(n146), .S(1'b1), .Q(m3[1]) );
  DFFSR \m3_reg[0]  ( .D(n580), .CLK(clk), .R(n147), .S(1'b1), .Q(m3[0]) );
  DFFSR \m2_reg[7]  ( .D(n581), .CLK(clk), .R(n147), .S(1'b1), .Q(m2[7]) );
  DFFSR \m2_reg[6]  ( .D(n582), .CLK(clk), .R(n147), .S(1'b1), .Q(m2[6]) );
  DFFSR \m2_reg[5]  ( .D(n583), .CLK(clk), .R(n147), .S(1'b1), .Q(m2[5]) );
  DFFSR \m2_reg[4]  ( .D(n584), .CLK(clk), .R(n147), .S(1'b1), .Q(m2[4]) );
  DFFSR \m2_reg[3]  ( .D(n585), .CLK(clk), .R(n147), .S(1'b1), .Q(m2[3]) );
  DFFSR \m2_reg[2]  ( .D(n586), .CLK(clk), .R(n147), .S(1'b1), .Q(m2[2]) );
  DFFSR \m2_reg[1]  ( .D(n587), .CLK(clk), .R(n147), .S(1'b1), .Q(m2[1]) );
  DFFSR \m2_reg[0]  ( .D(n588), .CLK(clk), .R(n147), .S(1'b1), .Q(m2[0]) );
  DFFSR \m1_reg[7]  ( .D(n589), .CLK(clk), .R(n147), .S(1'b1), .Q(m1[7]) );
  DFFSR \m1_reg[6]  ( .D(n590), .CLK(clk), .R(n147), .S(1'b1), .Q(m1[6]) );
  DFFSR \m1_reg[5]  ( .D(n591), .CLK(clk), .R(n147), .S(1'b1), .Q(m1[5]) );
  DFFSR \m1_reg[4]  ( .D(n592), .CLK(clk), .R(n148), .S(1'b1), .Q(m1[4]) );
  DFFSR \m1_reg[3]  ( .D(n593), .CLK(clk), .R(n148), .S(1'b1), .Q(m1[3]) );
  DFFSR \m1_reg[2]  ( .D(n594), .CLK(clk), .R(n148), .S(1'b1), .Q(m1[2]) );
  DFFSR \m1_reg[1]  ( .D(n595), .CLK(clk), .R(n148), .S(1'b1), .Q(m1[1]) );
  DFFSR \m1_reg[0]  ( .D(n596), .CLK(clk), .R(n148), .S(1'b1), .Q(m1[0]) );
  DFFSR o_write_enable_reg ( .D(n170), .CLK(clk), .R(n148), .S(1'b1), .Q(
        o_write_enable) );
  DFFSR o_full_reg ( .D(n281), .CLK(clk), .R(n148), .S(1'b1), .Q(o_full) );
  DFFSR \o_buffer2_data_reg[0]  ( .D(n524), .CLK(clk), .R(n148), .S(1'b1), .Q(
        o_buffer2_data[0]) );
  DFFSR \o_buffer2_data_reg[8]  ( .D(n516), .CLK(clk), .R(n148), .S(1'b1), .Q(
        o_buffer2_data[8]) );
  DFFSR \o_buffer2_data_reg[16]  ( .D(n508), .CLK(clk), .R(n148), .S(1'b1), 
        .Q(o_buffer2_data[16]) );
  DFFSR \o_buffer2_data_reg[24]  ( .D(n500), .CLK(clk), .R(n148), .S(1'b1), 
        .Q(o_buffer2_data[24]) );
  DFFSR \o_buffer2_data_reg[1]  ( .D(n523), .CLK(clk), .R(n148), .S(1'b1), .Q(
        o_buffer2_data[1]) );
  DFFSR \o_buffer2_data_reg[9]  ( .D(n515), .CLK(clk), .R(n149), .S(1'b1), .Q(
        o_buffer2_data[9]) );
  DFFSR \o_buffer2_data_reg[17]  ( .D(n507), .CLK(clk), .R(n149), .S(1'b1), 
        .Q(o_buffer2_data[17]) );
  DFFSR \o_buffer2_data_reg[25]  ( .D(n499), .CLK(clk), .R(n149), .S(1'b1), 
        .Q(o_buffer2_data[25]) );
  DFFSR \o_buffer2_data_reg[2]  ( .D(n522), .CLK(clk), .R(n149), .S(1'b1), .Q(
        o_buffer2_data[2]) );
  DFFSR \o_buffer2_data_reg[10]  ( .D(n514), .CLK(clk), .R(n149), .S(1'b1), 
        .Q(o_buffer2_data[10]) );
  DFFSR \o_buffer2_data_reg[18]  ( .D(n506), .CLK(clk), .R(n149), .S(1'b1), 
        .Q(o_buffer2_data[18]) );
  DFFSR \o_buffer2_data_reg[26]  ( .D(n498), .CLK(clk), .R(n149), .S(1'b1), 
        .Q(o_buffer2_data[26]) );
  DFFSR \o_buffer2_data_reg[3]  ( .D(n521), .CLK(clk), .R(n149), .S(1'b1), .Q(
        o_buffer2_data[3]) );
  DFFSR \o_buffer2_data_reg[11]  ( .D(n513), .CLK(clk), .R(n149), .S(1'b1), 
        .Q(o_buffer2_data[11]) );
  DFFSR \o_buffer2_data_reg[19]  ( .D(n505), .CLK(clk), .R(n149), .S(1'b1), 
        .Q(o_buffer2_data[19]) );
  DFFSR \o_buffer2_data_reg[27]  ( .D(n497), .CLK(clk), .R(n149), .S(1'b1), 
        .Q(o_buffer2_data[27]) );
  DFFSR \o_buffer2_data_reg[4]  ( .D(n520), .CLK(clk), .R(n149), .S(1'b1), .Q(
        o_buffer2_data[4]) );
  DFFSR \o_buffer2_data_reg[12]  ( .D(n512), .CLK(clk), .R(n150), .S(1'b1), 
        .Q(o_buffer2_data[12]) );
  DFFSR \o_buffer2_data_reg[20]  ( .D(n504), .CLK(clk), .R(n150), .S(1'b1), 
        .Q(o_buffer2_data[20]) );
  DFFSR \o_buffer2_data_reg[28]  ( .D(n496), .CLK(clk), .R(n150), .S(1'b1), 
        .Q(o_buffer2_data[28]) );
  DFFSR \o_buffer2_data_reg[5]  ( .D(n519), .CLK(clk), .R(n150), .S(1'b1), .Q(
        o_buffer2_data[5]) );
  DFFSR \o_buffer2_data_reg[13]  ( .D(n511), .CLK(clk), .R(n150), .S(1'b1), 
        .Q(o_buffer2_data[13]) );
  DFFSR \o_buffer2_data_reg[21]  ( .D(n503), .CLK(clk), .R(n150), .S(1'b1), 
        .Q(o_buffer2_data[21]) );
  DFFSR \o_buffer2_data_reg[29]  ( .D(n495), .CLK(clk), .R(n150), .S(1'b1), 
        .Q(o_buffer2_data[29]) );
  DFFSR \o_buffer2_data_reg[6]  ( .D(n518), .CLK(clk), .R(n150), .S(1'b1), .Q(
        o_buffer2_data[6]) );
  DFFSR \o_buffer2_data_reg[14]  ( .D(n510), .CLK(clk), .R(n150), .S(1'b1), 
        .Q(o_buffer2_data[14]) );
  DFFSR \o_buffer2_data_reg[22]  ( .D(n502), .CLK(clk), .R(n150), .S(1'b1), 
        .Q(o_buffer2_data[22]) );
  DFFSR \o_buffer2_data_reg[30]  ( .D(n494), .CLK(clk), .R(n150), .S(1'b1), 
        .Q(o_buffer2_data[30]) );
  DFFSR \o_buffer2_data_reg[7]  ( .D(n517), .CLK(clk), .R(n150), .S(1'b1), .Q(
        o_buffer2_data[7]) );
  DFFSR \o_buffer2_data_reg[15]  ( .D(n509), .CLK(clk), .R(n151), .S(1'b1), 
        .Q(o_buffer2_data[15]) );
  DFFSR \o_buffer2_data_reg[23]  ( .D(n501), .CLK(clk), .R(n151), .S(1'b1), 
        .Q(o_buffer2_data[23]) );
  DFFSR \o_buffer2_data_reg[31]  ( .D(n493), .CLK(clk), .R(n151), .S(1'b1), 
        .Q(o_buffer2_data[31]) );
  DFFSR o_empty_reg ( .D(next_empty), .CLK(clk), .R(1'b1), .S(n151), .Q(
        o_empty) );
  AND2X2 U118 ( .A(n117), .B(n237), .Y(n228) );
  AND2X2 U119 ( .A(n240), .B(n241), .Y(n225) );
  AND2X2 U120 ( .A(n222), .B(n119), .Y(n293) );
  AND2X2 U121 ( .A(n247), .B(n285), .Y(n296) );
  AND2X2 U122 ( .A(n259), .B(n251), .Y(n315) );
  AND2X2 U123 ( .A(n304), .B(n303), .Y(n314) );
  AND2X2 U124 ( .A(n311), .B(n244), .Y(n319) );
  AND2X2 U125 ( .A(n316), .B(n116), .Y(n405) );
  AND2X2 U126 ( .A(n415), .B(n178), .Y(n301) );
  AND2X2 U127 ( .A(n417), .B(n178), .Y(n302) );
  AND2X2 U128 ( .A(n415), .B(curr[0]), .Y(n308) );
  AND2X2 U129 ( .A(curr[0]), .B(n417), .Y(n307) );
  AND2X2 U130 ( .A(n418), .B(curr[0]), .Y(n305) );
  AND2X2 U131 ( .A(n418), .B(n178), .Y(n297) );
  AND2X2 U132 ( .A(n419), .B(curr[0]), .Y(n304) );
  AND2X2 U133 ( .A(n419), .B(n178), .Y(n299) );
  NOR2X1 U241 ( .A(n223), .B(n224), .Y(next_empty) );
  NAND2X1 U242 ( .A(n157), .B(n225), .Y(n224) );
  NAND3X1 U245 ( .A(n227), .B(n228), .C(n229), .Y(n226) );
  NOR2X1 U246 ( .A(n230), .B(n231), .Y(n229) );
  NAND2X1 U247 ( .A(n232), .B(n233), .Y(n231) );
  NAND3X1 U248 ( .A(n234), .B(n159), .C(n235), .Y(n230) );
  NOR2X1 U249 ( .A(n238), .B(n239), .Y(n227) );
  NOR2X1 U251 ( .A(n242), .B(n243), .Y(n241) );
  NAND2X1 U252 ( .A(n244), .B(n245), .Y(n243) );
  NAND3X1 U253 ( .A(n246), .B(n159), .C(n247), .Y(n242) );
  NOR2X1 U254 ( .A(n248), .B(n249), .Y(n240) );
  OAI21X1 U255 ( .A(n250), .B(n154), .C(n156), .Y(n249) );
  NAND3X1 U256 ( .A(n158), .B(n251), .C(n252), .Y(n239) );
  NOR2X1 U257 ( .A(n183), .B(n253), .Y(n252) );
  NAND2X1 U258 ( .A(n254), .B(n255), .Y(n253) );
  NAND3X1 U259 ( .A(n257), .B(n258), .C(n259), .Y(n248) );
  NAND3X1 U261 ( .A(n261), .B(n262), .C(n263), .Y(n260) );
  NOR2X1 U262 ( .A(n264), .B(n265), .Y(n263) );
  NAND2X1 U263 ( .A(n266), .B(n117), .Y(n265) );
  NAND3X1 U264 ( .A(n267), .B(n159), .C(n247), .Y(n264) );
  AOI21X1 U265 ( .A(i_write_complete), .B(n268), .C(n256), .Y(n262) );
  OAI21X1 U266 ( .A(i_write_complete), .B(n269), .C(n270), .Y(n256) );
  NOR2X1 U267 ( .A(n271), .B(n272), .Y(n261) );
  NAND3X1 U269 ( .A(n274), .B(n275), .C(n276), .Y(n273) );
  NOR2X1 U270 ( .A(n277), .B(n278), .Y(n276) );
  NAND2X1 U271 ( .A(n254), .B(n244), .Y(n278) );
  NAND3X1 U272 ( .A(n246), .B(n159), .C(n233), .Y(n277) );
  AOI22X1 U273 ( .A(i_write_complete), .B(n280), .C(n268), .D(n154), .Y(n275)
         );
  NOR2X1 U274 ( .A(n281), .B(n272), .Y(n274) );
  OR2X1 U275 ( .A(n282), .B(n283), .Y(n272) );
  OAI21X1 U276 ( .A(i_write_complete), .B(n250), .C(n116), .Y(n283) );
  NAND3X1 U277 ( .A(n285), .B(n234), .C(n258), .Y(n282) );
  NAND3X1 U280 ( .A(n180), .B(n181), .C(n289), .Y(n288) );
  AOI21X1 U281 ( .A(n279), .B(curr[0]), .C(n290), .Y(n289) );
  NOR2X1 U282 ( .A(n291), .B(n292), .Y(n279) );
  NAND3X1 U283 ( .A(n160), .B(n177), .C(n293), .Y(n292) );
  NOR2X1 U284 ( .A(n294), .B(n295), .Y(n222) );
  NAND3X1 U285 ( .A(n267), .B(n246), .C(n171), .Y(n295) );
  NAND3X1 U286 ( .A(n233), .B(n255), .C(n296), .Y(n290) );
  NAND2X1 U287 ( .A(n297), .B(n298), .Y(n285) );
  NAND2X1 U288 ( .A(n299), .B(n300), .Y(n247) );
  NAND2X1 U289 ( .A(n301), .B(n298), .Y(n255) );
  NAND2X1 U290 ( .A(n302), .B(n303), .Y(n233) );
  NAND2X1 U291 ( .A(n298), .B(n304), .Y(n246) );
  NAND2X1 U292 ( .A(n305), .B(n303), .Y(n267) );
  NAND3X1 U293 ( .A(n234), .B(n270), .C(n235), .Y(n294) );
  NAND2X1 U294 ( .A(n306), .B(n307), .Y(n235) );
  NAND2X1 U295 ( .A(n300), .B(n307), .Y(n270) );
  NAND2X1 U296 ( .A(n303), .B(n308), .Y(n234) );
  NAND2X1 U297 ( .A(n257), .B(n309), .Y(n268) );
  NAND2X1 U298 ( .A(n299), .B(n298), .Y(n257) );
  OAI21X1 U299 ( .A(n178), .B(n310), .C(n311), .Y(n281) );
  NAND3X1 U300 ( .A(n173), .B(n250), .C(n312), .Y(n291) );
  NOR2X1 U301 ( .A(n174), .B(n141), .Y(n312) );
  NAND2X1 U302 ( .A(n302), .B(n300), .Y(n269) );
  NOR2X1 U303 ( .A(n314), .B(n169), .Y(n250) );
  NAND2X1 U304 ( .A(n301), .B(n303), .Y(n237) );
  NAND3X1 U305 ( .A(n266), .B(n232), .C(n315), .Y(n280) );
  NAND2X1 U306 ( .A(n302), .B(n306), .Y(n232) );
  NAND2X1 U307 ( .A(n297), .B(n303), .Y(n266) );
  NAND3X1 U308 ( .A(n116), .B(n316), .C(n309), .Y(n238) );
  NAND2X1 U309 ( .A(n306), .B(n308), .Y(n309) );
  NAND3X1 U310 ( .A(n317), .B(n318), .C(n259), .Y(n271) );
  NAND2X1 U311 ( .A(n305), .B(n300), .Y(n259) );
  NAND3X1 U312 ( .A(n319), .B(n251), .C(n320), .Y(n287) );
  AOI21X1 U313 ( .A(i_save), .B(n141), .C(n314), .Y(n320) );
  NAND2X1 U314 ( .A(n298), .B(n307), .Y(n251) );
  NAND2X1 U315 ( .A(n299), .B(n306), .Y(n311) );
  OAI21X1 U316 ( .A(n168), .B(n136), .C(n322), .Y(n493) );
  OAI21X1 U317 ( .A(n119), .B(n141), .C(o_buffer2_data[31]), .Y(n322) );
  OAI21X1 U318 ( .A(n167), .B(n141), .C(n323), .Y(n494) );
  OAI21X1 U319 ( .A(n119), .B(n141), .C(o_buffer2_data[30]), .Y(n323) );
  OAI21X1 U320 ( .A(n166), .B(n141), .C(n324), .Y(n495) );
  OAI21X1 U321 ( .A(n119), .B(n140), .C(o_buffer2_data[29]), .Y(n324) );
  OAI21X1 U322 ( .A(n165), .B(n140), .C(n325), .Y(n496) );
  OAI21X1 U323 ( .A(n119), .B(n140), .C(o_buffer2_data[28]), .Y(n325) );
  OAI21X1 U324 ( .A(n164), .B(n140), .C(n326), .Y(n497) );
  OAI21X1 U325 ( .A(n119), .B(n140), .C(o_buffer2_data[27]), .Y(n326) );
  OAI21X1 U326 ( .A(n163), .B(n140), .C(n327), .Y(n498) );
  OAI21X1 U327 ( .A(n119), .B(n140), .C(o_buffer2_data[26]), .Y(n327) );
  OAI21X1 U328 ( .A(n162), .B(n140), .C(n328), .Y(n499) );
  OAI21X1 U329 ( .A(n118), .B(n140), .C(o_buffer2_data[25]), .Y(n328) );
  OAI21X1 U330 ( .A(n161), .B(n140), .C(n329), .Y(n500) );
  OAI21X1 U331 ( .A(n118), .B(n140), .C(o_buffer2_data[24]), .Y(n329) );
  OAI21X1 U332 ( .A(n168), .B(n140), .C(n330), .Y(n501) );
  OAI21X1 U333 ( .A(n118), .B(n139), .C(o_buffer2_data[23]), .Y(n330) );
  OAI21X1 U334 ( .A(n167), .B(n139), .C(n331), .Y(n502) );
  OAI21X1 U335 ( .A(n118), .B(n139), .C(o_buffer2_data[22]), .Y(n331) );
  OAI21X1 U336 ( .A(n166), .B(n139), .C(n332), .Y(n503) );
  OAI21X1 U337 ( .A(n118), .B(n139), .C(o_buffer2_data[21]), .Y(n332) );
  OAI21X1 U338 ( .A(n165), .B(n139), .C(n333), .Y(n504) );
  OAI21X1 U339 ( .A(n118), .B(n139), .C(o_buffer2_data[20]), .Y(n333) );
  OAI21X1 U340 ( .A(n164), .B(n139), .C(n334), .Y(n505) );
  OAI21X1 U341 ( .A(n118), .B(n139), .C(o_buffer2_data[19]), .Y(n334) );
  OAI21X1 U342 ( .A(n163), .B(n139), .C(n335), .Y(n506) );
  OAI21X1 U343 ( .A(n118), .B(n139), .C(o_buffer2_data[18]), .Y(n335) );
  OAI21X1 U344 ( .A(n162), .B(n139), .C(n336), .Y(n507) );
  OAI21X1 U345 ( .A(n118), .B(n138), .C(o_buffer2_data[17]), .Y(n336) );
  OAI21X1 U346 ( .A(n161), .B(n138), .C(n337), .Y(n508) );
  OAI21X1 U347 ( .A(n118), .B(n138), .C(o_buffer2_data[16]), .Y(n337) );
  OAI21X1 U348 ( .A(n168), .B(n138), .C(n338), .Y(n509) );
  OAI21X1 U349 ( .A(n118), .B(n138), .C(o_buffer2_data[15]), .Y(n338) );
  OAI21X1 U350 ( .A(n167), .B(n138), .C(n339), .Y(n510) );
  OAI21X1 U351 ( .A(n118), .B(n138), .C(o_buffer2_data[14]), .Y(n339) );
  OAI21X1 U352 ( .A(n166), .B(n138), .C(n340), .Y(n511) );
  OAI21X1 U353 ( .A(n118), .B(n138), .C(o_buffer2_data[13]), .Y(n340) );
  OAI21X1 U354 ( .A(n165), .B(n138), .C(n341), .Y(n512) );
  OAI21X1 U355 ( .A(n118), .B(n138), .C(o_buffer2_data[12]), .Y(n341) );
  OAI21X1 U356 ( .A(n164), .B(n137), .C(n342), .Y(n513) );
  OAI21X1 U357 ( .A(n118), .B(n137), .C(o_buffer2_data[11]), .Y(n342) );
  OAI21X1 U358 ( .A(n163), .B(n137), .C(n343), .Y(n514) );
  OAI21X1 U359 ( .A(n118), .B(n137), .C(o_buffer2_data[10]), .Y(n343) );
  OAI21X1 U360 ( .A(n162), .B(n137), .C(n344), .Y(n515) );
  OAI21X1 U361 ( .A(n118), .B(n137), .C(o_buffer2_data[9]), .Y(n344) );
  OAI21X1 U362 ( .A(n161), .B(n137), .C(n345), .Y(n516) );
  OAI21X1 U363 ( .A(n118), .B(n137), .C(o_buffer2_data[8]), .Y(n345) );
  OAI21X1 U364 ( .A(n168), .B(n137), .C(n346), .Y(n517) );
  OAI21X1 U365 ( .A(n118), .B(n137), .C(o_buffer2_data[7]), .Y(n346) );
  NAND3X1 U366 ( .A(n348), .B(n349), .C(n350), .Y(n347) );
  NOR2X1 U367 ( .A(n351), .B(n352), .Y(n350) );
  OAI22X1 U368 ( .A(n316), .B(n220), .C(n117), .D(n212), .Y(n352) );
  OAI21X1 U369 ( .A(n116), .B(n204), .C(n353), .Y(n351) );
  AOI22X1 U370 ( .A(m9[7]), .B(n183), .C(m8[7]), .D(n172), .Y(n353) );
  AOI22X1 U371 ( .A(m4[7]), .B(n175), .C(m3[7]), .D(n182), .Y(n349) );
  AOI22X1 U372 ( .A(m2[7]), .B(n176), .C(m1[7]), .D(n179), .Y(n348) );
  OAI21X1 U373 ( .A(n167), .B(n138), .C(n354), .Y(n518) );
  OAI21X1 U374 ( .A(n118), .B(n137), .C(o_buffer2_data[6]), .Y(n354) );
  NAND3X1 U375 ( .A(n356), .B(n357), .C(n358), .Y(n355) );
  NOR2X1 U376 ( .A(n359), .B(n360), .Y(n358) );
  OAI22X1 U377 ( .A(n316), .B(n221), .C(n117), .D(n213), .Y(n360) );
  OAI21X1 U378 ( .A(n116), .B(n205), .C(n361), .Y(n359) );
  AOI22X1 U379 ( .A(m9[6]), .B(n183), .C(m8[6]), .D(n172), .Y(n361) );
  AOI22X1 U380 ( .A(m4[6]), .B(n175), .C(m3[6]), .D(n182), .Y(n357) );
  AOI22X1 U381 ( .A(m2[6]), .B(n176), .C(m1[6]), .D(n179), .Y(n356) );
  OAI21X1 U382 ( .A(n166), .B(n137), .C(n362), .Y(n519) );
  OAI21X1 U383 ( .A(n118), .B(n136), .C(o_buffer2_data[5]), .Y(n362) );
  NAND3X1 U384 ( .A(n364), .B(n365), .C(n366), .Y(n363) );
  NOR2X1 U385 ( .A(n367), .B(n368), .Y(n366) );
  OAI22X1 U386 ( .A(n316), .B(n236), .C(n117), .D(n214), .Y(n368) );
  OAI21X1 U387 ( .A(n116), .B(n206), .C(n369), .Y(n367) );
  AOI22X1 U388 ( .A(m9[5]), .B(n183), .C(m8[5]), .D(n172), .Y(n369) );
  AOI22X1 U389 ( .A(m4[5]), .B(n175), .C(m3[5]), .D(n182), .Y(n365) );
  AOI22X1 U390 ( .A(m2[5]), .B(n176), .C(m1[5]), .D(n179), .Y(n364) );
  OAI21X1 U391 ( .A(n165), .B(n136), .C(n370), .Y(n520) );
  OAI21X1 U392 ( .A(n118), .B(n136), .C(o_buffer2_data[4]), .Y(n370) );
  NAND3X1 U393 ( .A(n372), .B(n373), .C(n374), .Y(n371) );
  NOR2X1 U394 ( .A(n375), .B(n376), .Y(n374) );
  OAI22X1 U395 ( .A(n316), .B(n284), .C(n117), .D(n215), .Y(n376) );
  OAI21X1 U396 ( .A(n116), .B(n207), .C(n377), .Y(n375) );
  AOI22X1 U397 ( .A(m9[4]), .B(n183), .C(m8[4]), .D(n172), .Y(n377) );
  AOI22X1 U398 ( .A(m4[4]), .B(n175), .C(m3[4]), .D(n182), .Y(n373) );
  AOI22X1 U399 ( .A(m2[4]), .B(n176), .C(m1[4]), .D(n179), .Y(n372) );
  OAI21X1 U400 ( .A(n164), .B(n136), .C(n378), .Y(n521) );
  OAI21X1 U401 ( .A(n118), .B(n136), .C(o_buffer2_data[3]), .Y(n378) );
  NAND3X1 U402 ( .A(n380), .B(n381), .C(n382), .Y(n379) );
  NOR2X1 U403 ( .A(n383), .B(n384), .Y(n382) );
  OAI22X1 U404 ( .A(n316), .B(n286), .C(n117), .D(n216), .Y(n384) );
  OAI21X1 U405 ( .A(n116), .B(n208), .C(n385), .Y(n383) );
  AOI22X1 U406 ( .A(m9[3]), .B(n183), .C(m8[3]), .D(n172), .Y(n385) );
  AOI22X1 U407 ( .A(m4[3]), .B(n175), .C(m3[3]), .D(n182), .Y(n381) );
  AOI22X1 U408 ( .A(m2[3]), .B(n176), .C(m1[3]), .D(n179), .Y(n380) );
  OAI21X1 U409 ( .A(n163), .B(n136), .C(n386), .Y(n522) );
  OAI21X1 U410 ( .A(n118), .B(n136), .C(o_buffer2_data[2]), .Y(n386) );
  NAND3X1 U411 ( .A(n388), .B(n389), .C(n390), .Y(n387) );
  NOR2X1 U412 ( .A(n391), .B(n392), .Y(n390) );
  OAI22X1 U413 ( .A(n316), .B(n321), .C(n117), .D(n217), .Y(n392) );
  OAI21X1 U414 ( .A(n116), .B(n209), .C(n393), .Y(n391) );
  AOI22X1 U415 ( .A(m9[2]), .B(n183), .C(m8[2]), .D(n172), .Y(n393) );
  AOI22X1 U416 ( .A(m4[2]), .B(n175), .C(m3[2]), .D(n182), .Y(n389) );
  AOI22X1 U417 ( .A(m2[2]), .B(n176), .C(m1[2]), .D(n179), .Y(n388) );
  OAI21X1 U418 ( .A(n162), .B(n136), .C(n394), .Y(n523) );
  OAI21X1 U419 ( .A(n118), .B(n136), .C(o_buffer2_data[1]), .Y(n394) );
  NAND3X1 U420 ( .A(n396), .B(n397), .C(n398), .Y(n395) );
  NOR2X1 U421 ( .A(n399), .B(n400), .Y(n398) );
  OAI22X1 U422 ( .A(n316), .B(n597), .C(n117), .D(n218), .Y(n400) );
  OAI21X1 U423 ( .A(n116), .B(n210), .C(n401), .Y(n399) );
  AOI22X1 U424 ( .A(m9[1]), .B(n183), .C(m8[1]), .D(n172), .Y(n401) );
  AOI22X1 U425 ( .A(m4[1]), .B(n175), .C(m3[1]), .D(n182), .Y(n397) );
  AOI22X1 U426 ( .A(m2[1]), .B(n176), .C(m1[1]), .D(n179), .Y(n396) );
  OAI21X1 U427 ( .A(n161), .B(n136), .C(n402), .Y(n524) );
  OAI21X1 U428 ( .A(n118), .B(n136), .C(o_buffer2_data[0]), .Y(n402) );
  NAND3X1 U429 ( .A(n404), .B(n405), .C(n406), .Y(n403) );
  NOR2X1 U430 ( .A(n407), .B(n408), .Y(n406) );
  NAND2X1 U431 ( .A(n258), .B(n244), .Y(n408) );
  NAND3X1 U432 ( .A(n318), .B(n117), .C(n245), .Y(n407) );
  NOR2X1 U433 ( .A(n172), .B(n183), .Y(n404) );
  NAND3X1 U434 ( .A(n410), .B(n411), .C(n412), .Y(n409) );
  NOR2X1 U435 ( .A(n413), .B(n414), .Y(n412) );
  OAI22X1 U436 ( .A(n316), .B(n598), .C(n117), .D(n219), .Y(n414) );
  NAND2X1 U438 ( .A(n304), .B(n300), .Y(n316) );
  OAI21X1 U439 ( .A(n116), .B(n211), .C(n416), .Y(n413) );
  AOI22X1 U440 ( .A(m9[0]), .B(n183), .C(m8[0]), .D(n172), .Y(n416) );
  NAND2X1 U441 ( .A(n302), .B(n298), .Y(n254) );
  NAND2X1 U442 ( .A(n298), .B(n308), .Y(n317) );
  NOR2X1 U443 ( .A(n186), .B(n184), .Y(n415) );
  NOR2X1 U445 ( .A(n184), .B(curr[1]), .Y(n417) );
  AOI22X1 U446 ( .A(m4[0]), .B(n175), .C(m3[0]), .D(n182), .Y(n411) );
  NAND2X1 U447 ( .A(n305), .B(n298), .Y(n244) );
  NOR2X1 U448 ( .A(n185), .B(curr[2]), .Y(n298) );
  NAND2X1 U449 ( .A(n297), .B(n300), .Y(n258) );
  NOR2X1 U450 ( .A(n185), .B(n187), .Y(n300) );
  AOI22X1 U451 ( .A(m2[0]), .B(n176), .C(m1[0]), .D(n179), .Y(n410) );
  NAND2X1 U452 ( .A(n304), .B(n306), .Y(n318) );
  NAND2X1 U453 ( .A(n299), .B(n303), .Y(n245) );
  NOR2X1 U454 ( .A(n187), .B(curr[3]), .Y(n303) );
  NOR2X1 U455 ( .A(n186), .B(curr[4]), .Y(n419) );
  OAI21X1 U456 ( .A(n126), .B(n188), .C(n421), .Y(n525) );
  NAND2X1 U457 ( .A(i_processed_sum_9[7]), .B(n133), .Y(n421) );
  OAI21X1 U458 ( .A(n124), .B(n189), .C(n422), .Y(n526) );
  NAND2X1 U459 ( .A(i_processed_sum_9[6]), .B(n133), .Y(n422) );
  OAI21X1 U460 ( .A(n124), .B(n190), .C(n423), .Y(n527) );
  NAND2X1 U461 ( .A(i_processed_sum_9[5]), .B(n133), .Y(n423) );
  OAI21X1 U462 ( .A(n124), .B(n191), .C(n424), .Y(n528) );
  NAND2X1 U463 ( .A(i_processed_sum_9[4]), .B(n133), .Y(n424) );
  OAI21X1 U464 ( .A(n124), .B(n192), .C(n425), .Y(n529) );
  NAND2X1 U465 ( .A(i_processed_sum_9[3]), .B(n133), .Y(n425) );
  OAI21X1 U466 ( .A(n124), .B(n193), .C(n426), .Y(n530) );
  NAND2X1 U467 ( .A(i_processed_sum_9[2]), .B(n133), .Y(n426) );
  OAI21X1 U468 ( .A(n124), .B(n194), .C(n427), .Y(n531) );
  NAND2X1 U469 ( .A(i_processed_sum_9[1]), .B(n132), .Y(n427) );
  OAI21X1 U470 ( .A(n124), .B(n195), .C(n428), .Y(n532) );
  NAND2X1 U471 ( .A(i_processed_sum_9[0]), .B(n132), .Y(n428) );
  OAI21X1 U472 ( .A(n124), .B(n196), .C(n429), .Y(n533) );
  NAND2X1 U473 ( .A(i_processed_sum_8[7]), .B(n132), .Y(n429) );
  OAI21X1 U474 ( .A(n124), .B(n197), .C(n430), .Y(n534) );
  NAND2X1 U475 ( .A(i_processed_sum_8[6]), .B(n132), .Y(n430) );
  OAI21X1 U476 ( .A(n124), .B(n198), .C(n431), .Y(n535) );
  NAND2X1 U477 ( .A(i_processed_sum_8[5]), .B(n132), .Y(n431) );
  OAI21X1 U478 ( .A(n124), .B(n199), .C(n432), .Y(n536) );
  NAND2X1 U479 ( .A(i_processed_sum_8[4]), .B(n132), .Y(n432) );
  OAI21X1 U480 ( .A(n124), .B(n200), .C(n433), .Y(n537) );
  NAND2X1 U481 ( .A(i_processed_sum_8[3]), .B(n132), .Y(n433) );
  OAI21X1 U482 ( .A(n124), .B(n201), .C(n434), .Y(n538) );
  NAND2X1 U483 ( .A(i_processed_sum_8[2]), .B(n132), .Y(n434) );
  OAI21X1 U484 ( .A(n125), .B(n202), .C(n435), .Y(n539) );
  NAND2X1 U485 ( .A(i_processed_sum_8[1]), .B(n132), .Y(n435) );
  OAI21X1 U486 ( .A(n125), .B(n203), .C(n436), .Y(n540) );
  NAND2X1 U487 ( .A(i_processed_sum_8[0]), .B(n132), .Y(n436) );
  OAI21X1 U488 ( .A(n125), .B(n204), .C(n437), .Y(n541) );
  NAND2X1 U489 ( .A(i_processed_sum_7[7]), .B(n132), .Y(n437) );
  OAI21X1 U490 ( .A(n125), .B(n205), .C(n438), .Y(n542) );
  NAND2X1 U491 ( .A(i_processed_sum_7[6]), .B(n131), .Y(n438) );
  OAI21X1 U492 ( .A(n125), .B(n206), .C(n439), .Y(n543) );
  NAND2X1 U493 ( .A(i_processed_sum_7[5]), .B(n131), .Y(n439) );
  OAI21X1 U494 ( .A(n125), .B(n207), .C(n440), .Y(n544) );
  NAND2X1 U495 ( .A(i_processed_sum_7[4]), .B(n132), .Y(n440) );
  OAI21X1 U496 ( .A(n125), .B(n208), .C(n441), .Y(n545) );
  NAND2X1 U497 ( .A(i_processed_sum_7[3]), .B(n131), .Y(n441) );
  OAI21X1 U498 ( .A(n125), .B(n209), .C(n442), .Y(n546) );
  NAND2X1 U499 ( .A(i_processed_sum_7[2]), .B(n131), .Y(n442) );
  OAI21X1 U500 ( .A(n125), .B(n210), .C(n443), .Y(n547) );
  NAND2X1 U501 ( .A(i_processed_sum_7[1]), .B(n131), .Y(n443) );
  OAI21X1 U502 ( .A(n125), .B(n211), .C(n444), .Y(n548) );
  NAND2X1 U503 ( .A(i_processed_sum_7[0]), .B(n131), .Y(n444) );
  OAI21X1 U504 ( .A(n125), .B(n212), .C(n445), .Y(n549) );
  NAND2X1 U505 ( .A(i_processed_sum_6[7]), .B(n131), .Y(n445) );
  OAI21X1 U506 ( .A(n125), .B(n213), .C(n446), .Y(n550) );
  NAND2X1 U507 ( .A(i_processed_sum_6[6]), .B(n131), .Y(n446) );
  OAI21X1 U508 ( .A(n125), .B(n214), .C(n447), .Y(n551) );
  NAND2X1 U509 ( .A(i_processed_sum_6[5]), .B(n131), .Y(n447) );
  OAI21X1 U510 ( .A(n126), .B(n215), .C(n448), .Y(n552) );
  NAND2X1 U511 ( .A(i_processed_sum_6[4]), .B(n130), .Y(n448) );
  OAI21X1 U512 ( .A(n126), .B(n216), .C(n449), .Y(n553) );
  NAND2X1 U513 ( .A(i_processed_sum_6[3]), .B(n131), .Y(n449) );
  OAI21X1 U514 ( .A(n126), .B(n217), .C(n450), .Y(n554) );
  NAND2X1 U515 ( .A(i_processed_sum_6[2]), .B(n130), .Y(n450) );
  OAI21X1 U516 ( .A(n126), .B(n218), .C(n451), .Y(n555) );
  NAND2X1 U517 ( .A(i_processed_sum_6[1]), .B(n130), .Y(n451) );
  OAI21X1 U518 ( .A(n126), .B(n219), .C(n452), .Y(n556) );
  NAND2X1 U519 ( .A(i_processed_sum_6[0]), .B(n131), .Y(n452) );
  OAI21X1 U520 ( .A(n126), .B(n220), .C(n453), .Y(n557) );
  NAND2X1 U521 ( .A(i_processed_sum_5[7]), .B(n130), .Y(n453) );
  OAI21X1 U522 ( .A(n126), .B(n221), .C(n454), .Y(n558) );
  NAND2X1 U523 ( .A(i_processed_sum_5[6]), .B(n130), .Y(n454) );
  OAI21X1 U524 ( .A(n126), .B(n236), .C(n455), .Y(n559) );
  NAND2X1 U525 ( .A(i_processed_sum_5[5]), .B(n131), .Y(n455) );
  OAI21X1 U526 ( .A(n126), .B(n284), .C(n456), .Y(n560) );
  NAND2X1 U527 ( .A(i_processed_sum_5[4]), .B(n130), .Y(n456) );
  OAI21X1 U528 ( .A(n127), .B(n286), .C(n457), .Y(n561) );
  NAND2X1 U529 ( .A(i_processed_sum_5[3]), .B(n130), .Y(n457) );
  OAI21X1 U530 ( .A(n126), .B(n321), .C(n458), .Y(n562) );
  NAND2X1 U531 ( .A(i_processed_sum_5[2]), .B(n130), .Y(n458) );
  OAI21X1 U532 ( .A(n126), .B(n597), .C(n459), .Y(n563) );
  NAND2X1 U533 ( .A(i_processed_sum_5[1]), .B(n130), .Y(n459) );
  OAI21X1 U534 ( .A(n126), .B(n598), .C(n460), .Y(n564) );
  NAND2X1 U535 ( .A(i_processed_sum_5[0]), .B(n129), .Y(n460) );
  OAI21X1 U536 ( .A(n127), .B(n599), .C(n461), .Y(n565) );
  NAND2X1 U537 ( .A(i_processed_sum_4[7]), .B(n130), .Y(n461) );
  OAI21X1 U538 ( .A(n127), .B(n600), .C(n462), .Y(n566) );
  NAND2X1 U539 ( .A(i_processed_sum_4[6]), .B(n129), .Y(n462) );
  OAI21X1 U540 ( .A(n127), .B(n601), .C(n463), .Y(n567) );
  NAND2X1 U541 ( .A(i_processed_sum_4[5]), .B(n129), .Y(n463) );
  OAI21X1 U542 ( .A(n127), .B(n602), .C(n464), .Y(n568) );
  NAND2X1 U543 ( .A(i_processed_sum_4[4]), .B(n130), .Y(n464) );
  OAI21X1 U544 ( .A(n127), .B(n603), .C(n465), .Y(n569) );
  NAND2X1 U545 ( .A(i_processed_sum_4[3]), .B(n129), .Y(n465) );
  OAI21X1 U546 ( .A(n127), .B(n604), .C(n466), .Y(n570) );
  NAND2X1 U547 ( .A(i_processed_sum_4[2]), .B(n129), .Y(n466) );
  OAI21X1 U548 ( .A(n127), .B(n605), .C(n467), .Y(n571) );
  NAND2X1 U549 ( .A(i_processed_sum_4[1]), .B(n130), .Y(n467) );
  OAI21X1 U550 ( .A(n127), .B(n606), .C(n468), .Y(n572) );
  NAND2X1 U551 ( .A(i_processed_sum_4[0]), .B(n130), .Y(n468) );
  OAI21X1 U552 ( .A(n127), .B(n607), .C(n469), .Y(n573) );
  NAND2X1 U553 ( .A(i_processed_sum_3[7]), .B(n129), .Y(n469) );
  OAI21X1 U554 ( .A(n127), .B(n608), .C(n470), .Y(n574) );
  NAND2X1 U555 ( .A(i_processed_sum_3[6]), .B(n129), .Y(n470) );
  OAI21X1 U556 ( .A(n128), .B(n609), .C(n471), .Y(n575) );
  NAND2X1 U557 ( .A(i_processed_sum_3[5]), .B(n130), .Y(n471) );
  OAI21X1 U558 ( .A(n128), .B(n610), .C(n472), .Y(n576) );
  NAND2X1 U559 ( .A(i_processed_sum_3[4]), .B(n129), .Y(n472) );
  OAI21X1 U560 ( .A(n127), .B(n611), .C(n473), .Y(n577) );
  NAND2X1 U561 ( .A(i_processed_sum_3[3]), .B(n131), .Y(n473) );
  OAI21X1 U562 ( .A(n128), .B(n612), .C(n474), .Y(n578) );
  NAND2X1 U563 ( .A(i_processed_sum_3[2]), .B(n130), .Y(n474) );
  OAI21X1 U564 ( .A(n128), .B(n613), .C(n475), .Y(n579) );
  NAND2X1 U565 ( .A(i_processed_sum_3[1]), .B(n130), .Y(n475) );
  OAI21X1 U566 ( .A(n128), .B(n614), .C(n476), .Y(n580) );
  NAND2X1 U567 ( .A(i_processed_sum_3[0]), .B(n130), .Y(n476) );
  OAI21X1 U568 ( .A(n128), .B(n615), .C(n477), .Y(n581) );
  NAND2X1 U569 ( .A(i_processed_sum_2[7]), .B(n131), .Y(n477) );
  OAI21X1 U570 ( .A(n128), .B(n616), .C(n478), .Y(n582) );
  NAND2X1 U571 ( .A(i_processed_sum_2[6]), .B(n130), .Y(n478) );
  OAI21X1 U572 ( .A(n128), .B(n617), .C(n479), .Y(n583) );
  NAND2X1 U573 ( .A(i_processed_sum_2[5]), .B(n131), .Y(n479) );
  OAI21X1 U574 ( .A(n128), .B(n618), .C(n480), .Y(n584) );
  NAND2X1 U575 ( .A(i_processed_sum_2[4]), .B(n131), .Y(n480) );
  OAI21X1 U576 ( .A(n129), .B(n619), .C(n481), .Y(n585) );
  NAND2X1 U577 ( .A(i_processed_sum_2[3]), .B(n131), .Y(n481) );
  OAI21X1 U578 ( .A(n128), .B(n620), .C(n482), .Y(n586) );
  NAND2X1 U579 ( .A(i_processed_sum_2[2]), .B(n131), .Y(n482) );
  OAI21X1 U580 ( .A(n127), .B(n621), .C(n483), .Y(n587) );
  NAND2X1 U581 ( .A(i_processed_sum_2[1]), .B(n132), .Y(n483) );
  OAI21X1 U582 ( .A(n129), .B(n622), .C(n484), .Y(n588) );
  NAND2X1 U583 ( .A(i_processed_sum_2[0]), .B(n132), .Y(n484) );
  OAI21X1 U584 ( .A(n128), .B(n623), .C(n485), .Y(n589) );
  NAND2X1 U585 ( .A(i_processed_sum_1[7]), .B(n132), .Y(n485) );
  OAI21X1 U586 ( .A(n129), .B(n624), .C(n486), .Y(n590) );
  NAND2X1 U587 ( .A(i_processed_sum_1[6]), .B(n132), .Y(n486) );
  OAI21X1 U588 ( .A(n129), .B(n625), .C(n487), .Y(n591) );
  NAND2X1 U589 ( .A(i_processed_sum_1[5]), .B(n132), .Y(n487) );
  OAI21X1 U590 ( .A(n128), .B(n626), .C(n488), .Y(n592) );
  NAND2X1 U591 ( .A(i_processed_sum_1[4]), .B(n132), .Y(n488) );
  OAI21X1 U592 ( .A(n129), .B(n627), .C(n489), .Y(n593) );
  NAND2X1 U593 ( .A(i_processed_sum_1[3]), .B(n133), .Y(n489) );
  OAI21X1 U594 ( .A(n129), .B(n628), .C(n490), .Y(n594) );
  NAND2X1 U595 ( .A(i_processed_sum_1[2]), .B(n133), .Y(n490) );
  OAI21X1 U596 ( .A(n128), .B(n629), .C(n491), .Y(n595) );
  NAND2X1 U597 ( .A(i_processed_sum_1[1]), .B(n133), .Y(n491) );
  OAI21X1 U598 ( .A(n129), .B(n630), .C(n492), .Y(n596) );
  NAND2X1 U599 ( .A(i_processed_sum_1[0]), .B(n133), .Y(n492) );
  NOR2X1 U600 ( .A(n141), .B(n310), .Y(n420) );
  NOR2X1 U602 ( .A(n310), .B(curr[0]), .Y(n313) );
  NAND2X1 U603 ( .A(n418), .B(n306), .Y(n310) );
  NOR2X1 U604 ( .A(curr[3]), .B(curr[2]), .Y(n306) );
  NOR2X1 U605 ( .A(curr[4]), .B(curr[1]), .Y(n418) );
  AND2X1 U37 ( .A(n301), .B(n306), .Y(n35) );
  AND2X2 U116 ( .A(n303), .B(n307), .Y(n114) );
  OR2X2 U117 ( .A(n287), .B(n288), .Y(n115) );
  BUFX2 U134 ( .A(n121), .Y(n128) );
  BUFX2 U135 ( .A(n121), .Y(n127) );
  BUFX2 U136 ( .A(n120), .Y(n125) );
  BUFX2 U137 ( .A(n120), .Y(n124) );
  BUFX2 U138 ( .A(n120), .Y(n126) );
  BUFX2 U139 ( .A(n121), .Y(n129) );
  BUFX2 U140 ( .A(n122), .Y(n130) );
  BUFX2 U141 ( .A(n122), .Y(n131) );
  BUFX2 U142 ( .A(n122), .Y(n132) );
  INVX2 U143 ( .A(n403), .Y(n118) );
  INVX2 U144 ( .A(n403), .Y(n119) );
  BUFX2 U145 ( .A(n123), .Y(n133) );
  BUFX2 U146 ( .A(n420), .Y(n123) );
  BUFX2 U147 ( .A(n420), .Y(n122) );
  BUFX2 U148 ( .A(n420), .Y(n121) );
  BUFX2 U149 ( .A(n420), .Y(n120) );
  INVX2 U150 ( .A(n317), .Y(n183) );
  INVX2 U151 ( .A(n254), .Y(n172) );
  BUFX2 U152 ( .A(n135), .Y(n141) );
  BUFX2 U153 ( .A(n135), .Y(n139) );
  BUFX2 U154 ( .A(n134), .Y(n136) );
  BUFX2 U155 ( .A(n134), .Y(n138) );
  BUFX2 U156 ( .A(n135), .Y(n140) );
  BUFX2 U157 ( .A(n134), .Y(n137) );
  INVX2 U158 ( .A(n114), .Y(n116) );
  INVX2 U159 ( .A(n35), .Y(n117) );
  BUFX2 U160 ( .A(n313), .Y(n135) );
  BUFX2 U161 ( .A(n313), .Y(n134) );
  BUFX2 U162 ( .A(n_rst), .Y(n150) );
  BUFX2 U163 ( .A(n_rst), .Y(n149) );
  BUFX2 U164 ( .A(n_rst), .Y(n148) );
  BUFX2 U165 ( .A(n_rst), .Y(n147) );
  BUFX2 U166 ( .A(n_rst), .Y(n146) );
  BUFX2 U167 ( .A(n_rst), .Y(n145) );
  BUFX2 U168 ( .A(n_rst), .Y(n144) );
  BUFX2 U169 ( .A(n_rst), .Y(n143) );
  BUFX2 U170 ( .A(n_rst), .Y(n142) );
  BUFX2 U171 ( .A(n_rst), .Y(n151) );
  INVX2 U172 ( .A(n273), .Y(n152) );
  INVX2 U173 ( .A(n225), .Y(n153) );
  INVX2 U174 ( .A(i_write_complete), .Y(n154) );
  INVX2 U175 ( .A(n260), .Y(n155) );
  INVX2 U176 ( .A(n239), .Y(n156) );
  INVX2 U177 ( .A(n226), .Y(n157) );
  INVX2 U178 ( .A(n256), .Y(n158) );
  INVX2 U179 ( .A(n279), .Y(n159) );
  INVX2 U180 ( .A(n281), .Y(n160) );
  INVX2 U181 ( .A(n409), .Y(n161) );
  INVX2 U182 ( .A(n395), .Y(n162) );
  INVX2 U183 ( .A(n387), .Y(n163) );
  INVX2 U184 ( .A(n379), .Y(n164) );
  INVX2 U185 ( .A(n371), .Y(n165) );
  INVX2 U186 ( .A(n363), .Y(n166) );
  INVX2 U187 ( .A(n355), .Y(n167) );
  INVX2 U188 ( .A(n347), .Y(n168) );
  INVX2 U189 ( .A(n237), .Y(n169) );
  INVX2 U190 ( .A(n222), .Y(n170) );
  INVX2 U191 ( .A(n290), .Y(n171) );
  INVX2 U192 ( .A(n280), .Y(n173) );
  INVX2 U193 ( .A(n269), .Y(n174) );
  INVX2 U194 ( .A(n258), .Y(n175) );
  INVX2 U195 ( .A(n245), .Y(n176) );
  INVX2 U196 ( .A(n268), .Y(n177) );
  INVX2 U197 ( .A(curr[0]), .Y(n178) );
  INVX2 U198 ( .A(n318), .Y(n179) );
  INVX2 U199 ( .A(n271), .Y(n180) );
  INVX2 U200 ( .A(n238), .Y(n181) );
  INVX2 U201 ( .A(n244), .Y(n182) );
  INVX2 U202 ( .A(curr[4]), .Y(n184) );
  INVX2 U203 ( .A(curr[3]), .Y(n185) );
  INVX2 U204 ( .A(curr[1]), .Y(n186) );
  INVX2 U205 ( .A(curr[2]), .Y(n187) );
  INVX2 U206 ( .A(m9[7]), .Y(n188) );
  INVX2 U207 ( .A(m9[6]), .Y(n189) );
  INVX2 U208 ( .A(m9[5]), .Y(n190) );
  INVX2 U209 ( .A(m9[4]), .Y(n191) );
  INVX2 U210 ( .A(m9[3]), .Y(n192) );
  INVX2 U211 ( .A(m9[2]), .Y(n193) );
  INVX2 U212 ( .A(m9[1]), .Y(n194) );
  INVX2 U213 ( .A(m9[0]), .Y(n195) );
  INVX2 U214 ( .A(m8[7]), .Y(n196) );
  INVX2 U215 ( .A(m8[6]), .Y(n197) );
  INVX2 U216 ( .A(m8[5]), .Y(n198) );
  INVX2 U217 ( .A(m8[4]), .Y(n199) );
  INVX2 U218 ( .A(m8[3]), .Y(n200) );
  INVX2 U219 ( .A(m8[2]), .Y(n201) );
  INVX2 U220 ( .A(m8[1]), .Y(n202) );
  INVX2 U221 ( .A(m8[0]), .Y(n203) );
  INVX2 U222 ( .A(m7[7]), .Y(n204) );
  INVX2 U223 ( .A(m7[6]), .Y(n205) );
  INVX2 U224 ( .A(m7[5]), .Y(n206) );
  INVX2 U225 ( .A(m7[4]), .Y(n207) );
  INVX2 U226 ( .A(m7[3]), .Y(n208) );
  INVX2 U227 ( .A(m7[2]), .Y(n209) );
  INVX2 U228 ( .A(m7[1]), .Y(n210) );
  INVX2 U229 ( .A(m7[0]), .Y(n211) );
  INVX2 U230 ( .A(m6[7]), .Y(n212) );
  INVX2 U231 ( .A(m6[6]), .Y(n213) );
  INVX2 U232 ( .A(m6[5]), .Y(n214) );
  INVX2 U233 ( .A(m6[4]), .Y(n215) );
  INVX2 U234 ( .A(m6[3]), .Y(n216) );
  INVX2 U235 ( .A(m6[2]), .Y(n217) );
  INVX2 U236 ( .A(m6[1]), .Y(n218) );
  INVX2 U237 ( .A(m6[0]), .Y(n219) );
  INVX2 U238 ( .A(m5[7]), .Y(n220) );
  INVX2 U239 ( .A(m5[6]), .Y(n221) );
  INVX2 U240 ( .A(m5[5]), .Y(n236) );
  INVX2 U243 ( .A(m5[4]), .Y(n284) );
  INVX2 U244 ( .A(m5[3]), .Y(n286) );
  INVX2 U250 ( .A(m5[2]), .Y(n321) );
  INVX2 U260 ( .A(m5[1]), .Y(n597) );
  INVX2 U268 ( .A(m5[0]), .Y(n598) );
  INVX2 U278 ( .A(m4[7]), .Y(n599) );
  INVX2 U279 ( .A(m4[6]), .Y(n600) );
  INVX2 U437 ( .A(m4[5]), .Y(n601) );
  INVX2 U444 ( .A(m4[4]), .Y(n602) );
  INVX2 U601 ( .A(m4[3]), .Y(n603) );
  INVX2 U606 ( .A(m4[2]), .Y(n604) );
  INVX2 U607 ( .A(m4[1]), .Y(n605) );
  INVX2 U608 ( .A(m4[0]), .Y(n606) );
  INVX2 U609 ( .A(m3[7]), .Y(n607) );
  INVX2 U610 ( .A(m3[6]), .Y(n608) );
  INVX2 U611 ( .A(m3[5]), .Y(n609) );
  INVX2 U612 ( .A(m3[4]), .Y(n610) );
  INVX2 U613 ( .A(m3[3]), .Y(n611) );
  INVX2 U614 ( .A(m3[2]), .Y(n612) );
  INVX2 U615 ( .A(m3[1]), .Y(n613) );
  INVX2 U616 ( .A(m3[0]), .Y(n614) );
  INVX2 U617 ( .A(m2[7]), .Y(n615) );
  INVX2 U618 ( .A(m2[6]), .Y(n616) );
  INVX2 U619 ( .A(m2[5]), .Y(n617) );
  INVX2 U620 ( .A(m2[4]), .Y(n618) );
  INVX2 U621 ( .A(m2[3]), .Y(n619) );
  INVX2 U622 ( .A(m2[2]), .Y(n620) );
  INVX2 U623 ( .A(m2[1]), .Y(n621) );
  INVX2 U624 ( .A(m2[0]), .Y(n622) );
  INVX2 U625 ( .A(m1[7]), .Y(n623) );
  INVX2 U626 ( .A(m1[6]), .Y(n624) );
  INVX2 U627 ( .A(m1[5]), .Y(n625) );
  INVX2 U628 ( .A(m1[4]), .Y(n626) );
  INVX2 U629 ( .A(m1[3]), .Y(n627) );
  INVX2 U630 ( .A(m1[2]), .Y(n628) );
  INVX2 U631 ( .A(m1[1]), .Y(n629) );
  INVX2 U632 ( .A(m1[0]), .Y(n630) );
  NAND2X1 U633 ( .A(n152), .B(n155), .Y(n223) );
endmodule


module mcu ( clk, n_rst, i_stop, i_done, i_read_complete, 
        i_grayscale_data_ready, i_b1_full, i_gradient_data_ready, 
        i_start_next_write, i_write_complete, i_b2_empty, o_re, 
        o_grayscale_start, o_b1_save, o_b1_clear, o_gradient_start, o_b2_save, 
        o_we );
  input clk, n_rst, i_stop, i_done, i_read_complete, i_grayscale_data_ready,
         i_b1_full, i_gradient_data_ready, i_start_next_write,
         i_write_complete, i_b2_empty;
  output o_re, o_grayscale_start, o_b1_save, o_b1_clear, o_gradient_start,
         o_b2_save, o_we;
  wire   n42, n43, n44, n45, n46, n48, n49, n50, n51, n52, n53, n54, n55, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n1, n3, n5, n7, n10, n12,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n47, n56, n68;
  wire   [5:0] curr;

  DFFSR \curr_reg[0]  ( .D(n3), .CLK(clk), .R(1'b1), .S(n_rst), .Q(curr[0]) );
  DFFSR \curr_reg[2]  ( .D(n7), .CLK(clk), .R(n_rst), .S(1'b1), .Q(curr[2]) );
  DFFSR \curr_reg[3]  ( .D(n1), .CLK(clk), .R(n_rst), .S(1'b1), .Q(curr[3]) );
  DFFSR \curr_reg[1]  ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(curr[1]) );
  DFFSR \curr_reg[4]  ( .D(n10), .CLK(clk), .R(n_rst), .S(1'b1), .Q(curr[4])
         );
  DFFSR o_gradient_start_reg ( .D(n23), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        o_gradient_start) );
  DFFSR o_b2_save_reg ( .D(n37), .CLK(clk), .R(n_rst), .S(1'b1), .Q(o_b2_save)
         );
  DFFSR o_b1_clear_reg ( .D(n37), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        o_b1_clear) );
  DFFSR o_b1_save_reg ( .D(n22), .CLK(clk), .R(n_rst), .S(1'b1), .Q(o_b1_save)
         );
  DFFSR o_grayscale_start_reg ( .D(n33), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        o_grayscale_start) );
  DFFSR o_re_reg ( .D(n27), .CLK(clk), .R(n_rst), .S(1'b1), .Q(o_re) );
  DFFSR o_we_reg ( .D(n25), .CLK(clk), .R(n_rst), .S(1'b1), .Q(o_we) );
  OAI21X1 U45 ( .A(n56), .B(n44), .C(n20), .Y(n43) );
  NAND2X1 U46 ( .A(n45), .B(n46), .Y(n42) );
  NAND2X1 U49 ( .A(n50), .B(n51), .Y(n49) );
  AOI22X1 U50 ( .A(n24), .B(curr[3]), .C(i_grayscale_data_ready), .D(n32), .Y(
        n50) );
  NAND3X1 U51 ( .A(n53), .B(n54), .C(n55), .Y(n48) );
  OR2X1 U54 ( .A(n59), .B(n60), .Y(n58) );
  OAI21X1 U55 ( .A(i_stop), .B(n29), .C(n61), .Y(n60) );
  OAI21X1 U56 ( .A(i_b1_full), .B(n62), .C(n63), .Y(n59) );
  AOI22X1 U57 ( .A(i_done), .B(n34), .C(i_write_complete), .D(n35), .Y(n63) );
  OR2X1 U58 ( .A(n64), .B(n65), .Y(n57) );
  OAI21X1 U59 ( .A(n38), .B(n44), .C(n66), .Y(n65) );
  NAND3X1 U60 ( .A(n54), .B(n67), .C(n53), .Y(n64) );
  OR2X1 U63 ( .A(n71), .B(n72), .Y(n70) );
  OAI21X1 U64 ( .A(n67), .B(n21), .C(n20), .Y(n72) );
  NAND3X1 U65 ( .A(n28), .B(n74), .C(n75), .Y(n73) );
  AOI22X1 U66 ( .A(i_done), .B(n34), .C(i_b2_empty), .D(n26), .Y(n75) );
  OR2X1 U67 ( .A(n76), .B(n77), .Y(n69) );
  OAI22X1 U68 ( .A(n62), .B(n68), .C(i_write_complete), .D(n45), .Y(n77) );
  OAI21X1 U69 ( .A(n47), .B(n44), .C(n55), .Y(n76) );
  OR2X1 U70 ( .A(n78), .B(curr[0]), .Y(n55) );
  NAND3X1 U73 ( .A(n61), .B(n51), .C(n82), .Y(n81) );
  AOI22X1 U74 ( .A(n31), .B(n21), .C(i_stop), .D(n83), .Y(n82) );
  AOI21X1 U75 ( .A(n36), .B(i_b1_full), .C(n84), .Y(n51) );
  OAI21X1 U76 ( .A(n66), .B(i_b2_empty), .C(n85), .Y(n84) );
  NOR2X1 U77 ( .A(n71), .B(n86), .Y(n61) );
  OAI21X1 U78 ( .A(curr[0]), .B(n87), .C(n88), .Y(n86) );
  OAI21X1 U79 ( .A(i_grayscale_data_ready), .B(n52), .C(n89), .Y(n71) );
  NAND2X1 U80 ( .A(n12), .B(n90), .Y(n80) );
  AOI21X1 U81 ( .A(n24), .B(curr[0]), .C(n91), .Y(n90) );
  NAND2X1 U82 ( .A(n28), .B(n46), .Y(n91) );
  NAND3X1 U83 ( .A(n93), .B(n94), .C(n95), .Y(n44) );
  NOR2X1 U84 ( .A(n96), .B(n97), .Y(n95) );
  NAND3X1 U85 ( .A(n52), .B(n67), .C(n62), .Y(n97) );
  NAND3X1 U86 ( .A(n98), .B(n38), .C(n99), .Y(n62) );
  NAND3X1 U87 ( .A(curr[0]), .B(n47), .C(n39), .Y(n67) );
  NAND3X1 U88 ( .A(curr[1]), .B(curr[0]), .C(n39), .Y(n52) );
  NAND3X1 U89 ( .A(n45), .B(n100), .C(n29), .Y(n96) );
  NOR2X1 U90 ( .A(n78), .B(n30), .Y(n83) );
  NAND3X1 U91 ( .A(n41), .B(n56), .C(n101), .Y(n78) );
  NOR2X1 U92 ( .A(curr[2]), .B(curr[1]), .Y(n101) );
  NAND3X1 U93 ( .A(n99), .B(n38), .C(n102), .Y(n45) );
  NOR2X1 U94 ( .A(n92), .B(n103), .Y(n94) );
  NAND2X1 U95 ( .A(n74), .B(n54), .Y(n103) );
  NOR2X1 U96 ( .A(n87), .B(n30), .Y(n92) );
  NAND3X1 U97 ( .A(curr[2]), .B(n47), .C(n102), .Y(n87) );
  NOR2X1 U98 ( .A(n26), .B(n34), .Y(n93) );
  NAND3X1 U99 ( .A(n102), .B(curr[1]), .C(n105), .Y(n66) );
  OAI22X1 U100 ( .A(n104), .B(i_done), .C(n19), .D(n53), .Y(n106) );
  NAND3X1 U101 ( .A(n40), .B(n30), .C(curr[2]), .Y(n53) );
  NAND3X1 U102 ( .A(n99), .B(curr[2]), .C(n102), .Y(n104) );
  NAND3X1 U103 ( .A(n102), .B(n47), .C(n105), .Y(n74) );
  NOR2X1 U104 ( .A(n56), .B(curr[3]), .Y(n102) );
  NAND3X1 U105 ( .A(n30), .B(n47), .C(n39), .Y(n88) );
  NAND2X1 U106 ( .A(n39), .B(n99), .Y(n89) );
  NOR2X1 U107 ( .A(n47), .B(curr[0]), .Y(n99) );
  NAND3X1 U108 ( .A(n41), .B(n56), .C(curr[2]), .Y(n107) );
  NAND3X1 U109 ( .A(curr[1]), .B(n98), .C(n105), .Y(n54) );
  NOR2X1 U110 ( .A(n30), .B(curr[2]), .Y(n105) );
  NAND3X1 U111 ( .A(n30), .B(n38), .C(n40), .Y(n85) );
  NAND3X1 U112 ( .A(curr[0]), .B(n40), .C(curr[2]), .Y(n46) );
  NAND2X1 U113 ( .A(n98), .B(n47), .Y(n100) );
  NOR2X1 U114 ( .A(n41), .B(curr[4]), .Y(n98) );
  OR2X2 U3 ( .A(n48), .B(n49), .Y(n1) );
  OR2X2 U5 ( .A(n80), .B(n81), .Y(n3) );
  OR2X2 U7 ( .A(n69), .B(n70), .Y(n5) );
  OR2X2 U9 ( .A(n57), .B(n58), .Y(n7) );
  OR2X2 U12 ( .A(n42), .B(n43), .Y(n10) );
  INVX2 U14 ( .A(n106), .Y(n12) );
  INVX2 U21 ( .A(i_gradient_data_ready), .Y(n19) );
  INVX2 U22 ( .A(n73), .Y(n20) );
  INVX2 U23 ( .A(i_read_complete), .Y(n21) );
  INVX2 U24 ( .A(n85), .Y(n22) );
  INVX2 U25 ( .A(n54), .Y(n23) );
  INVX2 U26 ( .A(n44), .Y(n24) );
  INVX2 U27 ( .A(n74), .Y(n25) );
  INVX2 U28 ( .A(n66), .Y(n26) );
  INVX2 U29 ( .A(n88), .Y(n27) );
  INVX2 U30 ( .A(n92), .Y(n28) );
  INVX2 U31 ( .A(n83), .Y(n29) );
  INVX2 U32 ( .A(curr[0]), .Y(n30) );
  INVX2 U33 ( .A(n67), .Y(n31) );
  INVX2 U34 ( .A(n52), .Y(n32) );
  INVX2 U35 ( .A(n89), .Y(n33) );
  INVX2 U36 ( .A(n104), .Y(n34) );
  INVX2 U37 ( .A(n45), .Y(n35) );
  INVX2 U38 ( .A(n62), .Y(n36) );
  INVX2 U39 ( .A(n46), .Y(n37) );
  INVX2 U40 ( .A(curr[2]), .Y(n38) );
  INVX2 U41 ( .A(n107), .Y(n39) );
  INVX2 U42 ( .A(n100), .Y(n40) );
  INVX2 U43 ( .A(curr[3]), .Y(n41) );
  INVX2 U44 ( .A(curr[1]), .Y(n47) );
  INVX2 U47 ( .A(curr[4]), .Y(n56) );
  INVX2 U48 ( .A(i_b1_full), .Y(n68) );
endmodule


module Top_Level ( clk, n_rst, s_haddr, m_haddr, m_hrdata, s_hrdata, m_hwdata, 
        s_hwdata, s_hwrite, m_hwrite, s_hready, m_hready );
  input [31:0] s_haddr;
  output [31:0] m_haddr;
  input [31:0] m_hrdata;
  output [31:0] s_hrdata;
  output [31:0] m_hwdata;
  input [31:0] s_hwdata;
  input clk, n_rst, s_hwrite, m_hready;
  output m_hwrite, s_hready;
  wire   done, re, we, read_complete, write_complete, grayscale_start,
         grayscale_data_ready, b1_save, b1_clear, b1_full, gradient_start,
         gradient_ready, b2_save, b2_empty, start_next_write, n2;
  wire   [31:0] buffer2_data;
  wire   [31:0] rgb;
  wire   [7:0] gray;
  wire   [7:0] m1;
  wire   [7:0] m2;
  wire   [7:0] m3;
  wire   [7:0] m4;
  wire   [7:0] m5;
  wire   [7:0] m6;
  wire   [7:0] m7;
  wire   [7:0] m8;
  wire   [7:0] m9;
  wire   [7:0] m10;
  wire   [7:0] m11;
  wire   [7:0] m12;
  wire   [7:0] m13;
  wire   [7:0] m14;
  wire   [7:0] m15;
  wire   [7:0] m16;
  wire   [7:0] m17;
  wire   [7:0] m18;
  wire   [7:0] m19;
  wire   [7:0] m20;
  wire   [7:0] m21;
  wire   [7:0] m22;
  wire   [7:0] m23;
  wire   [7:0] m24;
  wire   [7:0] m25;
  wire   [7:0] processed_sum_1;
  wire   [7:0] processed_sum_2;
  wire   [7:0] processed_sum_3;
  wire   [7:0] processed_sum_4;
  wire   [7:0] processed_sum_5;
  wire   [7:0] processed_sum_6;
  wire   [7:0] processed_sum_7;
  wire   [7:0] processed_sum_8;
  wire   [7:0] processed_sum_9;

  AHB_wrapper AHB_DUT ( .clk(clk), .n_rst(n_rst), .done(done), .s_haddr(
        s_haddr), .m_haddr(m_haddr), .s_hrdata(s_hrdata), .m_hrdata(m_hrdata), 
        .m_hwdata(m_hwdata), .s_hwdata(s_hwdata), .s_hwrite(s_hwrite), 
        .m_hwrite(m_hwrite), .s_hready(s_hready), .m_hready(m_hready), .re(re), 
        .we(we), .buffer2_data(buffer2_data), .greyscale_data(rgb), 
        .read_complete(read_complete), .write_complete(write_complete) );
  grayscale GS_DUT ( .clk(clk), .n_rst(n_rst), .i_grayscale_start(
        grayscale_start), .i_RGB(rgb), .o_grayscale_data_ready(
        grayscale_data_ready), .o_gray(gray) );
  buffer_window B1_DUT ( .clk(clk), .n_rst(n_rst), .i_data_in(gray), .i_save(
        b1_save), .i_clear(b1_clear), .o_full(b1_full), .o_m1(m1), .o_m2(m2), 
        .o_m3(m3), .o_m4(m4), .o_m5(m5), .o_m6(m6), .o_m7(m7), .o_m8(m8), 
        .o_m9(m9), .o_m10(m10), .o_m11(m11), .o_m12(m12), .o_m13(m13), .o_m14(
        m14), .o_m15(m15), .o_m16(m16), .o_m17(m17), .o_m18(m18), .o_m19(m19), 
        .o_m20(m20), .o_m21(m21), .o_m22(m22), .o_m23(m23), .o_m24(m24), 
        .o_m25(m25) );
  edge_detection_core EDC_DUT ( .clk(clk), .n_rst(n_rst), .i_m1(m1), .i_m2(m2), 
        .i_m3(m3), .i_m4(m4), .i_m5(m5), .i_m6(m6), .i_m7(m7), .i_m8(m8), 
        .i_m9(m9), .i_m10(m10), .i_m11(m11), .i_m12(m12), .i_m13(m13), .i_m14(
        m14), .i_m15(m15), .i_m16(m16), .i_m17(m17), .i_m18(m18), .i_m19(m19), 
        .i_m20(m20), .i_m21(m21), .i_m22(m22), .i_m23(m23), .i_m24(m24), 
        .i_m25(m25), .i_gradient_start(gradient_start), .o_gradient_ready(
        gradient_ready), .o_processed_sum_1(processed_sum_1), 
        .o_processed_sum_2(processed_sum_2), .o_processed_sum_3(
        processed_sum_3), .o_processed_sum_4(processed_sum_4), 
        .o_processed_sum_5(processed_sum_5), .o_processed_sum_6(
        processed_sum_6), .o_processed_sum_7(processed_sum_7), 
        .o_processed_sum_8(processed_sum_8), .o_processed_sum_9(
        processed_sum_9) );
  buffer_2 B2_DUT ( .clk(clk), .n_rst(n_rst), .i_processed_sum_1(
        processed_sum_1), .i_processed_sum_2(processed_sum_2), 
        .i_processed_sum_3(processed_sum_3), .i_processed_sum_4(
        processed_sum_4), .i_processed_sum_5(processed_sum_5), 
        .i_processed_sum_6(processed_sum_6), .i_processed_sum_7(
        processed_sum_7), .i_processed_sum_8(processed_sum_8), 
        .i_processed_sum_9(processed_sum_9), .i_save(b2_save), 
        .i_write_complete(write_complete), .o_empty(b2_empty), 
        .o_buffer2_data(buffer2_data), .o_write_enable(start_next_write) );
  mcu MCU_DUT ( .clk(clk), .n_rst(n_rst), .i_stop(n2), .i_done(done), 
        .i_read_complete(read_complete), .i_grayscale_data_ready(
        grayscale_data_ready), .i_b1_full(b1_full), .i_gradient_data_ready(
        gradient_ready), .i_start_next_write(start_next_write), 
        .i_write_complete(write_complete), .i_b2_empty(b2_empty), .o_re(re), 
        .o_grayscale_start(grayscale_start), .o_b1_save(b1_save), .o_b1_clear(
        b1_clear), .o_gradient_start(gradient_start), .o_b2_save(b2_save), 
        .o_we(we) );
  INVX2 U2 ( .A(s_hrdata[0]), .Y(n2) );
endmodule

