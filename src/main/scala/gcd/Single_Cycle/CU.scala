package Single_Cycle

import chisel3 . _
import chisel3 . util . _

class CU extends Module {
  val io = IO(new Bundle {
    val ins = Input(UInt(32.W))
    val RD = Output(UInt(5.W))
    val Rs1 = Output(UInt(5.W))
    val Rs2 = Output(UInt(5.W))
    val Imm = Output(UInt(32.W))
    val Instype = Output(Bool())
    val RegWrite = Output(Bool())
    val MemWrite = Output(Bool())
    val func = Output(UInt(5.W))

  })
//  io.RD := 0.U
//  io.func := 0.U
//  io.Rs1 := 0.U
//  io.Rs2 := 0.U
//  io.RegWrite := false.B
//  io.MemWrite := false.B
//  io.Instype := false.B
//  io.Imm :=0.U
  val Opcode = io.ins(6,0)

  when(Opcode === "b0110011".U){
    io.RD:= io.ins(11,7)
    io.func := Cat(io.ins(14,12),io.ins(30))
    io.Rs1 := io.ins(19,15)
    io.Rs2 := io.ins(24,20)
    io.Imm :=0.U
    io.RegWrite := true.B
    io.MemWrite := false.B
    io.Instype := true.B
  }
    .elsewhen(Opcode === "b0010011".U){
      io.RD:= io.ins(11,7)
      io.func := io.ins(14,12)
      io.Rs1 := io.ins(19,15)
      io.Rs2 := 0.U
      io.Imm := io.ins(31,20)
      io.RegWrite := true.B
      io.MemWrite := false.B
      io.Instype := false.B

    }
    .otherwise{
      io.RD := 0.U
      io.func := 0.U
      io.Rs1 := 0.U
      io.Rs2 := 0.U
      io.RegWrite := false.B
      io.MemWrite := false.B
      io.Instype := false.B
      io.Imm := 0.U

    }






}
