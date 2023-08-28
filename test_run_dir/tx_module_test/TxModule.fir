;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit TxModule : 
  module TxModule : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip tx : UInt<1>, flip ready : UInt<1>, valid : UInt<1>, data : UInt<4>}
    
    reg currentState : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[TxModule.scala 17:29]
    reg readyI : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[TxModule.scala 18:21]
    readyI <= io.ready @[TxModule.scala 19:10]
    io.valid <= io.tx @[TxModule.scala 20:10]
    io.data <= UInt<1>("h00") @[TxModule.scala 21:11]
    node _T = eq(UInt<2>("h00"), currentState) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      node _T_1 = bits(reset, 0, 0) @[TxModule.scala 24:24]
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
    
