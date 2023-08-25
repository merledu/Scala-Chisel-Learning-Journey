;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit eMux : 
  module eMux : 
    input clock : Clock
    input reset : UInt<1>
    output io : {out : SInt<4>, flip in1 : SInt<4>, flip in2 : SInt<4>, flip sel : UInt<1>}
    
    node _io_out_T = mux(io.sel, io.in1, io.in2) @[ex2.scala 18:8]
    io.out <= _io_out_T @[ex2.scala 21:10]
    
