package LAB3
import chisel3._
import chisel3.util._
import chisel3.stage.ChiselStage

class LM_IO_Interface_ImmdValGen extends Bundle {
    val instr = Input (UInt(32.W))
    val immd_se = Output (UInt(32.W))
}
class ImmdValGen extends Module {
    val io = IO (new LM_IO_Interface_ImmdValGen)
    val Opcode = io.instr(6,0)
    io.immd_se := 0.U
    switch (Opcode){
        is ("b0010011".U){
            io.immd_se := Cat(Fill(20, io.instr(31)), io.instr(31, 20))
        }
        is ("b0100011".U){
            io.immd_se := Cat(Fill(20, io.instr(31)), io.instr(31, 25), io.instr(11, 7))
        }
        is ("b1100011".U){
            io.immd_se :=  Cat(Fill(20, io.instr(31)), io.instr(31), io.instr(7), io.instr(30, 25), io.instr(11,8))
        }
        is ("b0010111".U){
            io.immd_se := Cat(Fill(20, io.instr(31)), io.instr(31, 12))
        }
        is ("b1101111".U){
            io.immd_se := Cat(Fill(20, io.instr(31)), io.instr(31), io.instr(19, 12), io.instr(11), io.instr(19,1))
        }
    }
}