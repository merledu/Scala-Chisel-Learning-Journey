;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit task2 : 
  module task2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<1>[4], flip sel : UInt<1>[2], flip shift_type : UInt<1>, out : UInt<1>[4]}
    
    io.out[1] <= UInt<1>("h00") @[task2.scala 12:15]
    io.out[2] <= UInt<1>("h00") @[task2.scala 13:15]
    io.out[3] <= UInt<1>("h00") @[task2.scala 14:15]
    node select = cat(io.sel[1], io.sel[0]) @[Cat.scala 30:58]
    node _io_out_0_T = eq(UInt<1>("h01"), select) @[Mux.scala 80:60]
    node _io_out_0_T_1 = mux(_io_out_0_T, io.in[1], io.in[0]) @[Mux.scala 80:57]
    node _io_out_0_T_2 = eq(UInt<2>("h02"), select) @[Mux.scala 80:60]
    node _io_out_0_T_3 = mux(_io_out_0_T_2, io.in[2], _io_out_0_T_1) @[Mux.scala 80:57]
    node _io_out_0_T_4 = eq(UInt<2>("h03"), select) @[Mux.scala 80:60]
    node _io_out_0_T_5 = mux(_io_out_0_T_4, io.in[3], _io_out_0_T_3) @[Mux.scala 80:57]
    io.out[0] <= _io_out_0_T_5 @[task2.scala 17:15]
    
