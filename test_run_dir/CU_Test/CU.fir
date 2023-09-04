;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit CU : 
  module CU : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip ins : UInt<32>, RD : UInt<5>, Rs1 : UInt<5>, Rs2 : UInt<5>, RegWrite : UInt<1>, MemWrite : UInt<1>, func : UInt<5>}
    
    io.RD <= UInt<1>("h00") @[CU.scala 17:9]
    io.func <= UInt<1>("h00") @[CU.scala 18:11]
    io.Rs1 <= UInt<1>("h00") @[CU.scala 19:10]
    io.Rs2 <= UInt<1>("h00") @[CU.scala 20:10]
    io.RegWrite <= UInt<1>("h00") @[CU.scala 21:15]
    io.MemWrite <= UInt<1>("h00") @[CU.scala 22:15]
    node Opcode = bits(io.ins, 6, 0) @[CU.scala 23:22]
    node _T = eq(Opcode, UInt<6>("h033")) @[CU.scala 25:15]
    when _T : @[CU.scala 25:32]
      node _io_RD_T = bits(io.ins, 11, 7) @[CU.scala 26:19]
      io.RD <= _io_RD_T @[CU.scala 26:10]
      node io_func_hi = bits(io.ins, 14, 12) @[CU.scala 27:26]
      node io_func_lo = bits(io.ins, 31, 30) @[CU.scala 27:40]
      node _io_func_T = cat(io_func_hi, io_func_lo) @[Cat.scala 30:58]
      io.func <= _io_func_T @[CU.scala 27:13]
      node _io_Rs1_T = bits(io.ins, 19, 15) @[CU.scala 28:21]
      io.Rs1 <= _io_Rs1_T @[CU.scala 28:12]
      node _io_Rs2_T = bits(io.ins, 24, 20) @[CU.scala 29:21]
      io.Rs2 <= _io_Rs2_T @[CU.scala 29:12]
      io.RegWrite <= UInt<1>("h01") @[CU.scala 30:17]
      io.MemWrite <= UInt<1>("h00") @[CU.scala 31:17]
      skip @[CU.scala 25:32]
    
