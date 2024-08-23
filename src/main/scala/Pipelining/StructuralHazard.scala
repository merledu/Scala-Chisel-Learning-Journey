package Pipelining

import chisel3._
import chisel3.util._

class StructuralHazard extends Module {
  val io = IO(new Bundle {
    val rs1 = Input(UInt(5.W))
    val rs2 = Input(UInt(5.W))
    val MEM_WB_regWr = Input(UInt(1.W))
    val MEM_WB_Rd = Input(UInt(5.W))
    val fwd_rs1 = Output(UInt(1.W))
    val fwd_rs2 = Output(UInt(1.W))
})

when(io.MEM_WB_regWr === 1.U &&  io.MEM_WB_Rd === io.rs1) {
    io.fwd_rs1 := 1.U
}.otherwise {
    io.fwd_rs1 := 0.U
}

when(io.MEM_WB_regWr === 1.U && io.MEM_WB_Rd === io.rs2) {
    io.fwd_rs2 := 1.U
}.otherwise {
    io.fwd_rs2 := 0.U
}
}