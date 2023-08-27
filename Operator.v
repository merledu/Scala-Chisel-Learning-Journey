module Operator(
  input        clock,
  input        reset,
  input  [7:0] io_in_0,
  input  [7:0] io_in_1,
  input  [7:0] io_in_2,
  output [7:0] io_out_0,
  output [7:0] io_out_1,
  output [7:0] io_out_2
);
  wire [7:0] _outputVec_0_T = io_in_0 & io_in_1; // @[ex3.scala 30:11]
  assign io_out_0 = _outputVec_0_T & io_in_2; // @[ex3.scala 30:11]
  assign io_out_1 = _outputVec_0_T & io_in_2; // @[ex3.scala 30:11]
  assign io_out_2 = _outputVec_0_T & io_in_2; // @[ex3.scala 30:11]
endmodule
