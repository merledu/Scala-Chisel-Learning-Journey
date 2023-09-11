package Single_Cycle

import chisel3 . _
import chisel3 . util . _

class CU extends Module {
  val io = IO(new Bundle {
    val ins = Input(UInt(32.W))
    val RD = Output(UInt(5.W))
    val Rs1 = Output(UInt(5.W))
    val Rs2 = Output(UInt(5.W))
    val Imm = Output(SInt(32.W))
    val Instype = Output(Bool())  //Immidiate / Register select
    val RegWrite = Output(Bool())
    val MemWrite = Output(Bool())
    val func = Output(UInt(5.W))
    val wbselect = Output(Bool())
    val aluselect = Output(Bool()) // 1 when S type to perform addition / else 0
    val lengthselect = Output(UInt(2.W))

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

  when(Opcode === "b0110011".U){  // R type
    io.RD:= io.ins(11,7)
    io.func := Cat(io.ins(14,12),io.ins(30))
    io.Rs1 := io.ins(19,15)
    io.Rs2 := io.ins(24,20)
    io.Imm :=0.S
    io.RegWrite := true.B
    io.MemWrite := false.B
    io.aluselect := false.B
    io.Instype := true.B
    io.wbselect := true.B
    io.lengthselect := 0.U
  }
    .elsewhen(Opcode === "b0010011".U){  // I type
      io.RD:= io.ins(11,7)
      io.func := MuxLookup(io.ins(14, 12), 0.U, Array(
        (0.U) -> 0.U,
        (1.U) -> 2.U,
        (2.U) -> 4.U,
        (3.U) -> 6.U,
        (4.U) -> 8.U,
        (5.U) -> Mux(io.ins(30),11.U,10.U),
        (6.U) -> 12.U,
        (7.U) -> 14.U,
      ))
      io.Rs1 := io.ins(19,15)
      io.Rs2 := 0.U
      io.Imm := io.ins(31,20).asSInt()
      io.RegWrite := true.B
      io.MemWrite := false.B
      io.Instype := false.B
      io.wbselect := true.B
      io.aluselect := false.B
      io.lengthselect := 0.U


    }
    .elsewhen(Opcode === "b0000011".U){  // Load
      io.RD := io.ins(11, 7)
      io.func := io.ins(14, 12)
      io.Rs1 := io.ins(19, 15)
      io.Rs2 := 0.U
      io.Imm := io.ins(31, 20).asSInt()
      io.RegWrite := true.B
      io.MemWrite := false.B
      io.Instype := false.B
      io.wbselect := true.B
      io.aluselect := false.B
      io.lengthselect := io.ins(13, 12)

    }
    .elsewhen(Opcode === "b0100011".U) { //store
      io.RD := io.ins(11, 7)
      io.func := 0.U
      io.Rs1 := io.ins(19, 15)
      io.Rs2 := io.ins(24,20)
      io.Imm :=(Cat(io.ins(11,7),io.ins(31, 25))).asSInt()
      io.RegWrite := false.B
      io.MemWrite := true.B
      io.Instype := false.B
      io.wbselect := false.B
      io.aluselect := true.B
      io.lengthselect := io.ins(14, 12)


    }
    .otherwise{
      io.RD := 0.U
      io.func := 0.U
      io.Rs1 := 0.U
      io.Rs2 := 0.U
      io.RegWrite := false.B
      io.MemWrite := false.B
      io.Instype := false.B
      io.Imm := 0.S
      io.wbselect :=false.B
      io.aluselect := false.B
      io.lengthselect := 0.U

    }






}
