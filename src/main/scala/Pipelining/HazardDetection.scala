package Pipelining

import chisel3._
import chisel3.util._

class HazardDetection extends Module {
  val io = IO(new Bundle {
    val IF_ID_inst = Input(UInt(32.W))
    val ID_EX_memRead = Input(Bool())
    val ID_EX_rd = Input(UInt(5.W))
    val pc_in = Input(SInt(32.W))
    val current_pc = Input(SInt(32.W))

    val inst_forward = Output(Bool())
    val pc_forward = Output(Bool())
    val ctrl_forward = Output(Bool())
    val inst_out = Output(UInt(32.W))
    val pc_out = Output(SInt(32.W))
    val current_pc_out = Output(SInt(32.W))
})

val Rs1 = io.IF_ID_inst(19, 15)
val Rs2 = io.IF_ID_inst(24, 20)

when(io.ID_EX_memRead === "b1".U && ((io.ID_EX_rd === Rs1) || (io.ID_EX_rd === Rs2))) {
    io.inst_forward := 1.U
    io.pc_forward := 1.U
    io.ctrl_forward := 1.U
    io.inst_out := io.IF_ID_inst
    io.pc_out := io.pc_in
    io.current_pc_out := dontTouch(io.current_pc)

}.otherwise {
    io.inst_forward := 0.U
    io.pc_forward := 0.U
    io.ctrl_forward := 0.U
    io.inst_out := io.IF_ID_inst 
    io.pc_out := io.pc_in         
    io.current_pc_out := dontTouch(io.current_pc)
  }
}