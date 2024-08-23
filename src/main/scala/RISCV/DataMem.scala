package RISCV
import chisel3._
import chisel3.util._

class DataMemory extends Module{
    val io = IO (new Bundle{
        val Addr = Input(UInt(32.W))
        val mem_read = Input(Bool())
        val mem_write = Input(Bool())
        val DataIn = Input(SInt(32.W))
        val DataOut = Output(SInt(32.W))
    })
val mem = Mem(1024, SInt(32.W)) 
io.DataOut := 0.S
when (io.mem_write === 1.B){
    mem.write(io.Addr, io.DataIn)
}
when (io.mem_read === 1.B){
    io.DataOut := mem.read(io.Addr)
}
}  