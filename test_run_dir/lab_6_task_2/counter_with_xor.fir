;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit counter_with_xor : 
  module counter_with_xor : 
    input clock : Clock
    input reset : UInt<1>
    output io : {out : UInt<3>}
    
    reg counter : UInt<3>, clock with : (reset => (reset, UInt<3>("h00"))) @[Task2.scala 9:24]
    node _countbuffer_T = bits(counter, 2, 2) @[Task2.scala 10:32]
    node _countbuffer_T_1 = xor(_countbuffer_T, UInt<1>("h01")) @[Task2.scala 10:55]
    node _countbuffer_T_2 = add(counter, UInt<1>("h01")) @[Task2.scala 10:70]
    node _countbuffer_T_3 = tail(_countbuffer_T_2, 1) @[Task2.scala 10:70]
    node countbuffer = mux(_countbuffer_T_1, _countbuffer_T_3, UInt<1>("h00")) @[Task2.scala 10:24]
    counter <= countbuffer @[Task2.scala 11:11]
    io.out <= counter @[Task2.scala 12:10]
    
