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
    output io_Imm : SInt<32>
    output io_Instype : UInt<1>
    output io_RegWrite : UInt<1>
    output io_MemWrite : UInt<1>
    output io_func : UInt<5>
    output io_wbselect : UInt<1>
    output io_aluselect : UInt<1>
    output io_lengthselect : UInt<2>

    node Opcode = bits(io_ins, 6, 0) @[CU.scala 30:22]
    node _T = eq(Opcode, UInt<6>("h33")) @[CU.scala 32:15]
    node _io_RD_T = bits(io_ins, 11, 7) @[CU.scala 33:19]
    node io_func_hi = bits(io_ins, 14, 12) @[CU.scala 34:26]
    node io_func_lo = bits(io_ins, 30, 30) @[CU.scala 34:40]
    node _io_func_T = cat(io_func_hi, io_func_lo) @[Cat.scala 30:58]
    node _io_Rs1_T = bits(io_ins, 19, 15) @[CU.scala 35:21]
    node _io_Rs2_T = bits(io_ins, 24, 20) @[CU.scala 36:21]
    node _T_1 = eq(Opcode, UInt<5>("h13")) @[CU.scala 45:22]
    node _io_RD_T_1 = bits(io_ins, 11, 7) @[CU.scala 46:21]
    node _io_func_T_1 = bits(io_ins, 14, 12) @[CU.scala 47:34]
    node _io_func_T_2 = bits(io_ins, 30, 30) @[CU.scala 53:28]
    node _io_func_T_3 = mux(_io_func_T_2, UInt<4>("hb"), UInt<4>("ha")) @[CU.scala 53:21]
    node _io_func_T_4 = eq(UInt<1>("h1"), _io_func_T_1) @[Mux.scala 80:60]
    node _io_func_T_5 = mux(_io_func_T_4, UInt<2>("h2"), UInt<1>("h0")) @[Mux.scala 80:57]
    node _io_func_T_6 = eq(UInt<2>("h2"), _io_func_T_1) @[Mux.scala 80:60]
    node _io_func_T_7 = mux(_io_func_T_6, UInt<3>("h4"), _io_func_T_5) @[Mux.scala 80:57]
    node _io_func_T_8 = eq(UInt<2>("h3"), _io_func_T_1) @[Mux.scala 80:60]
    node _io_func_T_9 = mux(_io_func_T_8, UInt<3>("h6"), _io_func_T_7) @[Mux.scala 80:57]
    node _io_func_T_10 = eq(UInt<3>("h4"), _io_func_T_1) @[Mux.scala 80:60]
    node _io_func_T_11 = mux(_io_func_T_10, UInt<4>("h8"), _io_func_T_9) @[Mux.scala 80:57]
    node _io_func_T_12 = eq(UInt<3>("h5"), _io_func_T_1) @[Mux.scala 80:60]
    node _io_func_T_13 = mux(_io_func_T_12, _io_func_T_3, _io_func_T_11) @[Mux.scala 80:57]
    node _io_func_T_14 = eq(UInt<3>("h6"), _io_func_T_1) @[Mux.scala 80:60]
    node _io_func_T_15 = mux(_io_func_T_14, UInt<4>("hc"), _io_func_T_13) @[Mux.scala 80:57]
    node _io_func_T_16 = eq(UInt<3>("h7"), _io_func_T_1) @[Mux.scala 80:60]
    node _io_func_T_17 = mux(_io_func_T_16, UInt<4>("he"), _io_func_T_15) @[Mux.scala 80:57]
    node _io_Rs1_T_1 = bits(io_ins, 19, 15) @[CU.scala 57:23]
    node _io_Imm_T = bits(io_ins, 31, 20) @[CU.scala 59:23]
    node _io_Imm_T_1 = asSInt(_io_Imm_T) @[CU.scala 59:37]
    node _T_2 = eq(Opcode, UInt<2>("h3")) @[CU.scala 69:22]
    node _io_RD_T_2 = bits(io_ins, 11, 7) @[CU.scala 70:22]
    node _io_func_T_18 = bits(io_ins, 14, 12) @[CU.scala 71:24]
    node _io_Rs1_T_2 = bits(io_ins, 19, 15) @[CU.scala 72:23]
    node _io_Imm_T_2 = bits(io_ins, 31, 20) @[CU.scala 74:23]
    node _io_Imm_T_3 = asSInt(_io_Imm_T_2) @[CU.scala 74:38]
    node _io_lengthselect_T = bits(io_ins, 13, 12) @[CU.scala 80:32]
    node _T_3 = eq(Opcode, UInt<6>("h23")) @[CU.scala 83:22]
    node _io_RD_T_3 = bits(io_ins, 11, 7) @[CU.scala 84:22]
    node _io_Rs1_T_3 = bits(io_ins, 19, 15) @[CU.scala 86:23]
    node _io_Rs2_T_1 = bits(io_ins, 24, 20) @[CU.scala 87:23]
    node io_Imm_hi = bits(io_ins, 11, 7) @[CU.scala 88:27]
    node io_Imm_lo = bits(io_ins, 31, 25) @[CU.scala 88:40]
    node _io_Imm_T_4 = cat(io_Imm_hi, io_Imm_lo) @[Cat.scala 30:58]
    node _io_Imm_T_5 = asSInt(_io_Imm_T_4) @[CU.scala 88:57]
    node _io_lengthselect_T_1 = bits(io_ins, 14, 12) @[CU.scala 94:32]
    node _GEN_0 = mux(_T_3, _io_RD_T_3, UInt<1>("h0")) @[CU.scala 83:40 CU.scala 84:13 CU.scala 99:13]
    node _GEN_1 = mux(_T_3, UInt<1>("h0"), UInt<1>("h0")) @[CU.scala 83:40 CU.scala 85:15 CU.scala 100:15]
    node _GEN_2 = mux(_T_3, _io_Rs1_T_3, UInt<1>("h0")) @[CU.scala 83:40 CU.scala 86:14 CU.scala 101:14]
    node _GEN_3 = mux(_T_3, _io_Rs2_T_1, UInt<1>("h0")) @[CU.scala 83:40 CU.scala 87:14 CU.scala 102:14]
    node _GEN_4 = mux(_T_3, _io_Imm_T_5, asSInt(UInt<1>("h0"))) @[CU.scala 83:40 CU.scala 88:14 CU.scala 106:14]
    node _GEN_5 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[CU.scala 83:40 CU.scala 90:19 CU.scala 104:19]
    node _GEN_6 = mux(_T_3, _io_lengthselect_T_1, UInt<1>("h0")) @[CU.scala 83:40 CU.scala 94:23 CU.scala 109:23]
    node _GEN_7 = mux(_T_2, _io_RD_T_2, _GEN_0) @[CU.scala 69:39 CU.scala 70:13]
    node _GEN_8 = mux(_T_2, _io_func_T_18, _GEN_1) @[CU.scala 69:39 CU.scala 71:15]
    node _GEN_9 = mux(_T_2, _io_Rs1_T_2, _GEN_2) @[CU.scala 69:39 CU.scala 72:14]
    node _GEN_10 = mux(_T_2, UInt<1>("h0"), _GEN_3) @[CU.scala 69:39 CU.scala 73:14]
    node _GEN_11 = mux(_T_2, _io_Imm_T_3, _GEN_4) @[CU.scala 69:39 CU.scala 74:14]
    node _GEN_12 = mux(_T_2, UInt<1>("h1"), _GEN_1) @[CU.scala 69:39 CU.scala 75:19]
    node _GEN_13 = mux(_T_2, UInt<1>("h0"), _GEN_5) @[CU.scala 69:39 CU.scala 76:19]
    node _GEN_14 = mux(_T_2, UInt<1>("h0"), _GEN_1) @[CU.scala 69:39 CU.scala 77:18]
    node _GEN_15 = mux(_T_2, _io_lengthselect_T, _GEN_6) @[CU.scala 69:39 CU.scala 80:23]
    node _GEN_16 = mux(_T_1, _io_RD_T_1, _GEN_7) @[CU.scala 45:39 CU.scala 46:12]
    node _GEN_17 = mux(_T_1, _io_func_T_17, _GEN_8) @[CU.scala 45:39 CU.scala 47:15]
    node _GEN_18 = mux(_T_1, _io_Rs1_T_1, _GEN_9) @[CU.scala 45:39 CU.scala 57:14]
    node _GEN_19 = mux(_T_1, UInt<1>("h0"), _GEN_10) @[CU.scala 45:39 CU.scala 58:14]
    node _GEN_20 = mux(_T_1, _io_Imm_T_1, _GEN_11) @[CU.scala 45:39 CU.scala 59:14]
    node _GEN_21 = mux(_T_1, UInt<1>("h1"), _GEN_12) @[CU.scala 45:39 CU.scala 60:19]
    node _GEN_22 = mux(_T_1, UInt<1>("h0"), _GEN_13) @[CU.scala 45:39 CU.scala 61:19]
    node _GEN_23 = mux(_T_1, UInt<1>("h0"), _GEN_14) @[CU.scala 45:39 CU.scala 62:18]
    node _GEN_24 = mux(_T_1, UInt<1>("h0"), _GEN_15) @[CU.scala 45:39 CU.scala 65:23]
    node _GEN_25 = mux(_T, _io_RD_T, _GEN_16) @[CU.scala 32:32 CU.scala 33:10]
    node _GEN_26 = mux(_T, _io_func_T, _GEN_17) @[CU.scala 32:32 CU.scala 34:13]
    node _GEN_27 = mux(_T, _io_Rs1_T, _GEN_18) @[CU.scala 32:32 CU.scala 35:12]
    node _GEN_28 = mux(_T, _io_Rs2_T, _GEN_19) @[CU.scala 32:32 CU.scala 36:12]
    node _GEN_29 = mux(_T, asSInt(UInt<1>("h0")), _GEN_20) @[CU.scala 32:32 CU.scala 37:12]
    node _GEN_30 = mux(_T, UInt<1>("h1"), _GEN_21) @[CU.scala 32:32 CU.scala 38:17]
    node _GEN_31 = mux(_T, UInt<1>("h0"), _GEN_22) @[CU.scala 32:32 CU.scala 39:17]
    node _GEN_32 = mux(_T, UInt<1>("h1"), _GEN_23) @[CU.scala 32:32 CU.scala 41:16]
    node _GEN_33 = mux(_T, UInt<1>("h0"), _GEN_24) @[CU.scala 32:32 CU.scala 43:21]
    io_RD <= _GEN_25
    io_Rs1 <= _GEN_27
    io_Rs2 <= _GEN_28
    io_Imm <= _GEN_29
    io_Instype <= _GEN_32
    io_RegWrite <= _GEN_30
    io_MemWrite <= _GEN_31
    io_func <= _GEN_26
    io_wbselect <= _GEN_30
    io_aluselect <= _GEN_31
    io_lengthselect <= bits(_GEN_33, 1, 0)

  module RegisterFile :
    input clock : Clock
    input reset : UInt<1>
    input io_Wen : UInt<1>
    input io_RD : UInt<5>
    input io_Rs1in : UInt<5>
    input io_Rs2in : UInt<5>
    output io_Rs1out : SInt<32>
    output io_Rs2out : SInt<32>
    input io_datain : SInt<32>

    mem regFile : @[RegisterFile.scala 15:21]
      data-type => SInt<32>
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
    input io_datain : SInt<32>
    output io_dataout : SInt<32>

    mem memory : @[Datamem.scala 13:20]
      data-type => SInt<32>
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
    node _GEN_6 = mux(io_Wen, memory.io_dataout_MPORT.data, asSInt(UInt<1>("h0"))) @[Datamem.scala 16:16 Datamem.scala 18:16 Datamem.scala 14:14]
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
    input io_in_A : SInt<32>
    input io_in_B : SInt<32>
    input io_alu_Op : UInt<4>
    output io_out : SInt<32>
    output io_sum : SInt<32>

    node _sum_T = add(io_in_A, io_in_B) @[buggedAlu.scala 46:23]
    node _sum_T_1 = tail(_sum_T, 1) @[buggedAlu.scala 46:23]
    node sum = asSInt(_sum_T_1) @[buggedAlu.scala 46:23]
    node _sub_T = sub(io_in_A, io_in_B) @[buggedAlu.scala 47:23]
    node _sub_T_1 = tail(_sub_T, 1) @[buggedAlu.scala 47:23]
    node sub = asSInt(_sub_T_1) @[buggedAlu.scala 47:23]
    node _cmp_T = lt(io_in_A, io_in_B) @[buggedAlu.scala 48:27]
    node cmp = mux(_cmp_T, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[buggedAlu.scala 48:18]
    node _cmpU_T = asUInt(io_in_A) @[buggedAlu.scala 49:34]
    node _cmpU_T_1 = asUInt(io_in_B) @[buggedAlu.scala 49:53]
    node _cmpU_T_2 = lt(_cmpU_T, _cmpU_T_1) @[buggedAlu.scala 49:37]
    node cmpU = mux(_cmpU_T_2, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[buggedAlu.scala 49:19]
    node shamt = bits(io_in_B, 4, 0) @[buggedAlu.scala 50:24]
    node _shiftrl_T = asUInt(io_in_A) @[buggedAlu.scala 52:33]
    node shiftrl = dshr(_shiftrl_T, shamt) @[buggedAlu.scala 52:36]
    node shitfl = dshl(io_in_A, shamt) @[buggedAlu.scala 53:26]
    node shiftrA = dshr(io_in_A, shamt) @[buggedAlu.scala 54:27]
    node div = div(io_in_A, io_in_B) @[buggedAlu.scala 55:23]
    node rem = rem(io_in_A, io_in_B) @[buggedAlu.scala 56:23]
    node _io_out_T = eq(io_alu_Op, UInt<4>("h0")) @[buggedAlu.scala 59:28]
    node _io_out_T_1 = eq(io_alu_Op, UInt<4>("h1")) @[buggedAlu.scala 60:32]
    node _io_out_T_2 = eq(io_alu_Op, UInt<4>("h4")) @[buggedAlu.scala 61:35]
    node _io_out_T_3 = eq(io_alu_Op, UInt<4>("h6")) @[buggedAlu.scala 62:39]
    node _io_out_T_4 = eq(io_alu_Op, UInt<4>("ha")) @[buggedAlu.scala 63:43]
    node _io_out_T_5 = asSInt(shiftrl) @[buggedAlu.scala 63:70]
    node _io_out_T_6 = eq(io_alu_Op, UInt<4>("hb")) @[buggedAlu.scala 64:47]
    node _io_out_T_7 = eq(io_alu_Op, UInt<4>("h2")) @[buggedAlu.scala 65:51]
    node _io_out_T_8 = eq(io_alu_Op, UInt<4>("he")) @[buggedAlu.scala 66:55]
    node _io_out_T_9 = and(io_in_A, io_in_B) @[buggedAlu.scala 66:77]
    node _io_out_T_10 = asSInt(_io_out_T_9) @[buggedAlu.scala 66:77]
    node _io_out_T_11 = eq(io_alu_Op, UInt<4>("hc")) @[buggedAlu.scala 67:59]
    node _io_out_T_12 = or(io_in_A, io_in_B) @[buggedAlu.scala 67:80]
    node _io_out_T_13 = asSInt(_io_out_T_12) @[buggedAlu.scala 67:80]
    node _io_out_T_14 = eq(io_alu_Op, UInt<4>("h8")) @[buggedAlu.scala 68:64]
    node _io_out_T_15 = xor(io_in_A, io_in_B) @[buggedAlu.scala 68:86]
    node _io_out_T_16 = asSInt(_io_out_T_15) @[buggedAlu.scala 68:86]
    node _io_out_T_17 = eq(io_alu_Op, UInt<4>("hd")) @[buggedAlu.scala 69:67]
    node _io_out_T_18 = eq(io_alu_Op, UInt<4>("hf")) @[buggedAlu.scala 70:71]
    node _io_out_T_19 = mux(_io_out_T_18, io_in_B, asSInt(UInt<1>("h0"))) @[buggedAlu.scala 70:60]
    node _io_out_T_20 = mux(_io_out_T_17, io_in_A, _io_out_T_19) @[buggedAlu.scala 69:56]
    node _io_out_T_21 = mux(_io_out_T_14, _io_out_T_16, _io_out_T_20) @[buggedAlu.scala 68:53]
    node _io_out_T_22 = mux(_io_out_T_11, _io_out_T_13, _io_out_T_21) @[buggedAlu.scala 67:48]
    node _io_out_T_23 = mux(_io_out_T_8, _io_out_T_10, _io_out_T_22) @[buggedAlu.scala 66:44]
    node _io_out_T_24 = mux(_io_out_T_7, shitfl, _io_out_T_23) @[buggedAlu.scala 65:40]
    node _io_out_T_25 = mux(_io_out_T_6, shiftrA, _io_out_T_24) @[buggedAlu.scala 64:36]
    node _io_out_T_26 = mux(_io_out_T_4, _io_out_T_5, _io_out_T_25) @[buggedAlu.scala 63:32]
    node _io_out_T_27 = mux(_io_out_T_3, cmpU, _io_out_T_26) @[buggedAlu.scala 62:28]
    node _io_out_T_28 = mux(_io_out_T_2, cmp, _io_out_T_27) @[buggedAlu.scala 61:24]
    node _io_out_T_29 = mux(_io_out_T_1, sub, _io_out_T_28) @[buggedAlu.scala 60:20]
    node _io_out_T_30 = mux(_io_out_T, sum, _io_out_T_29) @[buggedAlu.scala 59:16]
    io_out <= asSInt(bits(_io_out_T_30, 31, 0)) @[buggedAlu.scala 58:12]
    io_sum <= sum @[buggedAlu.scala 76:12]

  module DataPath :
    input clock : Clock
    input reset : UInt<1>
    output io_out : SInt<32>

    inst pc of PC @[DataPath.scala 13:18]
    inst cu of CU @[DataPath.scala 14:18]
    inst regfile of RegisterFile @[DataPath.scala 15:23]
    inst insmem of InstMem @[DataPath.scala 16:22]
    inst datamem of Datamem @[DataPath.scala 17:23]
    inst alu of ALU1 @[DataPath.scala 18:19]
    node _alu_io_alu_Op_T = mux(cu.io_aluselect, UInt<1>("h0"), cu.io_func) @[DataPath.scala 23:23]
    node _alu_io_in_B_T = eq(cu.io_Instype, UInt<1>("h0")) @[DataPath.scala 31:22]
    node _alu_io_in_B_T_1 = mux(_alu_io_in_B_T, cu.io_Imm, regfile.io_Rs2out) @[DataPath.scala 31:21]
    node _datamem_io_addr_T = asUInt(alu.io_out) @[DataPath.scala 32:39]
    node _datamem_io_datain_T = bits(regfile.io_Rs2out, 8, 0) @[DataPath.scala 34:31]
    node _datamem_io_datain_T_1 = asSInt(_datamem_io_datain_T) @[DataPath.scala 34:44]
    node _datamem_io_datain_T_2 = bits(regfile.io_Rs2out, 15, 0) @[DataPath.scala 35:31]
    node _datamem_io_datain_T_3 = asSInt(_datamem_io_datain_T_2) @[DataPath.scala 35:45]
    node _datamem_io_datain_T_4 = eq(UInt<1>("h0"), cu.io_lengthselect) @[Mux.scala 80:60]
    node _datamem_io_datain_T_5 = mux(_datamem_io_datain_T_4, _datamem_io_datain_T_1, asSInt(UInt<1>("h0"))) @[Mux.scala 80:57]
    node _datamem_io_datain_T_6 = eq(UInt<1>("h1"), cu.io_lengthselect) @[Mux.scala 80:60]
    node _datamem_io_datain_T_7 = mux(_datamem_io_datain_T_6, _datamem_io_datain_T_3, _datamem_io_datain_T_5) @[Mux.scala 80:57]
    node _datamem_io_datain_T_8 = eq(UInt<2>("h2"), cu.io_lengthselect) @[Mux.scala 80:60]
    node _datamem_io_datain_T_9 = mux(_datamem_io_datain_T_8, regfile.io_Rs2out, _datamem_io_datain_T_7) @[Mux.scala 80:57]
    node _datamem_io_datain_T_10 = mux(cu.io_wbselect, regfile.io_Rs2out, _datamem_io_datain_T_9) @[DataPath.scala 33:27]
    node _regfile_io_datain_T = bits(datamem.io_dataout, 8, 0) @[DataPath.scala 40:32]
    node _regfile_io_datain_T_1 = asSInt(_regfile_io_datain_T) @[DataPath.scala 40:44]
    node _regfile_io_datain_T_2 = bits(datamem.io_dataout, 15, 0) @[DataPath.scala 41:32]
    node _regfile_io_datain_T_3 = asSInt(_regfile_io_datain_T_2) @[DataPath.scala 41:45]
    node _regfile_io_datain_T_4 = eq(UInt<1>("h0"), cu.io_lengthselect) @[Mux.scala 80:60]
    node _regfile_io_datain_T_5 = mux(_regfile_io_datain_T_4, _regfile_io_datain_T_1, asSInt(UInt<1>("h0"))) @[Mux.scala 80:57]
    node _regfile_io_datain_T_6 = eq(UInt<1>("h1"), cu.io_lengthselect) @[Mux.scala 80:60]
    node _regfile_io_datain_T_7 = mux(_regfile_io_datain_T_6, _regfile_io_datain_T_3, _regfile_io_datain_T_5) @[Mux.scala 80:57]
    node _regfile_io_datain_T_8 = eq(UInt<2>("h2"), cu.io_lengthselect) @[Mux.scala 80:60]
    node _regfile_io_datain_T_9 = mux(_regfile_io_datain_T_8, datamem.io_dataout, _regfile_io_datain_T_7) @[Mux.scala 80:57]
    node _regfile_io_datain_T_10 = mux(cu.io_wbselect, alu.io_out, _regfile_io_datain_T_9) @[DataPath.scala 39:27]
    io_out <= alu.io_out @[DataPath.scala 43:10]
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
    regfile.io_datain <= _regfile_io_datain_T_10 @[DataPath.scala 39:21]
    insmem.clock <= clock
    insmem.reset <= reset
    insmem.io_addr <= pc.io_nextaddr @[DataPath.scala 21:18]
    datamem.clock <= clock
    datamem.reset <= reset
    datamem.io_Wen <= cu.io_MemWrite @[DataPath.scala 25:18]
    datamem.io_addr <= _datamem_io_addr_T @[DataPath.scala 32:19]
    datamem.io_datain <= _datamem_io_datain_T_10 @[DataPath.scala 33:21]
    alu.clock <= clock
    alu.reset <= reset
    alu.io_in_A <= regfile.io_Rs1out @[DataPath.scala 30:15]
    alu.io_in_B <= _alu_io_in_B_T_1 @[DataPath.scala 31:15]
    alu.io_alu_Op <= bits(_alu_io_alu_Op_T, 3, 0) @[DataPath.scala 23:17]
