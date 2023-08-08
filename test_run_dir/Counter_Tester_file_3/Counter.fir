;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Counter : 
  module Counter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {result : UInt<1>}
    
    node _max_T = dshl(UInt<1>("h01"), UInt<3>("h05")) @[Counter.scala 10:15]
    node _max_T_1 = sub(_max_T, UInt<1>("h01")) @[Counter.scala 10:31]
    node max = tail(_max_T_1, 1) @[Counter.scala 10:31]
    reg count : UInt<16>, clock with : (reset => (reset, UInt<16>("h00"))) @[Counter.scala 11:21]
    node _T = eq(count, max) @[Counter.scala 12:14]
    when _T : @[Counter.scala 12:24]
      count <= UInt<1>("h00") @[Counter.scala 13:11]
      skip @[Counter.scala 12:24]
    else : @[Counter.scala 14:14]
      node _count_T = add(count, UInt<1>("h01")) @[Counter.scala 15:20]
      node _count_T_1 = tail(_count_T, 1) @[Counter.scala 15:20]
      count <= _count_T_1 @[Counter.scala 15:11]
      skip @[Counter.scala 14:14]
    node _io_result_T = dshr(count, UInt<4>("h0f")) @[Counter.scala 17:22]
    node _io_result_T_1 = bits(_io_result_T, 0, 0) @[Counter.scala 17:22]
    io.result <= _io_result_T_1 @[Counter.scala 17:13]
    
