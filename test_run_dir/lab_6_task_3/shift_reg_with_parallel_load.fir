;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit shift_reg_with_parallel_load : 
  module shift_reg_with_parallel_load : 
    input clock : Clock
    input reset : UInt<1>
    output io : {out : UInt<1>[2], flip load_in : UInt<1>[2], flip in : UInt<1>, flip load : UInt<1>}
    
    reg shfitreg : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[Task3.scala 12:25]
    node _T = bits(shfitreg, 0, 0) @[Task3.scala 13:29]
    node _T_1 = bits(shfitreg, 1, 1) @[Task3.scala 13:29]
    io.out[0] <= _T @[Task3.scala 13:10]
    io.out[1] <= _T_1 @[Task3.scala 13:10]
    node _T_2 = eq(io.load, UInt<1>("h01")) @[Task3.scala 15:17]
    when _T_2 : @[Task3.scala 15:25]
      node _shfitreg_T = cat(io.load_in[1], io.load_in[0]) @[Cat.scala 30:58]
      shfitreg <= _shfitreg_T @[Task3.scala 16:14]
      skip @[Task3.scala 15:25]
    else : @[Task3.scala 18:15]
      node _nextState_T = shl(shfitreg, 1) @[Task3.scala 19:34]
      node nextState = or(_nextState_T, io.in) @[Task3.scala 19:49]
      shfitreg <= nextState @[Task3.scala 20:16]
      node _T_3 = bits(shfitreg, 0, 0) @[Task3.scala 21:33]
      node _T_4 = bits(shfitreg, 1, 1) @[Task3.scala 21:33]
      io.out[0] <= _T_3 @[Task3.scala 21:14]
      io.out[1] <= _T_4 @[Task3.scala 21:14]
      skip @[Task3.scala 18:15]
    
