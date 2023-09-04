;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit InstMem : 
  module InstMem : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip addr : UInt<32>, inst : UInt<32>}
    
    cmem imem : UInt<32>[32] @[InsMem.scala 14:18]
    node _io_inst_T = div(io.addr, UInt<3>("h04")) @[InsMem.scala 16:33]
    node _io_inst_T_1 = bits(_io_inst_T, 4, 0) @[InsMem.scala 16:21]
    infer mport io_inst_MPORT = imem[_io_inst_T_1], clock @[InsMem.scala 16:21]
    io.inst <= io_inst_MPORT @[InsMem.scala 16:13]
    
