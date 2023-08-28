;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Main : 
  module RxModule : 
    input clock : Clock
    input reset : Reset
    output io : {flip valid : UInt<1>, flip data : UInt<4>, flip busy : UInt<1>, ready : UInt<1>}
    
    node _T = eq(io.busy, UInt<1>("h00")) @[RxModule.scala 17:7]
    when _T : @[RxModule.scala 17:16]
      io.ready <= UInt<1>("h01") @[RxModule.scala 18:12]
      skip @[RxModule.scala 17:16]
    else : @[RxModule.scala 20:13]
      io.ready <= UInt<1>("h00") @[RxModule.scala 21:14]
      skip @[RxModule.scala 20:13]
    
  module TxModule : 
    input clock : Clock
    input reset : Reset
    output io : {flip tx : UInt<1>, flip ready : UInt<1>, valid : UInt<1>, data : UInt<4>}
    
    reg currentState : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[TxModule.scala 17:29]
    reg readyI : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[TxModule.scala 18:21]
    readyI <= io.ready @[TxModule.scala 19:10]
    io.valid <= io.tx @[TxModule.scala 20:10]
    io.data <= UInt<1>("h00") @[TxModule.scala 21:11]
    node _T = eq(UInt<2>("h00"), currentState) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      node _T_1 = asUInt(reset) @[TxModule.scala 24:24]
      when _T_1 : @[TxModule.scala 24:28]
        currentState <= UInt<2>("h00") @[TxModule.scala 25:22]
        skip @[TxModule.scala 24:28]
      else : @[TxModule.scala 26:19]
        currentState <= UInt<2>("h01") @[TxModule.scala 27:22]
        skip @[TxModule.scala 26:19]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_2 = eq(UInt<2>("h01"), currentState) @[Conditional.scala 37:30]
      when _T_2 : @[Conditional.scala 39:67]
        when io.tx : @[TxModule.scala 31:19]
          currentState <= UInt<2>("h02") @[TxModule.scala 32:22]
          io.valid <= UInt<1>("h01") @[TxModule.scala 33:18]
          skip @[TxModule.scala 31:19]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_3 = eq(UInt<2>("h02"), currentState) @[Conditional.scala 37:30]
        when _T_3 : @[Conditional.scala 39:67]
          node _T_4 = and(readyI, io.valid) @[TxModule.scala 41:19]
          when _T_4 : @[TxModule.scala 41:32]
            io.data <= UInt<4>("h0a") @[TxModule.scala 42:17]
            currentState <= UInt<2>("h01") @[TxModule.scala 43:22]
            skip @[TxModule.scala 41:32]
          skip @[Conditional.scala 39:67]
    
  module Main : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip busy : UInt<1>, flip tx : UInt<1>, data : UInt<4>}
    
    inst rxmodule of RxModule @[Task3.scala 15:24]
    rxmodule.clock <= clock
    rxmodule.reset <= reset
    inst txmodule of TxModule @[Task3.scala 16:24]
    txmodule.clock <= clock
    txmodule.reset <= reset
    txmodule.io.tx <= io.tx @[Task3.scala 18:18]
    rxmodule.io.busy <= io.busy @[Task3.scala 19:20]
    rxmodule.io.valid <= txmodule.io.valid @[Task3.scala 21:21]
    rxmodule.io.data <= txmodule.io.data @[Task3.scala 22:20]
    txmodule.io.ready <= rxmodule.io.ready @[Task3.scala 23:21]
    io.data <= txmodule.io.data @[Task3.scala 25:11]
    
