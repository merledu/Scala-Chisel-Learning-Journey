circuit RegisterFile :
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
      writer => MPORT
      read-under-write => undefined
    node _T = neq(io_RD, UInt<1>("h0")) @[RegisterFile.scala 20:25]
    node _T_1 = and(io_Wen, _T) @[RegisterFile.scala 20:15]
    node _GEN_0 = validif(_T_1, io_RD) @[RegisterFile.scala 20:34 RegisterFile.scala 21:12]
    node _GEN_1 = validif(_T_1, clock) @[RegisterFile.scala 20:34 RegisterFile.scala 21:12]
    node _GEN_2 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[RegisterFile.scala 20:34 RegisterFile.scala 21:12 RegisterFile.scala 15:21]
    node _GEN_3 = validif(_T_1, UInt<1>("h1")) @[RegisterFile.scala 20:34 RegisterFile.scala 21:20]
    node _GEN_4 = validif(_T_1, io_datain) @[RegisterFile.scala 20:34 RegisterFile.scala 21:20]
    node _GEN_5 = validif(eq(_T_1, UInt<1>("h0")), io_Rs1in) @[RegisterFile.scala 20:34 RegisterFile.scala 24:27]
    node _GEN_6 = validif(eq(_T_1, UInt<1>("h0")), clock) @[RegisterFile.scala 20:34 RegisterFile.scala 24:27]
    node _GEN_7 = mux(_T_1, UInt<1>("h0"), UInt<1>("h1")) @[RegisterFile.scala 20:34 RegisterFile.scala 15:21 RegisterFile.scala 24:27]
    node _GEN_8 = mux(_T_1, asSInt(UInt<1>("h0")), regFile.io_Rs1out_MPORT.data) @[RegisterFile.scala 20:34 RegisterFile.scala 16:13 RegisterFile.scala 24:17]
    node _GEN_9 = validif(eq(_T_1, UInt<1>("h0")), io_Rs2in) @[RegisterFile.scala 20:34 RegisterFile.scala 25:27]
    node _GEN_10 = mux(_T_1, asSInt(UInt<1>("h0")), regFile.io_Rs2out_MPORT.data) @[RegisterFile.scala 20:34 RegisterFile.scala 17:13 RegisterFile.scala 25:17]
    io_Rs1out <= _GEN_8
    io_Rs2out <= _GEN_10
    regFile.io_Rs1out_MPORT.addr <= _GEN_5
    regFile.io_Rs1out_MPORT.en <= _GEN_7
    regFile.io_Rs1out_MPORT.clk <= _GEN_6
    regFile.io_Rs2out_MPORT.addr <= _GEN_9
    regFile.io_Rs2out_MPORT.en <= _GEN_7
    regFile.io_Rs2out_MPORT.clk <= _GEN_6
    regFile.MPORT.addr <= _GEN_0
    regFile.MPORT.en <= _GEN_2
    regFile.MPORT.clk <= _GEN_1
    regFile.MPORT.data <= _GEN_4
    regFile.MPORT.mask <= _GEN_3
