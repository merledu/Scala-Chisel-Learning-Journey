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
    io_out_0 <= _io_out_0_T_5 @[task2.scala 17:15]
    io_out_1 <= UInt<1>("h0") @[task2.scala 12:15]
    io_out_2 <= UInt<1>("h0") @[task2.scala 13:15]
    io_out_3 <= UInt<1>("h0") @[task2.scala 14:15]
