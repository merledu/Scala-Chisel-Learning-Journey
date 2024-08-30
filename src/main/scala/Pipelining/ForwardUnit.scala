package Pipelining

import chisel3._
import chisel3.util._

class ForwardUnit extends Module {
    val io = IO(new Bundle {
        val IDEX_rs1 = Input(UInt(5.W))
        val IDEX_rs2 = Input(UInt(5.W))
        val EXMEM_rd = Input(UInt(5.W))
        val EXMEM_regWr = Input(UInt(1.W))
        val MEMWB_rd = Input(UInt(5.W))
        val MEMWB_regWr = Input(UInt(1.W))
        
        val forward_a = Output(UInt(2.W))
        val forward_b = Output(UInt(2.W))
})

io.forward_a := "b00".U
io.forward_b := "b00".U

// EX HAZARD
when(io.EXMEM_regWr === "b1".U && io.EXMEM_rd =/= "b00000".U && 
        (io.EXMEM_rd === io.IDEX_rs1.asUInt) && (io.EXMEM_rd === io.IDEX_rs2)) {
    io.forward_a := "b10".U
    io.forward_b := "b10".U

}.elsewhen(io.EXMEM_regWr === "b1".U && io.EXMEM_rd =/= "b00000".U && 
        (io.EXMEM_rd === io.IDEX_rs2)) {    
    io.forward_b := "b10".U
  
}.elsewhen(io.EXMEM_regWr === "b1".U && io.EXMEM_rd =/= "b00000".U && 
        (io.EXMEM_rd === io.IDEX_rs1)) {    
    io.forward_a := "b10".U
}

// MEM HAZARD
when((io.MEMWB_regWr === "b1".U) && (io.MEMWB_rd =/= "b00000".U) && (io.MEMWB_rd === io.IDEX_rs1) && (io.MEMWB_rd === io.IDEX_rs2) && 
        ~(io.EXMEM_regWr === "b1".U && io.EXMEM_rd =/= "b00000".U && (io.EXMEM_rd === io.IDEX_rs1) && (io.EXMEM_rd === io.IDEX_rs2))) {
    io.forward_a := "b01".U
    io.forward_b := "b01".U

}.elsewhen((io.MEMWB_regWr === "b1".U) && (io.MEMWB_rd =/= "b00000".U) && (io.MEMWB_rd === io.IDEX_rs2) && 
        ~(io.EXMEM_regWr === "b1".U && io.EXMEM_rd =/= "b00000".U && (io.EXMEM_rd === io.IDEX_rs2))){
    io.forward_b := "b01".U

}.elsewhen((io.MEMWB_regWr === "b1".U) && (io.MEMWB_rd =/= "b00000".U) && (io.MEMWB_rd === io.IDEX_rs1) && 
        ~(io.EXMEM_regWr === "b1".U && io.EXMEM_rd =/= "b00000".U && (io.EXMEM_rd === io.IDEX_rs1))){
    io.forward_a := "b01".U
    }
}