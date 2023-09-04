circuit Datamem :
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
      writer => MPORT
      read-under-write => undefined
    node _T = bits(io_addr, 4, 0)
    node _GEN_0 = validif(io_Wen, _T) @[Datamem.scala 16:16]
    node _GEN_1 = validif(io_Wen, clock) @[Datamem.scala 16:16]
    node _GEN_2 = mux(io_Wen, UInt<1>("h1"), UInt<1>("h0")) @[Datamem.scala 16:16 Datamem.scala 13:20]
    node _GEN_3 = validif(io_Wen, UInt<1>("h1")) @[Datamem.scala 16:16]
    node _GEN_4 = validif(io_Wen, io_datain) @[Datamem.scala 16:16]
    node _io_dataout_T = bits(io_addr, 4, 0) @[Datamem.scala 20:28]
    io_dataout <= memory.io_dataout_MPORT.data @[Datamem.scala 20:14]
    memory.io_dataout_MPORT.addr <= _io_dataout_T @[Datamem.scala 20:28]
    memory.io_dataout_MPORT.en <= UInt<1>("h1") @[Datamem.scala 20:28]
    memory.io_dataout_MPORT.clk <= clock @[Datamem.scala 20:28]
    memory.MPORT.addr <= _GEN_0
    memory.MPORT.en <= _GEN_2
    memory.MPORT.clk <= _GEN_1
    memory.MPORT.data <= _GEN_4
    memory.MPORT.mask <= _GEN_3
