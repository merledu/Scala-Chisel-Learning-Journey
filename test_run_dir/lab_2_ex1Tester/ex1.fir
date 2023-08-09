;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit ex1 : 
  module ex1 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in_A : UInt<32>, flip in_B : UInt<32>, flip select : UInt<1>, out : UInt}
    
    when io.select : @[ex1.scala 16:21]
      io.out <= io.in_A @[ex1.scala 17:16]
      skip @[ex1.scala 16:21]
    else : @[ex1.scala 19:15]
      io.out <= io.in_B @[ex1.scala 20:16]
      skip @[ex1.scala 19:15]
    
