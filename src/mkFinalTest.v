//
// Generated by Bluespec Compiler, version 2018.10.beta1 (build e1df8052c, 2018-10-17)
//
// On Fri Oct 25 00:24:14 IST 2019
//
//
// Ports:
// Name                         I/O  size props
// CLK                            I     1 clock
// RST_N                          I     1 reset
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkFinalTest(CLK,
		   RST_N);
  input  CLK;
  input  RST_N;

  // register address
  reg [15 : 0] address;
  wire [15 : 0] address$D_IN;
  wire address$EN;

  // register h_00
  reg [7 : 0] h_00;
  wire [7 : 0] h_00$D_IN;
  wire h_00$EN;

  // register h_01
  reg [7 : 0] h_01;
  wire [7 : 0] h_01$D_IN;
  wire h_01$EN;

  // register l_00
  reg [7 : 0] l_00;
  wire [7 : 0] l_00$D_IN;
  wire l_00$EN;

  // register l_01
  reg [7 : 0] l_01;
  wire [7 : 0] l_01$D_IN;
  wire l_01$EN;

  // register read_count
  reg [15 : 0] read_count;
  wire [15 : 0] read_count$D_IN;
  wire read_count$EN;

  // register state
  reg [15 : 0] state;
  wire [15 : 0] state$D_IN;
  wire state$EN;

  // ports of submodule c_fifo_0
  wire [7 : 0] c_fifo_0$D_IN, c_fifo_0$D_OUT;
  wire c_fifo_0$CLR,
       c_fifo_0$DEQ,
       c_fifo_0$EMPTY_N,
       c_fifo_0$ENQ,
       c_fifo_0$FULL_N;

  // ports of submodule c_fifo_1
  wire [7 : 0] c_fifo_1$D_IN, c_fifo_1$D_OUT;
  wire c_fifo_1$CLR,
       c_fifo_1$DEQ,
       c_fifo_1$EMPTY_N,
       c_fifo_1$ENQ,
       c_fifo_1$FULL_N;

  // ports of submodule c_fifo_h0
  wire [7 : 0] c_fifo_h0$D_IN;
  wire c_fifo_h0$CLR, c_fifo_h0$DEQ, c_fifo_h0$ENQ;

  // ports of submodule c_fifo_h1
  wire [7 : 0] c_fifo_h1$D_IN;
  wire c_fifo_h1$CLR, c_fifo_h1$DEQ, c_fifo_h1$ENQ;

  // ports of submodule high_pass
  wire [15 : 0] high_pass$input_two_value_value;
  wire high_pass$EN_h_0, high_pass$EN_input_two_value;

  // ports of submodule image
  wire [15 : 0] image$ADDR_1,
		image$ADDR_2,
		image$ADDR_3,
		image$ADDR_4,
		image$ADDR_5,
		image$ADDR_IN;
  wire [7 : 0] image$D_IN,
	       image$D_OUT_1,
	       image$D_OUT_2,
	       image$D_OUT_3,
	       image$D_OUT_4;
  wire image$WE;

  // ports of submodule low_pass
  wire [15 : 0] low_pass$input_two_value_value;
  wire low_pass$EN_h_0, low_pass$EN_input_two_value;

  // ports of submodule row_fifo_0
  wire [7 : 0] row_fifo_0$D_IN, row_fifo_0$D_OUT;
  wire row_fifo_0$CLR,
       row_fifo_0$DEQ,
       row_fifo_0$EMPTY_N,
       row_fifo_0$ENQ,
       row_fifo_0$FULL_N;

  // ports of submodule row_fifo_1
  wire [7 : 0] row_fifo_1$D_IN, row_fifo_1$D_OUT;
  wire row_fifo_1$CLR,
       row_fifo_1$DEQ,
       row_fifo_1$EMPTY_N,
       row_fifo_1$ENQ,
       row_fifo_1$FULL_N;

  // rule scheduling signals
  wire WILL_FIRE_RL_first_coefficient,
       WILL_FIRE_RL_initial_push,
       WILL_FIRE_RL_push_till_last_address;

  // inputs to muxes for submodule ports
  wire [15 : 0] MUX_address$write_1__VAL_2, MUX_read_count$write_1__VAL_2;

  // remaining internal signals
  wire [15 : 0] x__h1431, x__h1451, x__h1474;
  wire [7 : 0] hh__h1971,
	       x__h1865,
	       x__h1955,
	       x__h2052,
	       y__h1866,
	       y__h1956,
	       y__h2053;
  wire row_fifo_0_i_notFull_AND_row_fifo_1_i_notFull__ETC___d7;

  // submodule c_fifo_0
  FIFO2 #(.width(32'd8), .guarded(32'd1)) c_fifo_0(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(c_fifo_0$D_IN),
						   .ENQ(c_fifo_0$ENQ),
						   .DEQ(c_fifo_0$DEQ),
						   .CLR(c_fifo_0$CLR),
						   .D_OUT(c_fifo_0$D_OUT),
						   .FULL_N(c_fifo_0$FULL_N),
						   .EMPTY_N(c_fifo_0$EMPTY_N));

  // submodule c_fifo_1
  FIFO2 #(.width(32'd8), .guarded(32'd1)) c_fifo_1(.RST(RST_N),
						   .CLK(CLK),
						   .D_IN(c_fifo_1$D_IN),
						   .ENQ(c_fifo_1$ENQ),
						   .DEQ(c_fifo_1$DEQ),
						   .CLR(c_fifo_1$CLR),
						   .D_OUT(c_fifo_1$D_OUT),
						   .FULL_N(c_fifo_1$FULL_N),
						   .EMPTY_N(c_fifo_1$EMPTY_N));

  // submodule c_fifo_h0
  FIFO2 #(.width(32'd8), .guarded(32'd1)) c_fifo_h0(.RST(RST_N),
						    .CLK(CLK),
						    .D_IN(c_fifo_h0$D_IN),
						    .ENQ(c_fifo_h0$ENQ),
						    .DEQ(c_fifo_h0$DEQ),
						    .CLR(c_fifo_h0$CLR),
						    .D_OUT(),
						    .FULL_N(),
						    .EMPTY_N());

  // submodule c_fifo_h1
  FIFO2 #(.width(32'd8), .guarded(32'd1)) c_fifo_h1(.RST(RST_N),
						    .CLK(CLK),
						    .D_IN(c_fifo_h1$D_IN),
						    .ENQ(c_fifo_h1$ENQ),
						    .DEQ(c_fifo_h1$DEQ),
						    .CLR(c_fifo_h1$CLR),
						    .D_OUT(),
						    .FULL_N(),
						    .EMPTY_N());

  // submodule high_pass
  mkHP high_pass(.CLK(CLK),
		 .RST_N(RST_N),
		 .input_two_value_value(high_pass$input_two_value_value),
		 .EN_input_two_value(high_pass$EN_input_two_value),
		 .EN_h_0(high_pass$EN_h_0),
		 .RDY_input_two_value(),
		 .h_0(),
		 .RDY_h_0());

  // submodule image
  RegFileLoad #(.file("image_text_file/lena256bw.txt"),
		.addr_width(32'd16),
		.data_width(32'd8),
		.lo(16'd0),
		.hi(16'd65535),
		.binary(1'd0)) image(.CLK(CLK),
				     .ADDR_1(image$ADDR_1),
				     .ADDR_2(image$ADDR_2),
				     .ADDR_3(image$ADDR_3),
				     .ADDR_4(image$ADDR_4),
				     .ADDR_5(image$ADDR_5),
				     .ADDR_IN(image$ADDR_IN),
				     .D_IN(image$D_IN),
				     .WE(image$WE),
				     .D_OUT_1(image$D_OUT_1),
				     .D_OUT_2(image$D_OUT_2),
				     .D_OUT_3(image$D_OUT_3),
				     .D_OUT_4(image$D_OUT_4),
				     .D_OUT_5());

  // submodule low_pass
  mkLP low_pass(.CLK(CLK),
		.RST_N(RST_N),
		.input_two_value_value(low_pass$input_two_value_value),
		.EN_input_two_value(low_pass$EN_input_two_value),
		.EN_h_0(low_pass$EN_h_0),
		.RDY_input_two_value(),
		.h_0(),
		.RDY_h_0());

  // submodule row_fifo_0
  FIFO2 #(.width(32'd8), .guarded(32'd1)) row_fifo_0(.RST(RST_N),
						     .CLK(CLK),
						     .D_IN(row_fifo_0$D_IN),
						     .ENQ(row_fifo_0$ENQ),
						     .DEQ(row_fifo_0$DEQ),
						     .CLR(row_fifo_0$CLR),
						     .D_OUT(row_fifo_0$D_OUT),
						     .FULL_N(row_fifo_0$FULL_N),
						     .EMPTY_N(row_fifo_0$EMPTY_N));

  // submodule row_fifo_1
  FIFO2 #(.width(32'd8), .guarded(32'd1)) row_fifo_1(.RST(RST_N),
						     .CLK(CLK),
						     .D_IN(row_fifo_1$D_IN),
						     .ENQ(row_fifo_1$ENQ),
						     .DEQ(row_fifo_1$DEQ),
						     .CLR(row_fifo_1$CLR),
						     .D_OUT(row_fifo_1$D_OUT),
						     .FULL_N(row_fifo_1$FULL_N),
						     .EMPTY_N(row_fifo_1$EMPTY_N));

  // rule RL_initial_push
  assign WILL_FIRE_RL_initial_push =
	     row_fifo_0_i_notFull_AND_row_fifo_1_i_notFull__ETC___d7 &&
	     address == 16'd0 &&
	     state == 16'd0 ;

  // rule RL_first_coefficient
  assign WILL_FIRE_RL_first_coefficient =
	     c_fifo_0$EMPTY_N && c_fifo_1$EMPTY_N && row_fifo_0$EMPTY_N &&
	     row_fifo_1$EMPTY_N &&
	     address > 16'd3 ;

  // rule RL_push_till_last_address
  assign WILL_FIRE_RL_push_till_last_address =
	     row_fifo_0_i_notFull_AND_row_fifo_1_i_notFull__ETC___d7 &&
	     address > 16'd1 ;

  // inputs to muxes for submodule ports
  assign MUX_address$write_1__VAL_2 =
	     (read_count == 16'd254) ? x__h1431 : x__h1474 ;
  assign MUX_read_count$write_1__VAL_2 =
	     (read_count == 16'd254) ? 16'd2 : x__h1451 ;

  // register address
  assign address$D_IN =
	     WILL_FIRE_RL_initial_push ?
	       x__h1474 :
	       MUX_address$write_1__VAL_2 ;
  assign address$EN =
	     WILL_FIRE_RL_initial_push ||
	     WILL_FIRE_RL_push_till_last_address ;

  // register h_00
  assign h_00$D_IN =
	     (row_fifo_1$D_OUT < row_fifo_0$D_OUT) ?
	       8'd0 :
	       x__h1865 - y__h1866 ;
  assign h_00$EN = WILL_FIRE_RL_first_coefficient ;

  // register h_01
  assign h_01$D_IN =
	     (c_fifo_1$D_OUT < c_fifo_0$D_OUT) ? 8'd0 : x__h1955 - y__h1956 ;
  assign h_01$EN = WILL_FIRE_RL_first_coefficient ;

  // register l_00
  assign l_00$D_IN = x__h1865 + y__h1866 ;
  assign l_00$EN = WILL_FIRE_RL_first_coefficient ;

  // register l_01
  assign l_01$D_IN = x__h1955 + y__h1956 ;
  assign l_01$EN = WILL_FIRE_RL_first_coefficient ;

  // register read_count
  assign read_count$D_IN =
	     WILL_FIRE_RL_initial_push ?
	       x__h1451 :
	       MUX_read_count$write_1__VAL_2 ;
  assign read_count$EN =
	     WILL_FIRE_RL_initial_push ||
	     WILL_FIRE_RL_push_till_last_address ;

  // register state
  assign state$D_IN = state + 16'd1 ;
  assign state$EN =
	     WILL_FIRE_RL_first_coefficient || WILL_FIRE_RL_initial_push ;

  // submodule c_fifo_0
  assign c_fifo_0$D_IN = image$D_OUT_3 ;
  assign c_fifo_0$ENQ =
	     WILL_FIRE_RL_push_till_last_address ||
	     WILL_FIRE_RL_initial_push ;
  assign c_fifo_0$DEQ = WILL_FIRE_RL_first_coefficient ;
  assign c_fifo_0$CLR = 1'b0 ;

  // submodule c_fifo_1
  assign c_fifo_1$D_IN = image$D_OUT_2 ;
  assign c_fifo_1$ENQ =
	     WILL_FIRE_RL_push_till_last_address ||
	     WILL_FIRE_RL_initial_push ;
  assign c_fifo_1$DEQ = WILL_FIRE_RL_first_coefficient ;
  assign c_fifo_1$CLR = 1'b0 ;

  // submodule c_fifo_h0
  assign c_fifo_h0$D_IN = 8'h0 ;
  assign c_fifo_h0$ENQ = 1'b0 ;
  assign c_fifo_h0$DEQ = 1'b0 ;
  assign c_fifo_h0$CLR = 1'b0 ;

  // submodule c_fifo_h1
  assign c_fifo_h1$D_IN = 8'h0 ;
  assign c_fifo_h1$ENQ = 1'b0 ;
  assign c_fifo_h1$DEQ = 1'b0 ;
  assign c_fifo_h1$CLR = 1'b0 ;

  // submodule high_pass
  assign high_pass$input_two_value_value = 16'h0 ;
  assign high_pass$EN_input_two_value = 1'b0 ;
  assign high_pass$EN_h_0 = 1'b0 ;

  // submodule image
  assign image$ADDR_1 = address ;
  assign image$ADDR_2 = address + 16'd257 ;
  assign image$ADDR_3 = address + 16'd256 ;
  assign image$ADDR_4 = address + 16'd1 ;
  assign image$ADDR_5 = 16'h0 ;
  assign image$ADDR_IN = 16'h0 ;
  assign image$D_IN = 8'h0 ;
  assign image$WE = 1'b0 ;

  // submodule low_pass
  assign low_pass$input_two_value_value = 16'h0 ;
  assign low_pass$EN_input_two_value = 1'b0 ;
  assign low_pass$EN_h_0 = 1'b0 ;

  // submodule row_fifo_0
  assign row_fifo_0$D_IN = image$D_OUT_1 ;
  assign row_fifo_0$ENQ =
	     WILL_FIRE_RL_push_till_last_address ||
	     WILL_FIRE_RL_initial_push ;
  assign row_fifo_0$DEQ = WILL_FIRE_RL_first_coefficient ;
  assign row_fifo_0$CLR = 1'b0 ;

  // submodule row_fifo_1
  assign row_fifo_1$D_IN = image$D_OUT_4 ;
  assign row_fifo_1$ENQ =
	     WILL_FIRE_RL_push_till_last_address ||
	     WILL_FIRE_RL_initial_push ;
  assign row_fifo_1$DEQ = WILL_FIRE_RL_first_coefficient ;
  assign row_fifo_1$CLR = 1'b0 ;

  // remaining internal signals
  assign hh__h1971 = (h_01 < h_00) ? 8'd0 : x__h2052 - y__h2053 ;
  assign row_fifo_0_i_notFull_AND_row_fifo_1_i_notFull__ETC___d7 =
	     row_fifo_0$FULL_N && row_fifo_1$FULL_N && c_fifo_0$FULL_N &&
	     c_fifo_1$FULL_N ;
  assign x__h1431 = address + 16'd258 ;
  assign x__h1451 = read_count + 16'd2 ;
  assign x__h1474 = address + 16'd2 ;
  assign x__h1865 = row_fifo_1$D_OUT >> 1 ;
  assign x__h1955 = c_fifo_1$D_OUT >> 1 ;
  assign x__h2052 = h_01 >> 1 ;
  assign y__h1866 = row_fifo_0$D_OUT >> 1 ;
  assign y__h1956 = c_fifo_0$D_OUT >> 1 ;
  assign y__h2053 = h_00 >> 1 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        address <= `BSV_ASSIGNMENT_DELAY 16'd0;
	h_00 <= `BSV_ASSIGNMENT_DELAY 8'd0;
	h_01 <= `BSV_ASSIGNMENT_DELAY 8'd0;
	l_00 <= `BSV_ASSIGNMENT_DELAY 8'd0;
	l_01 <= `BSV_ASSIGNMENT_DELAY 8'd0;
	read_count <= `BSV_ASSIGNMENT_DELAY 16'd0;
	state <= `BSV_ASSIGNMENT_DELAY 16'd0;
      end
    else
      begin
        if (address$EN) address <= `BSV_ASSIGNMENT_DELAY address$D_IN;
	if (h_00$EN) h_00 <= `BSV_ASSIGNMENT_DELAY h_00$D_IN;
	if (h_01$EN) h_01 <= `BSV_ASSIGNMENT_DELAY h_01$D_IN;
	if (l_00$EN) l_00 <= `BSV_ASSIGNMENT_DELAY l_00$D_IN;
	if (l_01$EN) l_01 <= `BSV_ASSIGNMENT_DELAY l_01$D_IN;
	if (read_count$EN)
	  read_count <= `BSV_ASSIGNMENT_DELAY read_count$D_IN;
	if (state$EN) state <= `BSV_ASSIGNMENT_DELAY state$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    address = 16'hAAAA;
    h_00 = 8'hAA;
    h_01 = 8'hAA;
    l_00 = 8'hAA;
    l_01 = 8'hAA;
    read_count = 16'hAAAA;
    state = 16'hAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE) if (state == 16'd16386) $finish(32'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_first_coefficient) $display(hh__h1971);
  end
  // synopsys translate_on
endmodule  // mkFinalTest

