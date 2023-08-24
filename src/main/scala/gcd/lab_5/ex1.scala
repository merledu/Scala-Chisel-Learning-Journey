package lab_5
import chisel3._
import chisel3.util._
//import chisel3 . iotesters .{ Driver , PeekPokeTester }

class IO_Interface(OPwidth: Int , Datawidth :Int) extends Bundle {
  val alu_oper = Input(UInt(OPwidth.W))
  val arg_x = Input(UInt(Datawidth.W))
  val arg_y = Input(UInt(Datawidth.W))
  val alu_out = Output(UInt(OPwidth.W))
}

class ALU ( OPwidth: Int , Datawidth :Int ) extends Module {
  val io = IO(new IO_Interface(OPwidth, Datawidth))
  val index = log2Ceil(Datawidth)
  when(io.alu_oper === "b0000".U) {
    io.alu_out := io.arg_x & io.arg_y
  }// OR
    .elsewhen(io.alu_oper === "b0001".U) {
      io.alu_out := io.arg_x | io.arg_y
    }
    .elsewhen(io.alu_oper === "b0010".U) {
      io.alu_out := io.arg_x + io.arg_y
    }
    .elsewhen(io.alu_oper === "b0110".U) {
      io.alu_out := io.arg_x - io.arg_y
    } // XOR
    .elsewhen(io.alu_oper === "b0011".U) {
      io.alu_out := io.arg_x ^ io.arg_y
    } // SLL
    .elsewhen(io.alu_oper === "b0100".U) {
      io.alu_out := io.arg_x << io.arg_y(index - 1, 0)
    } // SRL
    .elsewhen(io.alu_oper === "b0101".U) {
      io.alu_out := io.arg_x >> io.arg_y(index - 1, 0)
    } // SRA
    .elsewhen(io.alu_oper === "b0111".U) {
      io.alu_out := (io.arg_x.asSInt >> io.arg_y(index - 1, 0)).asUInt
    } // SLT
    .elsewhen(io.alu_oper === "b1000".U) {
      io.alu_out := io.arg_x.asSInt < io.arg_y.asSInt
    } // SLTU
    .elsewhen(io.alu_oper === "b1001".U) {
      io.alu_out := io.arg_x < io.arg_y
    }
    .otherwise{
      io.alu_out :=0.U
  }


//  println((new chisel3.stage.ChiselStage).emitVerilog(new ALU(32, 32)))
//  println((new chisel3.stage.ChiselStage).emitVerilog(new ALU(64, 64)))
}