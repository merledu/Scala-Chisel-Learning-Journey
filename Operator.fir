;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Operator : 
  module Operator : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<8>[3], out : UInt<8>[3]}
    
    wire outputVec : UInt<8>[3] @[ex3.scala 12:23]
    node _outputVec_0_T = and(io.in[0], io.in[1]) @[ex3.scala 30:11]
    node _outputVec_0_T_1 = and(_outputVec_0_T, io.in[2]) @[ex3.scala 30:11]
    outputVec[0] <= _outputVec_0_T_1 @[ex3.scala 16:18]
    node _outputVec_1_T = and(io.in[0], io.in[1]) @[ex3.scala 30:11]
    node _outputVec_1_T_1 = and(_outputVec_1_T, io.in[2]) @[ex3.scala 30:11]
    outputVec[1] <= _outputVec_1_T_1 @[ex3.scala 16:18]
    node _outputVec_2_T = and(io.in[0], io.in[1]) @[ex3.scala 30:11]
    node _outputVec_2_T_1 = and(_outputVec_2_T, io.in[2]) @[ex3.scala 30:11]
    outputVec[2] <= _outputVec_2_T_1 @[ex3.scala 16:18]
    io.out[0] <= outputVec[0] @[ex3.scala 18:10]
    io.out[1] <= outputVec[1] @[ex3.scala 18:10]
    io.out[2] <= outputVec[2] @[ex3.scala 18:10]
    
