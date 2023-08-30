circuit shift_register :
  module shift_register :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<4>
    output io_out : UInt<4>

    reg state : UInt<4>, clock with :
      reset => (UInt<1>("h0"), state) @[ex1.scala 11:23]
    node _nextState_T = shl(state, 4) @[ex1.scala 14:27]
    node nextState = or(_nextState_T, io_in) @[ex1.scala 14:42]
    io_out <= state @[ex1.scala 17:10]
    state <= mux(reset, UInt<4>("h0"), bits(nextState, 3, 0)) @[ex1.scala 11:23 ex1.scala 11:23 ex1.scala 16:9]
