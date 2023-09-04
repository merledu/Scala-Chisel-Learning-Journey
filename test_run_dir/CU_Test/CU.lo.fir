circuit CU :
  module CU :
    input clock : Clock
    input reset : UInt<1>
    input io_ins : UInt<32>
    output io_RD : UInt<5>
    output io_Rs1 : UInt<5>
    output io_Rs2 : UInt<5>
    output io_RegWrite : UInt<1>
    output io_MemWrite : UInt<1>
    output io_func : UInt<5>

    node Opcode = bits(io_ins, 6, 0) @[CU.scala 23:22]
    node _T = eq(Opcode, UInt<6>("h33")) @[CU.scala 25:15]
    node _io_RD_T = bits(io_ins, 11, 7) @[CU.scala 26:19]
    node io_func_hi = bits(io_ins, 14, 12) @[CU.scala 27:26]
    node io_func_lo = bits(io_ins, 31, 30) @[CU.scala 27:40]
    node _io_func_T = cat(io_func_hi, io_func_lo) @[Cat.scala 30:58]
    node _io_Rs1_T = bits(io_ins, 19, 15) @[CU.scala 28:21]
    node _io_Rs2_T = bits(io_ins, 24, 20) @[CU.scala 29:21]
    node _GEN_0 = mux(_T, _io_RD_T, UInt<1>("h0")) @[CU.scala 25:32 CU.scala 26:10 CU.scala 17:9]
    node _GEN_1 = mux(_T, _io_func_T, UInt<1>("h0")) @[CU.scala 25:32 CU.scala 27:13 CU.scala 18:11]
    node _GEN_2 = mux(_T, _io_Rs1_T, UInt<1>("h0")) @[CU.scala 25:32 CU.scala 28:12 CU.scala 19:10]
    node _GEN_3 = mux(_T, _io_Rs2_T, UInt<1>("h0")) @[CU.scala 25:32 CU.scala 29:12 CU.scala 20:10]
    node _GEN_4 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[CU.scala 25:32 CU.scala 30:17 CU.scala 21:15]
    node _GEN_5 = mux(_T, UInt<1>("h0"), UInt<1>("h0")) @[CU.scala 25:32 CU.scala 31:17 CU.scala 22:15]
    io_RD <= _GEN_0
    io_Rs1 <= _GEN_2
    io_Rs2 <= _GEN_3
    io_RegWrite <= _GEN_4
    io_MemWrite <= _GEN_5
    io_func <= _GEN_1
