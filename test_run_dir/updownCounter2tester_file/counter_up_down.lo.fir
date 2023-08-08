circuit counter_up_down :
  module counter_up_down :
    input clock : Clock
    input reset : UInt<1>
    input io_data_in : UInt<4>
    input io_reload : UInt<1>
    output io_out : UInt<1>

    reg countercheck_check : UInt<1>, clock with :
      reset => (UInt<1>("h0"), countercheck_check) @[UpDownCounter.scala 15:24]
    reg countercheck : UInt<5>, clock with :
      reset => (UInt<1>("h0"), countercheck) @[UpDownCounter.scala 16:26]
    node _countercheck_counter_T = sub(countercheck, UInt<1>("h1")) @[UpDownCounter.scala 18:26]
    node _countercheck_counter_T_1 = tail(_countercheck_counter_T, 1) @[UpDownCounter.scala 18:26]
    node _countercheck_counter_T_2 = add(countercheck, UInt<1>("h1")) @[UpDownCounter.scala 21:26]
    node _countercheck_counter_T_3 = tail(_countercheck_counter_T_2, 1) @[UpDownCounter.scala 21:26]
    node _GEN_0 = mux(countercheck_check, _countercheck_counter_T_1, _countercheck_counter_T_3) @[UpDownCounter.scala 17:17 UpDownCounter.scala 18:15 UpDownCounter.scala 21:15]
    node _countercheck_T = eq(countercheck, UInt<2>("h3")) @[UpDownCounter.scala 24:18]
    node _GEN_1 = mux(_countercheck_T, UInt<1>("h1"), countercheck_check) @[UpDownCounter.scala 24:38 UpDownCounter.scala 25:13 UpDownCounter.scala 15:24]
    node _GEN_2 = mux(_countercheck_T, UInt<1>("h1"), UInt<1>("h0")) @[UpDownCounter.scala 24:38 UpDownCounter.scala 26:14 UpDownCounter.scala 29:15]
    io_out <= _GEN_2
    countercheck_check <= mux(reset, UInt<1>("h0"), _GEN_1) @[UpDownCounter.scala 15:24 UpDownCounter.scala 15:24]
    countercheck <= mux(reset, UInt<5>("h0"), _GEN_0) @[UpDownCounter.scala 16:26 UpDownCounter.scala 16:26]
