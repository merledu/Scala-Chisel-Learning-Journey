;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit task2 : 
  module task2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<1>[4], flip sel : UInt<1>[2], flip shift_type : UInt<1>, out : UInt<1>[4]}
    
    node select = cat(io.sel[1], io.sel[0]) @[Cat.scala 30:58]
    node _io_out_0_T = eq(UInt<1>("h01"), select) @[Mux.scala 80:60]
    node _io_out_0_T_1 = mux(_io_out_0_T, io.in[1], io.in[0]) @[Mux.scala 80:57]
    node _io_out_0_T_2 = eq(UInt<2>("h02"), select) @[Mux.scala 80:60]
    node _io_out_0_T_3 = mux(_io_out_0_T_2, io.in[2], _io_out_0_T_1) @[Mux.scala 80:57]
    node _io_out_0_T_4 = eq(UInt<2>("h03"), select) @[Mux.scala 80:60]
    node _io_out_0_T_5 = mux(_io_out_0_T_4, io.in[3], _io_out_0_T_3) @[Mux.scala 80:57]
    io.out[0] <= _io_out_0_T_5 @[task2.scala 16:15]
    node _io_out_1_T = mux(io.shift_type, io.in[0], UInt<1>("h00")) @[task2.scala 26:21]
    node _io_out_1_T_1 = eq(UInt<1>("h01"), select) @[Mux.scala 80:60]
    node _io_out_1_T_2 = mux(_io_out_1_T_1, io.in[2], io.in[1]) @[Mux.scala 80:57]
    node _io_out_1_T_3 = eq(UInt<2>("h02"), select) @[Mux.scala 80:60]
    node _io_out_1_T_4 = mux(_io_out_1_T_3, io.in[3], _io_out_1_T_2) @[Mux.scala 80:57]
    node _io_out_1_T_5 = eq(UInt<2>("h03"), select) @[Mux.scala 80:60]
    node _io_out_1_T_6 = mux(_io_out_1_T_5, _io_out_1_T, _io_out_1_T_4) @[Mux.scala 80:57]
    io.out[1] <= _io_out_1_T_6 @[task2.scala 22:15]
    node _io_out_2_T = mux(io.shift_type, io.in[0], UInt<1>("h00")) @[task2.scala 32:21]
    node _io_out_2_T_1 = mux(io.shift_type, io.in[1], UInt<1>("h00")) @[task2.scala 33:21]
    node _io_out_2_T_2 = eq(UInt<1>("h01"), select) @[Mux.scala 80:60]
    node _io_out_2_T_3 = mux(_io_out_2_T_2, io.in[3], io.in[2]) @[Mux.scala 80:57]
    node _io_out_2_T_4 = eq(UInt<2>("h02"), select) @[Mux.scala 80:60]
    node _io_out_2_T_5 = mux(_io_out_2_T_4, _io_out_2_T, _io_out_2_T_3) @[Mux.scala 80:57]
    node _io_out_2_T_6 = eq(UInt<2>("h03"), select) @[Mux.scala 80:60]
    node _io_out_2_T_7 = mux(_io_out_2_T_6, _io_out_2_T_1, _io_out_2_T_5) @[Mux.scala 80:57]
    io.out[2] <= _io_out_2_T_7 @[task2.scala 29:15]
    node _io_out_3_T = mux(io.shift_type, io.in[0], UInt<1>("h00")) @[task2.scala 38:21]
    node _io_out_3_T_1 = mux(io.shift_type, io.in[1], UInt<1>("h00")) @[task2.scala 39:21]
    node _io_out_3_T_2 = mux(io.shift_type, io.in[2], UInt<1>("h00")) @[task2.scala 40:21]
    node _io_out_3_T_3 = eq(UInt<1>("h01"), select) @[Mux.scala 80:60]
    node _io_out_3_T_4 = mux(_io_out_3_T_3, _io_out_3_T, io.in[3]) @[Mux.scala 80:57]
    node _io_out_3_T_5 = eq(UInt<2>("h02"), select) @[Mux.scala 80:60]
    node _io_out_3_T_6 = mux(_io_out_3_T_5, _io_out_3_T_1, _io_out_3_T_4) @[Mux.scala 80:57]
    node _io_out_3_T_7 = eq(UInt<2>("h03"), select) @[Mux.scala 80:60]
    node _io_out_3_T_8 = mux(_io_out_3_T_7, _io_out_3_T_2, _io_out_3_T_6) @[Mux.scala 80:57]
    io.out[3] <= _io_out_3_T_8 @[task2.scala 36:15]
    
