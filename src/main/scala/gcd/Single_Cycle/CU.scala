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
    val Instype = Output(Bool())  //Immidiate / Register select
    val RegWrite = Output(Bool())
    val MemWrite = Output(Bool())
    val func = Output(UInt(5.W))
    val wbselect = Output(UInt(2.W))
    val aluselect = Output(Bool()) // 1 when S type to perform addition / else 0
    val lengthselect = Output(UInt(2.W))
    val dobranch = Input(Bool())
    val btypefun = Output(UInt(4.W))
    val pcselec = Output(Bool())
    val btype = Output(Bool())
    val jump = Output(Bool())
    val readmem = Output(Bool())


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
  io.btypefun := 0.U
  io.btype := 0.B
  io.jump :=0.B
  io.readmem := 0.B

  when(Opcode === "b0110011".U){  // R type
    io.RD:= io.ins(11,7)
    io.func := Cat(io.ins(14,12),io.ins(30))
    io.Rs1 := io.ins(19,15)
    io.Rs2 := io.ins(24,20)
    io.Imm :=0.U
    io.RegWrite := true.B
    io.MemWrite := false.B
    io.aluselect := false.B
    io.Instype := true.B
    io.wbselect := true.B
    io.lengthselect := 0.U
    io.pcselec := 0.B


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
      io.Imm := Cat(Fill(19,io.ins(31)),io.ins(31, 20))
      io.RegWrite := true.B
      io.MemWrite := false.B
      io.Instype := false.B
      io.wbselect := true.B
      io.aluselect := false.B
      io.lengthselect := 0.U
      io.pcselec := 0.B


    }
    .elsewhen(Opcode === "b0000011".U){  // Load
      io.RD := io.ins(11, 7)
      io.func := 0.U
      io.Rs1 := io.ins(19, 15)
      io.Rs2 := 0.U
      io.Imm := Cat(Fill(19,io.ins(31)),io.ins(31, 20))
      io.RegWrite := true.B
      io.MemWrite := false.B
      io.Instype := false.B
      io.wbselect := false.B
      io.aluselect := false.B
      io.lengthselect := io.ins(14, 12)
      io.pcselec := 0.B
      io.readmem := 1.B

    }
    .elsewhen(Opcode === "b0100011".U) { //store
      io.RD := io.ins(11, 7)
      io.func := 0.U
      io.Rs1 := io.ins(19, 15)
      io.Rs2 := io.ins(24,20)
      io.Imm :=(Cat(Fill(19,io.ins(31)),io.ins(31, 25),io.ins(11,7)))
      io.RegWrite := false.B
      io.MemWrite := true.B
      io.Instype := false.B
      io.wbselect := false.B
      io.aluselect := true.B
      io.lengthselect := io.ins(14, 12)
      io.pcselec := 0.B


    }
    .elsewhen(Opcode === "b1100011".U){ // B type
      io.func := 0.U
      io.RD := 0.U
      io.btypefun := io.ins(14, 12)
      io.Rs1 := io.ins(19, 15)
      io.Rs2 := io.ins(24, 20)
      io.Imm := ((Cat(Fill(19,io.ins(31)),io.ins(31),io.ins(7),io.ins(30,25),io.ins(11,8),0.U)))
      io.MemWrite := false.B
      io.RegWrite := false.B
      io.Instype := false.B
      io.lengthselect := 0.U
      io.aluselect := true.B
      io.wbselect := false.B
      io.btype := 1.B

      io.pcselec := Mux(io.dobranch && io.btype, true.B, false.B)

    }.elsewhen(Opcode === "b1101111".U) {// jal
    io.RD := io.ins(11,7)
    io.Imm := ((Cat(Fill(11,io.ins(31)),io.ins(31),io.ins(19,12),io.ins(20),io.ins(30,21),0.U)))
    io.func := 0.U
    io.Rs1 := 0.U
    io.Rs2 := 0.U
    io.MemWrite := false.B
    io.RegWrite := true.B
    io.Instype := false.B
    io.lengthselect := 0.U
    io.aluselect := false.B
    io.wbselect := 2.U
    io.btype := 0.B
    io.pcselec := 1.B
    io.jump := 1.B


  }
    .elsewhen(Opcode === "b1100111".U){ //jalr
      io.Imm := Cat(Fill(11,io.ins(31)),io.ins(31,20))
      io.Rs1 := io.ins(19,15)
      io.func := (io.ins(14,12))
      io.Rs2 := 0.U
      io.RD := io.ins(11,7)
      io.MemWrite := false.B
      io.RegWrite := true.B
      io.Instype := false.B
      io.lengthselect := 0.U
      io.aluselect := true.B
      io.wbselect := true.B
      io.btype := 0.B
      io.pcselec := 1.B
      io.jump := 0.B
    }
    .elsewhen(Opcode === "b0110111".U){ //lui
      io.Imm := Cat(io.ins(31,12),Fill(11 ,0.U ),0.U)
      io.func :=0.U
      io.Rs2 := 0.U
      io.Rs1 := 0.U
      io.RD := io.ins(11,7)
      io.MemWrite := false.B
      io.RegWrite := true.B
      io.Instype := false.B
      io.lengthselect := 0.U
      io.aluselect := true.B
      io.wbselect := true.B
      io.btype := 0.B
      io.jump := 0.B
      io.pcselec := 0.B
    }
    .elsewhen(Opcode === "b0010111".U) { //LUIPC
      io.Imm := Cat(io.ins(31, 12), Fill(11, 0.U), 0.U)
      io.func := 0.U
      io.Rs2 := 0.U
      io.Rs1 := 0.U
      io.RD := 0.U
      io.MemWrite := false.B
      io.RegWrite := false.B
      io.Instype := false.B
      io.lengthselect := 0.U
      io.aluselect := true.B
      io.wbselect := false.B
      io.btype := 0.B
      io.jump := 1.B
      io.pcselec := 1.B
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
      io.wbselect :=false.B
      io.aluselect := false.B
      io.lengthselect := 0.U
      io.pcselec := 0.B



    }






}
