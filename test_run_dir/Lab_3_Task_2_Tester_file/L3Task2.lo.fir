circuit L3Task2 :
  module L3Task2 :
    input clock : Clock
    input reset : UInt<1>
    input io_instr : UInt<32>
    output io_immd_se : SInt<32>

    node _immid_T = bits(io_instr, 31, 20) @[Task2.scala 11:32]
    node _immid_T_1 = asSInt(_immid_T) @[Task2.scala 11:46]
    node immid = _immid_T_1
    io_immd_se <= immid @[Task2.scala 14:14]
