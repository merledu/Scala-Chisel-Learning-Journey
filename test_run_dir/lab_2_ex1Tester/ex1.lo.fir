circuit ex1 :
  module ex1 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_A : UInt<32>
    input io_in_B : UInt<32>
    input io_select : UInt<1>
    output io_out : UInt<32>

    node _GEN_0 = mux(io_select, io_in_A, io_in_B) @[ex1.scala 16:21 ex1.scala 17:16 ex1.scala 20:16]
    io_out <= _GEN_0
