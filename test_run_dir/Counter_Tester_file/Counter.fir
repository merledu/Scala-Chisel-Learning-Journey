;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Counter : 
  module Counter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {result : UInt<1>}
    
    node _max_T = dshl(UInt<1>("h01"), UInt<3>("h05")) @[task1.scala 8:17]
    node _max_T_1 = sub(_max_T, UInt<1>("h01")) @[task1.scala 8:34]
    node max = tail(_max_T_1, 1) @[task1.scala 8:34]
    reg count : UInt<16>, clock with : (reset => (reset, UInt<16>("h00"))) @[task1.scala 9:21]
    node _T = eq(count, max) @[task1.scala 10:14]
    when _T : @[task1.scala 10:24]
      count <= UInt<1>("h00") @[task1.scala 11:11]
      skip @[task1.scala 10:24]
    else : @[task1.scala 12:14]
      node _count_T = add(count, UInt<1>("h01")) @[task1.scala 13:20]
      node _count_T_1 = tail(_count_T, 1) @[task1.scala 13:20]
      count <= _count_T_1 @[task1.scala 13:11]
      skip @[task1.scala 12:14]
    node _io_result_T = dshr(count, UInt<4>("h0f")) @[task1.scala 15:22]
    node _io_result_T_1 = bits(_io_result_T, 0, 0) @[task1.scala 15:22]
    io.result <= _io_result_T_1 @[task1.scala 15:13]
    
