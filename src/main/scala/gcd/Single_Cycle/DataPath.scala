package Single_Cycle

import lab_4.ALU1
import chisel3 . _
import chisel3 . util . _

class DataPath extends Module {
  val io = IO(new Bundle {
    val out = Output(UInt(32.W))
  })
  io.out := 0.U

  val pc = Module(new PC)
  val cu = Module(new CU)
  val regfile = Module(new RegisterFile)
  val insmem = Module(new InstMem("C:/Users/Hamza's Son/Desktop/DSA SEM2 Java project/Scala-Chisel-Learning-Journey/src/main/scala/gcd/Single_Cycle/Imem.txt"))
  val datamem = Module(new Datamem)
  val alu = Module(new ALU1)


  insmem.io.addr := pc.io.nextaddr
  cu.io.ins := insmem.io.inst
  alu.io.alu_Op := Mux(cu.io.aluselect,0.U,cu.io.func)
  regfile.io.Wen := cu.io.RegWrite
  datamem.io.Wen := cu.io.MemWrite
  regfile.io.RD := cu.io.RD
  regfile.io.Rs1in := cu.io.Rs1
  regfile.io.Rs2in := cu.io.Rs2
  datamem.io.datain := regfile.io.Rs2out
  alu.io.in_A := regfile.io.Rs1out
  alu.io.in_B := Mux(!cu.io.Instype ,  cu.io.Imm, regfile.io.Rs2out)
  datamem.io.addr := alu.io.out
  datamem.io.datain := Mux(cu.io.wbselect, regfile.io.Rs2out, MuxLookup(cu.io.lengthselect, 0.U, Array(
    (0.U) -> regfile.io.Rs2out(8, 0),
    (1.U) -> regfile.io.Rs2out(15, 0),
    (2.U) -> regfile.io.Rs2out)))


  regfile.io.datain := Mux(cu.io.wbselect, alu.io.out,MuxLookup(cu.io.lengthselect,0.U , Array(
    (0.U) -> datamem.io.dataout(8,0),
    (1.U) -> datamem.io.dataout(15,0),
    (2.U) -> datamem.io.dataout)))
  io.out := alu.io.out


}