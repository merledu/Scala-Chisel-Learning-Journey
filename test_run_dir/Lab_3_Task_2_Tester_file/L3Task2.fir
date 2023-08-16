;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit L3Task2 : 
  module L3Task2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip instr : UInt<32>, immd_se : SInt<32>}
    
    node _immid_T = bits(io.instr, 31, 20) @[Task2.scala 11:32]
    node _immid_T_1 = asSInt(_immid_T) @[Task2.scala 11:46]
    wire immid : SInt
    immid <= _immid_T_1
    io.immd_se <= immid @[Task2.scala 14:14]
    
