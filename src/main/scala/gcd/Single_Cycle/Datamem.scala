package Single_Cycle

import chisel3 . _
import chisel3 . util . _
class Datamem extends Module {
  val io = IO(new Bundle {
    val Wen = Input(Bool())
    val addr = Input(UInt(32.W))
    val datain = Input(SInt(32.W))
    val dataout = Output(SInt(32.W))
  })

  val memory = Mem (1024 , SInt(32.W ) )
  io.dataout := 0.S

  when (io.Wen){
    memory.write(io.addr,io.datain)
    io.dataout := memory.read(io.addr)
  }

  io.dataout := memory.read(io.addr)
}
