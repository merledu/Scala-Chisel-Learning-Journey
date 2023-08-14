;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Task1 : 
  module Task1 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip s0 : UInt<1>, flip s1 : UInt<1>, flip s2 : UInt<1>, out : UInt<32>}
    
    node select_hi = cat(io.s2, io.s1) @[Cat.scala 30:58]
    node select = cat(select_hi, io.s0) @[Cat.scala 30:58]
    node _io_out_T = and(select, UInt<3>("h04")) @[Task1.scala 18:17]
    node _io_out_T_1 = eq(UInt<3>("h04"), _io_out_T) @[Task1.scala 18:17]
    node _io_out_T_2 = eq(select, UInt<1>("h00")) @[Task1.scala 19:17]
    node _io_out_T_3 = eq(select, UInt<1>("h01")) @[Task1.scala 20:17]
    node _io_out_T_4 = eq(select, UInt<2>("h02")) @[Task1.scala 21:17]
    node _io_out_T_5 = eq(select, UInt<2>("h03")) @[Task1.scala 22:17]
    node _io_out_T_6 = mux(_io_out_T_5, UInt<5>("h018"), UInt<1>("h01")) @[Mux.scala 98:16]
    node _io_out_T_7 = mux(_io_out_T_4, UInt<5>("h010"), _io_out_T_6) @[Mux.scala 98:16]
    node _io_out_T_8 = mux(_io_out_T_3, UInt<4>("h08"), _io_out_T_7) @[Mux.scala 98:16]
    node _io_out_T_9 = mux(_io_out_T_2, UInt<1>("h00"), _io_out_T_8) @[Mux.scala 98:16]
    node _io_out_T_10 = mux(_io_out_T_1, UInt<6>("h020"), _io_out_T_9) @[Mux.scala 98:16]
    io.out <= _io_out_T_10 @[Task1.scala 17:11]
    
