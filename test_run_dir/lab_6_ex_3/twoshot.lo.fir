circuit twoshot :
  module twoshot :
    input clock : Clock
    input reset : UInt<1>
    input io_din : UInt<4>
    output io_out : UInt<4>

    reg timer_count : UInt<8>, clock with :
      reset => (UInt<1>("h0"), timer_count) @[ex3.scala 13:30]
    reg shots_remaining : UInt<2>, clock with :
      reset => (UInt<1>("h0"), shots_remaining) @[ex3.scala 14:34]
    node done = eq(timer_count, UInt<1>("h0")) @[ex3.scala 15:28]
    reg next : UInt<8>, clock with :
      reset => (UInt<1>("h0"), next) @[ex3.scala 16:23]
    node _T = eq(done, UInt<1>("h0")) @[ex3.scala 21:16]
    node _T_1 = gt(shots_remaining, UInt<1>("h0")) @[ex3.scala 21:41]
    node _T_2 = and(_T, _T_1) @[ex3.scala 21:22]
    node _next_T = sub(timer_count, UInt<1>("h1")) @[ex3.scala 22:27]
    node _next_T_1 = tail(_next_T, 1) @[ex3.scala 22:27]
    node _T_3 = eq(done, UInt<1>("h0")) @[ex3.scala 24:16]
    node _shots_remaining_T = sub(shots_remaining, UInt<1>("h1")) @[ex3.scala 25:42]
    node _shots_remaining_T_1 = tail(_shots_remaining_T, 1) @[ex3.scala 25:42]
    node _GEN_0 = mux(_T_3, _shots_remaining_T_1, shots_remaining) @[ex3.scala 24:22 ex3.scala 25:23 ex3.scala 14:34]
    node _GEN_1 = mux(_T_2, _next_T_1, next) @[ex3.scala 21:48 ex3.scala 22:12 ex3.scala 16:23]
    node _GEN_2 = mux(_T_2, shots_remaining, _GEN_0) @[ex3.scala 21:48 ex3.scala 14:34]
    node _GEN_3 = mux(done, io_din, _GEN_1) @[ex3.scala 18:16 ex3.scala 19:12]
    node _GEN_4 = mux(done, UInt<2>("h2"), _GEN_2) @[ex3.scala 18:16 ex3.scala 20:23]
    io_out <= bits(timer_count, 3, 0) @[ex3.scala 27:12]
    timer_count <= mux(reset, UInt<8>("h0"), next) @[ex3.scala 13:30 ex3.scala 13:30 ex3.scala 29:17]
    shots_remaining <= mux(reset, UInt<2>("h2"), _GEN_4) @[ex3.scala 14:34 ex3.scala 14:34]
    next <= mux(reset, UInt<1>("h0"), _GEN_3) @[ex3.scala 16:23 ex3.scala 16:23]
