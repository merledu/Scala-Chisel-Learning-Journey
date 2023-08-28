circuit Main :
  module RxModule :
    input clock : Clock
    input reset : UInt<1>
    input io_valid : UInt<1>
    input io_data : UInt<4>
    input io_busy : UInt<1>
    output io_ready : UInt<1>

    node _T = eq(io_busy, UInt<1>("h0")) @[RxModule.scala 17:7]
    node _GEN_0 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[RxModule.scala 17:16 RxModule.scala 18:12 RxModule.scala 21:14]
    io_ready <= _GEN_0

  module TxModule :
    input clock : Clock
    input reset : UInt<1>
    input io_tx : UInt<1>
    input io_ready : UInt<1>
    output io_valid : UInt<1>
    output io_data : UInt<4>

    reg currentState : UInt<2>, clock with :
      reset => (UInt<1>("h0"), currentState) @[TxModule.scala 17:29]
    reg readyI : UInt<1>, clock with :
      reset => (UInt<1>("h0"), readyI) @[TxModule.scala 18:21]
    node _T = eq(UInt<2>("h0"), currentState) @[Conditional.scala 37:30]
    node _T_1 = asUInt(reset) @[TxModule.scala 24:24]
    node _GEN_0 = mux(_T_1, UInt<2>("h0"), UInt<2>("h1")) @[TxModule.scala 24:28 TxModule.scala 25:22 TxModule.scala 27:22]
    node _T_2 = eq(UInt<2>("h1"), currentState) @[Conditional.scala 37:30]
    node _GEN_1 = mux(io_tx, UInt<2>("h2"), currentState) @[TxModule.scala 31:19 TxModule.scala 32:22 TxModule.scala 17:29]
    node _GEN_2 = mux(io_tx, UInt<1>("h1"), io_tx) @[TxModule.scala 31:19 TxModule.scala 33:18 TxModule.scala 20:10]
    node _T_3 = eq(UInt<2>("h2"), currentState) @[Conditional.scala 37:30]
    node _T_4 = and(readyI, io_valid) @[TxModule.scala 41:19]
    node _GEN_3 = mux(_T_4, UInt<4>("ha"), UInt<1>("h0")) @[TxModule.scala 41:32 TxModule.scala 42:17 TxModule.scala 21:11]
    node _GEN_4 = mux(_T_4, UInt<2>("h1"), currentState) @[TxModule.scala 41:32 TxModule.scala 43:22 TxModule.scala 17:29]
    node _GEN_5 = mux(_T_3, _GEN_3, UInt<1>("h0")) @[Conditional.scala 39:67 TxModule.scala 21:11]
    node _GEN_6 = mux(_T_3, _GEN_4, currentState) @[Conditional.scala 39:67 TxModule.scala 17:29]
    node _GEN_7 = mux(_T_2, _GEN_1, _GEN_6) @[Conditional.scala 39:67]
    node _GEN_8 = mux(_T_2, _GEN_2, io_tx) @[Conditional.scala 39:67 TxModule.scala 20:10]
    node _GEN_9 = mux(_T_2, UInt<1>("h0"), _GEN_5) @[Conditional.scala 39:67 TxModule.scala 21:11]
    node _GEN_10 = mux(_T, _GEN_0, _GEN_7) @[Conditional.scala 40:58]
    node _GEN_11 = mux(_T, io_tx, _GEN_8) @[Conditional.scala 40:58 TxModule.scala 20:10]
    node _GEN_12 = mux(_T, UInt<1>("h0"), _GEN_9) @[Conditional.scala 40:58 TxModule.scala 21:11]
    io_valid <= _GEN_11
    io_data <= _GEN_12
    currentState <= mux(reset, UInt<2>("h0"), _GEN_10) @[TxModule.scala 17:29 TxModule.scala 17:29]
    readyI <= mux(reset, UInt<1>("h0"), io_ready) @[TxModule.scala 18:21 TxModule.scala 18:21 TxModule.scala 19:10]

  module Main :
    input clock : Clock
    input reset : UInt<1>
    input io_busy : UInt<1>
    input io_tx : UInt<1>
    output io_data : UInt<4>

    inst rxmodule of RxModule @[Task3.scala 15:24]
    inst txmodule of TxModule @[Task3.scala 16:24]
    io_data <= txmodule.io_data @[Task3.scala 25:11]
    rxmodule.clock <= clock
    rxmodule.reset <= reset
    rxmodule.io_valid <= txmodule.io_valid @[Task3.scala 21:21]
    rxmodule.io_data <= txmodule.io_data @[Task3.scala 22:20]
    rxmodule.io_busy <= io_busy @[Task3.scala 19:20]
    txmodule.clock <= clock
    txmodule.reset <= reset
    txmodule.io_tx <= io_tx @[Task3.scala 18:18]
    txmodule.io_ready <= rxmodule.io_ready @[Task3.scala 23:21]
