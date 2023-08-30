;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit shift_register : 
  module shift_register : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<4>, out : UInt<4>}
    
    reg state : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[ex1.scala 11:23]
    node _nextState_T = shl(state, 4) @[ex1.scala 14:27]
    node nextState = or(_nextState_T, io.in) @[ex1.scala 14:42]
    state <= nextState @[ex1.scala 16:9]
    io.out <= state @[ex1.scala 17:10]
    
