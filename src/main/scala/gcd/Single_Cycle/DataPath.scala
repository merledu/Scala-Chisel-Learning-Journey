package Single_Cycle

import lab_4.ALU1
import chisel3 . _
import chisel3 . util . _

class DataPath extends Module {
  val io = IO(new Bundle {
    val out = Output(SInt(32.W))
  })
  io.out := 0.S

  //val pc = Module(new PC)
  val cu = Module(new CU)
  val regfile = Module(new RegisterFile)
  val insmem = Module(new InstMem("C:/Users/Hamza's Son/Desktop/DSA SEM2 Java project/Scala-Chisel-Learning-Journey/src/main/scala/gcd/Single_Cycle/Imem.txt"))
  val datamem = Module(new Datamem)
  val alu = Module(new ALU1)
  val checkbranch = Module(new BranchALU)

  val pc = RegInit(0.U(32.W))
  pc := Mux(cu.io.pcselec,(alu.io.out).asUInt(),pc+1.U)




  cu.io.dobranch := checkbranch.io.doBranch
  checkbranch.io.fun3:=cu.io.btypefun
  insmem.io.addr := pc
  checkbranch.io.isBtype := cu.io.btype
  cu.io.ins := insmem.io.inst
  alu.io.alu_Op := Mux(cu.io.aluselect,0.U,cu.io.func)
  regfile.io.Wen := cu.io.RegWrite
  datamem.io.Wen := cu.io.MemWrite
  regfile.io.RD := cu.io.RD
  regfile.io.Rs1in := cu.io.Rs1
  regfile.io.Rs2in := cu.io.Rs2
  datamem.io.datain := regfile.io.Rs2out
  checkbranch.io.in_A := regfile.io.Rs1out
  checkbranch.io.in_B := regfile.io.Rs2out
  regfile.io.datain := alu.io.out

  alu.io.in_A := Mux(checkbranch.io.doBranch || cu.io.jump , pc.asSInt(), regfile.io.Rs1out)
  alu.io.in_B := Mux(!cu.io.Instype , cu.io.Imm , regfile.io.Rs2out)
  datamem.io.addr := alu.io.out.asUInt()
  datamem.io.datain := Mux(cu.io.wbselect===1.U, regfile.io.Rs2out, MuxLookup(cu.io.lengthselect, 0.S, Array(
    (0.U) -> regfile.io.Rs2out(8, 0).asSInt(),
    (1.U) -> regfile.io.Rs2out(15, 0).asSInt(),
    (2.U) -> regfile.io.Rs2out.asSInt())))


    when(cu.io.wbselect === 1.U){
    regfile.io.datain := alu.io.out}
    .elsewhen(cu.io.wbselect === 0.U) {
    regfile.io.datain := MuxLookup(cu.io.lengthselect, 0.S, Array(
      (0.U) -> datamem.io.dataout(8, 0).asSInt(),
      (1.U) -> datamem.io.dataout(15, 0).asSInt(),
      (2.U) -> datamem.io.dataout.asSInt()))
  }
      .elsewhen(cu.io.wbselect === 2.U){
        regfile.io.datain := (pc +1.U).asSInt()
      }
  io.out := alu.io.out



}