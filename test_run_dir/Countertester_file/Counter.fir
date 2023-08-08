;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Counter : 
  module Counter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {result : UInt<1>}
    
    node _max_T = dshl(UInt<1>("h01"), UInt<2>("h02")) @[Counter.scala 10:15]
    node _max_T_1 = sub(_max_T, UInt<1>("h01")) @[Counter.scala 10:31]
    node max = tail(_max_T_1, 1) @[Counter.scala 10:31]
    reg count : UInt<16>, clock with : (reset => (reset, UInt<16>("h00"))) @[Counter.scala 11:21]
    node _T = dshr(count, UInt<2>("h02")) @[Counter.scala 12:11]
    node _T_1 = bits(_T, 0, 0) @[Counter.scala 12:11]
    node _T_2 = eq(_T_1, UInt<1>("h01")) @[Counter.scala 12:25]
    when _T_2 : @[Counter.scala 12:35]
      count <= UInt<1>("h00") @[Counter.scala 14:11]
      io.result <= UInt<1>("h01") @[Counter.scala 15:14]
      skip @[Counter.scala 12:35]
    else : @[Counter.scala 17:14]
      node _count_T = add(count, UInt<1>("h01")) @[Counter.scala 18:20]
      node _count_T_1 = tail(_count_T, 1) @[Counter.scala 18:20]
      count <= _count_T_1 @[Counter.scala 18:11]
      io.result <= UInt<1>("h00") @[Counter.scala 19:14]
      skip @[Counter.scala 17:14]
    
