circuit shift_reg_with_parallel_load :
  module shift_reg_with_parallel_load :
    input clock : Clock
    input reset : UInt<1>
    output io_out_0 : UInt<1>
    output io_out_1 : UInt<1>
    input io_load_in_0 : UInt<1>
    input io_load_in_1 : UInt<1>
    input io_in : UInt<1>
    input io_load : UInt<1>

    reg shfitreg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), shfitreg) @[Task3.scala 12:25]
    node _T = bits(shfitreg, 0, 0) @[Task3.scala 13:29]
    node _T_1 = bits(shfitreg, 1, 1) @[Task3.scala 13:29]
    node _T_2 = eq(io_load, UInt<1>("h1")) @[Task3.scala 15:17]
    node _shfitreg_T = cat(io_load_in_1, io_load_in_0) @[Cat.scala 30:58]
    node _nextState_T = shl(shfitreg, 1) @[Task3.scala 19:34]
    node nextState = or(_nextState_T, io_in) @[Task3.scala 19:49]
    node _T_3 = bits(shfitreg, 0, 0) @[Task3.scala 21:33]
    node _T_4 = bits(shfitreg, 1, 1) @[Task3.scala 21:33]
    node _GEN_0 = mux(_T_2, _shfitreg_T, nextState) @[Task3.scala 15:25 Task3.scala 16:14 Task3.scala 20:16]
    node _GEN_1 = mux(_T_2, _T, _T_3) @[Task3.scala 15:25 Task3.scala 13:10 Task3.scala 21:14]
    node _GEN_2 = mux(_T_2, _T_1, _T_4) @[Task3.scala 15:25 Task3.scala 13:10 Task3.scala 21:14]
    io_out_0 <= _GEN_1
    io_out_1 <= _GEN_2
    shfitreg <= mux(reset, UInt<2>("h0"), bits(_GEN_0, 1, 0)) @[Task3.scala 12:25 Task3.scala 12:25]
