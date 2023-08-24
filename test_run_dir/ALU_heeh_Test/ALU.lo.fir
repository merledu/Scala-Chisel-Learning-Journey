circuit ALU :
  module ALU :
    input clock : Clock
    input reset : UInt<1>
    input io_alu_oper : UInt<4>
    input io_arg_x : UInt<32>
    input io_arg_y : UInt<32>
    output io_alu_out : UInt<4>

    node _T = eq(UInt<1>("h0"), io_alu_oper) @[Conditional.scala 37:30]
    node _io_alu_out_T = and(io_arg_x, io_arg_y) @[ex1.scala 19:30]
    node _T_1 = eq(UInt<1>("h1"), io_alu_oper) @[Conditional.scala 37:30]
    node _io_alu_out_T_1 = or(io_arg_x, io_arg_y) @[ex1.scala 22:30]
    node _T_2 = eq(UInt<2>("h2"), io_alu_oper) @[Conditional.scala 37:30]
    node _io_alu_out_T_2 = add(io_arg_x, io_arg_y) @[ex1.scala 25:30]
    node _io_alu_out_T_3 = tail(_io_alu_out_T_2, 1) @[ex1.scala 25:30]
    node _T_3 = eq(UInt<3>("h6"), io_alu_oper) @[Conditional.scala 37:30]
    node _io_alu_out_T_4 = sub(io_arg_x, io_arg_y) @[ex1.scala 28:30]
    node _io_alu_out_T_5 = tail(_io_alu_out_T_4, 1) @[ex1.scala 28:30]
    node _T_4 = eq(UInt<2>("h3"), io_alu_oper) @[Conditional.scala 37:30]
    node _io_alu_out_T_6 = xor(io_arg_x, io_arg_y) @[ex1.scala 31:30]
    node _T_5 = eq(UInt<3>("h4"), io_alu_oper) @[Conditional.scala 37:30]
    node _io_alu_out_T_7 = bits(io_arg_y, 4, 0) @[ex1.scala 34:41]
    node _io_alu_out_T_8 = dshl(io_arg_x, _io_alu_out_T_7) @[ex1.scala 34:30]
    node _T_6 = eq(UInt<3>("h5"), io_alu_oper) @[Conditional.scala 37:30]
    node _io_alu_out_T_9 = bits(io_arg_y, 4, 0) @[ex1.scala 37:41]
    node _io_alu_out_T_10 = dshr(io_arg_x, _io_alu_out_T_9) @[ex1.scala 37:30]
    node _T_7 = eq(UInt<3>("h7"), io_alu_oper) @[Conditional.scala 37:30]
    node _io_alu_out_T_11 = asSInt(io_arg_x) @[ex1.scala 40:31]
    node _io_alu_out_T_12 = bits(io_arg_y, 4, 0) @[ex1.scala 40:49]
    node _io_alu_out_T_13 = dshr(_io_alu_out_T_11, _io_alu_out_T_12) @[ex1.scala 40:38]
    node _io_alu_out_T_14 = asUInt(_io_alu_out_T_13) @[ex1.scala 40:65]
    node _T_8 = eq(UInt<4>("h8"), io_alu_oper) @[Conditional.scala 37:30]
    node _io_alu_out_T_15 = asSInt(io_arg_x) @[ex1.scala 43:30]
    node _io_alu_out_T_16 = asSInt(io_arg_y) @[ex1.scala 43:48]
    node _io_alu_out_T_17 = lt(_io_alu_out_T_15, _io_alu_out_T_16) @[ex1.scala 43:37]
    node _T_9 = eq(UInt<4>("h9"), io_alu_oper) @[Conditional.scala 37:30]
    node _io_alu_out_T_18 = lt(io_arg_x, io_arg_y) @[ex1.scala 46:30]
    node _GEN_0 = mux(_T_9, _io_alu_out_T_18, UInt<1>("h0")) @[Conditional.scala 39:67 ex1.scala 46:18 ex1.scala 15:14]
    node _GEN_1 = mux(_T_8, _io_alu_out_T_17, _GEN_0) @[Conditional.scala 39:67 ex1.scala 43:18]
    node _GEN_2 = mux(_T_7, _io_alu_out_T_14, _GEN_1) @[Conditional.scala 39:67 ex1.scala 40:18]
    node _GEN_3 = mux(_T_6, _io_alu_out_T_10, _GEN_2) @[Conditional.scala 39:67 ex1.scala 37:18]
    node _GEN_4 = mux(_T_5, _io_alu_out_T_8, _GEN_3) @[Conditional.scala 39:67 ex1.scala 34:18]
    node _GEN_5 = mux(_T_4, _io_alu_out_T_6, _GEN_4) @[Conditional.scala 39:67 ex1.scala 31:18]
    node _GEN_6 = mux(_T_3, _io_alu_out_T_5, _GEN_5) @[Conditional.scala 39:67 ex1.scala 28:18]
    node _GEN_7 = mux(_T_2, _io_alu_out_T_3, _GEN_6) @[Conditional.scala 39:67 ex1.scala 25:18]
    node _GEN_8 = mux(_T_1, _io_alu_out_T_1, _GEN_7) @[Conditional.scala 39:67 ex1.scala 22:18]
    node _GEN_9 = mux(_T, _io_alu_out_T, _GEN_8) @[Conditional.scala 40:58 ex1.scala 19:18]
    io_alu_out <= bits(_GEN_9, 3, 0)
