//
// Generated by Bluespec Compiler, version 2018.10.beta1 (build e1df8052c, 2018-10-17)
//
// On Wed Oct 23 00:32:01 IST 2019
//
//
// Ports:
// Name                         I/O  size props
// RDY_input_two_value            O     1 const
// h_0                            O     8 reg
// RDY_h_0                        O     1 const
// CLK                            I     1 clock
// RST_N                          I     1 reset
// input_two_value_value          I    16
// EN_input_two_value             I     1
// EN_h_0                         I     1 unused
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

module mkLP(CLK,
	    RST_N,

	    input_two_value_value,
	    EN_input_two_value,
	    RDY_input_two_value,

	    EN_h_0,
	    h_0,
	    RDY_h_0);
  input  CLK;
  input  RST_N;

  // action method input_two_value
  input  [15 : 0] input_two_value_value;
  input  EN_input_two_value;
  output RDY_input_two_value;

  // actionvalue method h_0
  input  EN_h_0;
  output [7 : 0] h_0;
  output RDY_h_0;

  // signals for module outputs
  wire [7 : 0] h_0;
  wire RDY_h_0, RDY_input_two_value;

  // register out
  reg [7 : 0] out;
  wire [7 : 0] out$D_IN;
  wire out$EN;

  // action method input_two_value
  assign RDY_input_two_value = 1'd1 ;

  // actionvalue method h_0
  assign h_0 = out ;
  assign RDY_h_0 = 1'd1 ;

  // register out
  assign out$D_IN =
	     input_two_value_value[7:0] + input_two_value_value[15:8] >> 1 ;
  assign out$EN = EN_input_two_value ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        out <= `BSV_ASSIGNMENT_DELAY 8'd0;
      end
    else
      begin
        if (out$EN) out <= `BSV_ASSIGNMENT_DELAY out$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    out = 8'hAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkLP
