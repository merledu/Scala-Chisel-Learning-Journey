package Pipelining

import chisel3._
import chisel3.util._

class IF_ID extends Module {
    val io = IO(new Bundle {
        val pc_in = Input (SInt(32.W))
        val pc4_in = Input (UInt(32.W))
        val mux_pc_in = Input(SInt(32.W))
        val mux_inst_in = Input(UInt(32.W))
        

        val pc_out = Output (SInt(32.W))
        val pc4_out = Output (UInt(32.W))
        val mux_pc_out = Output(SInt(32.W))
        val mux_inst_out = Output(UInt(32.W))
        
})

val pc_in_reg = RegInit (0.S (32.W))
val pc4_reg = RegInit (0.U (32.W))
val mux_pc_reg = RegInit(0.S(32.W))
val mux_inst_reg = RegInit(0.U(32.W))


pc_in_reg := io.pc_in
pc4_reg := io.pc4_in
mux_pc_reg := io.mux_pc_in
mux_inst_reg := io.mux_inst_in


io.pc_out := pc_in_reg
io.pc4_out := pc4_reg
io.mux_pc_out := mux_pc_reg
io.mux_inst_out := mux_inst_reg

}