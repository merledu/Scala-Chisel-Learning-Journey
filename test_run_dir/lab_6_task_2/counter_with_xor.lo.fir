circuit counter_with_xor :
  module counter_with_xor :
    input clock : Clock
    input reset : UInt<1>
    output io_out : UInt<3>

    reg counter : UInt<3>, clock with :
      reset => (UInt<1>("h0"), counter) @[Task2.scala 9:24]
    node _countbuffer_T = bits(counter, 2, 2) @[Task2.scala 10:32]
    node _countbuffer_T_1 = xor(_countbuffer_T, UInt<1>("h1")) @[Task2.scala 10:55]
    node _countbuffer_T_2 = add(counter, UInt<1>("h1")) @[Task2.scala 10:70]
    node _countbuffer_T_3 = tail(_countbuffer_T_2, 1) @[Task2.scala 10:70]
    node countbuffer = mux(_countbuffer_T_1, _countbuffer_T_3, UInt<1>("h0")) @[Task2.scala 10:24]
    io_out <= counter @[Task2.scala 12:10]
    counter <= mux(reset, UInt<3>("h0"), countbuffer) @[Task2.scala 9:24 Task2.scala 9:24 Task2.scala 11:11]
