package RISCV

import chisel3._
import chisel3.util._

class Top extends Module {
    val io = IO (new Bundle{
        val out = Output(SInt(32.W))
        val address = Input(UInt(10.W))
        val data = Output(UInt(32.W))
    })
//objects
val Alu = Module(new ALU)
val AluControl = Module(new AluControl)
val Branch = Module(new Branch)
dontTouch(Branch.io)
val Control = Module(new Control)
val DataMem = Module(new DataMemory)
val ImmGen = Module(new ImmGen)
val InstMem = Module(new InstMemory("C:/Users/layba/Downloads/CHISEL3LABS/instmem.txt"))
val JalR = Module(new JalR)
val PC = Module(new ProgramCounter)
val RegFile = Module(new RegFile)

//PC.io.pc_in := PC.io.pc4
InstMem.io.address := PC.io.pc_out(21,2)
io.data := InstMem.io.data
Control.io.opcode := InstMem.io.data(6,0)
RegFile.io.write_Reg := InstMem.io.data(11,7)
ImmGen.io.instr := InstMem.io.data
AluControl.io.func3 := InstMem.io.data(14,12)
AluControl.io.func7 := InstMem.io.data(30)


RegFile.io.Reg_write := Control.io.regWrite
RegFile.io.Reg1 := Mux(Control.io.opcode === 51.U || Control.io.opcode === 19.U || Control.io.opcode === 35.U || Control.io.opcode === 3.U || Control.io.opcode === 99.U || Control.io.opcode === 103.U, InstMem.io.data(19,15),0.U)
RegFile.io.Reg2 := Mux(Control.io.opcode === 51.U || Control.io.opcode === 35.U || Control.io.opcode === 3.U, InstMem.io.data(24,20), 0.U)


Alu.io.in_A := MuxLookup(Control.io.operand_A_sel, 0.S, Array(
    (0.U) -> RegFile.io.rData1,
    (1.U) -> PC.io.pc4,
    (2.U) -> PC.io.pc_out,
    (3.U) -> RegFile.io.rData1
))
ImmGen.io.pc := PC.io.pc_out.asUInt
val a = MuxLookup(Control.io.extend_sel, 0.S, Array(
    (0.U) -> ImmGen.io.I_Type,
    (1.U) -> ImmGen.io.S_Type,
    (2.U) -> ImmGen.io.U_Type
))

Alu.io.in_B := MuxLookup(Control.io.operand_B_sel, 0.S, Array(
    (0.U) -> RegFile.io.rData2,
    (1.U) -> a
))
AluControl.io.alu_op := Control.io.aLUoperation
Alu.io.alu_Op := AluControl.io.out

   
val c = Branch.io.br_taken & Control.io.branch

JalR.io.immed := a.asUInt
JalR.io.readata1 := RegFile.io.rData1.asUInt


val b = MuxLookup(c, 0.S, Array(
    (0.U) -> PC.io.pc4,
    (1.U) -> ImmGen.io.SB_Type
))

PC.io.pc_in := MuxLookup(Control.io.next_pc_sel, 0.S, Array(
    (0.U) -> PC.io.pc4.asSInt,
    (1.U) -> b,
    (2.U) -> ImmGen.io.UJ_Type,
    (3.U) -> JalR.io.out.asSInt
))

Branch.io.fnct3 := AluControl.io.func3
Branch.io.branch := Control.io.branch
Branch.io.arg_x := RegFile.io.rData1
Branch.io.arg_y := RegFile.io.rData2

DataMem.io.Addr := Alu.io.out.asUInt
DataMem.io.DataIn := RegFile.io.Reg2.asSInt
DataMem.io.mem_write := Control.io.memwrite
DataMem.io.mem_read := Control.io.memRead


RegFile.io.write_data := MuxLookup(Control.io.memtoReg, 0.S, Array(
    (0.U) -> Alu.io.out,
    (1.U) -> DataMem.io.DataOut
))    

io.out := 0.S
}