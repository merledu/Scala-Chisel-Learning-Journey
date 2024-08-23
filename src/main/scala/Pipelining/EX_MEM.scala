package Pipelining

import chisel3._
import chisel3.util._

class EX_MEM extends Module {
    val io = IO(new Bundle {
        val IDEX_MEMRD = Input (Bool())
        val IDEX_MEMWR = Input (Bool())
        val IDEX_MEMTOREG = Input(Bool())
        val IDEX_REG_W = Input(Bool())
        val IDEX_rs2 = Input (SInt(32.W))
        val IDEX_rd = Input(UInt(5.W))
        val alu_in = Input (SInt(32.W))

        val EXMEM_memRd_out = Output (Bool())
        val EXMEM_memWr_out = Output (Bool())
        val EXMEM_memToReg_out = Output (Bool())
        val EXMEM_regWrite_out = Output (Bool())
        val EXMEM_rs2_out = Output (SInt(32.W))
        val EXMEM_rd_out = Output (UInt(5.W))
        val EXMEM_alu_out = Output (SInt(32.W))
})

val memRead_reg = RegInit(0.U(1.W))
val memWrite_reg = RegInit(0.U(1.W))
val memToReg_reg = RegInit(0.U(1.W))
val regWrite_reg = RegInit(0.U(1.W))
val reg_rs2 = RegInit(0.S(32.W))
val reg_rd = RegInit(0.U(5.W))
val reg_alu_in = RegInit(0.S(32.W))

memRead_reg := io.IDEX_MEMRD
memWrite_reg := io.IDEX_MEMWR
memToReg_reg := io.IDEX_MEMTOREG
regWrite_reg := io.IDEX_REG_W
reg_rs2 := io.IDEX_rs2
reg_rd := io.IDEX_rd
reg_alu_in := io.alu_in

io.EXMEM_memRd_out := memRead_reg
io.EXMEM_memWr_out := memWrite_reg
io.EXMEM_memToReg_out := memToReg_reg
io.EXMEM_regWrite_out := regWrite_reg
io.EXMEM_rs2_out := reg_rs2
io.EXMEM_rd_out := reg_rd
io.EXMEM_alu_out := reg_alu_in
       
}
