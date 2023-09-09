circuit DataPath :
  module PC :
    input clock : Clock
    input reset : UInt<1>
    output io_nextaddr : UInt<32>

    reg counter : UInt<32>, clock with :
      reset => (UInt<1>("h0"), counter) @[PC.scala 11:24]
    node _counter_T = add(counter, UInt<3>("h4")) @[PC.scala 14:24]
    node _counter_T_1 = tail(_counter_T, 1) @[PC.scala 14:24]
    io_nextaddr <= counter @[PC.scala 15:17]
    counter <= mux(reset, UInt<32>("h0"), _counter_T_1) @[PC.scala 11:24 PC.scala 11:24 PC.scala 14:13]

  module CU :
    input clock : Clock
    input reset : UInt<1>
    input io_ins : UInt<32>
    output io_RD : UInt<5>
    output io_Rs1 : UInt<5>
    output io_Rs2 : UInt<5>
    output io_Imm : UInt<32>
    output io_Instype : UInt<1>
    output io_RegWrite : UInt<1>
    output io_MemWrite : UInt<1>
    output io_func : UInt<5>
    output io_wbselect : UInt<1>

    node Opcode = bits(io_ins, 6, 0) @[CU.scala 28:22]
    node _T = eq(Opcode, UInt<6>("h33")) @[CU.scala 30:15]
    node _io_RD_T = bits(io_ins, 11, 7) @[CU.scala 31:19]
    node io_func_hi = bits(io_ins, 14, 12) @[CU.scala 32:26]
    node io_func_lo = bits(io_ins, 30, 30) @[CU.scala 32:40]
    node _io_func_T = cat(io_func_hi, io_func_lo) @[Cat.scala 30:58]
    node _io_Rs1_T = bits(io_ins, 19, 15) @[CU.scala 33:21]
    node _io_Rs2_T = bits(io_ins, 24, 20) @[CU.scala 34:21]
    node _T_1 = eq(Opcode, UInt<5>("h13")) @[CU.scala 41:22]
    node _io_RD_T_1 = bits(io_ins, 11, 7) @[CU.scala 42:21]
    node _io_func_T_1 = bits(io_ins, 14, 12) @[CU.scala 43:24]
    node _io_Rs1_T_1 = bits(io_ins, 19, 15) @[CU.scala 44:23]
    node _io_Imm_T = bits(io_ins, 31, 20) @[CU.scala 46:23]
    node _T_2 = eq(Opcode, UInt<2>("h3")) @[CU.scala 53:22]
    node _io_RD_T_2 = bits(io_ins, 11, 7) @[CU.scala 54:22]
    node _io_func_T_2 = bits(io_ins, 14, 12) @[CU.scala 55:24]
    node _io_Rs1_T_2 = bits(io_ins, 19, 15) @[CU.scala 56:23]
    node _io_Imm_T_1 = bits(io_ins, 31, 20) @[CU.scala 58:23]
    node _T_3 = eq(Opcode, UInt<6>("h23")) @[CU.scala 65:22]
    node _io_RD_T_3 = bits(io_ins, 11, 7) @[CU.scala 66:22]
    node _io_Rs1_T_3 = bits(io_ins, 19, 15) @[CU.scala 68:23]
    node _io_Rs2_T_1 = bits(io_ins, 24, 20) @[CU.scala 69:23]
    node io_Imm_hi = bits(io_ins, 4, 0) @[CU.scala 70:26]
    node io_Imm_lo = bits(io_ins, 31, 25) @[CU.scala 70:39]
    node _io_Imm_T_2 = cat(io_Imm_hi, io_Imm_lo) @[Cat.scala 30:58]
    node _GEN_0 = mux(_T_3, _io_RD_T_3, UInt<1>("h0")) @[CU.scala 65:40 CU.scala 66:13 CU.scala 77:13]
    node _GEN_1 = mux(_T_3, UInt<1>("h0"), UInt<1>("h0")) @[CU.scala 65:40 CU.scala 67:15 CU.scala 78:15]
    node _GEN_2 = mux(_T_3, _io_Rs1_T_3, UInt<1>("h0")) @[CU.scala 65:40 CU.scala 68:14 CU.scala 79:14]
    node _GEN_3 = mux(_T_3, _io_Rs2_T_1, UInt<1>("h0")) @[CU.scala 65:40 CU.scala 69:14 CU.scala 80:14]
    node _GEN_4 = mux(_T_3, _io_Imm_T_2, UInt<1>("h0")) @[CU.scala 65:40 CU.scala 70:14 CU.scala 84:14]
    node _GEN_5 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[CU.scala 65:40 CU.scala 72:19 CU.scala 82:19]
    node _GEN_6 = mux(_T_2, _io_RD_T_2, _GEN_0) @[CU.scala 53:39 CU.scala 54:13]
    node _GEN_7 = mux(_T_2, _io_func_T_2, _GEN_1) @[CU.scala 53:39 CU.scala 55:15]
    node _GEN_8 = mux(_T_2, _io_Rs1_T_2, _GEN_2) @[CU.scala 53:39 CU.scala 56:14]
    node _GEN_9 = mux(_T_2, UInt<1>("h0"), _GEN_3) @[CU.scala 53:39 CU.scala 57:14]
    node _GEN_10 = mux(_T_2, _io_Imm_T_1, _GEN_4) @[CU.scala 53:39 CU.scala 58:14]
    node _GEN_11 = mux(_T_2, UInt<1>("h1"), _GEN_1) @[CU.scala 53:39 CU.scala 59:19]
    node _GEN_12 = mux(_T_2, UInt<1>("h0"), _GEN_5) @[CU.scala 53:39 CU.scala 60:19]
    node _GEN_13 = mux(_T_2, UInt<1>("h0"), _GEN_1) @[CU.scala 53:39 CU.scala 61:18]
    node _GEN_14 = mux(_T_1, _io_RD_T_1, _GEN_6) @[CU.scala 41:39 CU.scala 42:12]
    node _GEN_15 = mux(_T_1, _io_func_T_1, _GEN_7) @[CU.scala 41:39 CU.scala 43:15]
    node _GEN_16 = mux(_T_1, _io_Rs1_T_1, _GEN_8) @[CU.scala 41:39 CU.scala 44:14]
    node _GEN_17 = mux(_T_1, UInt<1>("h0"), _GEN_9) @[CU.scala 41:39 CU.scala 45:14]
    node _GEN_18 = mux(_T_1, _io_Imm_T, _GEN_10) @[CU.scala 41:39 CU.scala 46:14]
    node _GEN_19 = mux(_T_1, UInt<1>("h1"), _GEN_11) @[CU.scala 41:39 CU.scala 47:19]
    node _GEN_20 = mux(_T_1, UInt<1>("h0"), _GEN_12) @[CU.scala 41:39 CU.scala 48:19]
    node _GEN_21 = mux(_T_1, UInt<1>("h0"), _GEN_13) @[CU.scala 41:39 CU.scala 49:18]
    node _GEN_22 = mux(_T_1, UInt<1>("h1"), _GEN_13) @[CU.scala 41:39 CU.scala 50:19]
    node _GEN_23 = mux(_T, _io_RD_T, _GEN_14) @[CU.scala 30:32 CU.scala 31:10]
    node _GEN_24 = mux(_T, _io_func_T, _GEN_15) @[CU.scala 30:32 CU.scala 32:13]
    node _GEN_25 = mux(_T, _io_Rs1_T, _GEN_16) @[CU.scala 30:32 CU.scala 33:12]
    node _GEN_26 = mux(_T, _io_Rs2_T, _GEN_17) @[CU.scala 30:32 CU.scala 34:12]
    node _GEN_27 = mux(_T, UInt<1>("h0"), _GEN_18) @[CU.scala 30:32 CU.scala 35:12]
    node _GEN_28 = mux(_T, UInt<1>("h1"), _GEN_19) @[CU.scala 30:32 CU.scala 36:17]
    node _GEN_29 = mux(_T, UInt<1>("h0"), _GEN_20) @[CU.scala 30:32 CU.scala 37:17]
    node _GEN_30 = mux(_T, UInt<1>("h1"), _GEN_21) @[CU.scala 30:32 CU.scala 38:16]
    node _GEN_31 = mux(_T, UInt<1>("h1"), _GEN_22) @[CU.scala 30:32 CU.scala 39:17]
    io_RD <= _GEN_23
    io_Rs1 <= _GEN_25
    io_Rs2 <= _GEN_26
    io_Imm <= _GEN_27
    io_Instype <= _GEN_30
    io_RegWrite <= _GEN_28
    io_MemWrite <= _GEN_29
    io_func <= _GEN_24
    io_wbselect <= _GEN_31

  module RegisterFile :
    input clock : Clock
    input reset : UInt<1>
    input io_Wen : UInt<1>
    input io_RD : UInt<5>
    input io_Rs1in : UInt<5>
    input io_Rs2in : UInt<5>
    output io_Rs1out : UInt<32>
    output io_Rs2out : UInt<32>
    input io_datain : UInt<32>

    mem regFile : @[RegisterFile.scala 15:21]
      data-type => UInt<32>
      depth => 32
      read-latency => 0
      write-latency => 1
      reader => io_Rs1out_MPORT
      reader => io_Rs2out_MPORT
      reader => io_Rs1out_MPORT_1
      reader => io_Rs2out_MPORT_1
      writer => MPORT
      read-under-write => undefined
    node _T = neq(io_RD, UInt<1>("h0")) @[RegisterFile.scala 20:25]
    node _T_1 = and(io_Wen, _T) @[RegisterFile.scala 20:15]
    node _GEN_0 = validif(_T_1, io_RD) @[RegisterFile.scala 20:34]
    node _GEN_1 = validif(_T_1, clock) @[RegisterFile.scala 20:34]
    node _GEN_2 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[RegisterFile.scala 20:34 RegisterFile.scala 15:21]
    node _GEN_3 = validif(_T_1, UInt<1>("h1")) @[RegisterFile.scala 20:34]
    node _GEN_4 = validif(_T_1, io_datain) @[RegisterFile.scala 20:34]
    node _GEN_5 = validif(_T_1, io_Rs1in) @[RegisterFile.scala 20:34 RegisterFile.scala 22:30]
    node _GEN_6 = mux(_T_1, regFile.io_Rs1out_MPORT.data, regFile.io_Rs1out_MPORT_1.data) @[RegisterFile.scala 20:34 RegisterFile.scala 22:15 RegisterFile.scala 26:17]
    node _GEN_7 = validif(_T_1, io_Rs2in) @[RegisterFile.scala 20:34 RegisterFile.scala 23:30]
    node _GEN_8 = mux(_T_1, regFile.io_Rs2out_MPORT.data, regFile.io_Rs2out_MPORT_1.data) @[RegisterFile.scala 20:34 RegisterFile.scala 23:15 RegisterFile.scala 27:17]
    node _GEN_9 = validif(eq(_T_1, UInt<1>("h0")), io_Rs1in) @[RegisterFile.scala 20:34 RegisterFile.scala 26:32]
    node _GEN_10 = validif(eq(_T_1, UInt<1>("h0")), clock) @[RegisterFile.scala 20:34 RegisterFile.scala 26:32]
    node _GEN_11 = mux(_T_1, UInt<1>("h0"), UInt<1>("h1")) @[RegisterFile.scala 20:34 RegisterFile.scala 15:21 RegisterFile.scala 26:32]
    node _GEN_12 = validif(eq(_T_1, UInt<1>("h0")), io_Rs2in) @[RegisterFile.scala 20:34 RegisterFile.scala 27:32]
    io_Rs1out <= _GEN_6
    io_Rs2out <= _GEN_8
    regFile.io_Rs1out_MPORT.addr <= _GEN_5
    regFile.io_Rs1out_MPORT.en <= _GEN_2
    regFile.io_Rs1out_MPORT.clk <= _GEN_1
    regFile.io_Rs2out_MPORT.addr <= _GEN_7
    regFile.io_Rs2out_MPORT.en <= _GEN_2
    regFile.io_Rs2out_MPORT.clk <= _GEN_1
    regFile.io_Rs1out_MPORT_1.addr <= _GEN_9
    regFile.io_Rs1out_MPORT_1.en <= _GEN_11
    regFile.io_Rs1out_MPORT_1.clk <= _GEN_10
    regFile.io_Rs2out_MPORT_1.addr <= _GEN_12
    regFile.io_Rs2out_MPORT_1.en <= _GEN_11
    regFile.io_Rs2out_MPORT_1.clk <= _GEN_10
    regFile.MPORT.addr <= _GEN_0
    regFile.MPORT.en <= _GEN_2
    regFile.MPORT.clk <= _GEN_1
    regFile.MPORT.data <= _GEN_4
    regFile.MPORT.mask <= _GEN_3

  module InstMem :
    input clock : Clock
    input reset : UInt<1>
    input io_addr : UInt<32>
    output io_inst : UInt<32>

    mem imem : @[InsMem.scala 14:18]
      data-type => UInt<32>
      depth => 32
      read-latency => 0
      write-latency => 1
      reader => io_inst_MPORT
      read-under-write => undefined
    node _io_inst_T = div(io_addr, UInt<3>("h4")) @[InsMem.scala 16:33]
    node _io_inst_T_1 = bits(_io_inst_T, 4, 0) @[InsMem.scala 16:21]
    io_inst <= imem.io_inst_MPORT.data @[InsMem.scala 16:13]
    imem.io_inst_MPORT.addr <= _io_inst_T_1 @[InsMem.scala 16:21]
    imem.io_inst_MPORT.en <= UInt<1>("h1") @[InsMem.scala 16:21]
    imem.io_inst_MPORT.clk <= clock @[InsMem.scala 16:21]

  module Datamem :
    input clock : Clock
    input reset : UInt<1>
    input io_Wen : UInt<1>
    input io_addr : UInt<32>
    input io_datain : UInt<32>
    output io_dataout : UInt<32>

    mem memory : @[Datamem.scala 13:20]
      data-type => UInt<32>
      depth => 32
      read-latency => 0
      write-latency => 1
      reader => io_dataout_MPORT
      reader => io_dataout_MPORT_1
      writer => MPORT
      read-under-write => undefined
    node _T = bits(io_addr, 4, 0)
    node _io_dataout_T = bits(io_addr, 4, 0) @[Datamem.scala 18:30]
    node _GEN_0 = validif(io_Wen, _T) @[Datamem.scala 16:16]
    node _GEN_1 = validif(io_Wen, clock) @[Datamem.scala 16:16]
    node _GEN_2 = mux(io_Wen, UInt<1>("h1"), UInt<1>("h0")) @[Datamem.scala 16:16 Datamem.scala 13:20]
    node _GEN_3 = validif(io_Wen, UInt<1>("h1")) @[Datamem.scala 16:16]
    node _GEN_4 = validif(io_Wen, io_datain) @[Datamem.scala 16:16]
    node _GEN_5 = validif(io_Wen, _io_dataout_T) @[Datamem.scala 16:16 Datamem.scala 18:30]
    node _GEN_6 = mux(io_Wen, memory.io_dataout_MPORT.data, UInt<1>("h0")) @[Datamem.scala 16:16 Datamem.scala 18:16 Datamem.scala 14:14]
    node _io_dataout_T_1 = bits(io_addr, 4, 0) @[Datamem.scala 21:28]
    io_dataout <= memory.io_dataout_MPORT_1.data @[Datamem.scala 21:14]
    memory.io_dataout_MPORT.addr <= _GEN_5
    memory.io_dataout_MPORT.en <= _GEN_2
    memory.io_dataout_MPORT.clk <= _GEN_1
    memory.io_dataout_MPORT_1.addr <= _io_dataout_T_1 @[Datamem.scala 21:28]
    memory.io_dataout_MPORT_1.en <= UInt<1>("h1") @[Datamem.scala 21:28]
    memory.io_dataout_MPORT_1.clk <= clock @[Datamem.scala 21:28]
    memory.MPORT.addr <= _GEN_0
    memory.MPORT.en <= _GEN_2
    memory.MPORT.clk <= _GEN_1
    memory.MPORT.data <= _GEN_4
    memory.MPORT.mask <= _GEN_3

  module ALU1 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_A : UInt<32>
    input io_in_B : UInt<32>
    input io_alu_Op : UInt<4>
    output io_out : UInt<32>
    output io_sum : UInt<32>

    node _sum_T = bits(io_alu_Op, 0, 0) @[buggedAlu.scala 46:38]
    node _sum_T_1 = sub(UInt<1>("h0"), io_in_B) @[buggedAlu.scala 46:44]
    node _sum_T_2 = tail(_sum_T_1, 1) @[buggedAlu.scala 46:44]
    node _sum_T_3 = mux(_sum_T, _sum_T_2, io_in_B) @[buggedAlu.scala 46:28]
    node _sum_T_4 = add(io_in_A, _sum_T_3) @[buggedAlu.scala 46:23]
    node sum = tail(_sum_T_4, 1) @[buggedAlu.scala 46:23]
    node _cmp_T = lt(io_in_A, io_in_B) @[buggedAlu.scala 47:27]
    node cmp = mux(_cmp_T, UInt<1>("h1"), UInt<1>("h0")) @[buggedAlu.scala 47:18]
    node shamt = bits(io_in_B, 4, 0) @[buggedAlu.scala 48:24]
    node _shin_T = bits(io_alu_Op, 3, 3) @[buggedAlu.scala 49:29]
    node _shin_T_1 = shl(UInt<16>("hffff"), 16) @[Bitwise.scala 102:47]
    node _shin_T_2 = xor(UInt<32>("hffffffff"), _shin_T_1) @[Bitwise.scala 102:21]
    node _shin_T_3 = shr(io_in_A, 16) @[Bitwise.scala 103:21]
    node _shin_T_4 = and(_shin_T_3, _shin_T_2) @[Bitwise.scala 103:31]
    node _shin_T_5 = bits(io_in_A, 15, 0) @[Bitwise.scala 103:46]
    node _shin_T_6 = shl(_shin_T_5, 16) @[Bitwise.scala 103:65]
    node _shin_T_7 = not(_shin_T_2) @[Bitwise.scala 103:77]
    node _shin_T_8 = and(_shin_T_6, _shin_T_7) @[Bitwise.scala 103:75]
    node _shin_T_9 = or(_shin_T_4, _shin_T_8) @[Bitwise.scala 103:39]
    node _shin_T_10 = bits(_shin_T_2, 23, 0) @[Bitwise.scala 102:28]
    node _shin_T_11 = shl(_shin_T_10, 8) @[Bitwise.scala 102:47]
    node _shin_T_12 = xor(_shin_T_2, _shin_T_11) @[Bitwise.scala 102:21]
    node _shin_T_13 = shr(_shin_T_9, 8) @[Bitwise.scala 103:21]
    node _shin_T_14 = and(_shin_T_13, _shin_T_12) @[Bitwise.scala 103:31]
    node _shin_T_15 = bits(_shin_T_9, 23, 0) @[Bitwise.scala 103:46]
    node _shin_T_16 = shl(_shin_T_15, 8) @[Bitwise.scala 103:65]
    node _shin_T_17 = not(_shin_T_12) @[Bitwise.scala 103:77]
    node _shin_T_18 = and(_shin_T_16, _shin_T_17) @[Bitwise.scala 103:75]
    node _shin_T_19 = or(_shin_T_14, _shin_T_18) @[Bitwise.scala 103:39]
    node _shin_T_20 = bits(_shin_T_12, 27, 0) @[Bitwise.scala 102:28]
    node _shin_T_21 = shl(_shin_T_20, 4) @[Bitwise.scala 102:47]
    node _shin_T_22 = xor(_shin_T_12, _shin_T_21) @[Bitwise.scala 102:21]
    node _shin_T_23 = shr(_shin_T_19, 4) @[Bitwise.scala 103:21]
    node _shin_T_24 = and(_shin_T_23, _shin_T_22) @[Bitwise.scala 103:31]
    node _shin_T_25 = bits(_shin_T_19, 27, 0) @[Bitwise.scala 103:46]
    node _shin_T_26 = shl(_shin_T_25, 4) @[Bitwise.scala 103:65]
    node _shin_T_27 = not(_shin_T_22) @[Bitwise.scala 103:77]
    node _shin_T_28 = and(_shin_T_26, _shin_T_27) @[Bitwise.scala 103:75]
    node _shin_T_29 = or(_shin_T_24, _shin_T_28) @[Bitwise.scala 103:39]
    node _shin_T_30 = bits(_shin_T_22, 29, 0) @[Bitwise.scala 102:28]
    node _shin_T_31 = shl(_shin_T_30, 2) @[Bitwise.scala 102:47]
    node _shin_T_32 = xor(_shin_T_22, _shin_T_31) @[Bitwise.scala 102:21]
    node _shin_T_33 = shr(_shin_T_29, 2) @[Bitwise.scala 103:21]
    node _shin_T_34 = and(_shin_T_33, _shin_T_32) @[Bitwise.scala 103:31]
    node _shin_T_35 = bits(_shin_T_29, 29, 0) @[Bitwise.scala 103:46]
    node _shin_T_36 = shl(_shin_T_35, 2) @[Bitwise.scala 103:65]
    node _shin_T_37 = not(_shin_T_32) @[Bitwise.scala 103:77]
    node _shin_T_38 = and(_shin_T_36, _shin_T_37) @[Bitwise.scala 103:75]
    node _shin_T_39 = or(_shin_T_34, _shin_T_38) @[Bitwise.scala 103:39]
    node _shin_T_40 = bits(_shin_T_32, 30, 0) @[Bitwise.scala 102:28]
    node _shin_T_41 = shl(_shin_T_40, 1) @[Bitwise.scala 102:47]
    node _shin_T_42 = xor(_shin_T_32, _shin_T_41) @[Bitwise.scala 102:21]
    node _shin_T_43 = shr(_shin_T_39, 1) @[Bitwise.scala 103:21]
    node _shin_T_44 = and(_shin_T_43, _shin_T_42) @[Bitwise.scala 103:31]
    node _shin_T_45 = bits(_shin_T_39, 30, 0) @[Bitwise.scala 103:46]
    node _shin_T_46 = shl(_shin_T_45, 1) @[Bitwise.scala 103:65]
    node _shin_T_47 = not(_shin_T_42) @[Bitwise.scala 103:77]
    node _shin_T_48 = and(_shin_T_46, _shin_T_47) @[Bitwise.scala 103:75]
    node _shin_T_49 = or(_shin_T_44, _shin_T_48) @[Bitwise.scala 103:39]
    node shin = mux(_shin_T, io_in_A, _shin_T_49) @[buggedAlu.scala 49:19]
    node _shiftr_T = bits(io_alu_Op, 0, 0) @[buggedAlu.scala 50:32]
    node _shiftr_T_1 = bits(shin, 31, 31) @[buggedAlu.scala 50:43]
    node shiftr_hi = and(_shiftr_T, _shiftr_T_1) @[buggedAlu.scala 50:36]
    node _shiftr_T_2 = cat(shiftr_hi, shin) @[Cat.scala 30:58]
    node _shiftr_T_3 = asSInt(_shiftr_T_2) @[buggedAlu.scala 50:61]
    node _shiftr_T_4 = dshr(_shiftr_T_3, shamt) @[buggedAlu.scala 50:68]
    node shiftr = bits(_shiftr_T_4, 31, 0) @[buggedAlu.scala 50:78]
    node _shitfl_T = shl(UInt<16>("hffff"), 16) @[Bitwise.scala 102:47]
    node _shitfl_T_1 = xor(UInt<32>("hffffffff"), _shitfl_T) @[Bitwise.scala 102:21]
    node _shitfl_T_2 = shr(shiftr, 16) @[Bitwise.scala 103:21]
    node _shitfl_T_3 = and(_shitfl_T_2, _shitfl_T_1) @[Bitwise.scala 103:31]
    node _shitfl_T_4 = bits(shiftr, 15, 0) @[Bitwise.scala 103:46]
    node _shitfl_T_5 = shl(_shitfl_T_4, 16) @[Bitwise.scala 103:65]
    node _shitfl_T_6 = not(_shitfl_T_1) @[Bitwise.scala 103:77]
    node _shitfl_T_7 = and(_shitfl_T_5, _shitfl_T_6) @[Bitwise.scala 103:75]
    node _shitfl_T_8 = or(_shitfl_T_3, _shitfl_T_7) @[Bitwise.scala 103:39]
    node _shitfl_T_9 = bits(_shitfl_T_1, 23, 0) @[Bitwise.scala 102:28]
    node _shitfl_T_10 = shl(_shitfl_T_9, 8) @[Bitwise.scala 102:47]
    node _shitfl_T_11 = xor(_shitfl_T_1, _shitfl_T_10) @[Bitwise.scala 102:21]
    node _shitfl_T_12 = shr(_shitfl_T_8, 8) @[Bitwise.scala 103:21]
    node _shitfl_T_13 = and(_shitfl_T_12, _shitfl_T_11) @[Bitwise.scala 103:31]
    node _shitfl_T_14 = bits(_shitfl_T_8, 23, 0) @[Bitwise.scala 103:46]
    node _shitfl_T_15 = shl(_shitfl_T_14, 8) @[Bitwise.scala 103:65]
    node _shitfl_T_16 = not(_shitfl_T_11) @[Bitwise.scala 103:77]
    node _shitfl_T_17 = and(_shitfl_T_15, _shitfl_T_16) @[Bitwise.scala 103:75]
    node _shitfl_T_18 = or(_shitfl_T_13, _shitfl_T_17) @[Bitwise.scala 103:39]
    node _shitfl_T_19 = bits(_shitfl_T_11, 27, 0) @[Bitwise.scala 102:28]
    node _shitfl_T_20 = shl(_shitfl_T_19, 4) @[Bitwise.scala 102:47]
    node _shitfl_T_21 = xor(_shitfl_T_11, _shitfl_T_20) @[Bitwise.scala 102:21]
    node _shitfl_T_22 = shr(_shitfl_T_18, 4) @[Bitwise.scala 103:21]
    node _shitfl_T_23 = and(_shitfl_T_22, _shitfl_T_21) @[Bitwise.scala 103:31]
    node _shitfl_T_24 = bits(_shitfl_T_18, 27, 0) @[Bitwise.scala 103:46]
    node _shitfl_T_25 = shl(_shitfl_T_24, 4) @[Bitwise.scala 103:65]
    node _shitfl_T_26 = not(_shitfl_T_21) @[Bitwise.scala 103:77]
    node _shitfl_T_27 = and(_shitfl_T_25, _shitfl_T_26) @[Bitwise.scala 103:75]
    node _shitfl_T_28 = or(_shitfl_T_23, _shitfl_T_27) @[Bitwise.scala 103:39]
    node _shitfl_T_29 = bits(_shitfl_T_21, 29, 0) @[Bitwise.scala 102:28]
    node _shitfl_T_30 = shl(_shitfl_T_29, 2) @[Bitwise.scala 102:47]
    node _shitfl_T_31 = xor(_shitfl_T_21, _shitfl_T_30) @[Bitwise.scala 102:21]
    node _shitfl_T_32 = shr(_shitfl_T_28, 2) @[Bitwise.scala 103:21]
    node _shitfl_T_33 = and(_shitfl_T_32, _shitfl_T_31) @[Bitwise.scala 103:31]
    node _shitfl_T_34 = bits(_shitfl_T_28, 29, 0) @[Bitwise.scala 103:46]
    node _shitfl_T_35 = shl(_shitfl_T_34, 2) @[Bitwise.scala 103:65]
    node _shitfl_T_36 = not(_shitfl_T_31) @[Bitwise.scala 103:77]
    node _shitfl_T_37 = and(_shitfl_T_35, _shitfl_T_36) @[Bitwise.scala 103:75]
    node _shitfl_T_38 = or(_shitfl_T_33, _shitfl_T_37) @[Bitwise.scala 103:39]
    node _shitfl_T_39 = bits(_shitfl_T_31, 30, 0) @[Bitwise.scala 102:28]
    node _shitfl_T_40 = shl(_shitfl_T_39, 1) @[Bitwise.scala 102:47]
    node _shitfl_T_41 = xor(_shitfl_T_31, _shitfl_T_40) @[Bitwise.scala 102:21]
    node _shitfl_T_42 = shr(_shitfl_T_38, 1) @[Bitwise.scala 103:21]
    node _shitfl_T_43 = and(_shitfl_T_42, _shitfl_T_41) @[Bitwise.scala 103:31]
    node _shitfl_T_44 = bits(_shitfl_T_38, 30, 0) @[Bitwise.scala 103:46]
    node _shitfl_T_45 = shl(_shitfl_T_44, 1) @[Bitwise.scala 103:65]
    node _shitfl_T_46 = not(_shitfl_T_41) @[Bitwise.scala 103:77]
    node _shitfl_T_47 = and(_shitfl_T_45, _shitfl_T_46) @[Bitwise.scala 103:75]
    node shitfl = or(_shitfl_T_43, _shitfl_T_47) @[Bitwise.scala 103:39]
    node div = div(io_in_A, io_in_B) @[buggedAlu.scala 52:23]
    node rem = rem(io_in_A, io_in_B) @[buggedAlu.scala 53:23]
    node _io_out_T = eq(io_alu_Op, UInt<4>("h0")) @[buggedAlu.scala 58:28]
    node _io_out_T_1 = eq(io_alu_Op, UInt<4>("h1")) @[buggedAlu.scala 58:55]
    node _io_out_T_2 = or(_io_out_T, _io_out_T_1) @[buggedAlu.scala 58:41]
    node _io_out_T_3 = eq(io_alu_Op, UInt<4>("h4")) @[buggedAlu.scala 59:31]
    node _io_out_T_4 = eq(io_alu_Op, UInt<4>("h6")) @[buggedAlu.scala 59:56]
    node _io_out_T_5 = or(_io_out_T_3, _io_out_T_4) @[buggedAlu.scala 59:43]
    node _io_out_T_6 = eq(io_alu_Op, UInt<4>("hb")) @[buggedAlu.scala 60:35]
    node _io_out_T_7 = eq(io_alu_Op, UInt<4>("ha")) @[buggedAlu.scala 60:60]
    node _io_out_T_8 = or(_io_out_T_6, _io_out_T_7) @[buggedAlu.scala 60:47]
    node _io_out_T_9 = eq(io_alu_Op, UInt<4>("h2")) @[buggedAlu.scala 61:39]
    node _io_out_T_10 = eq(io_alu_Op, UInt<4>("he")) @[buggedAlu.scala 62:43]
    node _io_out_T_11 = and(io_in_A, io_in_B) @[buggedAlu.scala 62:65]
    node _io_out_T_12 = eq(io_alu_Op, UInt<4>("hc")) @[buggedAlu.scala 63:47]
    node _io_out_T_13 = or(io_in_A, io_in_B) @[buggedAlu.scala 63:68]
    node _io_out_T_14 = eq(io_alu_Op, UInt<4>("h8")) @[buggedAlu.scala 64:51]
    node _io_out_T_15 = xor(io_in_A, io_in_B) @[buggedAlu.scala 64:73]
    node _io_out_T_16 = eq(io_alu_Op, UInt<4>("hd")) @[buggedAlu.scala 65:55]
    node _io_out_T_17 = eq(io_alu_Op, UInt<4>("hf")) @[buggedAlu.scala 66:59]
    node _io_out_T_18 = eq(io_alu_Op, UInt<4>("h3")) @[buggedAlu.scala 67:63]
    node _io_out_T_19 = eq(io_alu_Op, UInt<4>("h3")) @[buggedAlu.scala 68:67]
    node _io_out_T_20 = eq(io_alu_Op, UInt<4>("h5")) @[buggedAlu.scala 69:71]
    node _io_out_T_21 = eq(io_alu_Op, UInt<4>("h7")) @[buggedAlu.scala 70:75]
    node _io_out_T_22 = eq(io_alu_Op, UInt<4>("h7")) @[buggedAlu.scala 71:79]
    node _io_out_T_23 = mux(_io_out_T_22, rem, UInt<1>("h0")) @[buggedAlu.scala 71:68]
    node _io_out_T_24 = mux(_io_out_T_21, rem, _io_out_T_23) @[buggedAlu.scala 70:64]
    node _io_out_T_25 = mux(_io_out_T_20, div, _io_out_T_24) @[buggedAlu.scala 69:60]
    node _io_out_T_26 = mux(_io_out_T_19, div, _io_out_T_25) @[buggedAlu.scala 68:56]
    node _io_out_T_27 = mux(_io_out_T_18, div, _io_out_T_26) @[buggedAlu.scala 67:52]
    node _io_out_T_28 = mux(_io_out_T_17, io_in_B, _io_out_T_27) @[buggedAlu.scala 66:48]
    node _io_out_T_29 = mux(_io_out_T_16, io_in_A, _io_out_T_28) @[buggedAlu.scala 65:44]
    node _io_out_T_30 = mux(_io_out_T_14, _io_out_T_15, _io_out_T_29) @[buggedAlu.scala 64:40]
    node _io_out_T_31 = mux(_io_out_T_12, _io_out_T_13, _io_out_T_30) @[buggedAlu.scala 63:36]
    node _io_out_T_32 = mux(_io_out_T_10, _io_out_T_11, _io_out_T_31) @[buggedAlu.scala 62:32]
    node _io_out_T_33 = mux(_io_out_T_9, shitfl, _io_out_T_32) @[buggedAlu.scala 61:28]
    node _io_out_T_34 = mux(_io_out_T_8, shiftr, _io_out_T_33) @[buggedAlu.scala 60:24]
    node _io_out_T_35 = mux(_io_out_T_5, cmp, _io_out_T_34) @[buggedAlu.scala 59:20]
    node _io_out_T_36 = mux(_io_out_T_2, sum, _io_out_T_35) @[buggedAlu.scala 58:16]
    io_out <= _io_out_T_36 @[buggedAlu.scala 57:16]
    io_sum <= sum @[buggedAlu.scala 76:12]

  module DataPath :
    input clock : Clock
    input reset : UInt<1>
    output io_out : UInt<32>

    inst pc of PC @[DataPath.scala 13:18]
    inst cu of CU @[DataPath.scala 14:18]
    inst regfile of RegisterFile @[DataPath.scala 15:23]
    inst insmem of InstMem @[DataPath.scala 16:22]
    inst datamem of Datamem @[DataPath.scala 17:23]
    inst alu of ALU1 @[DataPath.scala 18:19]
    node _alu_io_in_B_T = eq(cu.io_Instype, UInt<1>("h0")) @[DataPath.scala 31:22]
    node _alu_io_in_B_T_1 = mux(_alu_io_in_B_T, cu.io_Imm, regfile.io_Rs2out) @[DataPath.scala 31:21]
    node _regfile_io_datain_T = mux(cu.io_wbselect, alu.io_out, datamem.io_dataout) @[DataPath.scala 34:27]
    io_out <= alu.io_out @[DataPath.scala 37:10]
    pc.clock <= clock
    pc.reset <= reset
    cu.clock <= clock
    cu.reset <= reset
    cu.io_ins <= insmem.io_inst @[DataPath.scala 22:13]
    regfile.clock <= clock
    regfile.reset <= reset
    regfile.io_Wen <= cu.io_RegWrite @[DataPath.scala 24:18]
    regfile.io_RD <= cu.io_RD @[DataPath.scala 26:17]
    regfile.io_Rs1in <= cu.io_Rs1 @[DataPath.scala 27:20]
    regfile.io_Rs2in <= cu.io_Rs2 @[DataPath.scala 28:20]
    regfile.io_datain <= _regfile_io_datain_T @[DataPath.scala 34:21]
    insmem.clock <= clock
    insmem.reset <= reset
    insmem.io_addr <= pc.io_nextaddr @[DataPath.scala 21:18]
    datamem.clock <= clock
    datamem.reset <= reset
    datamem.io_Wen <= cu.io_MemWrite @[DataPath.scala 25:18]
    datamem.io_addr <= alu.io_out @[DataPath.scala 32:19]
    datamem.io_datain <= regfile.io_Rs2out @[DataPath.scala 33:21]
    alu.clock <= clock
    alu.reset <= reset
    alu.io_in_A <= regfile.io_Rs1out @[DataPath.scala 30:15]
    alu.io_in_B <= _alu_io_in_B_T_1 @[DataPath.scala 31:15]
    alu.io_alu_Op <= bits(cu.io_func, 3, 0) @[DataPath.scala 23:17]
