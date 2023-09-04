;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit PC : 
  module PC : 
    input clock : Clock
    input reset : UInt<1>
    output io : {nextaddr : UInt<32>}
    
    reg counter : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[PC.scala 11:24]
    node _counter_T = add(counter, UInt<3>("h04")) @[PC.scala 13:22]
    node _counter_T_1 = tail(_counter_T, 1) @[PC.scala 13:22]
    counter <= _counter_T_1 @[PC.scala 13:11]
    io.nextaddr <= counter @[PC.scala 14:15]
    
