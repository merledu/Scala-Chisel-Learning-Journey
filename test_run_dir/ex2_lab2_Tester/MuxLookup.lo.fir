circuit MuxLookup :
  module MuxLookup :
    input clock : Clock
    input reset : UInt<1>
    input io_in0 : UInt<1>
    input io_in1 : UInt<1>
    input io_in2 : UInt<1>
    input io_in3 : UInt<1>
    input io_in4 : UInt<1>
    input io_in5 : UInt<1>
    input io_in6 : UInt<1>
    input io_in7 : UInt<1>
    input io_sel : UInt<3>
    output io_out : UInt<1>

    node _io_out_T = bits(io_sel, 1, 1) @[ex2.scala 21:31]
    node _io_out_T_1 = eq(UInt<1>("h0"), io_sel) @[Mux.scala 80:60]
    node _io_out_T_2 = mux(_io_out_T_1, io_in0, UInt<1>("h0")) @[Mux.scala 80:57]
    node _io_out_T_3 = eq(UInt<1>("h1"), io_sel) @[Mux.scala 80:60]
    node _io_out_T_4 = mux(_io_out_T_3, io_in1, _io_out_T_2) @[Mux.scala 80:57]
    node _io_out_T_5 = eq(UInt<2>("h2"), io_sel) @[Mux.scala 80:60]
    node _io_out_T_6 = mux(_io_out_T_5, io_in2, _io_out_T_4) @[Mux.scala 80:57]
    node _io_out_T_7 = eq(UInt<2>("h3"), io_sel) @[Mux.scala 80:60]
    node _io_out_T_8 = mux(_io_out_T_7, io_in3, _io_out_T_6) @[Mux.scala 80:57]
    node _io_out_T_9 = bits(io_sel, 0, 0) @[ex2.scala 27:31]
    node _io_out_T_10 = eq(UInt<3>("h5"), _io_out_T_9) @[Mux.scala 80:60]
    node _io_out_T_11 = mux(_io_out_T_10, io_in5, io_in4) @[Mux.scala 80:57]
    node _io_out_T_12 = eq(UInt<3>("h6"), _io_out_T_9) @[Mux.scala 80:60]
    node _io_out_T_13 = mux(_io_out_T_12, io_in6, _io_out_T_11) @[Mux.scala 80:57]
    node _io_out_T_14 = eq(UInt<3>("h7"), _io_out_T_9) @[Mux.scala 80:60]
    node _io_out_T_15 = mux(_io_out_T_14, io_in7, _io_out_T_13) @[Mux.scala 80:57]
    node _io_out_T_16 = eq(UInt<1>("h1"), _io_out_T) @[Mux.scala 80:60]
    node _io_out_T_17 = mux(_io_out_T_16, _io_out_T_15, _io_out_T_8) @[Mux.scala 80:57]
    io_out <= _io_out_T_17 @[ex2.scala 21:10]
