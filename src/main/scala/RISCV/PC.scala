package RISCV
import chisel3._ 
import chisel3.util._ 

class ProgramCounter extends Module {
    val io = IO (new Bundle {
        val pc_in = Input(SInt(32.W))
        val pc4 = Output(SInt(32.W))
        val pc_out = Output(SInt(32.W))
    })
    val pc = RegInit(0.S(32.W))
    pc := io.pc_in
    io.pc_out := pc
    io.pc4 := pc + 4.S
}