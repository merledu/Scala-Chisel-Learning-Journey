;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit MuxLookup : 
  module MuxLookup : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in0 : UInt<1>, flip in1 : UInt<1>, flip in2 : UInt<1>, flip in3 : UInt<1>, flip in4 : UInt<1>, flip in5 : UInt<1>, flip in6 : UInt<1>, flip in7 : UInt<1>, flip sel : UInt<3>, out : UInt<1>}
    
    node _io_out_T = bits(io.sel, 1, 1) @[ex2.scala 21:31]
    node _io_out_T_1 = eq(UInt<1>("h00"), io.sel) @[Mux.scala 80:60]
    node _io_out_T_2 = mux(_io_out_T_1, io.in0, UInt<1>("h00")) @[Mux.scala 80:57]
    node _io_out_T_3 = eq(UInt<1>("h01"), io.sel) @[Mux.scala 80:60]
    node _io_out_T_4 = mux(_io_out_T_3, io.in1, _io_out_T_2) @[Mux.scala 80:57]
    node _io_out_T_5 = eq(UInt<2>("h02"), io.sel) @[Mux.scala 80:60]
    node _io_out_T_6 = mux(_io_out_T_5, io.in2, _io_out_T_4) @[Mux.scala 80:57]
    node _io_out_T_7 = eq(UInt<2>("h03"), io.sel) @[Mux.scala 80:60]
    node _io_out_T_8 = mux(_io_out_T_7, io.in3, _io_out_T_6) @[Mux.scala 80:57]
    node _io_out_T_9 = bits(io.sel, 0, 0) @[ex2.scala 27:31]
    node _io_out_T_10 = eq(UInt<3>("h05"), _io_out_T_9) @[Mux.scala 80:60]
    node _io_out_T_11 = mux(_io_out_T_10, io.in5, io.in4) @[Mux.scala 80:57]
    node _io_out_T_12 = eq(UInt<3>("h06"), _io_out_T_9) @[Mux.scala 80:60]
    node _io_out_T_13 = mux(_io_out_T_12, io.in6, _io_out_T_11) @[Mux.scala 80:57]
    node _io_out_T_14 = eq(UInt<3>("h07"), _io_out_T_9) @[Mux.scala 80:60]
    node _io_out_T_15 = mux(_io_out_T_14, io.in7, _io_out_T_13) @[Mux.scala 80:57]
    node _io_out_T_16 = eq(UInt<1>("h01"), _io_out_T) @[Mux.scala 80:60]
    node _io_out_T_17 = mux(_io_out_T_16, _io_out_T_15, _io_out_T_8) @[Mux.scala 80:57]
    io.out <= _io_out_T_17 @[ex2.scala 21:10]
    
