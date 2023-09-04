circuit PC :
  module PC :
    input clock : Clock
    input reset : UInt<1>
    output io_nextaddr : UInt<32>

    reg counter : UInt<32>, clock with :
      reset => (UInt<1>("h0"), counter) @[PC.scala 11:24]
    node _counter_T = add(counter, UInt<3>("h4")) @[PC.scala 13:22]
    node _counter_T_1 = tail(_counter_T, 1) @[PC.scala 13:22]
    io_nextaddr <= counter @[PC.scala 14:15]
    counter <= mux(reset, UInt<32>("h0"), _counter_T_1) @[PC.scala 11:24 PC.scala 11:24 PC.scala 13:11]
