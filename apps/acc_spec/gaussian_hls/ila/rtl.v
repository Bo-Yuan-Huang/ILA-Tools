module gaussianRTL(
arg_0_TREADY,
arg_1_TDATA,
arg_1_TVALID,
arg_0_TDATA,
arg_0_TVALID,
arg_1_TREADY,
buffer_0_value_V_fu_,
buffer_1_value_V_fu_,
buffer_2_value_V_fu_,
buffer_3_value_V_fu_,
buffer_4_value_V_fu_,
buffer_5_value_V_fu_,
buffer_6_value_V_fu_,
buffer_7_value_V_fu_,
col_reg_349,
p_p2_in_bounded_stencil_stream_full,
p_p2_in_bounded_stencil_stream_s_U,
p_write_idx_1_1_reg_723,
row_reg_327,
slice_stream_V_value_V_U,
slice_stream_V_value_V_U_internal_full_n,
clk,rst,
step
);
input            arg_0_TREADY;
input      [7:0] arg_1_TDATA;
input            arg_1_TVALID;
input clk;
input rst;
input step;
output      [7:0] arg_0_TDATA;
output            arg_0_TVALID;
output            arg_1_TREADY;
output     [71:0] buffer_0_value_V_fu_;
output     [71:0] buffer_1_value_V_fu_;
output     [71:0] buffer_2_value_V_fu_;
output     [71:0] buffer_3_value_V_fu_;
output     [71:0] buffer_4_value_V_fu_;
output     [71:0] buffer_5_value_V_fu_;
output     [71:0] buffer_6_value_V_fu_;
output     [71:0] buffer_7_value_V_fu_;
output      [8:0] col_reg_349;
output            p_p2_in_bounded_stencil_stream_full;
output    [647:0] p_p2_in_bounded_stencil_stream_s_U;
output     [63:0] p_write_idx_1_1_reg_723;
output      [9:0] row_reg_327;
output     [71:0] slice_stream_V_value_V_U;
output            slice_stream_V_value_V_U_internal_full_n;
reg      [7:0] arg_0_TDATA;
reg            arg_0_TVALID;
reg            arg_1_TREADY;
reg     [71:0] buffer_0_value_V_fu_;
reg     [71:0] buffer_1_value_V_fu_;
reg     [71:0] buffer_2_value_V_fu_;
reg     [71:0] buffer_3_value_V_fu_;
reg     [71:0] buffer_4_value_V_fu_;
reg     [71:0] buffer_5_value_V_fu_;
reg     [71:0] buffer_6_value_V_fu_;
reg     [71:0] buffer_7_value_V_fu_;
reg      [8:0] col_reg_349;
reg            p_p2_in_bounded_stencil_stream_full;
reg    [647:0] p_p2_in_bounded_stencil_stream_s_U;
reg     [63:0] p_write_idx_1_1_reg_723;
reg      [9:0] row_reg_327;
reg     [71:0] slice_stream_V_value_V_U;
reg            slice_stream_V_value_V_U_internal_full_n;
wire            arg_0_TREADY;
wire      [7:0] arg_1_TDATA;
wire            arg_1_TVALID;
wire            n0;
wire            n1;
wire            n2;
wire            n3;
wire            n4;
wire            n5;
wire            n6;
wire            n7;
wire            n8;
wire            n9;
wire            n10;
wire      [7:0] n11;
wire      [7:0] n12;
wire      [7:0] n13;
wire      [7:0] n14;
wire      [7:0] n15;
wire            n16;
wire            n17;
wire            n18;
wire            n19;
wire            n20;
wire            n21;
wire            n22;
wire     [71:0] n23;
wire     [71:0] n24;
wire     [71:0] n25;
wire     [71:0] n26;
wire     [71:0] n27;
wire     [71:0] n28;
wire     [71:0] n29;
wire     [71:0] n30;
wire     [71:0] n31;
wire     [71:0] n32;
wire     [71:0] n33;
wire     [71:0] n34;
wire     [71:0] n35;
wire     [71:0] n36;
wire     [71:0] n37;
wire     [71:0] n38;
wire     [71:0] n39;
wire     [71:0] n40;
wire     [71:0] n41;
wire     [71:0] n42;
wire     [71:0] n43;
wire     [71:0] n44;
wire     [71:0] n45;
wire     [71:0] n46;
wire            n47;
wire      [8:0] n48;
wire      [8:0] n49;
wire      [8:0] n50;
wire      [8:0] n51;
wire      [8:0] n52;
wire            n53;
wire            n54;
wire            n55;
wire      [7:0] n56;
wire      [7:0] n57;
wire      [7:0] n58;
wire      [7:0] n59;
wire      [7:0] n60;
wire      [7:0] n61;
wire      [7:0] n62;
wire      [7:0] n63;
wire      [7:0] n64;
wire     [15:0] n65;
wire     [23:0] n66;
wire     [31:0] n67;
wire     [39:0] n68;
wire     [47:0] n69;
wire     [55:0] n70;
wire     [63:0] n71;
wire     [71:0] n72;
wire      [7:0] n73;
wire      [7:0] n74;
wire      [7:0] n75;
wire      [7:0] n76;
wire      [7:0] n77;
wire      [7:0] n78;
wire      [7:0] n79;
wire      [7:0] n80;
wire      [7:0] n81;
wire     [15:0] n82;
wire     [23:0] n83;
wire     [31:0] n84;
wire     [39:0] n85;
wire     [47:0] n86;
wire     [55:0] n87;
wire     [63:0] n88;
wire     [71:0] n89;
wire      [7:0] n90;
wire      [7:0] n91;
wire      [7:0] n92;
wire      [7:0] n93;
wire      [7:0] n94;
wire      [7:0] n95;
wire      [7:0] n96;
wire      [7:0] n97;
wire      [7:0] n98;
wire     [15:0] n99;
wire     [23:0] n100;
wire     [31:0] n101;
wire     [39:0] n102;
wire     [47:0] n103;
wire     [55:0] n104;
wire     [63:0] n105;
wire     [71:0] n106;
wire      [7:0] n107;
wire      [7:0] n108;
wire      [7:0] n109;
wire      [7:0] n110;
wire      [7:0] n111;
wire      [7:0] n112;
wire      [7:0] n113;
wire      [7:0] n114;
wire      [7:0] n115;
wire     [15:0] n116;
wire     [23:0] n117;
wire     [31:0] n118;
wire     [39:0] n119;
wire     [47:0] n120;
wire     [55:0] n121;
wire     [63:0] n122;
wire     [71:0] n123;
wire      [7:0] n124;
wire      [7:0] n125;
wire      [7:0] n126;
wire      [7:0] n127;
wire      [7:0] n128;
wire      [7:0] n129;
wire      [7:0] n130;
wire      [7:0] n131;
wire      [7:0] n132;
wire     [15:0] n133;
wire     [23:0] n134;
wire     [31:0] n135;
wire     [39:0] n136;
wire     [47:0] n137;
wire     [55:0] n138;
wire     [63:0] n139;
wire     [71:0] n140;
wire      [7:0] n141;
wire      [7:0] n142;
wire      [7:0] n143;
wire      [7:0] n144;
wire      [7:0] n145;
wire      [7:0] n146;
wire      [7:0] n147;
wire      [7:0] n148;
wire      [7:0] n149;
wire     [15:0] n150;
wire     [23:0] n151;
wire     [31:0] n152;
wire     [39:0] n153;
wire     [47:0] n154;
wire     [55:0] n155;
wire     [63:0] n156;
wire     [71:0] n157;
wire      [7:0] n158;
wire      [7:0] n159;
wire      [7:0] n160;
wire      [7:0] n161;
wire      [7:0] n162;
wire      [7:0] n163;
wire      [7:0] n164;
wire      [7:0] n165;
wire      [7:0] n166;
wire     [15:0] n167;
wire     [23:0] n168;
wire     [31:0] n169;
wire     [39:0] n170;
wire     [47:0] n171;
wire     [55:0] n172;
wire     [63:0] n173;
wire     [71:0] n174;
wire      [7:0] n175;
wire      [7:0] n176;
wire      [7:0] n177;
wire      [7:0] n178;
wire      [7:0] n179;
wire      [7:0] n180;
wire      [7:0] n181;
wire      [7:0] n182;
wire      [7:0] n183;
wire     [15:0] n184;
wire     [23:0] n185;
wire     [31:0] n186;
wire     [39:0] n187;
wire     [47:0] n188;
wire     [55:0] n189;
wire     [63:0] n190;
wire     [71:0] n191;
wire      [7:0] n192;
wire      [7:0] n193;
wire      [7:0] n194;
wire      [7:0] n195;
wire      [7:0] n196;
wire      [7:0] n197;
wire      [7:0] n198;
wire      [7:0] n199;
wire      [7:0] n200;
wire     [15:0] n201;
wire     [23:0] n202;
wire     [31:0] n203;
wire     [39:0] n204;
wire     [47:0] n205;
wire     [55:0] n206;
wire     [63:0] n207;
wire     [71:0] n208;
wire    [143:0] n209;
wire    [215:0] n210;
wire    [287:0] n211;
wire    [359:0] n212;
wire    [431:0] n213;
wire    [503:0] n214;
wire    [575:0] n215;
wire    [647:0] n216;
wire    [647:0] n217;
wire    [647:0] n218;
wire    [647:0] n219;
wire            n220;
wire            n221;
wire     [63:0] n222;
wire     [63:0] n223;
wire     [63:0] n224;
wire     [63:0] n225;
wire     [63:0] n226;
wire     [63:0] n227;
wire            n228;
wire      [9:0] n229;
wire      [9:0] n230;
wire      [9:0] n231;
wire      [9:0] n232;
wire      [9:0] n233;
wire      [9:0] n234;
wire            n235;
wire            n236;
wire      [7:0] n237;
wire            n238;
wire      [7:0] n239;
wire            n240;
wire      [7:0] n241;
wire            n242;
wire      [7:0] n243;
wire            n244;
wire      [7:0] n245;
wire            n246;
wire      [7:0] n247;
wire            n248;
wire      [7:0] n249;
wire      [7:0] n250;
wire      [7:0] n251;
wire      [7:0] n252;
wire      [7:0] n253;
wire      [7:0] n254;
wire      [7:0] n255;
wire      [7:0] n256;
wire      [7:0] n257;
wire      [7:0] n258;
wire      [7:0] n259;
wire      [7:0] n260;
wire      [7:0] n261;
wire      [7:0] n262;
wire      [7:0] n263;
wire      [7:0] n264;
wire      [7:0] n265;
wire      [7:0] n266;
wire      [7:0] n267;
wire      [7:0] n268;
wire      [7:0] n269;
wire      [7:0] n270;
wire      [7:0] n271;
wire      [7:0] n272;
wire      [7:0] n273;
wire      [7:0] n274;
wire      [7:0] n275;
wire      [7:0] n276;
wire      [7:0] n277;
wire      [7:0] n278;
wire      [7:0] n279;
wire      [7:0] n280;
wire      [7:0] n281;
wire      [7:0] n282;
wire      [7:0] n283;
wire      [7:0] n284;
wire      [7:0] n285;
wire      [7:0] n286;
wire      [7:0] n287;
wire      [7:0] n288;
wire      [7:0] n289;
wire      [7:0] n290;
wire      [7:0] n291;
wire      [7:0] n292;
wire      [7:0] n293;
wire      [7:0] n294;
wire      [7:0] n295;
wire      [7:0] n296;
wire      [7:0] n297;
wire      [7:0] n298;
wire      [7:0] n299;
wire      [7:0] n300;
wire      [7:0] n301;
wire      [7:0] n302;
wire      [7:0] n303;
wire      [7:0] n304;
wire      [7:0] n305;
wire      [7:0] n306;
wire     [15:0] n307;
wire     [23:0] n308;
wire     [31:0] n309;
wire     [39:0] n310;
wire     [47:0] n311;
wire     [55:0] n312;
wire     [63:0] n313;
wire     [71:0] n314;
wire     [71:0] n315;
wire     [71:0] n316;
wire     [71:0] n317;
wire     [71:0] n318;
wire            n319;
wire            n320;
wire            n321;
wire      [8:0] buffer_0_value_V_U_addr0;
wire      [7:0] buffer_0_value_V_U_data0;
wire            n322;
wire            n323;
wire            n324;
wire            n325;
wire            n326;
wire            n327;
wire            n328;
wire            n329;
wire            n330;
wire            n331;
wire      [8:0] buffer_1_value_V_U_addr0;
wire      [7:0] buffer_1_value_V_U_data0;
wire            n332;
wire            n333;
wire            n334;
wire      [8:0] buffer_2_value_V_U_addr0;
wire      [7:0] buffer_2_value_V_U_data0;
wire            n335;
wire            n336;
wire            n337;
wire      [8:0] buffer_3_value_V_U_addr0;
wire      [7:0] buffer_3_value_V_U_data0;
wire            n338;
wire            n339;
wire            n340;
wire      [8:0] buffer_4_value_V_U_addr0;
wire      [7:0] buffer_4_value_V_U_data0;
wire            n341;
wire            n342;
wire            n343;
wire      [8:0] buffer_5_value_V_U_addr0;
wire      [7:0] buffer_5_value_V_U_data0;
wire            n344;
wire            n345;
wire            n346;
wire      [8:0] buffer_6_value_V_U_addr0;
wire      [7:0] buffer_6_value_V_U_data0;
wire            n347;
wire            n348;
wire            n349;
wire      [8:0] buffer_7_value_V_U_addr0;
wire      [7:0] buffer_7_value_V_U_data0;
wire            n350;
wire            n351;
wire            n352;
wire            n353;
reg      [7:0] buffer_0_value_V_U[511:0];
reg      [7:0] buffer_1_value_V_U[511:0];
reg      [7:0] buffer_2_value_V_U[511:0];
reg      [7:0] buffer_3_value_V_U[511:0];
reg      [7:0] buffer_4_value_V_U[511:0];
reg      [7:0] buffer_5_value_V_U[511:0];
reg      [7:0] buffer_6_value_V_U[511:0];
reg      [7:0] buffer_7_value_V_U[511:0];
wire clk;
wire rst;
wire step;
assign n0 =  ( arg_1_TVALID ) == ( 1'd1 )  ;
assign n1 =  ( slice_stream_V_value_V_U_internal_full_n ) == ( 1'd0 )  ;
assign n2 =  ( n0 ) & ( n1 )  ;
assign n3 =  ( slice_stream_V_value_V_U_internal_full_n ) == ( 1'd1 )  ;
assign n4 =  ( p_p2_in_bounded_stencil_stream_full ) == ( 1'd0 )  ;
assign n5 =  ( n3 ) & ( n4 )  ;
assign n6 =  ( arg_0_TREADY ) == ( 1'd1 )  ;
assign n7 =  ( p_p2_in_bounded_stencil_stream_full ) == ( 1'd1 )  ;
assign n8 =  ( n6 ) & ( n7 )  ;
assign n9 =  ( arg_1_TVALID ) == ( 1'd0 )  ;
assign n10 =  ( n8 ) & ( n9 )  ;
assign n11 = gaussianBlurStencil(p_p2_in_bounded_stencil_stream_s_U) ;
assign n12 =  ( n7 ) ? ( n11 ) : ( arg_0_TDATA ) ;
assign n13 =  ( n10 ) ? ( n12 ) : ( arg_0_TDATA ) ;
assign n14 =  ( n5 ) ? ( arg_0_TDATA ) : ( n13 ) ;
assign n15 =  ( n2 ) ? ( arg_0_TDATA ) : ( n14 ) ;
assign n16 =  ( n7 ) ? ( 1'd1 ) : ( 1'd0 ) ;
assign n17 =  ( n10 ) ? ( n16 ) : ( arg_0_TVALID ) ;
assign n18 =  ( n5 ) ? ( 1'd0 ) : ( n17 ) ;
assign n19 =  ( n2 ) ? ( 1'd0 ) : ( n18 ) ;
assign n20 =  ( n10 ) ? ( 1'd1 ) : ( arg_1_TREADY ) ;
assign n21 =  ( n5 ) ? ( 1'd1 ) : ( n20 ) ;
assign n22 =  ( n2 ) ? ( 1'd0 ) : ( n21 ) ;
assign n23 =  ( n10 ) ? ( buffer_0_value_V_fu_ ) : ( buffer_0_value_V_fu_ ) ;
assign n24 =  ( n5 ) ? ( slice_stream_V_value_V_U ) : ( n23 ) ;
assign n25 =  ( n2 ) ? ( buffer_0_value_V_fu_ ) : ( n24 ) ;
assign n26 =  ( n10 ) ? ( buffer_1_value_V_fu_ ) : ( buffer_1_value_V_fu_ ) ;
assign n27 =  ( n5 ) ? ( buffer_0_value_V_fu_ ) : ( n26 ) ;
assign n28 =  ( n2 ) ? ( buffer_1_value_V_fu_ ) : ( n27 ) ;
assign n29 =  ( n10 ) ? ( buffer_2_value_V_fu_ ) : ( buffer_2_value_V_fu_ ) ;
assign n30 =  ( n5 ) ? ( buffer_1_value_V_fu_ ) : ( n29 ) ;
assign n31 =  ( n2 ) ? ( buffer_2_value_V_fu_ ) : ( n30 ) ;
assign n32 =  ( n10 ) ? ( buffer_3_value_V_fu_ ) : ( buffer_3_value_V_fu_ ) ;
assign n33 =  ( n5 ) ? ( buffer_2_value_V_fu_ ) : ( n32 ) ;
assign n34 =  ( n2 ) ? ( buffer_3_value_V_fu_ ) : ( n33 ) ;
assign n35 =  ( n10 ) ? ( buffer_4_value_V_fu_ ) : ( buffer_4_value_V_fu_ ) ;
assign n36 =  ( n5 ) ? ( buffer_3_value_V_fu_ ) : ( n35 ) ;
assign n37 =  ( n2 ) ? ( buffer_4_value_V_fu_ ) : ( n36 ) ;
assign n38 =  ( n10 ) ? ( buffer_5_value_V_fu_ ) : ( buffer_5_value_V_fu_ ) ;
assign n39 =  ( n5 ) ? ( buffer_4_value_V_fu_ ) : ( n38 ) ;
assign n40 =  ( n2 ) ? ( buffer_5_value_V_fu_ ) : ( n39 ) ;
assign n41 =  ( n10 ) ? ( buffer_6_value_V_fu_ ) : ( buffer_6_value_V_fu_ ) ;
assign n42 =  ( n5 ) ? ( buffer_5_value_V_fu_ ) : ( n41 ) ;
assign n43 =  ( n2 ) ? ( buffer_6_value_V_fu_ ) : ( n42 ) ;
assign n44 =  ( n10 ) ? ( buffer_7_value_V_fu_ ) : ( buffer_7_value_V_fu_ ) ;
assign n45 =  ( n5 ) ? ( buffer_6_value_V_fu_ ) : ( n44 ) ;
assign n46 =  ( n2 ) ? ( buffer_7_value_V_fu_ ) : ( n45 ) ;
assign n47 =  ( col_reg_349 ) != ( 9'd487 )  ;
assign n48 =  ( col_reg_349 ) + ( 9'd1 )  ;
assign n49 =  ( n47 ) ? ( n48 ) : ( 9'd0 ) ;
assign n50 =  ( n10 ) ? ( col_reg_349 ) : ( col_reg_349 ) ;
assign n51 =  ( n5 ) ? ( col_reg_349 ) : ( n50 ) ;
assign n52 =  ( n2 ) ? ( n49 ) : ( n51 ) ;
assign n53 =  ( n10 ) ? ( 1'd0 ) : ( p_p2_in_bounded_stencil_stream_full ) ;
assign n54 =  ( n5 ) ? ( 1'd0 ) : ( n53 ) ;
assign n55 =  ( n2 ) ? ( p_p2_in_bounded_stencil_stream_full ) : ( n54 ) ;
assign n56 = slice_stream_V_value_V_U[71:64] ;
assign n57 = buffer_0_value_V_fu_[71:64] ;
assign n58 = buffer_1_value_V_fu_[71:64] ;
assign n59 = buffer_2_value_V_fu_[71:64] ;
assign n60 = buffer_3_value_V_fu_[71:64] ;
assign n61 = buffer_4_value_V_fu_[71:64] ;
assign n62 = buffer_5_value_V_fu_[71:64] ;
assign n63 = buffer_6_value_V_fu_[71:64] ;
assign n64 = buffer_7_value_V_fu_[71:64] ;
assign n65 =  { ( n63 ) , ( n64 ) }  ;
assign n66 =  { ( n62 ) , ( n65 ) }  ;
assign n67 =  { ( n61 ) , ( n66 ) }  ;
assign n68 =  { ( n60 ) , ( n67 ) }  ;
assign n69 =  { ( n59 ) , ( n68 ) }  ;
assign n70 =  { ( n58 ) , ( n69 ) }  ;
assign n71 =  { ( n57 ) , ( n70 ) }  ;
assign n72 =  { ( n56 ) , ( n71 ) }  ;
assign n73 = slice_stream_V_value_V_U[63:56] ;
assign n74 = buffer_0_value_V_fu_[63:56] ;
assign n75 = buffer_1_value_V_fu_[63:56] ;
assign n76 = buffer_2_value_V_fu_[63:56] ;
assign n77 = buffer_3_value_V_fu_[63:56] ;
assign n78 = buffer_4_value_V_fu_[63:56] ;
assign n79 = buffer_5_value_V_fu_[63:56] ;
assign n80 = buffer_6_value_V_fu_[63:56] ;
assign n81 = buffer_7_value_V_fu_[63:56] ;
assign n82 =  { ( n80 ) , ( n81 ) }  ;
assign n83 =  { ( n79 ) , ( n82 ) }  ;
assign n84 =  { ( n78 ) , ( n83 ) }  ;
assign n85 =  { ( n77 ) , ( n84 ) }  ;
assign n86 =  { ( n76 ) , ( n85 ) }  ;
assign n87 =  { ( n75 ) , ( n86 ) }  ;
assign n88 =  { ( n74 ) , ( n87 ) }  ;
assign n89 =  { ( n73 ) , ( n88 ) }  ;
assign n90 = slice_stream_V_value_V_U[55:48] ;
assign n91 = buffer_0_value_V_fu_[55:48] ;
assign n92 = buffer_1_value_V_fu_[55:48] ;
assign n93 = buffer_2_value_V_fu_[55:48] ;
assign n94 = buffer_3_value_V_fu_[55:48] ;
assign n95 = buffer_4_value_V_fu_[55:48] ;
assign n96 = buffer_5_value_V_fu_[55:48] ;
assign n97 = buffer_6_value_V_fu_[55:48] ;
assign n98 = buffer_7_value_V_fu_[55:48] ;
assign n99 =  { ( n97 ) , ( n98 ) }  ;
assign n100 =  { ( n96 ) , ( n99 ) }  ;
assign n101 =  { ( n95 ) , ( n100 ) }  ;
assign n102 =  { ( n94 ) , ( n101 ) }  ;
assign n103 =  { ( n93 ) , ( n102 ) }  ;
assign n104 =  { ( n92 ) , ( n103 ) }  ;
assign n105 =  { ( n91 ) , ( n104 ) }  ;
assign n106 =  { ( n90 ) , ( n105 ) }  ;
assign n107 = slice_stream_V_value_V_U[47:40] ;
assign n108 = buffer_0_value_V_fu_[47:40] ;
assign n109 = buffer_1_value_V_fu_[47:40] ;
assign n110 = buffer_2_value_V_fu_[47:40] ;
assign n111 = buffer_3_value_V_fu_[47:40] ;
assign n112 = buffer_4_value_V_fu_[47:40] ;
assign n113 = buffer_5_value_V_fu_[47:40] ;
assign n114 = buffer_6_value_V_fu_[47:40] ;
assign n115 = buffer_7_value_V_fu_[47:40] ;
assign n116 =  { ( n114 ) , ( n115 ) }  ;
assign n117 =  { ( n113 ) , ( n116 ) }  ;
assign n118 =  { ( n112 ) , ( n117 ) }  ;
assign n119 =  { ( n111 ) , ( n118 ) }  ;
assign n120 =  { ( n110 ) , ( n119 ) }  ;
assign n121 =  { ( n109 ) , ( n120 ) }  ;
assign n122 =  { ( n108 ) , ( n121 ) }  ;
assign n123 =  { ( n107 ) , ( n122 ) }  ;
assign n124 = slice_stream_V_value_V_U[39:32] ;
assign n125 = buffer_0_value_V_fu_[39:32] ;
assign n126 = buffer_1_value_V_fu_[39:32] ;
assign n127 = buffer_2_value_V_fu_[39:32] ;
assign n128 = buffer_3_value_V_fu_[39:32] ;
assign n129 = buffer_4_value_V_fu_[39:32] ;
assign n130 = buffer_5_value_V_fu_[39:32] ;
assign n131 = buffer_6_value_V_fu_[39:32] ;
assign n132 = buffer_7_value_V_fu_[39:32] ;
assign n133 =  { ( n131 ) , ( n132 ) }  ;
assign n134 =  { ( n130 ) , ( n133 ) }  ;
assign n135 =  { ( n129 ) , ( n134 ) }  ;
assign n136 =  { ( n128 ) , ( n135 ) }  ;
assign n137 =  { ( n127 ) , ( n136 ) }  ;
assign n138 =  { ( n126 ) , ( n137 ) }  ;
assign n139 =  { ( n125 ) , ( n138 ) }  ;
assign n140 =  { ( n124 ) , ( n139 ) }  ;
assign n141 = slice_stream_V_value_V_U[31:24] ;
assign n142 = buffer_0_value_V_fu_[31:24] ;
assign n143 = buffer_1_value_V_fu_[31:24] ;
assign n144 = buffer_2_value_V_fu_[31:24] ;
assign n145 = buffer_3_value_V_fu_[31:24] ;
assign n146 = buffer_4_value_V_fu_[31:24] ;
assign n147 = buffer_5_value_V_fu_[31:24] ;
assign n148 = buffer_6_value_V_fu_[31:24] ;
assign n149 = buffer_7_value_V_fu_[31:24] ;
assign n150 =  { ( n148 ) , ( n149 ) }  ;
assign n151 =  { ( n147 ) , ( n150 ) }  ;
assign n152 =  { ( n146 ) , ( n151 ) }  ;
assign n153 =  { ( n145 ) , ( n152 ) }  ;
assign n154 =  { ( n144 ) , ( n153 ) }  ;
assign n155 =  { ( n143 ) , ( n154 ) }  ;
assign n156 =  { ( n142 ) , ( n155 ) }  ;
assign n157 =  { ( n141 ) , ( n156 ) }  ;
assign n158 = slice_stream_V_value_V_U[23:16] ;
assign n159 = buffer_0_value_V_fu_[23:16] ;
assign n160 = buffer_1_value_V_fu_[23:16] ;
assign n161 = buffer_2_value_V_fu_[23:16] ;
assign n162 = buffer_3_value_V_fu_[23:16] ;
assign n163 = buffer_4_value_V_fu_[23:16] ;
assign n164 = buffer_5_value_V_fu_[23:16] ;
assign n165 = buffer_6_value_V_fu_[23:16] ;
assign n166 = buffer_7_value_V_fu_[23:16] ;
assign n167 =  { ( n165 ) , ( n166 ) }  ;
assign n168 =  { ( n164 ) , ( n167 ) }  ;
assign n169 =  { ( n163 ) , ( n168 ) }  ;
assign n170 =  { ( n162 ) , ( n169 ) }  ;
assign n171 =  { ( n161 ) , ( n170 ) }  ;
assign n172 =  { ( n160 ) , ( n171 ) }  ;
assign n173 =  { ( n159 ) , ( n172 ) }  ;
assign n174 =  { ( n158 ) , ( n173 ) }  ;
assign n175 = slice_stream_V_value_V_U[15:8] ;
assign n176 = buffer_0_value_V_fu_[15:8] ;
assign n177 = buffer_1_value_V_fu_[15:8] ;
assign n178 = buffer_2_value_V_fu_[15:8] ;
assign n179 = buffer_3_value_V_fu_[15:8] ;
assign n180 = buffer_4_value_V_fu_[15:8] ;
assign n181 = buffer_5_value_V_fu_[15:8] ;
assign n182 = buffer_6_value_V_fu_[15:8] ;
assign n183 = buffer_7_value_V_fu_[15:8] ;
assign n184 =  { ( n182 ) , ( n183 ) }  ;
assign n185 =  { ( n181 ) , ( n184 ) }  ;
assign n186 =  { ( n180 ) , ( n185 ) }  ;
assign n187 =  { ( n179 ) , ( n186 ) }  ;
assign n188 =  { ( n178 ) , ( n187 ) }  ;
assign n189 =  { ( n177 ) , ( n188 ) }  ;
assign n190 =  { ( n176 ) , ( n189 ) }  ;
assign n191 =  { ( n175 ) , ( n190 ) }  ;
assign n192 = slice_stream_V_value_V_U[7:0] ;
assign n193 = buffer_0_value_V_fu_[7:0] ;
assign n194 = buffer_1_value_V_fu_[7:0] ;
assign n195 = buffer_2_value_V_fu_[7:0] ;
assign n196 = buffer_3_value_V_fu_[7:0] ;
assign n197 = buffer_4_value_V_fu_[7:0] ;
assign n198 = buffer_5_value_V_fu_[7:0] ;
assign n199 = buffer_6_value_V_fu_[7:0] ;
assign n200 = buffer_7_value_V_fu_[7:0] ;
assign n201 =  { ( n199 ) , ( n200 ) }  ;
assign n202 =  { ( n198 ) , ( n201 ) }  ;
assign n203 =  { ( n197 ) , ( n202 ) }  ;
assign n204 =  { ( n196 ) , ( n203 ) }  ;
assign n205 =  { ( n195 ) , ( n204 ) }  ;
assign n206 =  { ( n194 ) , ( n205 ) }  ;
assign n207 =  { ( n193 ) , ( n206 ) }  ;
assign n208 =  { ( n192 ) , ( n207 ) }  ;
assign n209 =  { ( n191 ) , ( n208 ) }  ;
assign n210 =  { ( n174 ) , ( n209 ) }  ;
assign n211 =  { ( n157 ) , ( n210 ) }  ;
assign n212 =  { ( n140 ) , ( n211 ) }  ;
assign n213 =  { ( n123 ) , ( n212 ) }  ;
assign n214 =  { ( n106 ) , ( n213 ) }  ;
assign n215 =  { ( n89 ) , ( n214 ) }  ;
assign n216 =  { ( n72 ) , ( n215 ) }  ;
assign n217 =  ( n10 ) ? ( p_p2_in_bounded_stencil_stream_s_U ) : ( p_p2_in_bounded_stencil_stream_s_U ) ;
assign n218 =  ( n5 ) ? ( n216 ) : ( n217 ) ;
assign n219 =  ( n2 ) ? ( p_p2_in_bounded_stencil_stream_s_U ) : ( n218 ) ;
assign n220 =  ( col_reg_349 ) == ( 9'd487 )  ;
assign n221 =  ( p_write_idx_1_1_reg_723 ) != ( 64'd7 )  ;
assign n222 =  ( p_write_idx_1_1_reg_723 ) + ( 64'd1 )  ;
assign n223 =  ( n221 ) ? ( n222 ) : ( 64'd0 ) ;
assign n224 =  ( n220 ) ? ( n223 ) : ( p_write_idx_1_1_reg_723 ) ;
assign n225 =  ( n10 ) ? ( p_write_idx_1_1_reg_723 ) : ( p_write_idx_1_1_reg_723 ) ;
assign n226 =  ( n5 ) ? ( p_write_idx_1_1_reg_723 ) : ( n225 ) ;
assign n227 =  ( n2 ) ? ( n224 ) : ( n226 ) ;
assign n228 =  ( row_reg_327 ) != ( 10'd687 )  ;
assign n229 =  ( row_reg_327 ) + ( 10'd1 )  ;
assign n230 =  ( n228 ) ? ( n229 ) : ( row_reg_327 ) ;
assign n231 =  ( n220 ) ? ( n230 ) : ( row_reg_327 ) ;
assign n232 =  ( n10 ) ? ( row_reg_327 ) : ( row_reg_327 ) ;
assign n233 =  ( n5 ) ? ( row_reg_327 ) : ( n232 ) ;
assign n234 =  ( n2 ) ? ( n231 ) : ( n233 ) ;
assign n235 =  ( row_reg_327 ) >= ( 10'd8 )  ;
assign n236 =  ( p_write_idx_1_1_reg_723 ) == ( 64'd0 )  ;
assign n237 =  (  buffer_7_value_V_U [ col_reg_349 ] )  ;
assign n238 =  ( p_write_idx_1_1_reg_723 ) == ( 64'd1 )  ;
assign n239 =  (  buffer_0_value_V_U [ col_reg_349 ] )  ;
assign n240 =  ( p_write_idx_1_1_reg_723 ) == ( 64'd2 )  ;
assign n241 =  (  buffer_1_value_V_U [ col_reg_349 ] )  ;
assign n242 =  ( p_write_idx_1_1_reg_723 ) == ( 64'd3 )  ;
assign n243 =  (  buffer_2_value_V_U [ col_reg_349 ] )  ;
assign n244 =  ( p_write_idx_1_1_reg_723 ) == ( 64'd4 )  ;
assign n245 =  (  buffer_3_value_V_U [ col_reg_349 ] )  ;
assign n246 =  ( p_write_idx_1_1_reg_723 ) == ( 64'd5 )  ;
assign n247 =  (  buffer_4_value_V_U [ col_reg_349 ] )  ;
assign n248 =  ( p_write_idx_1_1_reg_723 ) == ( 64'd6 )  ;
assign n249 =  (  buffer_5_value_V_U [ col_reg_349 ] )  ;
assign n250 =  (  buffer_6_value_V_U [ col_reg_349 ] )  ;
assign n251 =  ( n248 ) ? ( n249 ) : ( n250 ) ;
assign n252 =  ( n246 ) ? ( n247 ) : ( n251 ) ;
assign n253 =  ( n244 ) ? ( n245 ) : ( n252 ) ;
assign n254 =  ( n242 ) ? ( n243 ) : ( n253 ) ;
assign n255 =  ( n240 ) ? ( n241 ) : ( n254 ) ;
assign n256 =  ( n238 ) ? ( n239 ) : ( n255 ) ;
assign n257 =  ( n236 ) ? ( n237 ) : ( n256 ) ;
assign n258 =  ( n248 ) ? ( n247 ) : ( n249 ) ;
assign n259 =  ( n246 ) ? ( n245 ) : ( n258 ) ;
assign n260 =  ( n244 ) ? ( n243 ) : ( n259 ) ;
assign n261 =  ( n242 ) ? ( n241 ) : ( n260 ) ;
assign n262 =  ( n240 ) ? ( n239 ) : ( n261 ) ;
assign n263 =  ( n238 ) ? ( n237 ) : ( n262 ) ;
assign n264 =  ( n236 ) ? ( n250 ) : ( n263 ) ;
assign n265 =  ( n248 ) ? ( n245 ) : ( n247 ) ;
assign n266 =  ( n246 ) ? ( n243 ) : ( n265 ) ;
assign n267 =  ( n244 ) ? ( n241 ) : ( n266 ) ;
assign n268 =  ( n242 ) ? ( n239 ) : ( n267 ) ;
assign n269 =  ( n240 ) ? ( n237 ) : ( n268 ) ;
assign n270 =  ( n238 ) ? ( n250 ) : ( n269 ) ;
assign n271 =  ( n236 ) ? ( n249 ) : ( n270 ) ;
assign n272 =  ( n248 ) ? ( n243 ) : ( n245 ) ;
assign n273 =  ( n246 ) ? ( n241 ) : ( n272 ) ;
assign n274 =  ( n244 ) ? ( n239 ) : ( n273 ) ;
assign n275 =  ( n242 ) ? ( n237 ) : ( n274 ) ;
assign n276 =  ( n240 ) ? ( n250 ) : ( n275 ) ;
assign n277 =  ( n238 ) ? ( n249 ) : ( n276 ) ;
assign n278 =  ( n236 ) ? ( n247 ) : ( n277 ) ;
assign n279 =  ( n248 ) ? ( n241 ) : ( n243 ) ;
assign n280 =  ( n246 ) ? ( n239 ) : ( n279 ) ;
assign n281 =  ( n244 ) ? ( n237 ) : ( n280 ) ;
assign n282 =  ( n242 ) ? ( n250 ) : ( n281 ) ;
assign n283 =  ( n240 ) ? ( n249 ) : ( n282 ) ;
assign n284 =  ( n238 ) ? ( n247 ) : ( n283 ) ;
assign n285 =  ( n236 ) ? ( n245 ) : ( n284 ) ;
assign n286 =  ( n248 ) ? ( n239 ) : ( n241 ) ;
assign n287 =  ( n246 ) ? ( n237 ) : ( n286 ) ;
assign n288 =  ( n244 ) ? ( n250 ) : ( n287 ) ;
assign n289 =  ( n242 ) ? ( n249 ) : ( n288 ) ;
assign n290 =  ( n240 ) ? ( n247 ) : ( n289 ) ;
assign n291 =  ( n238 ) ? ( n245 ) : ( n290 ) ;
assign n292 =  ( n236 ) ? ( n243 ) : ( n291 ) ;
assign n293 =  ( n248 ) ? ( n237 ) : ( n239 ) ;
assign n294 =  ( n246 ) ? ( n250 ) : ( n293 ) ;
assign n295 =  ( n244 ) ? ( n249 ) : ( n294 ) ;
assign n296 =  ( n242 ) ? ( n247 ) : ( n295 ) ;
assign n297 =  ( n240 ) ? ( n245 ) : ( n296 ) ;
assign n298 =  ( n238 ) ? ( n243 ) : ( n297 ) ;
assign n299 =  ( n236 ) ? ( n241 ) : ( n298 ) ;
assign n300 =  ( n248 ) ? ( n250 ) : ( n237 ) ;
assign n301 =  ( n246 ) ? ( n249 ) : ( n300 ) ;
assign n302 =  ( n244 ) ? ( n247 ) : ( n301 ) ;
assign n303 =  ( n242 ) ? ( n245 ) : ( n302 ) ;
assign n304 =  ( n240 ) ? ( n243 ) : ( n303 ) ;
assign n305 =  ( n238 ) ? ( n241 ) : ( n304 ) ;
assign n306 =  ( n236 ) ? ( n239 ) : ( n305 ) ;
assign n307 =  { ( n299 ) , ( n306 ) }  ;
assign n308 =  { ( n292 ) , ( n307 ) }  ;
assign n309 =  { ( n285 ) , ( n308 ) }  ;
assign n310 =  { ( n278 ) , ( n309 ) }  ;
assign n311 =  { ( n271 ) , ( n310 ) }  ;
assign n312 =  { ( n264 ) , ( n311 ) }  ;
assign n313 =  { ( n257 ) , ( n312 ) }  ;
assign n314 =  { ( arg_1_TDATA ) , ( n313 ) }  ;
assign n315 =  ( n235 ) ? ( n314 ) : ( slice_stream_V_value_V_U ) ;
assign n316 =  ( n10 ) ? ( slice_stream_V_value_V_U ) : ( slice_stream_V_value_V_U ) ;
assign n317 =  ( n5 ) ? ( slice_stream_V_value_V_U ) : ( n316 ) ;
assign n318 =  ( n2 ) ? ( n315 ) : ( n317 ) ;
assign n319 =  ( n10 ) ? ( slice_stream_V_value_V_U_internal_full_n ) : ( slice_stream_V_value_V_U_internal_full_n ) ;
assign n320 =  ( n5 ) ? ( 1'd0 ) : ( n319 ) ;
assign n321 =  ( n2 ) ? ( 1'd1 ) : ( n320 ) ;
assign n322 = ~ ( n2 ) ;
assign n323 = ~ ( n5 ) ;
assign n324 =  ( n322 ) & ( n323 )  ;
assign n325 = ~ ( n10 ) ;
assign n326 =  ( n324 ) & ( n325 )  ;
assign n327 =  ( n324 ) & ( n10 )  ;
assign n328 =  ( n322 ) & ( n5 )  ;
assign n329 = ~ ( n236 ) ;
assign n330 =  ( n2 ) & ( n329 )  ;
assign n331 =  ( n2 ) & ( n236 )  ;
assign buffer_0_value_V_U_addr0 = n331 ? (col_reg_349) : (0);
assign buffer_0_value_V_U_data0 = n331 ? (arg_1_TDATA) : (buffer_0_value_V_U[0]);
assign n332 = ~ ( n238 ) ;
assign n333 =  ( n2 ) & ( n332 )  ;
assign n334 =  ( n2 ) & ( n238 )  ;
assign buffer_1_value_V_U_addr0 = n334 ? (col_reg_349) : (0);
assign buffer_1_value_V_U_data0 = n334 ? (arg_1_TDATA) : (buffer_1_value_V_U[0]);
assign n335 = ~ ( n240 ) ;
assign n336 =  ( n2 ) & ( n335 )  ;
assign n337 =  ( n2 ) & ( n240 )  ;
assign buffer_2_value_V_U_addr0 = n337 ? (col_reg_349) : (0);
assign buffer_2_value_V_U_data0 = n337 ? (arg_1_TDATA) : (buffer_2_value_V_U[0]);
assign n338 = ~ ( n242 ) ;
assign n339 =  ( n2 ) & ( n338 )  ;
assign n340 =  ( n2 ) & ( n242 )  ;
assign buffer_3_value_V_U_addr0 = n340 ? (col_reg_349) : (0);
assign buffer_3_value_V_U_data0 = n340 ? (arg_1_TDATA) : (buffer_3_value_V_U[0]);
assign n341 = ~ ( n244 ) ;
assign n342 =  ( n2 ) & ( n341 )  ;
assign n343 =  ( n2 ) & ( n244 )  ;
assign buffer_4_value_V_U_addr0 = n343 ? (col_reg_349) : (0);
assign buffer_4_value_V_U_data0 = n343 ? (arg_1_TDATA) : (buffer_4_value_V_U[0]);
assign n344 = ~ ( n246 ) ;
assign n345 =  ( n2 ) & ( n344 )  ;
assign n346 =  ( n2 ) & ( n246 )  ;
assign buffer_5_value_V_U_addr0 = n346 ? (col_reg_349) : (0);
assign buffer_5_value_V_U_data0 = n346 ? (arg_1_TDATA) : (buffer_5_value_V_U[0]);
assign n347 = ~ ( n248 ) ;
assign n348 =  ( n2 ) & ( n347 )  ;
assign n349 =  ( n2 ) & ( n248 )  ;
assign buffer_6_value_V_U_addr0 = n349 ? (col_reg_349) : (0);
assign buffer_6_value_V_U_data0 = n349 ? (arg_1_TDATA) : (buffer_6_value_V_U[0]);
assign n350 =  ( p_write_idx_1_1_reg_723 ) == ( 64'd7 )  ;
assign n351 = ~ ( n350 ) ;
assign n352 =  ( n2 ) & ( n351 )  ;
assign n353 =  ( n2 ) & ( n350 )  ;
assign buffer_7_value_V_U_addr0 = n353 ? (col_reg_349) : (0);
assign buffer_7_value_V_U_data0 = n353 ? (arg_1_TDATA) : (buffer_7_value_V_U[0]);
function [7:0] gaussianBlurStencil ;
input [647:0] arg0;
    begin
//TODO: Add the specific function HERE.    
        gaussianBlurStencil = arg0[7:0];
    end
endfunction

always @(posedge clk) begin
   if(rst) begin
       arg_0_TDATA <= arg_0_TDATA;
       arg_0_TVALID <= arg_0_TVALID;
       arg_1_TREADY <= arg_1_TREADY;
       buffer_0_value_V_fu_ <= buffer_0_value_V_fu_;
       buffer_1_value_V_fu_ <= buffer_1_value_V_fu_;
       buffer_2_value_V_fu_ <= buffer_2_value_V_fu_;
       buffer_3_value_V_fu_ <= buffer_3_value_V_fu_;
       buffer_4_value_V_fu_ <= buffer_4_value_V_fu_;
       buffer_5_value_V_fu_ <= buffer_5_value_V_fu_;
       buffer_6_value_V_fu_ <= buffer_6_value_V_fu_;
       buffer_7_value_V_fu_ <= buffer_7_value_V_fu_;
       col_reg_349 <= col_reg_349;
       p_p2_in_bounded_stencil_stream_full <= p_p2_in_bounded_stencil_stream_full;
       p_p2_in_bounded_stencil_stream_s_U <= p_p2_in_bounded_stencil_stream_s_U;
       p_write_idx_1_1_reg_723 <= p_write_idx_1_1_reg_723;
       row_reg_327 <= row_reg_327;
       slice_stream_V_value_V_U <= slice_stream_V_value_V_U;
       slice_stream_V_value_V_U_internal_full_n <= slice_stream_V_value_V_U_internal_full_n;
   end
   else if(step) begin
       arg_0_TDATA <= n15;
       arg_0_TVALID <= n19;
       arg_1_TREADY <= n22;
       buffer_0_value_V_fu_ <= n25;
       buffer_1_value_V_fu_ <= n28;
       buffer_2_value_V_fu_ <= n31;
       buffer_3_value_V_fu_ <= n34;
       buffer_4_value_V_fu_ <= n37;
       buffer_5_value_V_fu_ <= n40;
       buffer_6_value_V_fu_ <= n43;
       buffer_7_value_V_fu_ <= n46;
       col_reg_349 <= n52;
       p_p2_in_bounded_stencil_stream_full <= n55;
       p_p2_in_bounded_stencil_stream_s_U <= n219;
       p_write_idx_1_1_reg_723 <= n227;
       row_reg_327 <= n234;
       slice_stream_V_value_V_U <= n318;
       slice_stream_V_value_V_U_internal_full_n <= n321;
       buffer_0_value_V_U [ buffer_0_value_V_U_addr0 ] <= buffer_0_value_V_U_data0;
       buffer_1_value_V_U [ buffer_1_value_V_U_addr0 ] <= buffer_1_value_V_U_data0;
       buffer_2_value_V_U [ buffer_2_value_V_U_addr0 ] <= buffer_2_value_V_U_data0;
       buffer_3_value_V_U [ buffer_3_value_V_U_addr0 ] <= buffer_3_value_V_U_data0;
       buffer_4_value_V_U [ buffer_4_value_V_U_addr0 ] <= buffer_4_value_V_U_data0;
       buffer_5_value_V_U [ buffer_5_value_V_U_addr0 ] <= buffer_5_value_V_U_data0;
       buffer_6_value_V_U [ buffer_6_value_V_U_addr0 ] <= buffer_6_value_V_U_data0;
       buffer_7_value_V_U [ buffer_7_value_V_U_addr0 ] <= buffer_7_value_V_U_data0;
   end
end
endmodule
