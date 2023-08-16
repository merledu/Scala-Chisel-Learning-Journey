circuit Ex1 :
  module Ex1 :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<4>
    output io_out : UInt<2>

    node _T = eq(UInt<1>("h1"), io_in) @[Conditional.scala 37:30]
    node _T_1 = eq(UInt<2>("h2"), io_in) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<3>("h4"), io_in) @[Conditional.scala 37:30]
    node _T_3 = eq(UInt<4>("h8"), io_in) @[Conditional.scala 37:30]
    node _GEN_0 = mux(_T_3, UInt<2>("h3"), UInt<1>("h0")) @[Conditional.scala 39:67 Ex1.scala 25:13 Ex1.scala 12:10]
    node _GEN_1 = mux(_T_2, UInt<2>("h2"), _GEN_0) @[Conditional.scala 39:67 Ex1.scala 22:14]
    node _GEN_2 = mux(_T_1, UInt<1>("h1"), _GEN_1) @[Conditional.scala 39:67 Ex1.scala 19:14]
    node _GEN_3 = mux(_T, UInt<1>("h0"), _GEN_2) @[Conditional.scala 40:58 Ex1.scala 16:14]
    io_out <= _GEN_3
