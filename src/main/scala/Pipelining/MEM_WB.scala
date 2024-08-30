package Pipelining

import chisel3._
import chisel3.util._

class MEM_WB extends Module {
    val io = IO(new Bundle {
        val EXMEM_MEMTOREG = Input (Bool())
        val EXMEM_REG_W = Input (Bool())
        val EXMEM_MEMRD = Input(UInt(5.W))
        val EXMEM_rd = Input (UInt(5.W))
        val in_dataMem = Input (SInt(32.W))
        val in_alu_out = Input (SInt(32.W))

        val MEMWB_memToReg_out = Output(Bool())
        val MEMWB_reg_w_out = Output(Bool())
        val MEMWB_rd_out = Output(UInt(5.W))
        val MEMWB_memRd_out = Output(Bool())
        val MEMWB_dataMem_out = Output(SInt(32.W))
        val MEMWB_alu_out = Output(SInt(32.W))
})
 
val reg_memToReg = RegInit(0.U(1.W))
val reg_reg_w = RegInit(0.U(1.W))
val reg_memRd = RegInit(0.U(1.W))
val reg_rd = RegInit(0.U(5.W))
val reg_dataMem = RegInit(0.S(32.W))
val reg_alu_out = RegInit(0.S(32.W))

reg_memToReg := io.EXMEM_MEMTOREG
reg_reg_w := io.EXMEM_REG_W
reg_memRd := io.EXMEM_MEMRD
reg_rd := io.EXMEM_rd
reg_dataMem := io.in_dataMem
reg_alu_out := io.in_alu_out

io.MEMWB_memToReg_out := reg_memToReg
io.MEMWB_reg_w_out := reg_reg_w
io.MEMWB_memRd_out := reg_memRd
io.MEMWB_rd_out := reg_rd
io.MEMWB_dataMem_out := reg_dataMem
io.MEMWB_alu_out := reg_alu_out

}