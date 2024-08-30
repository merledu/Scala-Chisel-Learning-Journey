package LAB3
import chisel3._
import chisel3.util._
import ALUOP._
import chisel3.stage.ChiselStage

trait Config {
    val WLEN = 4
    val ALUOP_SIG_LEN = 4
}
object ALUOP {
    val ALU_ADD = 0.U (4.W)
    val ALU_SUB = 1.U (4.W)
    val ALU_AND = 2.U (4.W)
    val ALU_OR = 3.U (4.W)
    val ALU_XOR = 4.U (4.W)
    val ALU_SLT = 5.U (4.W)
    val ALU_SLL = 6.U (4.W)
    val ALU_SRL = 8.U (4.W)
}
class ALUIO extends Bundle with Config {
    val in_A = Input (UInt(WLEN.W))
    val in_B = Input (UInt(WLEN.W))
    val alu_Op = Input (UInt(ALUOP_SIG_LEN.W))
    val out = Output (UInt(WLEN.W))
    val sum = Output (UInt(WLEN.W))
}
class ALU extends Module with Config {
    val io = IO (new ALUIO)
    io.out := 0.U
    io.sum := 0.U
    switch (io.alu_Op) {
        is (ALU_ADD){
            io.out := io.in_A + io.in_B
        }
        is (ALU_SUB){
            io.out := io.in_A - io.in_B
        }
        is (ALU_AND){
            io.out := io.in_A & io.in_B
        }
        is (ALU_OR){
            io.out := io.in_A | io.in_B
        }
        is (ALU_XOR){
            io.out := io.in_A ^ io.in_B
        }
        is (ALU_SLT){
            io.out := io.in_A > io.in_B
        }
        is (ALU_SLL){
            io.out := io.in_A << io.in_B
        }
        is (ALU_SRL){
            io.out := io.in_A >> io.in_B
        }
    }
}