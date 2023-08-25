circuit eMux :
  module eMux :
    input clock : Clock
    input reset : UInt<1>
    output io_out : SInt<4>
    input io_in1 : SInt<4>
    input io_in2 : SInt<4>
    input io_sel : UInt<1>

    node _io_out_T = mux(io_sel, io_in1, io_in2) @[ex2.scala 18:8]
    io_out <= _io_out_T @[ex2.scala 21:10]
