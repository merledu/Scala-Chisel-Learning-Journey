package RISCV
import chisel3._
import chisel3.util._

class RegFile extends Module{
    val io = IO(new Bundle {
        val Reg1 = Input(UInt(5.W))
        val Reg2 = Input(UInt(5.W))
        val Reg_write = Input(Bool())
        val write_Reg = Input(UInt(5.W))
        val write_data = Input(SInt(32.W))
        val rData1 = Output(SInt(32.W))
        val rData2 = Output(SInt(32.W))
    })
val regs = Reg (Vec(32, SInt(32.W)))

io.rData1 := Mux ((io.Reg1.orR) , regs(io.Reg1), 0.S)
io.rData2 := Mux ((io.Reg2.orR) , regs(io.Reg2), 0.S)

when(io.Reg_write & io.write_Reg.orR){
    regs (io.write_Reg) := io.write_data
}
}