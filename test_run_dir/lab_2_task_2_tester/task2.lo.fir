circuit task2 :
  module task2 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_0 : UInt<1>
    input io_in_1 : UInt<1>
    input io_in_2 : UInt<1>
    input io_in_3 : UInt<1>
    input io_sel_0 : UInt<1>
    input io_sel_1 : UInt<1>
    input io_shift_type : UInt<1>
    output io_out_0 : UInt<1>
    output io_out_1 : UInt<1>
    output io_out_2 : UInt<1>
    output io_out_3 : UInt<1>

    node select = cat(io_sel_1, io_sel_0) @[Cat.scala 30:58]
    node _io_out_0_T = eq(UInt<1>("h1"), select) @[Mux.scala 80:60]
    node _io_out_0_T_1 = mux(_io_out_0_T, io_in_1, io_in_0) @[Mux.scala 80:57]
    node _io_out_0_T_2 = eq(UInt<2>("h2"), select) @[Mux.scala 80:60]
    node _io_out_0_T_3 = mux(_io_out_0_T_2, io_in_2, _io_out_0_T_1) @[Mux.scala 80:57]
    node _io_out_0_T_4 = eq(UInt<2>("h3"), select) @[Mux.scala 80:60]
    node _io_out_0_T_5 = mux(_io_out_0_T_4, io_in_3, _io_out_0_T_3) @[Mux.scala 80:57]
    node _io_out_1_T = mux(io_shift_type, io_in_0, UInt<1>("h0")) @[task2.scala 26:21]
    node _io_out_1_T_1 = eq(UInt<1>("h1"), select) @[Mux.scala 80:60]
    node _io_out_1_T_2 = mux(_io_out_1_T_1, io_in_2, io_in_1) @[Mux.scala 80:57]
    node _io_out_1_T_3 = eq(UInt<2>("h2"), select) @[Mux.scala 80:60]
    node _io_out_1_T_4 = mux(_io_out_1_T_3, io_in_3, _io_out_1_T_2) @[Mux.scala 80:57]
    node _io_out_1_T_5 = eq(UInt<2>("h3"), select) @[Mux.scala 80:60]
    node _io_out_1_T_6 = mux(_io_out_1_T_5, _io_out_1_T, _io_out_1_T_4) @[Mux.scala 80:57]
    node _io_out_2_T = mux(io_shift_type, io_in_0, UInt<1>("h0")) @[task2.scala 32:21]
    node _io_out_2_T_1 = mux(io_shift_type, io_in_1, UInt<1>("h0")) @[task2.scala 33:21]
    node _io_out_2_T_2 = eq(UInt<1>("h1"), select) @[Mux.scala 80:60]
    node _io_out_2_T_3 = mux(_io_out_2_T_2, io_in_3, io_in_2) @[Mux.scala 80:57]
    node _io_out_2_T_4 = eq(UInt<2>("h2"), select) @[Mux.scala 80:60]
    node _io_out_2_T_5 = mux(_io_out_2_T_4, _io_out_2_T, _io_out_2_T_3) @[Mux.scala 80:57]
    node _io_out_2_T_6 = eq(UInt<2>("h3"), select) @[Mux.scala 80:60]
    node _io_out_2_T_7 = mux(_io_out_2_T_6, _io_out_2_T_1, _io_out_2_T_5) @[Mux.scala 80:57]
    node _io_out_3_T = mux(io_shift_type, io_in_0, UInt<1>("h0")) @[task2.scala 38:21]
    node _io_out_3_T_1 = mux(io_shift_type, io_in_1, UInt<1>("h0")) @[task2.scala 39:21]
    node _io_out_3_T_2 = mux(io_shift_type, io_in_2, UInt<1>("h0")) @[task2.scala 40:21]
    node _io_out_3_T_3 = eq(UInt<1>("h1"), select) @[Mux.scala 80:60]
    node _io_out_3_T_4 = mux(_io_out_3_T_3, _io_out_3_T, io_in_3) @[Mux.scala 80:57]
    node _io_out_3_T_5 = eq(UInt<2>("h2"), select) @[Mux.scala 80:60]
    node _io_out_3_T_6 = mux(_io_out_3_T_5, _io_out_3_T_1, _io_out_3_T_4) @[Mux.scala 80:57]
    node _io_out_3_T_7 = eq(UInt<2>("h3"), select) @[Mux.scala 80:60]
    node _io_out_3_T_8 = mux(_io_out_3_T_7, _io_out_3_T_2, _io_out_3_T_6) @[Mux.scala 80:57]
    io_out_0 <= _io_out_0_T_5 @[task2.scala 16:15]
    io_out_1 <= _io_out_1_T_6 @[task2.scala 22:15]
    io_out_2 <= _io_out_2_T_7 @[task2.scala 29:15]
    io_out_3 <= _io_out_3_T_8 @[task2.scala 36:15]
