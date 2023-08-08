circuit Counter :
  module Counter :
    input clock : Clock
    input reset : UInt<1>
    output io_result : UInt<1>

    node _max_T = dshl(UInt<1>("h1"), UInt<3>("h5")) @[Counter.scala 10:15]
    node _max_T_1 = sub(_max_T, UInt<1>("h1")) @[Counter.scala 10:31]
    node max = tail(_max_T_1, 1) @[Counter.scala 10:31]
    reg count : UInt<16>, clock with :
      reset => (UInt<1>("h0"), count) @[Counter.scala 11:21]
    node _T = eq(count, max) @[Counter.scala 12:14]
    node _count_T = add(count, UInt<1>("h1")) @[Counter.scala 15:20]
    node _count_T_1 = tail(_count_T, 1) @[Counter.scala 15:20]
    node _GEN_0 = mux(_T, UInt<1>("h0"), _count_T_1) @[Counter.scala 12:24 Counter.scala 13:11 Counter.scala 15:11]
    node _io_result_T = dshr(count, UInt<4>("hf")) @[Counter.scala 17:22]
    node _io_result_T_1 = bits(_io_result_T, 0, 0) @[Counter.scala 17:22]
    io_result <= _io_result_T_1 @[Counter.scala 17:13]
    count <= mux(reset, UInt<16>("h0"), _GEN_0) @[Counter.scala 11:21 Counter.scala 11:21]
