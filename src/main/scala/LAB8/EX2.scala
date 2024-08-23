package LAB8
import chisel3._
import chisel3.util._

class Forwarding extends Module {
    val io = IO (new Bundle {
        val out = Output (Vec(2, UInt (4.W)))
        val rdAddr = Input (UInt (10.W))
        val wrAddr = Input (UInt (10.W))
        val wrData = Input (Vec(2, UInt (4.W)))
        val wr_en = Input (Bool())
        val enable = Input (Bool())
        val mask = Input(Vec(2, Bool()))
})
val memory = SyncReadMem (1024 , Vec(2,UInt (32.W )) )
val wrDataReg = RegNext ( io.wrData )
val doForwardReg = RegNext ( io.wrAddr === io.rdAddr && io.wr_en)
val memData = memory.read (io.rdAddr, io.enable)
when (io.wr_en)
{
    memory.write (io.wrAddr , io.wrData, io.mask)
}
io.out(0) := Mux ( doForwardReg, wrDataReg(0), memData(0))
io.out(1) := Mux ( doForwardReg, wrDataReg(1), memData(1))
}
