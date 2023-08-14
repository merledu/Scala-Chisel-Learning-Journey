circuit Task1 :
  module Task1 :
    input clock : Clock
    input reset : UInt<1>
    input io_s0 : UInt<1>
    input io_s1 : UInt<1>
    input io_s2 : UInt<1>
    output io_out : UInt<32>

    node select_hi = cat(io_s2, io_s1) @[Cat.scala 30:58]
    node select = cat(select_hi, io_s0) @[Cat.scala 30:58]
    node _io_out_T = and(select, UInt<3>("h4")) @[Task1.scala 18:17]
    node _io_out_T_1 = eq(UInt<3>("h4"), _io_out_T) @[Task1.scala 18:17]
    node _io_out_T_2 = eq(select, UInt<1>("h0")) @[Task1.scala 19:17]
    node _io_out_T_3 = eq(select, UInt<1>("h1")) @[Task1.scala 20:17]
    node _io_out_T_4 = eq(select, UInt<2>("h2")) @[Task1.scala 21:17]
    node _io_out_T_5 = eq(select, UInt<2>("h3")) @[Task1.scala 22:17]
    node _io_out_T_6 = mux(_io_out_T_5, UInt<5>("h18"), UInt<1>("h1")) @[Mux.scala 98:16]
    node _io_out_T_7 = mux(_io_out_T_4, UInt<5>("h10"), _io_out_T_6) @[Mux.scala 98:16]
    node _io_out_T_8 = mux(_io_out_T_3, UInt<4>("h8"), _io_out_T_7) @[Mux.scala 98:16]
    node _io_out_T_9 = mux(_io_out_T_2, UInt<1>("h0"), _io_out_T_8) @[Mux.scala 98:16]
    node _io_out_T_10 = mux(_io_out_T_1, UInt<6>("h20"), _io_out_T_9) @[Mux.scala 98:16]
    io_out <= _io_out_T_10 @[Task1.scala 17:11]
