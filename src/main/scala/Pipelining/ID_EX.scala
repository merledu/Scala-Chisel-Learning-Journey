package Pipelining

import chisel3._
import chisel3.util._

class ID_EX extends Module{
    val io = IO(new Bundle{
        val IF_ID_pc4_in = Input(UInt(32.W))
        // val IF_ID_pc_in = Input(UInt(32.W))
        val rs1_in = Input(UInt(5.W))
        val rs2_in = Input(UInt(5.W))
        val rs1_data_in = Input(SInt(32.W))
        val rs2_data_in = Input(SInt(2.W))
        val rd_in = Input(UInt(5.W))
        val immm_in = Input(SInt(32.W))
        val fun3_in =Input(UInt(3.W))
        val func7_in = Input(Bool())
        val ctrl_memWrite_in = Input(Bool())
        val ctrl_branch_in = Input(Bool())
        val ctrl_memRead_in = Input(Bool())
        val ctrl_regWrite_in = Input(Bool())
        val ctrl_memtoReg_in = Input(Bool())
        val ctrl_aluOp_in = Input(UInt(3.W))
        val ctrl_OpA_in = Input(UInt(2.W))
        val ctrl_OpB_in = Input(Bool())
        val ctrl_nextpc_in = Input(UInt(2.W))
   



        val IF_ID_pc4_out = Output(UInt(32.W))
        // val IF_ID_pc_out = Output(UInt(32.W))
        val rs1_out = Output(UInt(5.W))
        val rs2_out = Output(UInt(5.W))
        val rs1_data_out = Output(SInt(32.W))
        val rs2_data_out = Output(SInt(2.W))
        val rd_out = Output(UInt(5.W))
        val immm_out = Output(SInt(32.W))
        val fun3_out =Output(UInt(3.W))
        val func7_out = Output(Bool())
        val ctrl_memWrite_out = Output(Bool())
        val ctrl_branch_out = Output(Bool())
        val ctrl_memRead_out = Output(Bool())
        val ctrl_regWrite_out = Output(Bool())
        val ctrl_memtoReg_out = Output(Bool())
        val ctrl_aluOp_out = Output(UInt(3.W))
        val ctrl_OpA_out = Output(UInt(2.W))
        val ctrl_OpB_out = Output(Bool())
        val ctrl_nextpc_out = Output(UInt(2.W))
        
    })


val IF_ID_pc4_reg = RegInit(0.U(32.W))
val rs1_reg = RegInit(0.U(5.W))
val rs2_reg = RegInit(0.U(5.W))
val rs1_data_reg = RegInit(0.S(32.W))
val rs2_data_reg = RegInit(0.S(32.W))
val rd_reg = RegInit(0.U(5.W))
val immm_reg = RegInit(0.S(32.W))
val fun3_reg = RegInit(0.U(3.W))
val func7_reg = RegInit(0.U(1.W))
val ctrl_memWrite_reg = RegInit(0.U(1.W))
val ctrl_branch_reg = RegInit(0.U(1.W))
val ctrl_memRead_reg = RegInit(0.U(1.W))
val ctrl_regWrite_reg = RegInit(0.U(1.W))
val ctrl_memtoReg_reg = RegInit(0.U(1.W))
val ctrl_aluOp_reg = RegInit(0.U(3.W))
val ctrl_OpA_reg = RegInit(0.U(2.W))
val ctrl_OpB_reg = RegInit(0.U(1.W))
val ctrl_nextpc_reg = RegInit(0.U(2.W))




IF_ID_pc4_reg := io.IF_ID_pc4_in
rs1_reg := io.rs1_in
rs2_reg := io.rs2_in
rs1_data_reg := io.rs1_data_in
rs2_data_reg := io.rs2_data_in
rd_reg := io.rd_in
immm_reg := io.immm_in
fun3_reg := io.fun3_in
func7_reg := io.func7_in
ctrl_memWrite_reg := io.ctrl_memWrite_in
ctrl_branch_reg := io.ctrl_branch_in
ctrl_memRead_reg := io.ctrl_memRead_in
ctrl_regWrite_reg := io.ctrl_regWrite_in
ctrl_memtoReg_reg := io.ctrl_memtoReg_in
ctrl_aluOp_reg := io.ctrl_aluOp_in
ctrl_OpA_reg := io.ctrl_OpA_in
ctrl_OpB_reg := io.ctrl_OpB_in
ctrl_nextpc_reg := io.ctrl_nextpc_in


io.IF_ID_pc4_out := IF_ID_pc4_reg
io.rs1_out := rs1_reg
io.rs2_out := rs2_reg
io.rs1_data_out := rs1_data_reg 
io.rs2_data_out := rs2_data_reg 
io.rd_out := rd_reg
io.immm_out := immm_reg
io.fun3_out := fun3_reg
io.func7_out := func7_reg
io.ctrl_memWrite_out := ctrl_memWrite_reg
io.ctrl_branch_out := ctrl_branch_reg
io.ctrl_memRead_out := ctrl_memRead_reg 
io.ctrl_regWrite_out := ctrl_regWrite_reg
io.ctrl_memtoReg_out := ctrl_memtoReg_reg
io.ctrl_aluOp_out := ctrl_aluOp_reg 
io.ctrl_OpA_out := ctrl_OpA_reg
io.ctrl_OpB_out := ctrl_OpB_reg
io.ctrl_nextpc_out := ctrl_nextpc_reg

} 