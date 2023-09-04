;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit RegisterFile : 
  module RegisterFile : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip Wen : UInt<1>, flip RD : UInt<5>, flip Rs1in : UInt<5>, flip Rs2in : UInt<5>, Rs1out : SInt<32>, Rs2out : SInt<32>, flip datain : SInt<32>}
    
    cmem regFile : SInt<32>[32] @[RegisterFile.scala 15:21]
    io.Rs1out <= asSInt(UInt<1>("h00")) @[RegisterFile.scala 16:13]
    io.Rs2out <= asSInt(UInt<1>("h00")) @[RegisterFile.scala 17:13]
    node _T = neq(io.RD, UInt<1>("h00")) @[RegisterFile.scala 20:25]
    node _T_1 = and(io.Wen, _T) @[RegisterFile.scala 20:15]
    when _T_1 : @[RegisterFile.scala 20:34]
      infer mport MPORT = regFile[io.RD], clock @[RegisterFile.scala 21:12]
      MPORT <= io.datain @[RegisterFile.scala 21:20]
      skip @[RegisterFile.scala 20:34]
    else : @[RegisterFile.scala 23:15]
      infer mport io_Rs1out_MPORT = regFile[io.Rs1in], clock @[RegisterFile.scala 24:27]
      io.Rs1out <= io_Rs1out_MPORT @[RegisterFile.scala 24:17]
      infer mport io_Rs2out_MPORT = regFile[io.Rs2in], clock @[RegisterFile.scala 25:27]
      io.Rs2out <= io_Rs2out_MPORT @[RegisterFile.scala 25:17]
      skip @[RegisterFile.scala 23:15]
    
