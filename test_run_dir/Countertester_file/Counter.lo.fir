circuit Counter :
  module Counter :
    input clock : Clock
    input reset : UInt<1>
    output io_result : UInt<1>

    node _max_T = dshl(UInt<1>("h1"), UInt<2>("h2")) @[Counter.scala 10:15]
    node _max_T_1 = sub(_max_T, UInt<1>("h1")) @[Counter.scala 10:31]
    node max = tail(_max_T_1, 1) @[Counter.scala 10:31]
    reg count : UInt<16>, clock with :
      reset => (UInt<1>("h0"), count) @[Counter.scala 11:21]
    node _T = dshr(count, UInt<2>("h2")) @[Counter.scala 12:11]
    node _T_1 = bits(_T, 0, 0) @[Counter.scala 12:11]
    node _T_2 = eq(_T_1, UInt<1>("h1")) @[Counter.scala 12:25]
    node _count_T = add(count, UInt<1>("h1")) @[Counter.scala 18:20]
    node _count_T_1 = tail(_count_T, 1) @[Counter.scala 18:20]
    node _GEN_0 = mux(_T_2, UInt<1>("h0"), _count_T_1) @[Counter.scala 12:35 Counter.scala 14:11 Counter.scala 18:11]
    node _GEN_1 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[Counter.scala 12:35 Counter.scala 15:14 Counter.scala 19:14]
    io_result <= _GEN_1
    count <= mux(reset, UInt<16>("h0"), _GEN_0) @[Counter.scala 11:21 Counter.scala 11:21]
