circuit Counter2 :
  module Counter2 :
    input clock : Clock
    input reset : UInt<1>
    output io_result : UInt<1>

    reg counter1 : UInt<4>, clock with :
      reset => (UInt<1>("h0"), counter1) @[Counter2.scala 10:25]
    node _counter1_T = eq(counter1, UInt<3>("h4")) @[Counter2.scala 11:18]
    node _counter1_count_T = add(counter1, UInt<1>("h1")) @[Counter2.scala 15:24]
    node _counter1_count_T_1 = tail(_counter1_count_T, 1) @[Counter2.scala 15:24]
    node _GEN_0 = mux(_counter1_T, UInt<1>("h0"), _counter1_count_T_1) @[Counter2.scala 11:35 Counter2.scala 12:15 Counter2.scala 15:15]
    node _io_result_T = bits(counter1, 3, 3) @[Counter2.scala 21:27]
    io_result <= _io_result_T @[Counter2.scala 21:15]
    counter1 <= mux(reset, UInt<4>("h0"), _GEN_0) @[Counter2.scala 10:25 Counter2.scala 10:25]
