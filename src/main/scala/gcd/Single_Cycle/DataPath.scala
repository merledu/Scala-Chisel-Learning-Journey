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
  //val datamem = Module(new Datamem)
  val alu = Module(new ALU1)


  insmem.io.addr := pc.io.nextaddr
  cu.io.ins := insmem.io.inst
  alu.io.alu_Op := cu.io.func
  regfile.io.Wen := cu.io.RegWrite
  regfile.io.RD := cu.io.RD
  regfile.io.Rs1in := cu.io.Rs1
  regfile.io.Rs2in := cu.io.Rs2

  alu.io.in_A := regfile.io.Rs1out
  when(cu.io.Itype){
    alu.io.in_B := cu.io.Imm
  }
    .otherwise{
      alu.io.in_B := regfile.io.Rs2out
    }

  regfile.io.datain :=  alu.io.out

  io.out := alu.io.out


}