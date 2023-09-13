circuit DataPath :
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
    output io_wbselect : UInt<2>
    output io_aluselect : UInt<1>
    output io_lengthselect : UInt<2>
    input io_dobranch : UInt<1>
    output io_btypefun : UInt<4>
    output io_pcselec : UInt<1>
    output io_btype : UInt<1>
    output io_jump : UInt<1>

    node Opcode = bits(io_ins, 6, 0) @[CU.scala 36:22]
    node _T = eq(Opcode, UInt<6>("h33")) @[CU.scala 42:15]
    node _io_RD_T = bits(io_ins, 11, 7) @[CU.scala 43:19]
    node io_func_hi = bits(io_ins, 14, 12) @[CU.scala 44:26]
    node io_func_lo = bits(io_ins, 30, 30) @[CU.scala 44:40]
    node _io_func_T = cat(io_func_hi, io_func_lo) @[Cat.scala 30:58]
    node _io_Rs1_T = bits(io_ins, 19, 15) @[CU.scala 45:21]
    node _io_Rs2_T = bits(io_ins, 24, 20) @[CU.scala 46:21]
    node _T_1 = eq(Opcode, UInt<5>("h13")) @[CU.scala 58:22]
    node _io_RD_T_1 = bits(io_ins, 11, 7) @[CU.scala 59:21]
    node _io_func_T_1 = bits(io_ins, 14, 12) @[CU.scala 60:34]
    node _io_func_T_2 = bits(io_ins, 30, 30) @[CU.scala 66:28]
    node _io_func_T_3 = mux(_io_func_T_2, UInt<4>("hb"), UInt<4>("ha")) @[CU.scala 66:21]
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
    node _io_Rs1_T_1 = bits(io_ins, 19, 15) @[CU.scala 70:23]
    node _io_Imm_T = bits(io_ins, 31, 31) @[CU.scala 72:35]
    node _io_Imm_T_1 = bits(_io_Imm_T, 0, 0) @[Bitwise.scala 72:15]
    node io_Imm_hi = mux(_io_Imm_T_1, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 72:12]
    node io_Imm_lo = bits(io_ins, 31, 20) @[CU.scala 72:47]
    node _io_Imm_T_2 = cat(io_Imm_hi, io_Imm_lo) @[Cat.scala 30:58]
    node _io_Imm_T_3 = asSInt(_io_Imm_T_2) @[CU.scala 72:63]
    node _T_2 = eq(Opcode, UInt<2>("h3")) @[CU.scala 83:22]
    node _io_RD_T_2 = bits(io_ins, 11, 7) @[CU.scala 84:22]
    node _io_func_T_18 = bits(io_ins, 14, 12) @[CU.scala 85:24]
    node _io_Rs1_T_2 = bits(io_ins, 19, 15) @[CU.scala 86:23]
    node _io_Imm_T_4 = bits(io_ins, 31, 31) @[CU.scala 88:35]
    node _io_Imm_T_5 = bits(_io_Imm_T_4, 0, 0) @[Bitwise.scala 72:15]
    node io_Imm_hi_1 = mux(_io_Imm_T_5, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 72:12]
    node io_Imm_lo_1 = bits(io_ins, 31, 20) @[CU.scala 88:47]
    node _io_Imm_T_6 = cat(io_Imm_hi_1, io_Imm_lo_1) @[Cat.scala 30:58]
    node _io_Imm_T_7 = asSInt(_io_Imm_T_6) @[CU.scala 88:63]
    node _io_lengthselect_T = bits(io_ins, 13, 12) @[CU.scala 94:32]
    node _T_3 = eq(Opcode, UInt<6>("h23")) @[CU.scala 98:22]
    node _io_RD_T_3 = bits(io_ins, 11, 7) @[CU.scala 99:22]
    node _io_Rs1_T_3 = bits(io_ins, 19, 15) @[CU.scala 101:23]
    node _io_Rs2_T_1 = bits(io_ins, 24, 20) @[CU.scala 102:23]
    node _io_Imm_T_8 = bits(io_ins, 31, 31) @[CU.scala 103:35]
    node _io_Imm_T_9 = bits(_io_Imm_T_8, 0, 0) @[Bitwise.scala 72:15]
    node io_Imm_hi_hi = mux(_io_Imm_T_9, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 72:12]
    node io_Imm_hi_lo = bits(io_ins, 31, 25) @[CU.scala 103:47]
    node io_Imm_lo_2 = bits(io_ins, 11, 7) @[CU.scala 103:62]
    node io_Imm_hi_2 = cat(io_Imm_hi_hi, io_Imm_hi_lo) @[Cat.scala 30:58]
    node _io_Imm_T_10 = cat(io_Imm_hi_2, io_Imm_lo_2) @[Cat.scala 30:58]
    node _io_Imm_T_11 = asSInt(_io_Imm_T_10) @[CU.scala 103:77]
    node _io_lengthselect_T_1 = bits(io_ins, 14, 12) @[CU.scala 109:32]
    node _T_4 = eq(Opcode, UInt<7>("h63")) @[CU.scala 114:22]
    node _io_btypefun_T = bits(io_ins, 14, 12) @[CU.scala 117:28]
    node _io_Rs1_T_4 = bits(io_ins, 19, 15) @[CU.scala 118:23]
    node _io_Rs2_T_2 = bits(io_ins, 24, 20) @[CU.scala 119:23]
    node _io_Imm_T_12 = bits(io_ins, 31, 31) @[CU.scala 120:37]
    node _io_Imm_T_13 = bits(_io_Imm_T_12, 0, 0) @[Bitwise.scala 72:15]
    node io_Imm_hi_hi_hi = mux(_io_Imm_T_13, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 72:12]
    node io_Imm_hi_hi_lo = bits(io_ins, 31, 31) @[CU.scala 120:49]
    node io_Imm_hi_lo_1 = bits(io_ins, 7, 7) @[CU.scala 120:60]
    node io_Imm_lo_hi_hi = bits(io_ins, 30, 25) @[CU.scala 120:70]
    node io_Imm_lo_hi_lo = bits(io_ins, 11, 8) @[CU.scala 120:84]
    node io_Imm_lo_hi = cat(io_Imm_lo_hi_hi, io_Imm_lo_hi_lo) @[Cat.scala 30:58]
    node io_Imm_lo_3 = cat(io_Imm_lo_hi, UInt<1>("h0")) @[Cat.scala 30:58]
    node io_Imm_hi_hi_1 = cat(io_Imm_hi_hi_hi, io_Imm_hi_hi_lo) @[Cat.scala 30:58]
    node io_Imm_hi_3 = cat(io_Imm_hi_hi_1, io_Imm_hi_lo_1) @[Cat.scala 30:58]
    node _io_Imm_T_14 = cat(io_Imm_hi_3, io_Imm_lo_3) @[Cat.scala 30:58]
    node _io_Imm_T_15 = shr(_io_Imm_T_14, 2) @[CU.scala 120:96]
    node _io_Imm_T_16 = asSInt(_io_Imm_T_15) @[CU.scala 120:107]
    node _io_pcselec_T = and(io_dobranch, io_btype) @[CU.scala 129:37]
    node _io_pcselec_T_1 = mux(_io_pcselec_T, UInt<1>("h1"), UInt<1>("h0")) @[CU.scala 129:24]
    node _T_5 = eq(Opcode, UInt<7>("h6f")) @[CU.scala 131:23]
    node _io_RD_T_4 = bits(io_ins, 11, 7) @[CU.scala 132:20]
    node _io_Imm_T_17 = bits(io_ins, 31, 31) @[CU.scala 133:33]
    node _io_Imm_T_18 = bits(_io_Imm_T_17, 0, 0) @[Bitwise.scala 72:15]
    node io_Imm_hi_hi_hi_1 = mux(_io_Imm_T_18, UInt<11>("h7ff"), UInt<11>("h0")) @[Bitwise.scala 72:12]
    node io_Imm_hi_hi_lo_1 = bits(io_ins, 31, 31) @[CU.scala 133:45]
    node io_Imm_hi_lo_2 = bits(io_ins, 19, 12) @[CU.scala 133:56]
    node io_Imm_lo_hi_1 = bits(io_ins, 20, 20) @[CU.scala 133:70]
    node io_Imm_lo_lo = bits(io_ins, 29, 21) @[CU.scala 133:81]
    node io_Imm_lo_4 = cat(io_Imm_lo_hi_1, io_Imm_lo_lo) @[Cat.scala 30:58]
    node io_Imm_hi_hi_2 = cat(io_Imm_hi_hi_hi_1, io_Imm_hi_hi_lo_1) @[Cat.scala 30:58]
    node io_Imm_hi_4 = cat(io_Imm_hi_hi_2, io_Imm_hi_lo_2) @[Cat.scala 30:58]
    node _io_Imm_T_19 = cat(io_Imm_hi_4, io_Imm_lo_4) @[Cat.scala 30:58]
    node _io_Imm_T_20 = asSInt(_io_Imm_T_19) @[CU.scala 133:96]
    node _io_Imm_T_21 = shr(_io_Imm_T_20, 2) @[CU.scala 133:99]
    node _T_6 = eq(Opcode, UInt<7>("h67")) @[CU.scala 149:22]
    node _io_Imm_T_22 = bits(io_ins, 31, 31) @[CU.scala 150:35]
    node _io_Imm_T_23 = bits(_io_Imm_T_22, 0, 0) @[Bitwise.scala 72:15]
    node io_Imm_hi_5 = mux(_io_Imm_T_23, UInt<11>("h7ff"), UInt<11>("h0")) @[Bitwise.scala 72:12]
    node io_Imm_lo_5 = bits(io_ins, 31, 20) @[CU.scala 150:47]
    node _io_Imm_T_24 = cat(io_Imm_hi_5, io_Imm_lo_5) @[Cat.scala 30:58]
    node _io_Imm_T_25 = asSInt(_io_Imm_T_24) @[CU.scala 150:62]
    node _io_Rs1_T_5 = bits(io_ins, 19, 15) @[CU.scala 151:23]
    node _io_func_T_19 = bits(io_ins, 14, 12) @[CU.scala 152:25]
    node _io_RD_T_5 = bits(io_ins, 11, 7) @[CU.scala 154:22]
    node _GEN_0 = mux(_T_6, _io_Imm_T_25, asSInt(UInt<1>("h0"))) @[CU.scala 149:39 CU.scala 150:14 CU.scala 174:14]
    node _GEN_1 = mux(_T_6, _io_Rs1_T_5, UInt<1>("h0")) @[CU.scala 149:39 CU.scala 151:14 CU.scala 169:14]
    node _GEN_2 = mux(_T_6, _io_func_T_19, UInt<1>("h0")) @[CU.scala 149:39 CU.scala 152:15 CU.scala 168:15]
    node _GEN_3 = mux(_T_6, UInt<1>("h0"), UInt<1>("h0")) @[CU.scala 149:39 CU.scala 153:14 CU.scala 170:14]
    node _GEN_4 = mux(_T_6, _io_RD_T_5, UInt<1>("h0")) @[CU.scala 149:39 CU.scala 154:13 CU.scala 167:13]
    node _GEN_5 = mux(_T_6, UInt<1>("h1"), UInt<1>("h0")) @[CU.scala 149:39 CU.scala 156:19 CU.scala 171:19]
    node _GEN_6 = mux(_T_5, _io_RD_T_4, _GEN_4) @[CU.scala 131:41 CU.scala 132:11]
    node _GEN_7 = mux(_T_5, _io_Imm_T_21, _GEN_0) @[CU.scala 131:41 CU.scala 133:12]
    node _GEN_8 = mux(_T_5, UInt<1>("h0"), _GEN_2) @[CU.scala 131:41 CU.scala 134:13]
    node _GEN_9 = mux(_T_5, UInt<1>("h0"), _GEN_1) @[CU.scala 131:41 CU.scala 135:12]
    node _GEN_10 = mux(_T_5, UInt<1>("h0"), _GEN_3) @[CU.scala 131:41 CU.scala 136:12]
    node _GEN_11 = mux(_T_5, UInt<1>("h1"), _GEN_5) @[CU.scala 131:41 CU.scala 138:17]
    node _GEN_12 = mux(_T_5, UInt<1>("h0"), _GEN_5) @[CU.scala 131:41 CU.scala 141:18]
    node _GEN_13 = mux(_T_5, UInt<2>("h2"), _GEN_5) @[CU.scala 131:41 CU.scala 142:17]
    node _GEN_14 = mux(_T_5, UInt<1>("h1"), _GEN_3) @[CU.scala 131:41 CU.scala 145:13]
    node _GEN_15 = mux(_T_4, UInt<1>("h0"), _GEN_8) @[CU.scala 114:39 CU.scala 115:15]
    node _GEN_16 = mux(_T_4, UInt<1>("h0"), _GEN_6) @[CU.scala 114:39 CU.scala 116:13]
    node _GEN_17 = mux(_T_4, _io_btypefun_T, UInt<1>("h0")) @[CU.scala 114:39 CU.scala 117:19 CU.scala 38:15]
    node _GEN_18 = mux(_T_4, _io_Rs1_T_4, _GEN_9) @[CU.scala 114:39 CU.scala 118:14]
    node _GEN_19 = mux(_T_4, _io_Rs2_T_2, _GEN_10) @[CU.scala 114:39 CU.scala 119:14]
    node _GEN_20 = mux(_T_4, _io_Imm_T_16, _GEN_7) @[CU.scala 114:39 CU.scala 120:14]
    node _GEN_21 = mux(_T_4, UInt<1>("h0"), _GEN_10) @[CU.scala 114:39 CU.scala 121:19]
    node _GEN_22 = mux(_T_4, UInt<1>("h0"), _GEN_11) @[CU.scala 114:39 CU.scala 122:19]
    node _GEN_23 = mux(_T_4, UInt<1>("h1"), _GEN_12) @[CU.scala 114:39 CU.scala 125:20]
    node _GEN_24 = mux(_T_4, UInt<1>("h0"), _GEN_13) @[CU.scala 114:39 CU.scala 126:19]
    node _GEN_25 = mux(_T_4, UInt<1>("h1"), _GEN_10) @[CU.scala 114:39 CU.scala 127:16]
    node _GEN_26 = mux(_T_4, _io_pcselec_T_1, _GEN_11) @[CU.scala 114:39 CU.scala 129:18]
    node _GEN_27 = mux(_T_4, UInt<1>("h0"), _GEN_14) @[CU.scala 114:39 CU.scala 40:11]
    node _GEN_28 = mux(_T_3, _io_RD_T_3, _GEN_16) @[CU.scala 98:40 CU.scala 99:13]
    node _GEN_29 = mux(_T_3, UInt<1>("h0"), _GEN_15) @[CU.scala 98:40 CU.scala 100:15]
    node _GEN_30 = mux(_T_3, _io_Rs1_T_3, _GEN_18) @[CU.scala 98:40 CU.scala 101:14]
    node _GEN_31 = mux(_T_3, _io_Rs2_T_1, _GEN_19) @[CU.scala 98:40 CU.scala 102:14]
    node _GEN_32 = mux(_T_3, _io_Imm_T_11, _GEN_20) @[CU.scala 98:40 CU.scala 103:14]
    node _GEN_33 = mux(_T_3, UInt<1>("h0"), _GEN_22) @[CU.scala 98:40 CU.scala 104:19]
    node _GEN_34 = mux(_T_3, UInt<1>("h1"), _GEN_21) @[CU.scala 98:40 CU.scala 105:19]
    node _GEN_35 = mux(_T_3, UInt<1>("h0"), _GEN_21) @[CU.scala 98:40 CU.scala 106:18]
    node _GEN_36 = mux(_T_3, UInt<1>("h0"), _GEN_24) @[CU.scala 98:40 CU.scala 107:19]
    node _GEN_37 = mux(_T_3, UInt<1>("h1"), _GEN_23) @[CU.scala 98:40 CU.scala 108:20]
    node _GEN_38 = mux(_T_3, _io_lengthselect_T_1, _GEN_21) @[CU.scala 98:40 CU.scala 109:23]
    node _GEN_39 = mux(_T_3, UInt<1>("h0"), _GEN_26) @[CU.scala 98:40 CU.scala 110:18]
    node _GEN_40 = mux(_T_3, UInt<1>("h0"), _GEN_17) @[CU.scala 98:40 CU.scala 38:15]
    node _GEN_41 = mux(_T_3, UInt<1>("h0"), _GEN_25) @[CU.scala 98:40 CU.scala 39:12]
    node _GEN_42 = mux(_T_3, UInt<1>("h0"), _GEN_27) @[CU.scala 98:40 CU.scala 40:11]
    node _GEN_43 = mux(_T_2, _io_RD_T_2, _GEN_28) @[CU.scala 83:39 CU.scala 84:13]
    node _GEN_44 = mux(_T_2, _io_func_T_18, _GEN_29) @[CU.scala 83:39 CU.scala 85:15]
    node _GEN_45 = mux(_T_2, _io_Rs1_T_2, _GEN_30) @[CU.scala 83:39 CU.scala 86:14]
    node _GEN_46 = mux(_T_2, UInt<1>("h0"), _GEN_31) @[CU.scala 83:39 CU.scala 87:14]
    node _GEN_47 = mux(_T_2, _io_Imm_T_7, _GEN_32) @[CU.scala 83:39 CU.scala 88:14]
    node _GEN_48 = mux(_T_2, UInt<1>("h1"), _GEN_33) @[CU.scala 83:39 CU.scala 89:19]
    node _GEN_49 = mux(_T_2, UInt<1>("h0"), _GEN_34) @[CU.scala 83:39 CU.scala 90:19]
    node _GEN_50 = mux(_T_2, UInt<1>("h0"), _GEN_35) @[CU.scala 83:39 CU.scala 91:18]
    node _GEN_51 = mux(_T_2, UInt<1>("h1"), _GEN_36) @[CU.scala 83:39 CU.scala 92:19]
    node _GEN_52 = mux(_T_2, UInt<1>("h0"), _GEN_37) @[CU.scala 83:39 CU.scala 93:20]
    node _GEN_53 = mux(_T_2, _io_lengthselect_T, _GEN_38) @[CU.scala 83:39 CU.scala 94:23]
    node _GEN_54 = mux(_T_2, UInt<1>("h0"), _GEN_39) @[CU.scala 83:39 CU.scala 95:18]
    node _GEN_55 = mux(_T_2, UInt<1>("h0"), _GEN_40) @[CU.scala 83:39 CU.scala 38:15]
    node _GEN_56 = mux(_T_2, UInt<1>("h0"), _GEN_41) @[CU.scala 83:39 CU.scala 39:12]
    node _GEN_57 = mux(_T_2, UInt<1>("h0"), _GEN_42) @[CU.scala 83:39 CU.scala 40:11]
    node _GEN_58 = mux(_T_1, _io_RD_T_1, _GEN_43) @[CU.scala 58:39 CU.scala 59:12]
    node _GEN_59 = mux(_T_1, _io_func_T_17, _GEN_44) @[CU.scala 58:39 CU.scala 60:15]
    node _GEN_60 = mux(_T_1, _io_Rs1_T_1, _GEN_45) @[CU.scala 58:39 CU.scala 70:14]
    node _GEN_61 = mux(_T_1, UInt<1>("h0"), _GEN_46) @[CU.scala 58:39 CU.scala 71:14]
    node _GEN_62 = mux(_T_1, _io_Imm_T_3, _GEN_47) @[CU.scala 58:39 CU.scala 72:14]
    node _GEN_63 = mux(_T_1, UInt<1>("h1"), _GEN_48) @[CU.scala 58:39 CU.scala 73:19]
    node _GEN_64 = mux(_T_1, UInt<1>("h0"), _GEN_49) @[CU.scala 58:39 CU.scala 74:19]
    node _GEN_65 = mux(_T_1, UInt<1>("h0"), _GEN_50) @[CU.scala 58:39 CU.scala 75:18]
    node _GEN_66 = mux(_T_1, UInt<1>("h1"), _GEN_51) @[CU.scala 58:39 CU.scala 76:19]
    node _GEN_67 = mux(_T_1, UInt<1>("h0"), _GEN_52) @[CU.scala 58:39 CU.scala 77:20]
    node _GEN_68 = mux(_T_1, UInt<1>("h0"), _GEN_53) @[CU.scala 58:39 CU.scala 78:23]
    node _GEN_69 = mux(_T_1, UInt<1>("h0"), _GEN_54) @[CU.scala 58:39 CU.scala 79:18]
    node _GEN_70 = mux(_T_1, UInt<1>("h0"), _GEN_55) @[CU.scala 58:39 CU.scala 38:15]
    node _GEN_71 = mux(_T_1, UInt<1>("h0"), _GEN_56) @[CU.scala 58:39 CU.scala 39:12]
    node _GEN_72 = mux(_T_1, UInt<1>("h0"), _GEN_57) @[CU.scala 58:39 CU.scala 40:11]
    node _GEN_73 = mux(_T, _io_RD_T, _GEN_58) @[CU.scala 42:32 CU.scala 43:10]
    node _GEN_74 = mux(_T, _io_func_T, _GEN_59) @[CU.scala 42:32 CU.scala 44:13]
    node _GEN_75 = mux(_T, _io_Rs1_T, _GEN_60) @[CU.scala 42:32 CU.scala 45:12]
    node _GEN_76 = mux(_T, _io_Rs2_T, _GEN_61) @[CU.scala 42:32 CU.scala 46:12]
    node _GEN_77 = mux(_T, asSInt(UInt<1>("h0")), _GEN_62) @[CU.scala 42:32 CU.scala 47:12]
    node _GEN_78 = mux(_T, UInt<1>("h1"), _GEN_63) @[CU.scala 42:32 CU.scala 48:17]
    node _GEN_79 = mux(_T, UInt<1>("h0"), _GEN_64) @[CU.scala 42:32 CU.scala 49:17]
    node _GEN_80 = mux(_T, UInt<1>("h0"), _GEN_67) @[CU.scala 42:32 CU.scala 50:18]
    node _GEN_81 = mux(_T, UInt<1>("h1"), _GEN_65) @[CU.scala 42:32 CU.scala 51:16]
    node _GEN_82 = mux(_T, UInt<1>("h1"), _GEN_66) @[CU.scala 42:32 CU.scala 52:17]
    node _GEN_83 = mux(_T, UInt<1>("h0"), _GEN_68) @[CU.scala 42:32 CU.scala 53:21]
    node _GEN_84 = mux(_T, UInt<1>("h0"), _GEN_69) @[CU.scala 42:32 CU.scala 54:16]
    node _GEN_85 = mux(_T, UInt<1>("h0"), _GEN_70) @[CU.scala 42:32 CU.scala 38:15]
    node _GEN_86 = mux(_T, UInt<1>("h0"), _GEN_71) @[CU.scala 42:32 CU.scala 39:12]
    node _GEN_87 = mux(_T, UInt<1>("h0"), _GEN_72) @[CU.scala 42:32 CU.scala 40:11]
    node immgen = UInt<20>("h0")
    io_RD <= _GEN_73
    io_Rs1 <= _GEN_75
    io_Rs2 <= _GEN_76
    io_Imm <= _GEN_77
    io_Instype <= _GEN_81
    io_RegWrite <= _GEN_78
    io_MemWrite <= _GEN_79
    io_func <= _GEN_74
    io_wbselect <= _GEN_82
    io_aluselect <= _GEN_80
    io_lengthselect <= bits(_GEN_83, 1, 0)
    io_btypefun <= _GEN_85
    io_pcselec <= _GEN_84
    io_btype <= _GEN_86
    io_jump <= _GEN_87

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
    node _io_inst_T = bits(io_addr, 4, 0) @[InsMem.scala 16:21]
    io_inst <= imem.io_inst_MPORT.data @[InsMem.scala 16:13]
    imem.io_inst_MPORT.addr <= _io_inst_T @[InsMem.scala 16:21]
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

    node _sum_T = add(io_in_A, io_in_B) @[buggedAlu.scala 47:23]
    node _sum_T_1 = tail(_sum_T, 1) @[buggedAlu.scala 47:23]
    node sum = asSInt(_sum_T_1) @[buggedAlu.scala 47:23]
    node _sub_T = sub(io_in_A, io_in_B) @[buggedAlu.scala 48:23]
    node _sub_T_1 = tail(_sub_T, 1) @[buggedAlu.scala 48:23]
    node sub = asSInt(_sub_T_1) @[buggedAlu.scala 48:23]
    node _cmp_T = lt(io_in_A, io_in_B) @[buggedAlu.scala 49:27]
    node cmp = mux(_cmp_T, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[buggedAlu.scala 49:18]
    node _cmpU_T = asUInt(io_in_A) @[buggedAlu.scala 50:34]
    node _cmpU_T_1 = asUInt(io_in_B) @[buggedAlu.scala 50:53]
    node _cmpU_T_2 = lt(_cmpU_T, _cmpU_T_1) @[buggedAlu.scala 50:37]
    node cmpU = mux(_cmpU_T_2, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[buggedAlu.scala 50:19]
    node shamt = bits(io_in_B, 4, 0) @[buggedAlu.scala 51:24]
    node _shiftrl_T = asUInt(io_in_A) @[buggedAlu.scala 53:33]
    node shiftrl = dshr(_shiftrl_T, shamt) @[buggedAlu.scala 53:36]
    node shitfl = dshl(io_in_A, shamt) @[buggedAlu.scala 54:26]
    node shiftrA = dshr(io_in_A, shamt) @[buggedAlu.scala 55:27]
    node _beq_T = eq(io_in_A, io_in_B) @[buggedAlu.scala 56:27]
    node beq = mux(_beq_T, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[buggedAlu.scala 56:18]
    node _bge_T = or(cmp, beq) @[buggedAlu.scala 57:20]
    node bge = asSInt(_bge_T) @[buggedAlu.scala 57:20]
    node _bgeu_T = asUInt(io_in_A) @[buggedAlu.scala 58:30]
    node _bgeu_T_1 = asUInt(io_in_B) @[buggedAlu.scala 58:50]
    node bgeu = geq(_bgeu_T, _bgeu_T_1) @[buggedAlu.scala 58:33]
    node _io_out_T = eq(io_alu_Op, UInt<4>("h0")) @[buggedAlu.scala 63:28]
    node _io_out_T_1 = eq(io_alu_Op, UInt<4>("h1")) @[buggedAlu.scala 64:32]
    node _io_out_T_2 = eq(io_alu_Op, UInt<4>("h4")) @[buggedAlu.scala 65:35]
    node _io_out_T_3 = eq(io_alu_Op, UInt<4>("h6")) @[buggedAlu.scala 66:39]
    node _io_out_T_4 = eq(io_alu_Op, UInt<4>("ha")) @[buggedAlu.scala 67:43]
    node _io_out_T_5 = asSInt(shiftrl) @[buggedAlu.scala 67:70]
    node _io_out_T_6 = eq(io_alu_Op, UInt<4>("hb")) @[buggedAlu.scala 68:47]
    node _io_out_T_7 = eq(io_alu_Op, UInt<4>("h2")) @[buggedAlu.scala 69:51]
    node _io_out_T_8 = eq(io_alu_Op, UInt<4>("he")) @[buggedAlu.scala 70:55]
    node _io_out_T_9 = and(io_in_A, io_in_B) @[buggedAlu.scala 70:77]
    node _io_out_T_10 = asSInt(_io_out_T_9) @[buggedAlu.scala 70:77]
    node _io_out_T_11 = eq(io_alu_Op, UInt<4>("hc")) @[buggedAlu.scala 71:59]
    node _io_out_T_12 = or(io_in_A, io_in_B) @[buggedAlu.scala 71:80]
    node _io_out_T_13 = asSInt(_io_out_T_12) @[buggedAlu.scala 71:80]
    node _io_out_T_14 = eq(io_alu_Op, UInt<4>("h8")) @[buggedAlu.scala 72:64]
    node _io_out_T_15 = xor(io_in_A, io_in_B) @[buggedAlu.scala 72:86]
    node _io_out_T_16 = asSInt(_io_out_T_15) @[buggedAlu.scala 72:86]
    node _io_out_T_17 = mux(_io_out_T_14, _io_out_T_16, asSInt(UInt<1>("h0"))) @[buggedAlu.scala 72:53]
    node _io_out_T_18 = mux(_io_out_T_11, _io_out_T_13, _io_out_T_17) @[buggedAlu.scala 71:48]
    node _io_out_T_19 = mux(_io_out_T_8, _io_out_T_10, _io_out_T_18) @[buggedAlu.scala 70:44]
    node _io_out_T_20 = mux(_io_out_T_7, shitfl, _io_out_T_19) @[buggedAlu.scala 69:40]
    node _io_out_T_21 = mux(_io_out_T_6, shiftrA, _io_out_T_20) @[buggedAlu.scala 68:36]
    node _io_out_T_22 = mux(_io_out_T_4, _io_out_T_5, _io_out_T_21) @[buggedAlu.scala 67:32]
    node _io_out_T_23 = mux(_io_out_T_3, cmpU, _io_out_T_22) @[buggedAlu.scala 66:28]
    node _io_out_T_24 = mux(_io_out_T_2, cmp, _io_out_T_23) @[buggedAlu.scala 65:24]
    node _io_out_T_25 = mux(_io_out_T_1, sub, _io_out_T_24) @[buggedAlu.scala 64:20]
    node _io_out_T_26 = mux(_io_out_T, sum, _io_out_T_25) @[buggedAlu.scala 63:16]
    io_out <= asSInt(bits(_io_out_T_26, 31, 0)) @[buggedAlu.scala 62:12]
    io_sum <= sum @[buggedAlu.scala 75:12]

  module BranchALU :
    input clock : Clock
    input reset : UInt<1>
    input io_in_A : SInt<32>
    input io_in_B : SInt<32>
    input io_fun3 : UInt<4>
    output io_doBranch : UInt<1>
    input io_isBtype : UInt<1>

    node Beq = eq(io_in_A, io_in_B) @[BranchALU.scala 15:21]
    node blt = lt(io_in_A, io_in_B) @[BranchALU.scala 16:21]
    node _bgeu_T = asUInt(io_in_A) @[BranchALU.scala 17:28]
    node _bgeu_T_1 = asUInt(io_in_B) @[BranchALU.scala 17:48]
    node bgeu = geq(_bgeu_T, _bgeu_T_1) @[BranchALU.scala 17:31]
    node _bltu_T = asUInt(io_in_A) @[BranchALU.scala 18:28]
    node _bltu_T_1 = asUInt(io_in_B) @[BranchALU.scala 18:47]
    node bltu = lt(_bltu_T, _bltu_T_1) @[BranchALU.scala 18:31]
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
    output io_out : SInt<32>

    inst cu of CU @[DataPath.scala 14:18]
    inst regfile of RegisterFile @[DataPath.scala 15:23]
    inst insmem of InstMem @[DataPath.scala 16:22]
    inst datamem of Datamem @[DataPath.scala 17:23]
    inst alu of ALU1 @[DataPath.scala 18:19]
    inst checkbranch of BranchALU @[DataPath.scala 19:27]
    reg pc : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pc) @[DataPath.scala 21:19]
    node _pc_T = asUInt(alu.io_out) @[DataPath.scala 22:46]
    node _pc_T_1 = add(pc, UInt<1>("h1")) @[DataPath.scala 22:51]
    node _pc_T_2 = tail(_pc_T_1, 1) @[DataPath.scala 22:51]
    node _pc_T_3 = mux(cu.io_pcselec, _pc_T, _pc_T_2) @[DataPath.scala 22:12]
    node _alu_io_alu_Op_T = mux(cu.io_aluselect, UInt<1>("h0"), cu.io_func) @[DataPath.scala 32:23]
    node _alu_io_in_A_T = or(checkbranch.io_doBranch, cu.io_jump) @[DataPath.scala 43:46]
    node _alu_io_in_A_T_1 = asSInt(pc) @[DataPath.scala 43:71]
    node _alu_io_in_A_T_2 = mux(_alu_io_in_A_T, _alu_io_in_A_T_1, regfile.io_Rs1out) @[DataPath.scala 43:21]
    node _alu_io_in_B_T = eq(cu.io_Instype, UInt<1>("h0")) @[DataPath.scala 44:22]
    node _alu_io_in_B_T_1 = mux(_alu_io_in_B_T, cu.io_Imm, regfile.io_Rs2out) @[DataPath.scala 44:21]
    node _datamem_io_addr_T = asUInt(alu.io_out) @[DataPath.scala 45:39]
    node _datamem_io_datain_T = eq(cu.io_wbselect, UInt<1>("h1")) @[DataPath.scala 46:42]
    node _datamem_io_datain_T_1 = bits(regfile.io_Rs2out, 8, 0) @[DataPath.scala 47:31]
    node _datamem_io_datain_T_2 = asSInt(_datamem_io_datain_T_1) @[DataPath.scala 47:44]
    node _datamem_io_datain_T_3 = bits(regfile.io_Rs2out, 15, 0) @[DataPath.scala 48:31]
    node _datamem_io_datain_T_4 = asSInt(_datamem_io_datain_T_3) @[DataPath.scala 48:45]
    node _datamem_io_datain_T_5 = eq(UInt<1>("h0"), cu.io_lengthselect) @[Mux.scala 80:60]
    node _datamem_io_datain_T_6 = mux(_datamem_io_datain_T_5, _datamem_io_datain_T_2, asSInt(UInt<1>("h0"))) @[Mux.scala 80:57]
    node _datamem_io_datain_T_7 = eq(UInt<1>("h1"), cu.io_lengthselect) @[Mux.scala 80:60]
    node _datamem_io_datain_T_8 = mux(_datamem_io_datain_T_7, _datamem_io_datain_T_4, _datamem_io_datain_T_6) @[Mux.scala 80:57]
    node _datamem_io_datain_T_9 = eq(UInt<2>("h2"), cu.io_lengthselect) @[Mux.scala 80:60]
    node _datamem_io_datain_T_10 = mux(_datamem_io_datain_T_9, regfile.io_Rs2out, _datamem_io_datain_T_8) @[Mux.scala 80:57]
    node _datamem_io_datain_T_11 = mux(_datamem_io_datain_T, regfile.io_Rs2out, _datamem_io_datain_T_10) @[DataPath.scala 46:27]
    node _T = eq(cu.io_wbselect, UInt<1>("h1")) @[DataPath.scala 52:25]
    node _T_1 = eq(cu.io_wbselect, UInt<1>("h0")) @[DataPath.scala 54:30]
    node _regfile_io_datain_T = bits(datamem.io_dataout, 8, 0) @[DataPath.scala 56:34]
    node _regfile_io_datain_T_1 = asSInt(_regfile_io_datain_T) @[DataPath.scala 56:47]
    node _regfile_io_datain_T_2 = bits(datamem.io_dataout, 15, 0) @[DataPath.scala 57:34]
    node _regfile_io_datain_T_3 = asSInt(_regfile_io_datain_T_2) @[DataPath.scala 57:48]
    node _regfile_io_datain_T_4 = eq(UInt<1>("h0"), cu.io_lengthselect) @[Mux.scala 80:60]
    node _regfile_io_datain_T_5 = mux(_regfile_io_datain_T_4, _regfile_io_datain_T_1, asSInt(UInt<1>("h0"))) @[Mux.scala 80:57]
    node _regfile_io_datain_T_6 = eq(UInt<1>("h1"), cu.io_lengthselect) @[Mux.scala 80:60]
    node _regfile_io_datain_T_7 = mux(_regfile_io_datain_T_6, _regfile_io_datain_T_3, _regfile_io_datain_T_5) @[Mux.scala 80:57]
    node _regfile_io_datain_T_8 = eq(UInt<2>("h2"), cu.io_lengthselect) @[Mux.scala 80:60]
    node _regfile_io_datain_T_9 = mux(_regfile_io_datain_T_8, datamem.io_dataout, _regfile_io_datain_T_7) @[Mux.scala 80:57]
    node _T_2 = eq(cu.io_wbselect, UInt<2>("h2")) @[DataPath.scala 60:32]
    node _regfile_io_datain_T_10 = add(pc, UInt<1>("h1")) @[DataPath.scala 61:34]
    node _regfile_io_datain_T_11 = tail(_regfile_io_datain_T_10, 1) @[DataPath.scala 61:34]
    node _regfile_io_datain_T_12 = asSInt(_regfile_io_datain_T_11) @[DataPath.scala 61:46]
    node _GEN_0 = mux(_T_2, _regfile_io_datain_T_12, alu.io_out) @[DataPath.scala 60:40 DataPath.scala 61:27 DataPath.scala 41:21]
    node _GEN_1 = mux(_T_1, _regfile_io_datain_T_9, _GEN_0) @[DataPath.scala 54:39 DataPath.scala 55:23]
    node _GEN_2 = mux(_T, alu.io_out, _GEN_1) @[DataPath.scala 52:33 DataPath.scala 53:23]
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
    datamem.io_addr <= _datamem_io_addr_T @[DataPath.scala 45:19]
    datamem.io_datain <= _datamem_io_datain_T_11 @[DataPath.scala 46:21]
    alu.clock <= clock
    alu.reset <= reset
    alu.io_in_A <= _alu_io_in_A_T_2 @[DataPath.scala 43:15]
    alu.io_in_B <= _alu_io_in_B_T_1 @[DataPath.scala 44:15]
    alu.io_alu_Op <= bits(_alu_io_alu_Op_T, 3, 0) @[DataPath.scala 32:17]
    checkbranch.clock <= clock
    checkbranch.reset <= reset
    checkbranch.io_in_A <= regfile.io_Rs1out @[DataPath.scala 39:23]
    checkbranch.io_in_B <= regfile.io_Rs2out @[DataPath.scala 40:23]
    checkbranch.io_fun3 <= cu.io_btypefun @[DataPath.scala 28:22]
    checkbranch.io_isBtype <= cu.io_btype @[DataPath.scala 30:26]
    pc <= mux(reset, UInt<32>("h0"), _pc_T_3) @[DataPath.scala 21:19 DataPath.scala 21:19 DataPath.scala 22:6]
