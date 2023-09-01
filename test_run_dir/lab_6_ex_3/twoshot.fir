;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit twoshot : 
  module twoshot : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip din : UInt<4>, out : UInt<4>}
    
    reg timer_count : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[ex3.scala 13:30]
    reg shots_remaining : UInt<2>, clock with : (reset => (reset, UInt<2>("h02"))) @[ex3.scala 14:34]
    node done = eq(timer_count, UInt<1>("h00")) @[ex3.scala 15:28]
    reg next : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[ex3.scala 16:23]
    when done : @[ex3.scala 18:16]
      next <= io.din @[ex3.scala 19:12]
      shots_remaining <= UInt<2>("h02") @[ex3.scala 20:23]
      skip @[ex3.scala 18:16]
    else : @[ex3.scala 21:48]
      node _T = eq(done, UInt<1>("h00")) @[ex3.scala 21:16]
      node _T_1 = gt(shots_remaining, UInt<1>("h00")) @[ex3.scala 21:41]
      node _T_2 = and(_T, _T_1) @[ex3.scala 21:22]
      when _T_2 : @[ex3.scala 21:48]
        node _next_T = sub(timer_count, UInt<1>("h01")) @[ex3.scala 22:27]
        node _next_T_1 = tail(_next_T, 1) @[ex3.scala 22:27]
        next <= _next_T_1 @[ex3.scala 22:12]
        skip @[ex3.scala 21:48]
      else : @[ex3.scala 24:22]
        node _T_3 = eq(done, UInt<1>("h00")) @[ex3.scala 24:16]
        when _T_3 : @[ex3.scala 24:22]
          node _shots_remaining_T = sub(shots_remaining, UInt<1>("h01")) @[ex3.scala 25:42]
          node _shots_remaining_T_1 = tail(_shots_remaining_T, 1) @[ex3.scala 25:42]
          shots_remaining <= _shots_remaining_T_1 @[ex3.scala 25:23]
          skip @[ex3.scala 24:22]
    io.out <= timer_count @[ex3.scala 27:12]
    timer_count <= next @[ex3.scala 29:17]
    
