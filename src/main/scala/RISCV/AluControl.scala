package RISCV
import chisel3._
import chisel3.util._

class AluControl extends Module{
    val io = IO (new Bundle {
        val func3 = Input (UInt(3.W))
        val func7 = Input (Bool())
        val alu_op = Input (UInt(3.W))
        val out = Output (UInt(5.W))  
    })
    //R
    when (io.alu_op === 0.U){
        io.out := Cat(0.U, io.func7, io.func3)
    }
    //I
    .elsewhen (io.alu_op === 1.U){
        io.out := Cat("b00".U, io.func3)
    }
    //SB
    .elsewhen (io.alu_op === 2.U){
        io.out := Cat(1.U, 0.U, io.func3)
    }
    //UJ
    .elsewhen (io.alu_op === 3.U){
        io.out := "b11111".U
    }
    //load
    .elsewhen (io.alu_op === 4.U){
        io.out := "b00000".U
    }
    //S
    .elsewhen (io.alu_op === 5.U){
        io.out := "b00000".U
    }
    //U_auipc
    .elsewhen (io.alu_op === 6.U){
        io.out := "b00000".U
    }
    //U_LUI
    .elsewhen (io.alu_op === 7.U){
        io.out := "b00000".U
    }
    .otherwise{
        io.out := 0.U
    }
}        