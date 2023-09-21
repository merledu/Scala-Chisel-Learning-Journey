circuit DataPath :
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
    output io_wbselect : UInt<2>
    output io_aluselect : UInt<1>
    output io_lengthselect : UInt<2>
    input io_dobranch : UInt<1>
    output io_btypefun : UInt<4>
    output io_pcselec : UInt<1>
    output io_btype : UInt<1>
    output io_jump : UInt<1>
    output io_readmem : UInt<1>

    node Opcode = bits(io_ins, 6, 0) @[CU.scala 37:22]
    node _T = eq(Opcode, UInt<6>("h33")) @[CU.scala 43:15]
    node _io_RD_T = bits(io_ins, 11, 7) @[CU.scala 44:19]
    node io_func_hi = bits(io_ins, 14, 12) @[CU.scala 45:26]
    node io_func_lo = bits(io_ins, 30, 30) @[CU.scala 45:40]
    node _io_func_T = cat(io_func_hi, io_func_lo) @[Cat.scala 30:58]
    node _io_Rs1_T = bits(io_ins, 19, 15) @[CU.scala 46:21]
    node _io_Rs2_T = bits(io_ins, 24, 20) @[CU.scala 47:21]
    node _T_1 = eq(Opcode, UInt<5>("h13")) @[CU.scala 59:22]
    node _io_RD_T_1 = bits(io_ins, 11, 7) @[CU.scala 60:21]
    node _io_func_T_1 = bits(io_ins, 14, 12) @[CU.scala 61:34]
    node _io_func_T_2 = bits(io_ins, 30, 30) @[CU.scala 67:28]
    node _io_func_T_3 = mux(_io_func_T_2, UInt<4>("hb"), UInt<4>("ha")) @[CU.scala 67:21]
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
    node _io_Rs1_T_1 = bits(io_ins, 19, 15) @[CU.scala 71:23]
    node _io_Imm_T = bits(io_ins, 31, 31) @[CU.scala 73:35]
    node _io_Imm_T_1 = bits(_io_Imm_T, 0, 0) @[Bitwise.scala 72:15]
    node io_Imm_hi = mux(_io_Imm_T_1, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 72:12]
    node io_Imm_lo = bits(io_ins, 31, 20) @[CU.scala 73:47]
    node _io_Imm_T_2 = cat(io_Imm_hi, io_Imm_lo) @[Cat.scala 30:58]
    node _T_2 = eq(Opcode, UInt<2>("h3")) @[CU.scala 84:22]
    node _io_RD_T_2 = bits(io_ins, 11, 7) @[CU.scala 85:22]
    node _io_Rs1_T_2 = bits(io_ins, 19, 15) @[CU.scala 87:23]
    node _io_Imm_T_3 = bits(io_ins, 31, 31) @[CU.scala 89:35]
    node _io_Imm_T_4 = bits(_io_Imm_T_3, 0, 0) @[Bitwise.scala 72:15]
    node io_Imm_hi_1 = mux(_io_Imm_T_4, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 72:12]
    node io_Imm_lo_1 = bits(io_ins, 31, 20) @[CU.scala 89:47]
    node _io_Imm_T_5 = cat(io_Imm_hi_1, io_Imm_lo_1) @[Cat.scala 30:58]
    node _io_lengthselect_T = bits(io_ins, 14, 12) @[CU.scala 95:32]
    node _T_3 = eq(Opcode, UInt<6>("h23")) @[CU.scala 100:22]
    node _io_RD_T_3 = bits(io_ins, 11, 7) @[CU.scala 101:22]
    node _io_Rs1_T_3 = bits(io_ins, 19, 15) @[CU.scala 103:23]
    node _io_Rs2_T_1 = bits(io_ins, 24, 20) @[CU.scala 104:23]
    node _io_Imm_T_6 = bits(io_ins, 31, 31) @[CU.scala 105:35]
    node _io_Imm_T_7 = bits(_io_Imm_T_6, 0, 0) @[Bitwise.scala 72:15]
    node io_Imm_hi_hi = mux(_io_Imm_T_7, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 72:12]
    node io_Imm_hi_lo = bits(io_ins, 31, 25) @[CU.scala 105:47]
    node io_Imm_lo_2 = bits(io_ins, 11, 7) @[CU.scala 105:62]
    node io_Imm_hi_2 = cat(io_Imm_hi_hi, io_Imm_hi_lo) @[Cat.scala 30:58]
    node _io_Imm_T_8 = cat(io_Imm_hi_2, io_Imm_lo_2) @[Cat.scala 30:58]
    node _io_lengthselect_T_1 = bits(io_ins, 14, 12) @[CU.scala 111:32]
    node _T_4 = eq(Opcode, UInt<7>("h63")) @[CU.scala 116:22]
    node _io_btypefun_T = bits(io_ins, 14, 12) @[CU.scala 119:28]
    node _io_Rs1_T_4 = bits(io_ins, 19, 15) @[CU.scala 120:23]
    node _io_Rs2_T_2 = bits(io_ins, 24, 20) @[CU.scala 121:23]
    node _io_Imm_T_9 = bits(io_ins, 31, 31) @[CU.scala 122:37]
    node _io_Imm_T_10 = bits(_io_Imm_T_9, 0, 0) @[Bitwise.scala 72:15]
    node io_Imm_hi_hi_hi = mux(_io_Imm_T_10, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 72:12]
    node io_Imm_hi_hi_lo = bits(io_ins, 31, 31) @[CU.scala 122:49]
    node io_Imm_hi_lo_1 = bits(io_ins, 7, 7) @[CU.scala 122:60]
    node io_Imm_lo_hi_hi = bits(io_ins, 30, 25) @[CU.scala 122:70]
    node io_Imm_lo_hi_lo = bits(io_ins, 11, 8) @[CU.scala 122:84]
    node io_Imm_lo_hi = cat(io_Imm_lo_hi_hi, io_Imm_lo_hi_lo) @[Cat.scala 30:58]
    node io_Imm_lo_3 = cat(io_Imm_lo_hi, UInt<1>("h0")) @[Cat.scala 30:58]
    node io_Imm_hi_hi_1 = cat(io_Imm_hi_hi_hi, io_Imm_hi_hi_lo) @[Cat.scala 30:58]
    node io_Imm_hi_3 = cat(io_Imm_hi_hi_1, io_Imm_hi_lo_1) @[Cat.scala 30:58]
    node _io_Imm_T_11 = cat(io_Imm_hi_3, io_Imm_lo_3) @[Cat.scala 30:58]
    node _io_pcselec_T = and(io_dobranch, io_btype) @[CU.scala 131:37]
    node _io_pcselec_T_1 = mux(_io_pcselec_T, UInt<1>("h1"), UInt<1>("h0")) @[CU.scala 131:24]
    node _T_5 = eq(Opcode, UInt<7>("h6f")) @[CU.scala 133:23]
    node _io_RD_T_4 = bits(io_ins, 11, 7) @[CU.scala 134:20]
    node _io_Imm_T_12 = bits(io_ins, 31, 31) @[CU.scala 135:35]
    node _io_Imm_T_13 = bits(_io_Imm_T_12, 0, 0) @[Bitwise.scala 72:15]
    node io_Imm_hi_hi_hi_1 = mux(_io_Imm_T_13, UInt<11>("h7ff"), UInt<11>("h0")) @[Bitwise.scala 72:12]
    node io_Imm_hi_hi_lo_1 = bits(io_ins, 31, 31) @[CU.scala 135:47]
    node io_Imm_hi_lo_2 = bits(io_ins, 19, 12) @[CU.scala 135:58]
    node io_Imm_lo_hi_hi_1 = bits(io_ins, 20, 20) @[CU.scala 135:72]
    node io_Imm_lo_hi_lo_1 = bits(io_ins, 30, 21) @[CU.scala 135:83]
    node io_Imm_lo_hi_1 = cat(io_Imm_lo_hi_hi_1, io_Imm_lo_hi_lo_1) @[Cat.scala 30:58]
    node io_Imm_lo_4 = cat(io_Imm_lo_hi_1, UInt<1>("h0")) @[Cat.scala 30:58]
    node io_Imm_hi_hi_2 = cat(io_Imm_hi_hi_hi_1, io_Imm_hi_hi_lo_1) @[Cat.scala 30:58]
    node io_Imm_hi_4 = cat(io_Imm_hi_hi_2, io_Imm_hi_lo_2) @[Cat.scala 30:58]
    node _io_Imm_T_14 = cat(io_Imm_hi_4, io_Imm_lo_4) @[Cat.scala 30:58]
    node _T_6 = eq(Opcode, UInt<7>("h67")) @[CU.scala 151:22]
    node _io_Imm_T_15 = bits(io_ins, 31, 31) @[CU.scala 152:35]
    node _io_Imm_T_16 = bits(_io_Imm_T_15, 0, 0) @[Bitwise.scala 72:15]
    node io_Imm_hi_5 = mux(_io_Imm_T_16, UInt<11>("h7ff"), UInt<11>("h0")) @[Bitwise.scala 72:12]
    node io_Imm_lo_5 = bits(io_ins, 31, 20) @[CU.scala 152:47]
    node _io_Imm_T_17 = cat(io_Imm_hi_5, io_Imm_lo_5) @[Cat.scala 30:58]
    node _io_Rs1_T_5 = bits(io_ins, 19, 15) @[CU.scala 153:23]
    node _io_func_T_18 = bits(io_ins, 14, 12) @[CU.scala 154:25]
    node _io_RD_T_5 = bits(io_ins, 11, 7) @[CU.scala 156:22]
    node _T_7 = eq(Opcode, UInt<6>("h37")) @[CU.scala 167:22]
    node io_Imm_hi_hi_3 = bits(io_ins, 31, 12) @[CU.scala 168:27]
    node io_Imm_hi_lo_3 = mux(UInt<1>("h0"), UInt<11>("h7ff"), UInt<11>("h0")) @[Bitwise.scala 72:12]
    node io_Imm_hi_6 = cat(io_Imm_hi_hi_3, io_Imm_hi_lo_3) @[Cat.scala 30:58]
    node _io_Imm_T_18 = cat(io_Imm_hi_6, UInt<1>("h0")) @[Cat.scala 30:58]
    node _io_RD_T_6 = bits(io_ins, 11, 7) @[CU.scala 172:22]
    node _T_8 = eq(Opcode, UInt<5>("h17")) @[CU.scala 183:22]
    node io_Imm_hi_hi_4 = bits(io_ins, 31, 12) @[CU.scala 184:27]
    node io_Imm_hi_lo_4 = mux(UInt<1>("h0"), UInt<11>("h7ff"), UInt<11>("h0")) @[Bitwise.scala 72:12]
    node io_Imm_hi_7 = cat(io_Imm_hi_hi_4, io_Imm_hi_lo_4) @[Cat.scala 30:58]
    node _io_Imm_T_19 = cat(io_Imm_hi_7, UInt<1>("h0")) @[Cat.scala 30:58]
    node _GEN_0 = mux(_T_8, _io_Imm_T_19, UInt<1>("h0")) @[CU.scala 183:40 CU.scala 184:14 CU.scala 209:14]
    node _GEN_1 = mux(_T_8, UInt<1>("h0"), UInt<1>("h0")) @[CU.scala 183:40 CU.scala 185:15 CU.scala 203:15]
    node _GEN_2 = mux(_T_8, UInt<1>("h1"), UInt<1>("h0")) @[CU.scala 183:40 CU.scala 193:20 CU.scala 211:20]
    node _GEN_3 = mux(_T_7, _io_Imm_T_18, _GEN_0) @[CU.scala 167:39 CU.scala 168:14]
    node _GEN_4 = mux(_T_7, UInt<1>("h0"), _GEN_1) @[CU.scala 167:39 CU.scala 169:15]
    node _GEN_5 = mux(_T_7, _io_RD_T_6, _GEN_1) @[CU.scala 167:39 CU.scala 172:13]
    node _GEN_6 = mux(_T_7, UInt<1>("h1"), _GEN_1) @[CU.scala 167:39 CU.scala 174:19]
    node _GEN_7 = mux(_T_7, UInt<1>("h1"), _GEN_2) @[CU.scala 167:39 CU.scala 177:20]
    node _GEN_8 = mux(_T_7, UInt<1>("h0"), _GEN_2) @[CU.scala 167:39 CU.scala 180:15]
    node _GEN_9 = mux(_T_6, _io_Imm_T_17, _GEN_3) @[CU.scala 151:39 CU.scala 152:14]
    node _GEN_10 = mux(_T_6, _io_Rs1_T_5, _GEN_4) @[CU.scala 151:39 CU.scala 153:14]
    node _GEN_11 = mux(_T_6, _io_func_T_18, _GEN_4) @[CU.scala 151:39 CU.scala 154:15]
    node _GEN_12 = mux(_T_6, UInt<1>("h0"), _GEN_4) @[CU.scala 151:39 CU.scala 155:14]
    node _GEN_13 = mux(_T_6, _io_RD_T_5, _GEN_5) @[CU.scala 151:39 CU.scala 156:13]
    node _GEN_14 = mux(_T_6, UInt<1>("h1"), _GEN_6) @[CU.scala 151:39 CU.scala 158:19]
    node _GEN_15 = mux(_T_6, UInt<1>("h1"), _GEN_7) @[CU.scala 151:39 CU.scala 161:20]
    node _GEN_16 = mux(_T_6, UInt<1>("h1"), _GEN_8) @[CU.scala 151:39 CU.scala 164:18]
    node _GEN_17 = mux(_T_6, UInt<1>("h0"), _GEN_8) @[CU.scala 151:39 CU.scala 165:15]
    node _GEN_18 = mux(_T_5, _io_RD_T_4, _GEN_13) @[CU.scala 133:41 CU.scala 134:11]
    node _GEN_19 = mux(_T_5, _io_Imm_T_14, _GEN_9) @[CU.scala 133:41 CU.scala 135:12]
    node _GEN_20 = mux(_T_5, UInt<1>("h0"), _GEN_11) @[CU.scala 133:41 CU.scala 136:13]
    node _GEN_21 = mux(_T_5, UInt<1>("h0"), _GEN_10) @[CU.scala 133:41 CU.scala 137:12]
    node _GEN_22 = mux(_T_5, UInt<1>("h0"), _GEN_12) @[CU.scala 133:41 CU.scala 138:12]
    node _GEN_23 = mux(_T_5, UInt<1>("h1"), _GEN_14) @[CU.scala 133:41 CU.scala 140:17]
    node _GEN_24 = mux(_T_5, UInt<1>("h0"), _GEN_15) @[CU.scala 133:41 CU.scala 143:18]
    node _GEN_25 = mux(_T_5, UInt<2>("h2"), _GEN_14) @[CU.scala 133:41 CU.scala 144:17]
    node _GEN_26 = mux(_T_5, UInt<1>("h1"), _GEN_16) @[CU.scala 133:41 CU.scala 146:16]
    node _GEN_27 = mux(_T_5, UInt<1>("h1"), _GEN_17) @[CU.scala 133:41 CU.scala 147:13]
    node _GEN_28 = mux(_T_4, UInt<1>("h0"), _GEN_20) @[CU.scala 116:39 CU.scala 117:15]
    node _GEN_29 = mux(_T_4, UInt<1>("h0"), _GEN_18) @[CU.scala 116:39 CU.scala 118:13]
    node _GEN_30 = mux(_T_4, _io_btypefun_T, UInt<1>("h0")) @[CU.scala 116:39 CU.scala 119:19 CU.scala 38:15]
    node _GEN_31 = mux(_T_4, _io_Rs1_T_4, _GEN_21) @[CU.scala 116:39 CU.scala 120:14]
    node _GEN_32 = mux(_T_4, _io_Rs2_T_2, _GEN_22) @[CU.scala 116:39 CU.scala 121:14]
    node _GEN_33 = mux(_T_4, _io_Imm_T_11, _GEN_19) @[CU.scala 116:39 CU.scala 122:14]
    node _GEN_34 = mux(_T_4, UInt<1>("h0"), _GEN_22) @[CU.scala 116:39 CU.scala 123:19]
    node _GEN_35 = mux(_T_4, UInt<1>("h0"), _GEN_23) @[CU.scala 116:39 CU.scala 124:19]
    node _GEN_36 = mux(_T_4, UInt<1>("h1"), _GEN_24) @[CU.scala 116:39 CU.scala 127:20]
    node _GEN_37 = mux(_T_4, UInt<1>("h0"), _GEN_25) @[CU.scala 116:39 CU.scala 128:19]
    node _GEN_38 = mux(_T_4, UInt<1>("h1"), _GEN_22) @[CU.scala 116:39 CU.scala 129:16]
    node _GEN_39 = mux(_T_4, _io_pcselec_T_1, _GEN_26) @[CU.scala 116:39 CU.scala 131:18]
    node _GEN_40 = mux(_T_4, UInt<1>("h0"), _GEN_27) @[CU.scala 116:39 CU.scala 40:11]
    node _GEN_41 = mux(_T_3, _io_RD_T_3, _GEN_29) @[CU.scala 100:40 CU.scala 101:13]
    node _GEN_42 = mux(_T_3, UInt<1>("h0"), _GEN_28) @[CU.scala 100:40 CU.scala 102:15]
    node _GEN_43 = mux(_T_3, _io_Rs1_T_3, _GEN_31) @[CU.scala 100:40 CU.scala 103:14]
    node _GEN_44 = mux(_T_3, _io_Rs2_T_1, _GEN_32) @[CU.scala 100:40 CU.scala 104:14]
    node _GEN_45 = mux(_T_3, _io_Imm_T_8, _GEN_33) @[CU.scala 100:40 CU.scala 105:14]
    node _GEN_46 = mux(_T_3, UInt<1>("h0"), _GEN_35) @[CU.scala 100:40 CU.scala 106:19]
    node _GEN_47 = mux(_T_3, UInt<1>("h1"), _GEN_34) @[CU.scala 100:40 CU.scala 107:19]
    node _GEN_48 = mux(_T_3, UInt<1>("h0"), _GEN_34) @[CU.scala 100:40 CU.scala 108:18]
    node _GEN_49 = mux(_T_3, UInt<1>("h0"), _GEN_37) @[CU.scala 100:40 CU.scala 109:19]
    node _GEN_50 = mux(_T_3, UInt<1>("h1"), _GEN_36) @[CU.scala 100:40 CU.scala 110:20]
    node _GEN_51 = mux(_T_3, _io_lengthselect_T_1, _GEN_34) @[CU.scala 100:40 CU.scala 111:23]
    node _GEN_52 = mux(_T_3, UInt<1>("h0"), _GEN_39) @[CU.scala 100:40 CU.scala 112:18]
    node _GEN_53 = mux(_T_3, UInt<1>("h0"), _GEN_30) @[CU.scala 100:40 CU.scala 38:15]
    node _GEN_54 = mux(_T_3, UInt<1>("h0"), _GEN_38) @[CU.scala 100:40 CU.scala 39:12]
    node _GEN_55 = mux(_T_3, UInt<1>("h0"), _GEN_40) @[CU.scala 100:40 CU.scala 40:11]
    node _GEN_56 = mux(_T_2, _io_RD_T_2, _GEN_41) @[CU.scala 84:39 CU.scala 85:13]
    node _GEN_57 = mux(_T_2, UInt<1>("h0"), _GEN_42) @[CU.scala 84:39 CU.scala 86:15]
    node _GEN_58 = mux(_T_2, _io_Rs1_T_2, _GEN_43) @[CU.scala 84:39 CU.scala 87:14]
    node _GEN_59 = mux(_T_2, UInt<1>("h0"), _GEN_44) @[CU.scala 84:39 CU.scala 88:14]
    node _GEN_60 = mux(_T_2, _io_Imm_T_5, _GEN_45) @[CU.scala 84:39 CU.scala 89:14]
    node _GEN_61 = mux(_T_2, UInt<1>("h1"), _GEN_46) @[CU.scala 84:39 CU.scala 90:19]
    node _GEN_62 = mux(_T_2, UInt<1>("h0"), _GEN_47) @[CU.scala 84:39 CU.scala 91:19]
    node _GEN_63 = mux(_T_2, UInt<1>("h0"), _GEN_48) @[CU.scala 84:39 CU.scala 92:18]
    node _GEN_64 = mux(_T_2, UInt<1>("h0"), _GEN_49) @[CU.scala 84:39 CU.scala 93:19]
    node _GEN_65 = mux(_T_2, UInt<1>("h0"), _GEN_50) @[CU.scala 84:39 CU.scala 94:20]
    node _GEN_66 = mux(_T_2, _io_lengthselect_T, _GEN_51) @[CU.scala 84:39 CU.scala 95:23]
    node _GEN_67 = mux(_T_2, UInt<1>("h0"), _GEN_52) @[CU.scala 84:39 CU.scala 96:18]
    node _GEN_68 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[CU.scala 84:39 CU.scala 97:18 CU.scala 41:14]
    node _GEN_69 = mux(_T_2, UInt<1>("h0"), _GEN_53) @[CU.scala 84:39 CU.scala 38:15]
    node _GEN_70 = mux(_T_2, UInt<1>("h0"), _GEN_54) @[CU.scala 84:39 CU.scala 39:12]
    node _GEN_71 = mux(_T_2, UInt<1>("h0"), _GEN_55) @[CU.scala 84:39 CU.scala 40:11]
    node _GEN_72 = mux(_T_1, _io_RD_T_1, _GEN_56) @[CU.scala 59:39 CU.scala 60:12]
    node _GEN_73 = mux(_T_1, _io_func_T_17, _GEN_57) @[CU.scala 59:39 CU.scala 61:15]
    node _GEN_74 = mux(_T_1, _io_Rs1_T_1, _GEN_58) @[CU.scala 59:39 CU.scala 71:14]
    node _GEN_75 = mux(_T_1, UInt<1>("h0"), _GEN_59) @[CU.scala 59:39 CU.scala 72:14]
    node _GEN_76 = mux(_T_1, _io_Imm_T_2, _GEN_60) @[CU.scala 59:39 CU.scala 73:14]
    node _GEN_77 = mux(_T_1, UInt<1>("h1"), _GEN_61) @[CU.scala 59:39 CU.scala 74:19]
    node _GEN_78 = mux(_T_1, UInt<1>("h0"), _GEN_62) @[CU.scala 59:39 CU.scala 75:19]
    node _GEN_79 = mux(_T_1, UInt<1>("h0"), _GEN_63) @[CU.scala 59:39 CU.scala 76:18]
    node _GEN_80 = mux(_T_1, UInt<1>("h1"), _GEN_64) @[CU.scala 59:39 CU.scala 77:19]
    node _GEN_81 = mux(_T_1, UInt<1>("h0"), _GEN_65) @[CU.scala 59:39 CU.scala 78:20]
    node _GEN_82 = mux(_T_1, UInt<1>("h0"), _GEN_66) @[CU.scala 59:39 CU.scala 79:23]
    node _GEN_83 = mux(_T_1, UInt<1>("h0"), _GEN_67) @[CU.scala 59:39 CU.scala 80:18]
    node _GEN_84 = mux(_T_1, UInt<1>("h0"), _GEN_68) @[CU.scala 59:39 CU.scala 41:14]
    node _GEN_85 = mux(_T_1, UInt<1>("h0"), _GEN_69) @[CU.scala 59:39 CU.scala 38:15]
    node _GEN_86 = mux(_T_1, UInt<1>("h0"), _GEN_70) @[CU.scala 59:39 CU.scala 39:12]
    node _GEN_87 = mux(_T_1, UInt<1>("h0"), _GEN_71) @[CU.scala 59:39 CU.scala 40:11]
    node _GEN_88 = mux(_T, _io_RD_T, _GEN_72) @[CU.scala 43:32 CU.scala 44:10]
    node _GEN_89 = mux(_T, _io_func_T, _GEN_73) @[CU.scala 43:32 CU.scala 45:13]
    node _GEN_90 = mux(_T, _io_Rs1_T, _GEN_74) @[CU.scala 43:32 CU.scala 46:12]
    node _GEN_91 = mux(_T, _io_Rs2_T, _GEN_75) @[CU.scala 43:32 CU.scala 47:12]
    node _GEN_92 = mux(_T, UInt<1>("h0"), _GEN_76) @[CU.scala 43:32 CU.scala 48:12]
    node _GEN_93 = mux(_T, UInt<1>("h1"), _GEN_77) @[CU.scala 43:32 CU.scala 49:17]
    node _GEN_94 = mux(_T, UInt<1>("h0"), _GEN_78) @[CU.scala 43:32 CU.scala 50:17]
    node _GEN_95 = mux(_T, UInt<1>("h0"), _GEN_81) @[CU.scala 43:32 CU.scala 51:18]
    node _GEN_96 = mux(_T, UInt<1>("h1"), _GEN_79) @[CU.scala 43:32 CU.scala 52:16]
    node _GEN_97 = mux(_T, UInt<1>("h1"), _GEN_80) @[CU.scala 43:32 CU.scala 53:17]
    node _GEN_98 = mux(_T, UInt<1>("h0"), _GEN_82) @[CU.scala 43:32 CU.scala 54:21]
    node _GEN_99 = mux(_T, UInt<1>("h0"), _GEN_83) @[CU.scala 43:32 CU.scala 55:16]
    node _GEN_100 = mux(_T, UInt<1>("h0"), _GEN_84) @[CU.scala 43:32 CU.scala 41:14]
    node _GEN_101 = mux(_T, UInt<1>("h0"), _GEN_85) @[CU.scala 43:32 CU.scala 38:15]
    node _GEN_102 = mux(_T, UInt<1>("h0"), _GEN_86) @[CU.scala 43:32 CU.scala 39:12]
    node _GEN_103 = mux(_T, UInt<1>("h0"), _GEN_87) @[CU.scala 43:32 CU.scala 40:11]
    io_RD <= _GEN_88
    io_Rs1 <= _GEN_90
    io_Rs2 <= _GEN_91
    io_Imm <= _GEN_92
    io_Instype <= _GEN_96
    io_RegWrite <= _GEN_93
    io_MemWrite <= _GEN_94
    io_func <= _GEN_89
    io_wbselect <= _GEN_97
    io_aluselect <= _GEN_95
    io_lengthselect <= bits(_GEN_98, 1, 0)
    io_btypefun <= _GEN_101
    io_pcselec <= _GEN_99
    io_btype <= _GEN_102
    io_jump <= _GEN_103
    io_readmem <= _GEN_100

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

    reg regFile_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_0) @[RegisterFile.scala 15:21]
    reg regFile_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_1) @[RegisterFile.scala 15:21]
    reg regFile_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_2) @[RegisterFile.scala 15:21]
    reg regFile_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_3) @[RegisterFile.scala 15:21]
    reg regFile_4 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_4) @[RegisterFile.scala 15:21]
    reg regFile_5 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_5) @[RegisterFile.scala 15:21]
    reg regFile_6 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_6) @[RegisterFile.scala 15:21]
    reg regFile_7 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_7) @[RegisterFile.scala 15:21]
    reg regFile_8 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_8) @[RegisterFile.scala 15:21]
    reg regFile_9 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_9) @[RegisterFile.scala 15:21]
    reg regFile_10 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_10) @[RegisterFile.scala 15:21]
    reg regFile_11 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_11) @[RegisterFile.scala 15:21]
    reg regFile_12 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_12) @[RegisterFile.scala 15:21]
    reg regFile_13 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_13) @[RegisterFile.scala 15:21]
    reg regFile_14 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_14) @[RegisterFile.scala 15:21]
    reg regFile_15 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_15) @[RegisterFile.scala 15:21]
    reg regFile_16 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_16) @[RegisterFile.scala 15:21]
    reg regFile_17 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_17) @[RegisterFile.scala 15:21]
    reg regFile_18 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_18) @[RegisterFile.scala 15:21]
    reg regFile_19 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_19) @[RegisterFile.scala 15:21]
    reg regFile_20 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_20) @[RegisterFile.scala 15:21]
    reg regFile_21 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_21) @[RegisterFile.scala 15:21]
    reg regFile_22 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_22) @[RegisterFile.scala 15:21]
    reg regFile_23 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_23) @[RegisterFile.scala 15:21]
    reg regFile_24 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_24) @[RegisterFile.scala 15:21]
    reg regFile_25 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_25) @[RegisterFile.scala 15:21]
    reg regFile_26 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_26) @[RegisterFile.scala 15:21]
    reg regFile_27 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_27) @[RegisterFile.scala 15:21]
    reg regFile_28 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_28) @[RegisterFile.scala 15:21]
    reg regFile_29 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_29) @[RegisterFile.scala 15:21]
    reg regFile_30 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_30) @[RegisterFile.scala 15:21]
    reg regFile_31 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), regFile_31) @[RegisterFile.scala 15:21]
    node _T = neq(io_RD, UInt<1>("h0")) @[RegisterFile.scala 23:25]
    node _T_1 = and(io_Wen, _T) @[RegisterFile.scala 23:15]
    node _regFile_io_RD = io_datain @[RegisterFile.scala 24:20 RegisterFile.scala 24:20]
    node _GEN_0 = mux(eq(UInt<1>("h0"), io_RD), _regFile_io_RD, UInt<1>("h0")) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 20:14]
    node _GEN_1 = mux(eq(UInt<1>("h1"), io_RD), _regFile_io_RD, regFile_1) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_2 = mux(eq(UInt<2>("h2"), io_RD), _regFile_io_RD, regFile_2) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_3 = mux(eq(UInt<2>("h3"), io_RD), _regFile_io_RD, regFile_3) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_4 = mux(eq(UInt<3>("h4"), io_RD), _regFile_io_RD, regFile_4) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_5 = mux(eq(UInt<3>("h5"), io_RD), _regFile_io_RD, regFile_5) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_6 = mux(eq(UInt<3>("h6"), io_RD), _regFile_io_RD, regFile_6) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_7 = mux(eq(UInt<3>("h7"), io_RD), _regFile_io_RD, regFile_7) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_8 = mux(eq(UInt<4>("h8"), io_RD), _regFile_io_RD, regFile_8) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_9 = mux(eq(UInt<4>("h9"), io_RD), _regFile_io_RD, regFile_9) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_10 = mux(eq(UInt<4>("ha"), io_RD), _regFile_io_RD, regFile_10) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_11 = mux(eq(UInt<4>("hb"), io_RD), _regFile_io_RD, regFile_11) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_12 = mux(eq(UInt<4>("hc"), io_RD), _regFile_io_RD, regFile_12) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_13 = mux(eq(UInt<4>("hd"), io_RD), _regFile_io_RD, regFile_13) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_14 = mux(eq(UInt<4>("he"), io_RD), _regFile_io_RD, regFile_14) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_15 = mux(eq(UInt<4>("hf"), io_RD), _regFile_io_RD, regFile_15) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_16 = mux(eq(UInt<5>("h10"), io_RD), _regFile_io_RD, regFile_16) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_17 = mux(eq(UInt<5>("h11"), io_RD), _regFile_io_RD, regFile_17) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_18 = mux(eq(UInt<5>("h12"), io_RD), _regFile_io_RD, regFile_18) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_19 = mux(eq(UInt<5>("h13"), io_RD), _regFile_io_RD, regFile_19) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_20 = mux(eq(UInt<5>("h14"), io_RD), _regFile_io_RD, regFile_20) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_21 = mux(eq(UInt<5>("h15"), io_RD), _regFile_io_RD, regFile_21) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_22 = mux(eq(UInt<5>("h16"), io_RD), _regFile_io_RD, regFile_22) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_23 = mux(eq(UInt<5>("h17"), io_RD), _regFile_io_RD, regFile_23) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_24 = mux(eq(UInt<5>("h18"), io_RD), _regFile_io_RD, regFile_24) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_25 = mux(eq(UInt<5>("h19"), io_RD), _regFile_io_RD, regFile_25) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_26 = mux(eq(UInt<5>("h1a"), io_RD), _regFile_io_RD, regFile_26) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_27 = mux(eq(UInt<5>("h1b"), io_RD), _regFile_io_RD, regFile_27) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_28 = mux(eq(UInt<5>("h1c"), io_RD), _regFile_io_RD, regFile_28) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_29 = mux(eq(UInt<5>("h1d"), io_RD), _regFile_io_RD, regFile_29) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_30 = mux(eq(UInt<5>("h1e"), io_RD), _regFile_io_RD, regFile_30) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_31 = mux(eq(UInt<5>("h1f"), io_RD), _regFile_io_RD, regFile_31) @[RegisterFile.scala 24:20 RegisterFile.scala 24:20 RegisterFile.scala 15:21]
    node _GEN_32 = validif(eq(UInt<1>("h0"), io_Rs1in), regFile_0) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_33 = mux(eq(UInt<1>("h1"), io_Rs1in), regFile_1, _GEN_32) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_34 = mux(eq(UInt<2>("h2"), io_Rs1in), regFile_2, _GEN_33) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_35 = mux(eq(UInt<2>("h3"), io_Rs1in), regFile_3, _GEN_34) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_36 = mux(eq(UInt<3>("h4"), io_Rs1in), regFile_4, _GEN_35) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_37 = mux(eq(UInt<3>("h5"), io_Rs1in), regFile_5, _GEN_36) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_38 = mux(eq(UInt<3>("h6"), io_Rs1in), regFile_6, _GEN_37) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_39 = mux(eq(UInt<3>("h7"), io_Rs1in), regFile_7, _GEN_38) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_40 = mux(eq(UInt<4>("h8"), io_Rs1in), regFile_8, _GEN_39) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_41 = mux(eq(UInt<4>("h9"), io_Rs1in), regFile_9, _GEN_40) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_42 = mux(eq(UInt<4>("ha"), io_Rs1in), regFile_10, _GEN_41) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_43 = mux(eq(UInt<4>("hb"), io_Rs1in), regFile_11, _GEN_42) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_44 = mux(eq(UInt<4>("hc"), io_Rs1in), regFile_12, _GEN_43) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_45 = mux(eq(UInt<4>("hd"), io_Rs1in), regFile_13, _GEN_44) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_46 = mux(eq(UInt<4>("he"), io_Rs1in), regFile_14, _GEN_45) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_47 = mux(eq(UInt<4>("hf"), io_Rs1in), regFile_15, _GEN_46) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_48 = mux(eq(UInt<5>("h10"), io_Rs1in), regFile_16, _GEN_47) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_49 = mux(eq(UInt<5>("h11"), io_Rs1in), regFile_17, _GEN_48) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_50 = mux(eq(UInt<5>("h12"), io_Rs1in), regFile_18, _GEN_49) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_51 = mux(eq(UInt<5>("h13"), io_Rs1in), regFile_19, _GEN_50) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_52 = mux(eq(UInt<5>("h14"), io_Rs1in), regFile_20, _GEN_51) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_53 = mux(eq(UInt<5>("h15"), io_Rs1in), regFile_21, _GEN_52) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_54 = mux(eq(UInt<5>("h16"), io_Rs1in), regFile_22, _GEN_53) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_55 = mux(eq(UInt<5>("h17"), io_Rs1in), regFile_23, _GEN_54) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_56 = mux(eq(UInt<5>("h18"), io_Rs1in), regFile_24, _GEN_55) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_57 = mux(eq(UInt<5>("h19"), io_Rs1in), regFile_25, _GEN_56) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_58 = mux(eq(UInt<5>("h1a"), io_Rs1in), regFile_26, _GEN_57) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_59 = mux(eq(UInt<5>("h1b"), io_Rs1in), regFile_27, _GEN_58) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_60 = mux(eq(UInt<5>("h1c"), io_Rs1in), regFile_28, _GEN_59) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_61 = mux(eq(UInt<5>("h1d"), io_Rs1in), regFile_29, _GEN_60) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_62 = mux(eq(UInt<5>("h1e"), io_Rs1in), regFile_30, _GEN_61) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_63 = mux(eq(UInt<5>("h1f"), io_Rs1in), regFile_31, _GEN_62) @[RegisterFile.scala 25:15 RegisterFile.scala 25:15]
    node _GEN_64 = validif(eq(UInt<1>("h0"), io_Rs2in), regFile_0) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_65 = mux(eq(UInt<1>("h1"), io_Rs2in), regFile_1, _GEN_64) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_66 = mux(eq(UInt<2>("h2"), io_Rs2in), regFile_2, _GEN_65) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_67 = mux(eq(UInt<2>("h3"), io_Rs2in), regFile_3, _GEN_66) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_68 = mux(eq(UInt<3>("h4"), io_Rs2in), regFile_4, _GEN_67) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_69 = mux(eq(UInt<3>("h5"), io_Rs2in), regFile_5, _GEN_68) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_70 = mux(eq(UInt<3>("h6"), io_Rs2in), regFile_6, _GEN_69) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_71 = mux(eq(UInt<3>("h7"), io_Rs2in), regFile_7, _GEN_70) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_72 = mux(eq(UInt<4>("h8"), io_Rs2in), regFile_8, _GEN_71) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_73 = mux(eq(UInt<4>("h9"), io_Rs2in), regFile_9, _GEN_72) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_74 = mux(eq(UInt<4>("ha"), io_Rs2in), regFile_10, _GEN_73) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_75 = mux(eq(UInt<4>("hb"), io_Rs2in), regFile_11, _GEN_74) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_76 = mux(eq(UInt<4>("hc"), io_Rs2in), regFile_12, _GEN_75) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_77 = mux(eq(UInt<4>("hd"), io_Rs2in), regFile_13, _GEN_76) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_78 = mux(eq(UInt<4>("he"), io_Rs2in), regFile_14, _GEN_77) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_79 = mux(eq(UInt<4>("hf"), io_Rs2in), regFile_15, _GEN_78) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_80 = mux(eq(UInt<5>("h10"), io_Rs2in), regFile_16, _GEN_79) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_81 = mux(eq(UInt<5>("h11"), io_Rs2in), regFile_17, _GEN_80) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_82 = mux(eq(UInt<5>("h12"), io_Rs2in), regFile_18, _GEN_81) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_83 = mux(eq(UInt<5>("h13"), io_Rs2in), regFile_19, _GEN_82) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_84 = mux(eq(UInt<5>("h14"), io_Rs2in), regFile_20, _GEN_83) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_85 = mux(eq(UInt<5>("h15"), io_Rs2in), regFile_21, _GEN_84) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_86 = mux(eq(UInt<5>("h16"), io_Rs2in), regFile_22, _GEN_85) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_87 = mux(eq(UInt<5>("h17"), io_Rs2in), regFile_23, _GEN_86) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_88 = mux(eq(UInt<5>("h18"), io_Rs2in), regFile_24, _GEN_87) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_89 = mux(eq(UInt<5>("h19"), io_Rs2in), regFile_25, _GEN_88) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_90 = mux(eq(UInt<5>("h1a"), io_Rs2in), regFile_26, _GEN_89) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_91 = mux(eq(UInt<5>("h1b"), io_Rs2in), regFile_27, _GEN_90) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_92 = mux(eq(UInt<5>("h1c"), io_Rs2in), regFile_28, _GEN_91) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_93 = mux(eq(UInt<5>("h1d"), io_Rs2in), regFile_29, _GEN_92) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_94 = mux(eq(UInt<5>("h1e"), io_Rs2in), regFile_30, _GEN_93) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_95 = mux(eq(UInt<5>("h1f"), io_Rs2in), regFile_31, _GEN_94) @[RegisterFile.scala 26:15 RegisterFile.scala 26:15]
    node _GEN_96 = mux(_T_1, _GEN_0, UInt<1>("h0")) @[RegisterFile.scala 23:34 RegisterFile.scala 20:14]
    node _GEN_97 = mux(_T_1, _GEN_1, regFile_1) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_98 = mux(_T_1, _GEN_2, regFile_2) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_99 = mux(_T_1, _GEN_3, regFile_3) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_100 = mux(_T_1, _GEN_4, regFile_4) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_101 = mux(_T_1, _GEN_5, regFile_5) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_102 = mux(_T_1, _GEN_6, regFile_6) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_103 = mux(_T_1, _GEN_7, regFile_7) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_104 = mux(_T_1, _GEN_8, regFile_8) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_105 = mux(_T_1, _GEN_9, regFile_9) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_106 = mux(_T_1, _GEN_10, regFile_10) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_107 = mux(_T_1, _GEN_11, regFile_11) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_108 = mux(_T_1, _GEN_12, regFile_12) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_109 = mux(_T_1, _GEN_13, regFile_13) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_110 = mux(_T_1, _GEN_14, regFile_14) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_111 = mux(_T_1, _GEN_15, regFile_15) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_112 = mux(_T_1, _GEN_16, regFile_16) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_113 = mux(_T_1, _GEN_17, regFile_17) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_114 = mux(_T_1, _GEN_18, regFile_18) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_115 = mux(_T_1, _GEN_19, regFile_19) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_116 = mux(_T_1, _GEN_20, regFile_20) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_117 = mux(_T_1, _GEN_21, regFile_21) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_118 = mux(_T_1, _GEN_22, regFile_22) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_119 = mux(_T_1, _GEN_23, regFile_23) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_120 = mux(_T_1, _GEN_24, regFile_24) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_121 = mux(_T_1, _GEN_25, regFile_25) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_122 = mux(_T_1, _GEN_26, regFile_26) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_123 = mux(_T_1, _GEN_27, regFile_27) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_124 = mux(_T_1, _GEN_28, regFile_28) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_125 = mux(_T_1, _GEN_29, regFile_29) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_126 = mux(_T_1, _GEN_30, regFile_30) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _GEN_127 = mux(_T_1, _GEN_31, regFile_31) @[RegisterFile.scala 23:34 RegisterFile.scala 15:21]
    node _regFile_io_Rs1in = _GEN_63 @[RegisterFile.scala 25:15]
    node _regFile_io_Rs1in_0 = _GEN_63 @[RegisterFile.scala 29:17]
    node _GEN_128 = mux(_T_1, _regFile_io_Rs1in, _regFile_io_Rs1in_0) @[RegisterFile.scala 23:34 RegisterFile.scala 25:15 RegisterFile.scala 29:17]
    node _regFile_io_Rs2in = _GEN_95 @[RegisterFile.scala 26:15]
    node _regFile_io_Rs2in_0 = _GEN_95 @[RegisterFile.scala 30:17]
    node _GEN_129 = mux(_T_1, _regFile_io_Rs2in, _regFile_io_Rs2in_0) @[RegisterFile.scala 23:34 RegisterFile.scala 26:15 RegisterFile.scala 30:17]
    io_Rs1out <= _GEN_128
    io_Rs2out <= _GEN_129
    regFile_0 <= _GEN_96
    regFile_1 <= _GEN_97
    regFile_2 <= _GEN_98
    regFile_3 <= _GEN_99
    regFile_4 <= _GEN_100
    regFile_5 <= _GEN_101
    regFile_6 <= _GEN_102
    regFile_7 <= _GEN_103
    regFile_8 <= _GEN_104
    regFile_9 <= _GEN_105
    regFile_10 <= _GEN_106
    regFile_11 <= _GEN_107
    regFile_12 <= _GEN_108
    regFile_13 <= _GEN_109
    regFile_14 <= _GEN_110
    regFile_15 <= _GEN_111
    regFile_16 <= _GEN_112
    regFile_17 <= _GEN_113
    regFile_18 <= _GEN_114
    regFile_19 <= _GEN_115
    regFile_20 <= _GEN_116
    regFile_21 <= _GEN_117
    regFile_22 <= _GEN_118
    regFile_23 <= _GEN_119
    regFile_24 <= _GEN_120
    regFile_25 <= _GEN_121
    regFile_26 <= _GEN_122
    regFile_27 <= _GEN_123
    regFile_28 <= _GEN_124
    regFile_29 <= _GEN_125
    regFile_30 <= _GEN_126
    regFile_31 <= _GEN_127

  module InstMem :
    input clock : Clock
    input reset : UInt<1>
    input io_addr : UInt<32>
    output io_inst : UInt<32>

    mem imem : @[InsMem.scala 14:18]
      data-type => UInt<32>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => io_inst_MPORT
      read-under-write => undefined
    node _io_inst_T = shr(io_addr, 2) @[InsMem.scala 16:32]
    node _io_inst_T_1 = bits(_io_inst_T, 9, 0) @[InsMem.scala 16:21]
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
    input io_fun3 : UInt<3>
    input io_enable : UInt<1>

    mem memory_0 : @[Datamem.scala 15:19]
      data-type => UInt<8>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => MPORT_1
      writer => MPORT
      read-under-write => undefined
    mem memory_1 : @[Datamem.scala 15:19]
      data-type => UInt<8>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => MPORT_1
      writer => MPORT
      read-under-write => undefined
    mem memory_2 : @[Datamem.scala 15:19]
      data-type => UInt<8>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => MPORT_1
      writer => MPORT
      read-under-write => undefined
    mem memory_3 : @[Datamem.scala 15:19]
      data-type => UInt<8>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => MPORT_1
      writer => MPORT
      read-under-write => undefined
    node _tempstore_0_T = bits(io_datain, 7, 0) @[Datamem.scala 22:28]
    node _tempstore_1_T = bits(io_datain, 15, 8) @[Datamem.scala 23:28]
    node _tempstore_2_T = bits(io_datain, 23, 16) @[Datamem.scala 24:28]
    node _tempstore_3_T = bits(io_datain, 31, 24) @[Datamem.scala 25:28]
    node _T = eq(io_fun3, UInt<1>("h0")) @[Datamem.scala 38:18]
    node _T_1 = bits(io_addr, 1, 0) @[Datamem.scala 39:19]
    node _T_2 = eq(_T_1, UInt<1>("h0")) @[Datamem.scala 39:26]
    node _T_3 = bits(io_addr, 1, 0) @[Datamem.scala 44:25]
    node _T_4 = eq(_T_3, UInt<1>("h1")) @[Datamem.scala 44:32]
    node _tempstore_1_T_1 = bits(io_datain, 7, 0) @[Datamem.scala 50:34]
    node _T_5 = bits(io_addr, 1, 0) @[Datamem.scala 53:25]
    node _T_6 = eq(_T_5, UInt<2>("h2")) @[Datamem.scala 53:32]
    node _tempstore_2_T_1 = bits(io_datain, 7, 0) @[Datamem.scala 59:34]
    node _T_7 = bits(io_addr, 1, 0) @[Datamem.scala 62:25]
    node _T_8 = eq(_T_7, UInt<2>("h3")) @[Datamem.scala 62:32]
    node _tempstore_3_T_1 = bits(io_datain, 7, 0) @[Datamem.scala 68:34]
    node _GEN_0 = mux(_T_8, UInt<1>("h0"), UInt<1>("h0")) @[Datamem.scala 62:41 Datamem.scala 63:17 Datamem.scala 32:11]
    node _GEN_1 = mux(_T_8, UInt<1>("h1"), UInt<1>("h0")) @[Datamem.scala 62:41 Datamem.scala 66:17 Datamem.scala 35:11]
    node _GEN_2 = mux(_T_8, _tempstore_3_T_1, _tempstore_3_T) @[Datamem.scala 62:41 Datamem.scala 68:22 Datamem.scala 25:16]
    node _GEN_3 = mux(_T_6, UInt<1>("h0"), _GEN_0) @[Datamem.scala 53:41 Datamem.scala 54:17]
    node _GEN_4 = mux(_T_6, UInt<1>("h1"), _GEN_0) @[Datamem.scala 53:41 Datamem.scala 56:17]
    node _GEN_5 = mux(_T_6, UInt<1>("h0"), _GEN_1) @[Datamem.scala 53:41 Datamem.scala 57:17]
    node _GEN_6 = mux(_T_6, _tempstore_2_T_1, _tempstore_2_T) @[Datamem.scala 53:41 Datamem.scala 59:22 Datamem.scala 24:16]
    node _GEN_7 = mux(_T_6, _tempstore_3_T, _GEN_2) @[Datamem.scala 53:41 Datamem.scala 25:16]
    node _GEN_8 = mux(_T_4, UInt<1>("h0"), _GEN_3) @[Datamem.scala 44:41 Datamem.scala 45:17]
    node _GEN_9 = mux(_T_4, UInt<1>("h1"), _GEN_3) @[Datamem.scala 44:41 Datamem.scala 46:17]
    node _GEN_10 = mux(_T_4, UInt<1>("h0"), _GEN_4) @[Datamem.scala 44:41 Datamem.scala 47:17]
    node _GEN_11 = mux(_T_4, UInt<1>("h0"), _GEN_5) @[Datamem.scala 44:41 Datamem.scala 48:17]
    node _GEN_12 = mux(_T_4, _tempstore_1_T_1, _tempstore_1_T) @[Datamem.scala 44:41 Datamem.scala 50:22 Datamem.scala 23:16]
    node _GEN_13 = mux(_T_4, _tempstore_2_T, _GEN_6) @[Datamem.scala 44:41 Datamem.scala 24:16]
    node _GEN_14 = mux(_T_4, _tempstore_3_T, _GEN_7) @[Datamem.scala 44:41 Datamem.scala 25:16]
    node _GEN_15 = mux(_T_2, UInt<1>("h1"), _GEN_8) @[Datamem.scala 39:35 Datamem.scala 40:17]
    node _GEN_16 = mux(_T_2, UInt<1>("h0"), _GEN_9) @[Datamem.scala 39:35 Datamem.scala 41:17]
    node _GEN_17 = mux(_T_2, UInt<1>("h0"), _GEN_10) @[Datamem.scala 39:35 Datamem.scala 42:17]
    node _GEN_18 = mux(_T_2, UInt<1>("h0"), _GEN_11) @[Datamem.scala 39:35 Datamem.scala 43:17]
    node _GEN_19 = mux(_T_2, _tempstore_1_T, _GEN_12) @[Datamem.scala 39:35 Datamem.scala 23:16]
    node _GEN_20 = mux(_T_2, _tempstore_2_T, _GEN_13) @[Datamem.scala 39:35 Datamem.scala 24:16]
    node _GEN_21 = mux(_T_2, _tempstore_3_T, _GEN_14) @[Datamem.scala 39:35 Datamem.scala 25:16]
    node _T_9 = eq(io_fun3, UInt<1>("h1")) @[Datamem.scala 72:25]
    node _T_10 = bits(io_addr, 1, 0) @[Datamem.scala 73:21]
    node _T_11 = eq(_T_10, UInt<1>("h0")) @[Datamem.scala 73:28]
    node _T_12 = bits(io_addr, 1, 0) @[Datamem.scala 79:27]
    node _T_13 = eq(_T_12, UInt<1>("h1")) @[Datamem.scala 79:34]
    node _tempstore_1_T_2 = bits(io_datain, 7, 0) @[Datamem.scala 85:36]
    node _tempstore_2_T_2 = bits(io_datain, 15, 8) @[Datamem.scala 86:36]
    node _T_14 = bits(io_addr, 1, 0) @[Datamem.scala 89:27]
    node _T_15 = eq(_T_14, UInt<2>("h2")) @[Datamem.scala 89:34]
    node _tempstore_2_T_3 = bits(io_datain, 7, 0) @[Datamem.scala 95:36]
    node _tempstore_3_T_2 = bits(io_datain, 15, 8) @[Datamem.scala 96:36]
    node _T_16 = bits(io_addr, 1, 0) @[Datamem.scala 99:27]
    node _T_17 = eq(_T_16, UInt<2>("h3")) @[Datamem.scala 99:34]
    node _tempstore_3_T_3 = bits(io_datain, 7, 0) @[Datamem.scala 105:36]
    node _GEN_22 = mux(_T_17, UInt<1>("h0"), UInt<1>("h0")) @[Datamem.scala 99:43 Datamem.scala 100:19 Datamem.scala 32:11]
    node _GEN_23 = mux(_T_17, UInt<1>("h1"), UInt<1>("h0")) @[Datamem.scala 99:43 Datamem.scala 103:19 Datamem.scala 35:11]
    node _GEN_24 = mux(_T_17, _tempstore_3_T_3, _tempstore_3_T) @[Datamem.scala 99:43 Datamem.scala 105:24 Datamem.scala 25:16]
    node _GEN_25 = mux(_T_15, UInt<1>("h0"), _GEN_22) @[Datamem.scala 89:43 Datamem.scala 90:19]
    node _GEN_26 = mux(_T_15, UInt<1>("h1"), _GEN_22) @[Datamem.scala 89:43 Datamem.scala 92:19]
    node _GEN_27 = mux(_T_15, UInt<1>("h1"), _GEN_23) @[Datamem.scala 89:43 Datamem.scala 93:19]
    node _GEN_28 = mux(_T_15, _tempstore_2_T_3, _tempstore_2_T) @[Datamem.scala 89:43 Datamem.scala 95:24 Datamem.scala 24:16]
    node _GEN_29 = mux(_T_15, _tempstore_3_T_2, _GEN_24) @[Datamem.scala 89:43 Datamem.scala 96:24]
    node _GEN_30 = mux(_T_13, UInt<1>("h0"), _GEN_25) @[Datamem.scala 79:43 Datamem.scala 80:19]
    node _GEN_31 = mux(_T_13, UInt<1>("h1"), _GEN_25) @[Datamem.scala 79:43 Datamem.scala 81:19]
    node _GEN_32 = mux(_T_13, UInt<1>("h1"), _GEN_26) @[Datamem.scala 79:43 Datamem.scala 82:19]
    node _GEN_33 = mux(_T_13, UInt<1>("h0"), _GEN_27) @[Datamem.scala 79:43 Datamem.scala 83:19]
    node _GEN_34 = mux(_T_13, _tempstore_1_T_2, _tempstore_1_T) @[Datamem.scala 79:43 Datamem.scala 85:24 Datamem.scala 23:16]
    node _GEN_35 = mux(_T_13, _tempstore_2_T_2, _GEN_28) @[Datamem.scala 79:43 Datamem.scala 86:24]
    node _GEN_36 = mux(_T_13, _tempstore_3_T, _GEN_29) @[Datamem.scala 79:43 Datamem.scala 25:16]
    node _GEN_37 = mux(_T_11, UInt<1>("h1"), _GEN_30) @[Datamem.scala 73:37 Datamem.scala 74:19]
    node _GEN_38 = mux(_T_11, UInt<1>("h1"), _GEN_31) @[Datamem.scala 73:37 Datamem.scala 75:19]
    node _GEN_39 = mux(_T_11, UInt<1>("h0"), _GEN_32) @[Datamem.scala 73:37 Datamem.scala 76:19]
    node _GEN_40 = mux(_T_11, UInt<1>("h0"), _GEN_33) @[Datamem.scala 73:37 Datamem.scala 77:19]
    node _GEN_41 = mux(_T_11, _tempstore_1_T, _GEN_34) @[Datamem.scala 73:37 Datamem.scala 23:16]
    node _GEN_42 = mux(_T_11, _tempstore_2_T, _GEN_35) @[Datamem.scala 73:37 Datamem.scala 24:16]
    node _GEN_43 = mux(_T_11, _tempstore_3_T, _GEN_36) @[Datamem.scala 73:37 Datamem.scala 25:16]
    node _T_18 = eq(io_fun3, UInt<2>("h2")) @[Datamem.scala 109:25]
    node _GEN_44 = mux(_T_18, UInt<1>("h1"), UInt<1>("h0")) @[Datamem.scala 109:34 Datamem.scala 110:17 Datamem.scala 32:11]
    node _GEN_45 = mux(_T_9, _GEN_37, _GEN_44) @[Datamem.scala 72:34]
    node _GEN_46 = mux(_T_9, _GEN_38, _GEN_44) @[Datamem.scala 72:34]
    node _GEN_47 = mux(_T_9, _GEN_39, _GEN_44) @[Datamem.scala 72:34]
    node _GEN_48 = mux(_T_9, _GEN_40, _GEN_44) @[Datamem.scala 72:34]
    node _GEN_49 = mux(_T_9, _GEN_41, _tempstore_1_T) @[Datamem.scala 72:34 Datamem.scala 23:16]
    node _GEN_50 = mux(_T_9, _GEN_42, _tempstore_2_T) @[Datamem.scala 72:34 Datamem.scala 24:16]
    node _GEN_51 = mux(_T_9, _GEN_43, _tempstore_3_T) @[Datamem.scala 72:34 Datamem.scala 25:16]
    node _GEN_52 = mux(_T, _GEN_15, _GEN_45) @[Datamem.scala 38:27]
    node _GEN_53 = mux(_T, _GEN_16, _GEN_46) @[Datamem.scala 38:27]
    node _GEN_54 = mux(_T, _GEN_17, _GEN_47) @[Datamem.scala 38:27]
    node _GEN_55 = mux(_T, _GEN_18, _GEN_48) @[Datamem.scala 38:27]
    node _GEN_56 = mux(_T, _GEN_19, _GEN_49) @[Datamem.scala 38:27]
    node _GEN_57 = mux(_T, _GEN_20, _GEN_50) @[Datamem.scala 38:27]
    node _GEN_58 = mux(_T, _GEN_21, _GEN_51) @[Datamem.scala 38:27]
    node _T_19 = bits(io_addr, 31, 2) @[Datamem.scala 117:25]
    node _T_20 = bits(_T_19, 9, 0)
    node _GEN_67 = mux(io_Wen, _GEN_52, UInt<1>("h0")) @[Datamem.scala 37:16 Datamem.scala 32:11]
    node mask_0 = _GEN_67 @[Datamem.scala 16:18]
    node tempstore_0 = _tempstore_0_T @[Datamem.scala 17:23 Datamem.scala 22:16]
    node _GEN_59 = validif(mask_0, tempstore_0)
    node _GEN_60 = mux(mask_0, UInt<1>("h1"), UInt<1>("h0"))
    node _GEN_68 = mux(io_Wen, _GEN_53, UInt<1>("h0")) @[Datamem.scala 37:16 Datamem.scala 33:11]
    node mask_1 = _GEN_68 @[Datamem.scala 16:18]
    node _GEN_71 = mux(io_Wen, _GEN_56, _tempstore_1_T) @[Datamem.scala 37:16 Datamem.scala 23:16]
    node tempstore_1 = _GEN_71 @[Datamem.scala 17:23]
    node _GEN_61 = validif(mask_1, tempstore_1)
    node _GEN_62 = mux(mask_1, UInt<1>("h1"), UInt<1>("h0"))
    node _GEN_69 = mux(io_Wen, _GEN_54, UInt<1>("h0")) @[Datamem.scala 37:16 Datamem.scala 34:11]
    node mask_2 = _GEN_69 @[Datamem.scala 16:18]
    node _GEN_72 = mux(io_Wen, _GEN_57, _tempstore_2_T) @[Datamem.scala 37:16 Datamem.scala 24:16]
    node tempstore_2 = _GEN_72 @[Datamem.scala 17:23]
    node _GEN_63 = validif(mask_2, tempstore_2)
    node _GEN_64 = mux(mask_2, UInt<1>("h1"), UInt<1>("h0"))
    node _GEN_70 = mux(io_Wen, _GEN_55, UInt<1>("h0")) @[Datamem.scala 37:16 Datamem.scala 35:11]
    node mask_3 = _GEN_70 @[Datamem.scala 16:18]
    node _GEN_73 = mux(io_Wen, _GEN_58, _tempstore_3_T) @[Datamem.scala 37:16 Datamem.scala 25:16]
    node tempstore_3 = _GEN_73 @[Datamem.scala 17:23]
    node _GEN_65 = validif(mask_3, tempstore_3)
    node _GEN_66 = mux(mask_3, UInt<1>("h1"), UInt<1>("h0"))
    node _GEN_74 = validif(io_Wen, _T_20) @[Datamem.scala 37:16]
    node _GEN_75 = validif(io_Wen, clock) @[Datamem.scala 37:16]
    node _GEN_76 = mux(io_Wen, UInt<1>("h1"), UInt<1>("h0")) @[Datamem.scala 37:16 Datamem.scala 15:19]
    node _GEN_77 = validif(io_Wen, _GEN_60) @[Datamem.scala 37:16]
    node _GEN_78 = validif(io_Wen, _GEN_62) @[Datamem.scala 37:16]
    node _GEN_79 = validif(io_Wen, _GEN_64) @[Datamem.scala 37:16]
    node _GEN_80 = validif(io_Wen, _GEN_66) @[Datamem.scala 37:16]
    node _GEN_81 = validif(io_Wen, _GEN_59) @[Datamem.scala 37:16]
    node _GEN_82 = validif(io_Wen, _GEN_61) @[Datamem.scala 37:16]
    node _GEN_83 = validif(io_Wen, _GEN_63) @[Datamem.scala 37:16]
    node _GEN_84 = validif(io_Wen, _GEN_65) @[Datamem.scala 37:16]
    node _T_21 = bits(io_addr, 31, 2) @[Datamem.scala 123:34]
    node _T_22 = bits(_T_21, 9, 0) @[Datamem.scala 123:26]
    node _T_23 = eq(io_fun3, UInt<1>("h0")) @[Datamem.scala 124:16]
    node _T_24 = bits(io_addr, 1, 0) @[Datamem.scala 125:17]
    node _T_25 = eq(_T_24, UInt<1>("h0")) @[Datamem.scala 125:23]
    node _GEN_99 = mux(io_enable, memory_0.MPORT_1.data, UInt<1>("h0")) @[Datamem.scala 122:18 Datamem.scala 123:12 Datamem.scala 27:15]
    node tempread_0 = _GEN_99 @[Datamem.scala 18:22]
    node _io_dataout_T = bits(tempread_0, 7, 7) @[Datamem.scala 126:42]
    node _io_dataout_T_1 = bits(_io_dataout_T, 0, 0) @[Bitwise.scala 72:15]
    node io_dataout_hi = mux(_io_dataout_T_1, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node _io_dataout_T_2 = cat(io_dataout_hi, tempread_0) @[Cat.scala 30:58]
    node _T_26 = bits(io_addr, 1, 0) @[Datamem.scala 127:22]
    node _T_27 = eq(_T_26, UInt<1>("h1")) @[Datamem.scala 127:27]
    node _GEN_100 = mux(io_enable, memory_1.MPORT_1.data, UInt<1>("h0")) @[Datamem.scala 122:18 Datamem.scala 123:12 Datamem.scala 28:15]
    node tempread_1 = _GEN_100 @[Datamem.scala 18:22]
    node _io_dataout_T_3 = bits(tempread_1, 7, 7) @[Datamem.scala 128:42]
    node _io_dataout_T_4 = bits(_io_dataout_T_3, 0, 0) @[Bitwise.scala 72:15]
    node io_dataout_hi_1 = mux(_io_dataout_T_4, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node _io_dataout_T_5 = cat(io_dataout_hi_1, tempread_1) @[Cat.scala 30:58]
    node _T_28 = bits(io_addr, 1, 0) @[Datamem.scala 129:22]
    node _T_29 = eq(_T_28, UInt<2>("h2")) @[Datamem.scala 129:27]
    node _GEN_101 = mux(io_enable, memory_2.MPORT_1.data, UInt<1>("h0")) @[Datamem.scala 122:18 Datamem.scala 123:12 Datamem.scala 29:15]
    node tempread_2 = _GEN_101 @[Datamem.scala 18:22]
    node _io_dataout_T_6 = bits(tempread_2, 7, 7) @[Datamem.scala 130:42]
    node _io_dataout_T_7 = bits(_io_dataout_T_6, 0, 0) @[Bitwise.scala 72:15]
    node io_dataout_hi_2 = mux(_io_dataout_T_7, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node _io_dataout_T_8 = cat(io_dataout_hi_2, tempread_2) @[Cat.scala 30:58]
    node _T_30 = bits(io_addr, 1, 0) @[Datamem.scala 131:22]
    node _T_31 = eq(_T_30, UInt<2>("h3")) @[Datamem.scala 131:27]
    node _GEN_102 = mux(io_enable, memory_3.MPORT_1.data, UInt<1>("h0")) @[Datamem.scala 122:18 Datamem.scala 123:12 Datamem.scala 30:15]
    node tempread_3 = _GEN_102 @[Datamem.scala 18:22]
    node _io_dataout_T_9 = bits(tempread_3, 7, 7) @[Datamem.scala 132:42]
    node _io_dataout_T_10 = bits(_io_dataout_T_9, 0, 0) @[Bitwise.scala 72:15]
    node io_dataout_hi_3 = mux(_io_dataout_T_10, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node _io_dataout_T_11 = cat(io_dataout_hi_3, tempread_3) @[Cat.scala 30:58]
    node _GEN_85 = mux(_T_31, _io_dataout_T_11, UInt<1>("h0")) @[Datamem.scala 131:35 Datamem.scala 132:16 Datamem.scala 20:14]
    node _GEN_86 = mux(_T_29, _io_dataout_T_8, _GEN_85) @[Datamem.scala 129:35 Datamem.scala 130:16]
    node _GEN_87 = mux(_T_27, _io_dataout_T_5, _GEN_86) @[Datamem.scala 127:35 Datamem.scala 128:16]
    node _GEN_88 = mux(_T_25, _io_dataout_T_2, _GEN_87) @[Datamem.scala 125:31 Datamem.scala 126:16]
    node _T_32 = eq(io_fun3, UInt<1>("h1")) @[Datamem.scala 134:22]
    node _T_33 = bits(io_addr, 1, 0) @[Datamem.scala 135:17]
    node _T_34 = eq(_T_33, UInt<1>("h0")) @[Datamem.scala 135:23]
    node _io_dataout_T_12 = bits(tempread_0, 7, 7) @[Datamem.scala 136:42]
    node _io_dataout_T_13 = bits(_io_dataout_T_12, 0, 0) @[Bitwise.scala 72:15]
    node io_dataout_hi_hi = mux(_io_dataout_T_13, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 72:12]
    node io_dataout_hi_4 = cat(io_dataout_hi_hi, tempread_0) @[Cat.scala 30:58]
    node _io_dataout_T_14 = cat(io_dataout_hi_4, tempread_1) @[Cat.scala 30:58]
    node _T_35 = bits(io_addr, 1, 0) @[Datamem.scala 137:22]
    node _T_36 = eq(_T_35, UInt<1>("h1")) @[Datamem.scala 137:27]
    node _io_dataout_T_15 = bits(tempread_1, 7, 7) @[Datamem.scala 138:42]
    node _io_dataout_T_16 = bits(_io_dataout_T_15, 0, 0) @[Bitwise.scala 72:15]
    node io_dataout_hi_hi_1 = mux(_io_dataout_T_16, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 72:12]
    node io_dataout_hi_5 = cat(io_dataout_hi_hi_1, tempread_1) @[Cat.scala 30:58]
    node _io_dataout_T_17 = cat(io_dataout_hi_5, tempread_2) @[Cat.scala 30:58]
    node _T_37 = bits(io_addr, 1, 0) @[Datamem.scala 139:22]
    node _T_38 = eq(_T_37, UInt<2>("h2")) @[Datamem.scala 139:27]
    node _io_dataout_T_18 = bits(tempread_2, 7, 7) @[Datamem.scala 140:42]
    node _io_dataout_T_19 = bits(_io_dataout_T_18, 0, 0) @[Bitwise.scala 72:15]
    node io_dataout_hi_hi_2 = mux(_io_dataout_T_19, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 72:12]
    node io_dataout_hi_6 = cat(io_dataout_hi_hi_2, tempread_2) @[Cat.scala 30:58]
    node _io_dataout_T_20 = cat(io_dataout_hi_6, tempread_3) @[Cat.scala 30:58]
    node _T_39 = bits(io_addr, 1, 0) @[Datamem.scala 141:22]
    node _T_40 = eq(_T_39, UInt<2>("h3")) @[Datamem.scala 141:27]
    node _io_dataout_T_21 = bits(tempread_3, 7, 7) @[Datamem.scala 142:42]
    node _io_dataout_T_22 = bits(_io_dataout_T_21, 0, 0) @[Bitwise.scala 72:15]
    node io_dataout_hi_7 = mux(_io_dataout_T_22, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node _io_dataout_T_23 = cat(io_dataout_hi_7, tempread_3) @[Cat.scala 30:58]
    node _GEN_89 = mux(_T_40, _io_dataout_T_23, UInt<1>("h0")) @[Datamem.scala 141:35 Datamem.scala 142:16 Datamem.scala 20:14]
    node _GEN_90 = mux(_T_38, _io_dataout_T_20, _GEN_89) @[Datamem.scala 139:35 Datamem.scala 140:16]
    node _GEN_91 = mux(_T_36, _io_dataout_T_17, _GEN_90) @[Datamem.scala 137:35 Datamem.scala 138:16]
    node _GEN_92 = mux(_T_34, _io_dataout_T_14, _GEN_91) @[Datamem.scala 135:31 Datamem.scala 136:16]
    node _T_41 = eq(io_fun3, UInt<2>("h2")) @[Datamem.scala 144:22]
    node io_dataout_lo = cat(tempread_1, tempread_0) @[Cat.scala 30:58]
    node io_dataout_hi_8 = cat(tempread_3, tempread_2) @[Cat.scala 30:58]
    node _io_dataout_T_24 = cat(io_dataout_hi_8, io_dataout_lo) @[Cat.scala 30:58]
    node _GEN_93 = mux(_T_41, _io_dataout_T_24, UInt<1>("h0")) @[Datamem.scala 144:31 Datamem.scala 145:16 Datamem.scala 20:14]
    node _GEN_94 = mux(_T_32, _GEN_92, _GEN_93) @[Datamem.scala 134:31]
    node _GEN_95 = mux(_T_23, _GEN_88, _GEN_94) @[Datamem.scala 124:25]
    node _GEN_96 = validif(io_enable, _T_22) @[Datamem.scala 122:18 Datamem.scala 123:26]
    node _GEN_97 = validif(io_enable, clock) @[Datamem.scala 122:18 Datamem.scala 123:26]
    node _GEN_98 = mux(io_enable, UInt<1>("h1"), UInt<1>("h0")) @[Datamem.scala 122:18 Datamem.scala 123:26 Datamem.scala 15:19]
    node _GEN_103 = mux(io_enable, _GEN_95, UInt<1>("h0")) @[Datamem.scala 122:18 Datamem.scala 20:14]
    io_dataout <= _GEN_103
    memory_0.MPORT_1.addr <= _GEN_96
    memory_1.MPORT_1.addr <= _GEN_96
    memory_2.MPORT_1.addr <= _GEN_96
    memory_3.MPORT_1.addr <= _GEN_96
    memory_0.MPORT_1.en <= _GEN_98
    memory_1.MPORT_1.en <= _GEN_98
    memory_2.MPORT_1.en <= _GEN_98
    memory_3.MPORT_1.en <= _GEN_98
    memory_0.MPORT_1.clk <= _GEN_97
    memory_1.MPORT_1.clk <= _GEN_97
    memory_2.MPORT_1.clk <= _GEN_97
    memory_3.MPORT_1.clk <= _GEN_97
    memory_0.MPORT.addr <= _GEN_74
    memory_1.MPORT.addr <= _GEN_74
    memory_2.MPORT.addr <= _GEN_74
    memory_3.MPORT.addr <= _GEN_74
    memory_0.MPORT.en <= _GEN_76
    memory_1.MPORT.en <= _GEN_76
    memory_2.MPORT.en <= _GEN_76
    memory_3.MPORT.en <= _GEN_76
    memory_0.MPORT.clk <= _GEN_75
    memory_1.MPORT.clk <= _GEN_75
    memory_2.MPORT.clk <= _GEN_75
    memory_3.MPORT.clk <= _GEN_75
    memory_0.MPORT.data <= _GEN_81
    memory_1.MPORT.data <= _GEN_82
    memory_2.MPORT.data <= _GEN_83
    memory_3.MPORT.data <= _GEN_84
    memory_0.MPORT.mask <= _GEN_77
    memory_1.MPORT.mask <= _GEN_78
    memory_2.MPORT.mask <= _GEN_79
    memory_3.MPORT.mask <= _GEN_80

  module ALU1 :
    input clock : Clock
    input reset : UInt<1>
    input io_in_A : UInt<32>
    input io_in_B : UInt<32>
    input io_alu_Op : UInt<4>
    output io_out : UInt<32>

    node _sum_T = add(io_in_A, io_in_B) @[buggedAlu.scala 46:23]
    node sum = tail(_sum_T, 1) @[buggedAlu.scala 46:23]
    node _sub_T = sub(io_in_A, io_in_B) @[buggedAlu.scala 47:23]
    node sub = tail(_sub_T, 1) @[buggedAlu.scala 47:23]
    node _cmp_T = lt(io_in_A, io_in_B) @[buggedAlu.scala 48:27]
    node cmp = mux(_cmp_T, UInt<1>("h1"), UInt<1>("h0")) @[buggedAlu.scala 48:18]
    node _cmpU_T = lt(io_in_A, io_in_B) @[buggedAlu.scala 49:37]
    node cmpU = mux(_cmpU_T, UInt<1>("h1"), UInt<1>("h0")) @[buggedAlu.scala 49:19]
    node shamt = bits(io_in_B, 4, 0) @[buggedAlu.scala 50:24]
    node shiftrl = dshr(io_in_A, shamt) @[buggedAlu.scala 52:36]
    node shitfl = dshl(io_in_A, shamt) @[buggedAlu.scala 53:26]
    node shiftrA = dshr(io_in_A, shamt) @[buggedAlu.scala 54:27]
    node _io_out_T = eq(io_alu_Op, UInt<4>("h0")) @[buggedAlu.scala 62:28]
    node _io_out_T_1 = eq(io_alu_Op, UInt<4>("h1")) @[buggedAlu.scala 63:32]
    node _io_out_T_2 = eq(io_alu_Op, UInt<4>("h4")) @[buggedAlu.scala 64:35]
    node _io_out_T_3 = eq(io_alu_Op, UInt<4>("h6")) @[buggedAlu.scala 65:39]
    node _io_out_T_4 = eq(io_alu_Op, UInt<4>("ha")) @[buggedAlu.scala 66:43]
    node _io_out_T_5 = eq(io_alu_Op, UInt<4>("hb")) @[buggedAlu.scala 67:47]
    node _io_out_T_6 = eq(io_alu_Op, UInt<4>("h2")) @[buggedAlu.scala 68:51]
    node _io_out_T_7 = eq(io_alu_Op, UInt<4>("he")) @[buggedAlu.scala 69:55]
    node _io_out_T_8 = and(io_in_A, io_in_B) @[buggedAlu.scala 69:77]
    node _io_out_T_9 = eq(io_alu_Op, UInt<4>("hc")) @[buggedAlu.scala 70:59]
    node _io_out_T_10 = or(io_in_A, io_in_B) @[buggedAlu.scala 70:80]
    node _io_out_T_11 = eq(io_alu_Op, UInt<4>("h8")) @[buggedAlu.scala 71:64]
    node _io_out_T_12 = xor(io_in_A, io_in_B) @[buggedAlu.scala 71:86]
    node _io_out_T_13 = mux(_io_out_T_11, _io_out_T_12, UInt<1>("h0")) @[buggedAlu.scala 71:53]
    node _io_out_T_14 = mux(_io_out_T_9, _io_out_T_10, _io_out_T_13) @[buggedAlu.scala 70:48]
    node _io_out_T_15 = mux(_io_out_T_7, _io_out_T_8, _io_out_T_14) @[buggedAlu.scala 69:44]
    node _io_out_T_16 = mux(_io_out_T_6, shitfl, _io_out_T_15) @[buggedAlu.scala 68:40]
    node _io_out_T_17 = mux(_io_out_T_5, shiftrA, _io_out_T_16) @[buggedAlu.scala 67:36]
    node _io_out_T_18 = mux(_io_out_T_4, shiftrl, _io_out_T_17) @[buggedAlu.scala 66:32]
    node _io_out_T_19 = mux(_io_out_T_3, cmpU, _io_out_T_18) @[buggedAlu.scala 65:28]
    node _io_out_T_20 = mux(_io_out_T_2, cmp, _io_out_T_19) @[buggedAlu.scala 64:24]
    node _io_out_T_21 = mux(_io_out_T_1, sub, _io_out_T_20) @[buggedAlu.scala 63:20]
    node _io_out_T_22 = mux(_io_out_T, sum, _io_out_T_21) @[buggedAlu.scala 62:16]
    io_out <= bits(_io_out_T_22, 31, 0) @[buggedAlu.scala 61:12]

  module BranchALU :
    input clock : Clock
    input reset : UInt<1>
    input io_in_A : UInt<32>
    input io_in_B : UInt<32>
    input io_fun3 : UInt<4>
    output io_doBranch : UInt<1>
    input io_isBtype : UInt<1>

    node Beq = eq(io_in_A, io_in_B) @[BranchALU.scala 15:21]
    node blt = lt(io_in_A, io_in_B) @[BranchALU.scala 16:21]
    node bgeu = geq(io_in_A, io_in_B) @[BranchALU.scala 17:31]
    node bltu = lt(io_in_A, io_in_B) @[BranchALU.scala 18:31]
    node _T = eq(io_isBtype, UInt<1>("h1")) @[BranchALU.scala 20:19]
    node _io_doBranch_T = eq(io_fun3, UInt<1>("h0")) @[BranchALU.scala 21:32]
    node _io_doBranch_T_1 = eq(io_fun3, UInt<1>("h1")) @[BranchALU.scala 22:19]
    node _io_doBranch_T_2 = eq(Beq, UInt<1>("h0")) @[BranchALU.scala 22:28]
    node _io_doBranch_T_3 = eq(io_fun3, UInt<3>("h4")) @[BranchALU.scala 23:21]
    node _io_doBranch_T_4 = eq(io_fun3, UInt<3>("h5")) @[BranchALU.scala 24:23]
    node _io_doBranch_T_5 = eq(blt, UInt<1>("h0")) @[BranchALU.scala 24:35]
    node _io_doBranch_T_6 = or(_io_doBranch_T_5, Beq) @[BranchALU.scala 24:40]
    node _io_doBranch_T_7 = eq(io_fun3, UInt<3>("h6")) @[BranchALU.scala 25:25]
    node _io_doBranch_T_8 = eq(io_fun3, UInt<3>("h7")) @[BranchALU.scala 26:27]
    node _io_doBranch_T_9 = mux(_io_doBranch_T_8, bgeu, UInt<1>("h0")) @[BranchALU.scala 26:18]
    node _io_doBranch_T_10 = mux(_io_doBranch_T_7, bltu, _io_doBranch_T_9) @[BranchALU.scala 25:16]
    node _io_doBranch_T_11 = mux(_io_doBranch_T_4, _io_doBranch_T_6, _io_doBranch_T_10) @[BranchALU.scala 24:14]
    node _io_doBranch_T_12 = mux(_io_doBranch_T_3, blt, _io_doBranch_T_11) @[BranchALU.scala 23:12]
    node _io_doBranch_T_13 = mux(_io_doBranch_T_1, _io_doBranch_T_2, _io_doBranch_T_12) @[BranchALU.scala 22:10]
    node _io_doBranch_T_14 = mux(_io_doBranch_T, Beq, _io_doBranch_T_13) @[BranchALU.scala 21:23]
    node _GEN_0 = mux(_T, _io_doBranch_T_14, UInt<1>("h0")) @[BranchALU.scala 20:28 BranchALU.scala 21:17 BranchALU.scala 30:19]
    io_doBranch <= _GEN_0

  module DataPath :
    input clock : Clock
    input reset : UInt<1>
    output io_out : UInt<32>

    inst cu of CU @[DataPath.scala 14:18]
    inst regfile of RegisterFile @[DataPath.scala 15:23]
    inst insmem of InstMem @[DataPath.scala 16:22]
    inst datamem of Datamem @[DataPath.scala 17:23]
    inst alu of ALU1 @[DataPath.scala 18:19]
    inst checkbranch of BranchALU @[DataPath.scala 19:27]
    reg pc : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pc) @[DataPath.scala 21:19]
    node _pc_T = add(pc, UInt<3>("h4")) @[DataPath.scala 22:42]
    node _pc_T_1 = tail(_pc_T, 1) @[DataPath.scala 22:42]
    node _pc_T_2 = mux(cu.io_pcselec, alu.io_out, _pc_T_1) @[DataPath.scala 22:12]
    node _alu_io_alu_Op_T = mux(cu.io_aluselect, UInt<1>("h0"), cu.io_func) @[DataPath.scala 32:23]
    node _alu_io_in_A_T = or(checkbranch.io_doBranch, cu.io_jump) @[DataPath.scala 45:46]
    node _alu_io_in_A_T_1 = mux(_alu_io_in_A_T, pc, regfile.io_Rs1out) @[DataPath.scala 45:21]
    node _alu_io_in_B_T = eq(cu.io_Instype, UInt<1>("h0")) @[DataPath.scala 46:22]
    node _alu_io_in_B_T_1 = mux(_alu_io_in_B_T, cu.io_Imm, regfile.io_Rs2out) @[DataPath.scala 46:21]
    node _T = eq(cu.io_wbselect, UInt<1>("h1")) @[DataPath.scala 55:25]
    node _T_1 = eq(cu.io_wbselect, UInt<1>("h0")) @[DataPath.scala 58:30]
    node _T_2 = eq(cu.io_wbselect, UInt<2>("h2")) @[DataPath.scala 60:31]
    node _regfile_io_datain_T = add(pc, UInt<3>("h4")) @[DataPath.scala 61:34]
    node _regfile_io_datain_T_1 = tail(_regfile_io_datain_T, 1) @[DataPath.scala 61:34]
    node _GEN_0 = mux(_T_2, _regfile_io_datain_T_1, alu.io_out) @[DataPath.scala 60:39 DataPath.scala 61:27 DataPath.scala 41:21]
    node _GEN_1 = mux(_T_1, datamem.io_dataout, _GEN_0) @[DataPath.scala 58:39 DataPath.scala 59:25]
    node _GEN_2 = mux(_T, alu.io_out, _GEN_1) @[DataPath.scala 55:33 DataPath.scala 56:23]
    io_out <= alu.io_out @[DataPath.scala 63:10]
    cu.clock <= clock
    cu.reset <= reset
    cu.io_ins <= insmem.io_inst @[DataPath.scala 31:13]
    cu.io_dobranch <= checkbranch.io_doBranch @[DataPath.scala 27:18]
    regfile.clock <= clock
    regfile.reset <= reset
    regfile.io_Wen <= cu.io_RegWrite @[DataPath.scala 33:18]
    regfile.io_RD <= cu.io_RD @[DataPath.scala 35:17]
    regfile.io_Rs1in <= cu.io_Rs1 @[DataPath.scala 36:20]
    regfile.io_Rs2in <= cu.io_Rs2 @[DataPath.scala 37:20]
    regfile.io_datain <= _GEN_2
    insmem.clock <= clock
    insmem.reset <= reset
    insmem.io_addr <= pc @[DataPath.scala 29:18]
    datamem.clock <= clock
    datamem.reset <= reset
    datamem.io_Wen <= cu.io_MemWrite @[DataPath.scala 34:18]
    datamem.io_addr <= alu.io_out @[DataPath.scala 47:19]
    datamem.io_datain <= regfile.io_Rs2out @[DataPath.scala 48:20]
    datamem.io_fun3 <= cu.io_lengthselect @[DataPath.scala 42:19]
    datamem.io_enable <= cu.io_readmem @[DataPath.scala 43:21]
    alu.clock <= clock
    alu.reset <= reset
    alu.io_in_A <= _alu_io_in_A_T_1 @[DataPath.scala 45:15]
    alu.io_in_B <= _alu_io_in_B_T_1 @[DataPath.scala 46:15]
    alu.io_alu_Op <= bits(_alu_io_alu_Op_T, 3, 0) @[DataPath.scala 32:17]
    checkbranch.clock <= clock
    checkbranch.reset <= reset
    checkbranch.io_in_A <= regfile.io_Rs1out @[DataPath.scala 39:23]
    checkbranch.io_in_B <= regfile.io_Rs2out @[DataPath.scala 40:23]
    checkbranch.io_fun3 <= cu.io_btypefun @[DataPath.scala 28:22]
    checkbranch.io_isBtype <= cu.io_btype @[DataPath.scala 30:26]
    pc <= mux(reset, UInt<32>("h0"), _pc_T_2) @[DataPath.scala 21:19 DataPath.scala 21:19 DataPath.scala 22:6]
