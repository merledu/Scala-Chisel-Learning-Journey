;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Datamem : 
  module Datamem : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip Wen : UInt<1>, flip addr : UInt<32>, flip datain : SInt<32>, dataout : SInt<32>}
    
    cmem memory : SInt<32>[32] @[Datamem.scala 13:20]
    io.dataout <= asSInt(UInt<1>("h00")) @[Datamem.scala 14:14]
    when io.Wen : @[Datamem.scala 16:16]
      node _T = bits(io.addr, 4, 0)
      write mport MPORT = memory[_T], clock
      MPORT <= io.datain
      skip @[Datamem.scala 16:16]
    node _io_dataout_T = bits(io.addr, 4, 0) @[Datamem.scala 20:28]
    read mport io_dataout_MPORT = memory[_io_dataout_T], clock @[Datamem.scala 20:28]
    io.dataout <= io_dataout_MPORT @[Datamem.scala 20:14]
    
