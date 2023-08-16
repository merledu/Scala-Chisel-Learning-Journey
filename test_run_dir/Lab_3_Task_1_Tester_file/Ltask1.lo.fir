circuit Ltask1 :
  module Ltask1 :
    input clock : Clock
    input reset : UInt<1>
    input io_fnct3 : UInt<3>
    input io_branch : UInt<1>
    input io_arg_x : UInt<32>
    input io_arg_y : UInt<32>
    output io_br_taken : UInt<1>

    node _io_br_taken_T = asSInt(io_arg_x) @[Task1.scala 15:49]
    node _io_br_taken_T_1 = asSInt(io_arg_y) @[Task1.scala 15:71]
    node _io_br_taken_T_2 = eq(_io_br_taken_T, _io_br_taken_T_1) @[Task1.scala 15:52]
    node _io_br_taken_T_3 = and(io_branch, _io_br_taken_T_2) @[Task1.scala 15:30]
    node _io_br_taken_T_4 = asSInt(io_arg_x) @[Task1.scala 16:49]
    node _io_br_taken_T_5 = asSInt(io_arg_y) @[Task1.scala 16:71]
    node _io_br_taken_T_6 = neq(_io_br_taken_T_4, _io_br_taken_T_5) @[Task1.scala 16:52]
    node _io_br_taken_T_7 = and(io_branch, _io_br_taken_T_6) @[Task1.scala 16:30]
    node _io_br_taken_T_8 = asSInt(io_arg_x) @[Task1.scala 17:49]
    node _io_br_taken_T_9 = asSInt(io_arg_y) @[Task1.scala 17:69]
    node _io_br_taken_T_10 = lt(_io_br_taken_T_8, _io_br_taken_T_9) @[Task1.scala 17:52]
    node _io_br_taken_T_11 = and(io_branch, _io_br_taken_T_10) @[Task1.scala 17:30]
    node _io_br_taken_T_12 = asSInt(io_arg_x) @[Task1.scala 18:49]
    node _io_br_taken_T_13 = asSInt(io_arg_y) @[Task1.scala 18:70]
    node _io_br_taken_T_14 = geq(_io_br_taken_T_12, _io_br_taken_T_13) @[Task1.scala 18:52]
    node _io_br_taken_T_15 = and(io_branch, _io_br_taken_T_14) @[Task1.scala 18:30]
    node _io_br_taken_T_16 = lt(io_arg_x, io_arg_y) @[Task1.scala 19:43]
    node _io_br_taken_T_17 = and(io_branch, _io_br_taken_T_16) @[Task1.scala 19:30]
    node _io_br_taken_T_18 = geq(io_arg_x, io_arg_y) @[Task1.scala 20:42]
    node _io_br_taken_T_19 = and(io_branch, _io_br_taken_T_18) @[Task1.scala 20:30]
    node _io_br_taken_T_20 = eq(UInt<1>("h0"), io_fnct3) @[Mux.scala 80:60]
    node _io_br_taken_T_21 = mux(_io_br_taken_T_20, _io_br_taken_T_3, UInt<1>("h0")) @[Mux.scala 80:57]
    node _io_br_taken_T_22 = eq(UInt<1>("h1"), io_fnct3) @[Mux.scala 80:60]
    node _io_br_taken_T_23 = mux(_io_br_taken_T_22, _io_br_taken_T_7, _io_br_taken_T_21) @[Mux.scala 80:57]
    node _io_br_taken_T_24 = eq(UInt<3>("h4"), io_fnct3) @[Mux.scala 80:60]
    node _io_br_taken_T_25 = mux(_io_br_taken_T_24, _io_br_taken_T_11, _io_br_taken_T_23) @[Mux.scala 80:57]
    node _io_br_taken_T_26 = eq(UInt<3>("h5"), io_fnct3) @[Mux.scala 80:60]
    node _io_br_taken_T_27 = mux(_io_br_taken_T_26, _io_br_taken_T_15, _io_br_taken_T_25) @[Mux.scala 80:57]
    node _io_br_taken_T_28 = eq(UInt<3>("h6"), io_fnct3) @[Mux.scala 80:60]
    node _io_br_taken_T_29 = mux(_io_br_taken_T_28, _io_br_taken_T_17, _io_br_taken_T_27) @[Mux.scala 80:57]
    node _io_br_taken_T_30 = eq(UInt<3>("h5"), io_fnct3) @[Mux.scala 80:60]
    node _io_br_taken_T_31 = mux(_io_br_taken_T_30, _io_br_taken_T_19, _io_br_taken_T_29) @[Mux.scala 80:57]
    io_br_taken <= _io_br_taken_T_31 @[Task1.scala 14:15]
