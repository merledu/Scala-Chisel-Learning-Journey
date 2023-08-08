circuit Counter :
  module Counter :
    input clock : Clock
    input reset : UInt<1>
    output io_result : UInt<1>

    node _max_T = dshl(UInt<1>("h1"), UInt<3>("h5")) @[task1.scala 8:17]
    node _max_T_1 = sub(_max_T, UInt<1>("h1")) @[task1.scala 8:34]
    node max = tail(_max_T_1, 1) @[task1.scala 8:34]
    reg count : UInt<16>, clock with :
      reset => (UInt<1>("h0"), count) @[task1.scala 9:21]
    node _T = eq(count, max) @[task1.scala 10:14]
    node _count_T = add(count, UInt<1>("h1")) @[task1.scala 13:20]
    node _count_T_1 = tail(_count_T, 1) @[task1.scala 13:20]
    node _GEN_0 = mux(_T, UInt<1>("h0"), _count_T_1) @[task1.scala 10:24 task1.scala 11:11 task1.scala 13:11]
    node _io_result_T = dshr(count, UInt<4>("hf")) @[task1.scala 15:22]
    node _io_result_T_1 = bits(_io_result_T, 0, 0) @[task1.scala 15:22]
    io_result <= _io_result_T_1 @[task1.scala 15:13]
    count <= mux(reset, UInt<16>("h0"), _GEN_0) @[task1.scala 9:21 task1.scala 9:21]
