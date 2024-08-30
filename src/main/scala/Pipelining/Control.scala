package Pipelining
import chisel3._
import chisel3.util._
        
class Control extends Module{
    val io = IO (new Bundle{
        val opcode = Input (UInt(7.W))
        val memwrite = Output (Bool())
        val branch = Output (Bool())
        val memRead = Output (Bool())
        val regWrite = Output (Bool())
        val memtoReg = Output (Bool())
        val aLUoperation = Output (UInt(3.W))
        val operand_A_sel = Output (UInt(2.W))
        val operand_B_sel = Output (Bool())
        val extend_sel = Output (UInt(2.W))
        val next_pc_sel = Output (UInt(2.W))
        val AMO_out = Output(Bool())
    })

    io.memtoReg := 0.U
    io.AMO_out := 0.U
    
    //R
    when (io.opcode === 51.U){
        io.memwrite := 0.B 
        io.branch := 0.B 
        io.memRead := 0.B 
        io.regWrite := 1.B  
        io.memtoReg := 0.B 
        io.aLUoperation := 0.B  
        io.operand_A_sel := 0.B  
        io.operand_B_sel := 0.B 
        io.extend_sel := 0.B 
        io.next_pc_sel := 0.B  
    }     
    //I    
    .elsewhen (io.opcode === 19.U){
        io.memwrite := 0.B 
        io.branch := 0.B 
        io.memRead := 0.B 
        io.regWrite := 1.B  
        io.memtoReg := 0.B 
        io.aLUoperation := 1.U 
        io.operand_A_sel := 0.U 
        io.operand_B_sel := 1.B 
        io.extend_sel := 0.U 
        io.next_pc_sel := 0.U 
    }
    //S
    .elsewhen (io.opcode === 35.U){
        io.memwrite := 1.B 
        io.branch := 0.B 
        io.memRead := 0.B 
        io.regWrite := 0.B  
        io.memtoReg := 0.B 
        io.aLUoperation := 5.U  
        io.operand_A_sel := 0.U 
        io.operand_B_sel := 1.B 
        io.extend_sel := 1.U 
        io.next_pc_sel := 0.U 
    }
    //Load
    .elsewhen (io.opcode === 3.U){
        io.memwrite := 0.B 
        io.branch := 0.B 
        io.memRead := 1.B 
        io.regWrite := 1.B  
        io.memtoReg := 1.B 
        io.aLUoperation := 4.U 
        io.operand_A_sel := 0.U 
        io.operand_B_sel := 1.B 
        io.extend_sel := 0.U 
        io.next_pc_sel := 0.U   
    }
    //SB
    .elsewhen (io.opcode === 99.U){
        io.memwrite := 0.B 
        io.branch := 1.B 
        io.memRead := 0.B 
        io.regWrite := 0.B  
        io.memtoReg := 0.B 
        io.aLUoperation := 2.U 
        io.operand_A_sel := 0.U 
        io.operand_B_sel := 0.B 
        io.extend_sel := 0.U 
        io.next_pc_sel := 1.U 
    }
    //UJ
    .elsewhen (io.opcode === 111.U){
        io.memwrite := 0.B 
        io.branch := 0.B 
        io.memRead := 0.B 
        io.regWrite := 1.B  
        io.memtoReg := 0.B 
        io.aLUoperation := 3.U  
        io.operand_A_sel := 1.U
        io.operand_B_sel := 0.B 
        io.extend_sel := 0.U 
        io.next_pc_sel := 2.U 
    }
    //JalR
    .elsewhen (io.opcode === 103.U){
        io.memwrite := 0.B 
        io.branch := 0.B 
        io.memRead := 0.B 
        io.regWrite := 1.B  
        io.memtoReg := 0.B 
        io.aLUoperation := 3.U 
        io.operand_A_sel := 1.U 
        io.operand_B_sel := 0.B 
        io.extend_sel := 0.U 
        io.next_pc_sel := 3.U 
    }
    // U type (lui)   
    .elsewhen ( io.opcode === 55.U ) {
        io.memwrite := 0.B
        io.branch := 0.B
        io.memRead := 0.B
        io.regWrite := 1.B
        io.memtoReg := 0.B
        io.aLUoperation := 6.U
        io.operand_A_sel := 3.U
        io.operand_B_sel := 1.B
        io.extend_sel := 2.U
        io.next_pc_sel := 0.U
    // U type (auipc)   
    }
    .elsewhen ( io.opcode === 23.U ) {
        io.memwrite := 0.B
        io.branch := 0.B
        io.memRead := 0.B
        io.regWrite := 1.B
        io.memtoReg := 0.B
        io.aLUoperation := 7.U
        io.operand_A_sel := 2.U
        io.operand_B_sel := 1.B
        io.extend_sel := 2.U
        io.next_pc_sel := 0.U

    }
    .elsewhen(io.opcode === "b0101111".U) { 
<<<<<<< HEAD
        // io.memwrite := true.B
        // io.branch := 0.B
        // io.memRead := 1.B
        // io.regWrite := true.B
        // io.memtoReg := true.B
        // io.aLUoperation := 0.U  
        // io.operand_A_sel := 0.U 
        // io.operand_B_sel := 0.U 
        // io.extend_sel := 0.U  
        // io.next_pc_sel := 0.U
        io.AMO_out := 1.B
        //
        io.memwrite := 1.B 
        io.branch := 0.B 
        io.memRead := 1.B 
        io.regWrite := 1.B  
        io.memtoReg := 1.B 
        io.aLUoperation := 4.U 
        io.operand_A_sel := 0.U 
        io.operand_B_sel := 1.B 
        io.extend_sel := 0.U 
        io.next_pc_sel := 0.U
=======
        io.memwrite := true.B
        io.branch := 0.B
        io.memRead := 1.B
        io.regWrite := true.B
        io.memtoReg := true.B
        io.aLUoperation := 0.U  
        io.operand_A_sel := 0.U 
        io.operand_B_sel := 0.U 
        io.extend_sel := 0.U  
        io.next_pc_sel := 0.U
        io.AMO_out := 1.B
        //
        // io.memwrite := 1.B 
        // io.branch := 0.B 
        // io.memRead := 0.B 
        // io.regWrite := 0.B  
        // io.memtoReg := 0.B 
        // io.aLUoperation := 5.U  
        // io.operand_A_sel := 0.U 
        // io.operand_B_sel := 1.B 
        // io.extend_sel := 1.U 
        // io.next_pc_sel := 0.U
>>>>>>> 89e481d5c559b232a672fb36d60b384eb795bb1b
    }
    .otherwise {
        io.memwrite := 0.U
        io.branch := 0.U
        io.memRead := 0.U
        io.regWrite := 0.U 
        io.memtoReg := 0.U 
        io.aLUoperation := 0.U 
        io.operand_A_sel := 0.U
        io.operand_B_sel := 0.U
        io.extend_sel := 0.U 
        io.next_pc_sel := 0.U
        io.AMO_out := 0.B 
    }
}