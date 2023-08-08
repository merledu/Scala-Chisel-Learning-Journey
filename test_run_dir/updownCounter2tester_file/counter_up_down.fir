;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit counter_up_down : 
  module counter_up_down : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip data_in : UInt<4>, flip reload : UInt<1>, out : UInt<1>}
    
    reg countercheck_check : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[UpDownCounter.scala 15:24]
    reg countercheck : UInt<5>, clock with : (reset => (reset, UInt<5>("h00"))) @[UpDownCounter.scala 16:26]
    when countercheck_check : @[UpDownCounter.scala 17:17]
      node _countercheck_counter_T = sub(countercheck, UInt<1>("h01")) @[UpDownCounter.scala 18:26]
      node _countercheck_counter_T_1 = tail(_countercheck_counter_T, 1) @[UpDownCounter.scala 18:26]
      countercheck <= _countercheck_counter_T_1 @[UpDownCounter.scala 18:15]
      skip @[UpDownCounter.scala 17:17]
    else : @[UpDownCounter.scala 20:16]
      node _countercheck_counter_T_2 = add(countercheck, UInt<1>("h01")) @[UpDownCounter.scala 21:26]
      node _countercheck_counter_T_3 = tail(_countercheck_counter_T_2, 1) @[UpDownCounter.scala 21:26]
      countercheck <= _countercheck_counter_T_3 @[UpDownCounter.scala 21:15]
      skip @[UpDownCounter.scala 20:16]
    node _countercheck_T = eq(countercheck, UInt<2>("h03")) @[UpDownCounter.scala 24:18]
    when _countercheck_T : @[UpDownCounter.scala 24:38]
      countercheck_check <= UInt<1>("h01") @[UpDownCounter.scala 25:13]
      io.out <= UInt<1>("h01") @[UpDownCounter.scala 26:14]
      skip @[UpDownCounter.scala 24:38]
    else : @[UpDownCounter.scala 28:15]
      io.out <= UInt<1>("h00") @[UpDownCounter.scala 29:15]
      skip @[UpDownCounter.scala 28:15]
    
