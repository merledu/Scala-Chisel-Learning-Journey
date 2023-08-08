;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Counter2 : 
  module Counter2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {result : UInt<1>}
    
    reg counter1 : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Counter2.scala 10:25]
    node _counter1_T = eq(counter1, UInt<3>("h04")) @[Counter2.scala 11:18]
    when _counter1_T : @[Counter2.scala 11:35]
      counter1 <= UInt<1>("h00") @[Counter2.scala 12:15]
      skip @[Counter2.scala 11:35]
    else : @[Counter2.scala 14:16]
      node _counter1_count_T = add(counter1, UInt<1>("h01")) @[Counter2.scala 15:24]
      node _counter1_count_T_1 = tail(_counter1_count_T, 1) @[Counter2.scala 15:24]
      counter1 <= _counter1_count_T_1 @[Counter2.scala 15:15]
      skip @[Counter2.scala 14:16]
    node _io_result_T = bits(counter1, 3, 3) @[Counter2.scala 21:27]
    io.result <= _io_result_T @[Counter2.scala 21:15]
    
