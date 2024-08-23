package Pipelining
import chisel3._
import chisel3.util._

class BranchForward extends Module {
  val io = IO(new Bundle {
    val ID_EX_RD = Input(UInt(5.W))
    val EX_MEM_RD = Input(UInt(5.W))
    val MEM_WB_RD = Input(UInt(5.W))
    val ID_EX_memRd = Input(UInt(1.W))
    val EX_MEM_memRd = Input(UInt(1.W))
    val MEM_WB_memRd = Input(UInt(1.W))
    val rs1 = Input(UInt(5.W))
    
    val rs2 = Input(UInt(5.W))
    val ctrl_branch = Input(UInt(1.W))

    val forward_rs1 = Output(UInt(4.W))
    val forward_rs2 = Output(UInt(4.W))
})

io.forward_rs1 := "b0000".U
io.forward_rs2 := "b0000".U

// For Branch
when(io.ctrl_branch === 1.U) {
    // ALU Hazard
    when(io.ctrl_branch === 1.U && io.ID_EX_RD =/= "b00000".U && io.ID_EX_memRd =/= 1.U && (io.ID_EX_RD === io.rs1) && (io.ID_EX_RD === io.rs2)) {
        io.forward_rs1 := "b0001".U
        io.forward_rs2 := "b0001".U
       
    }.elsewhen(io.ctrl_branch === 1.U && io.ID_EX_RD =/= "b00000".U && io.ID_EX_memRd =/= 1.U && (io.ID_EX_RD === io.rs1)) {
        io.forward_rs1 := "b0001".U

    }.elsewhen(io.ctrl_branch === 1.U && io.ID_EX_RD =/= "b00000".U && io.ID_EX_memRd =/= 1.U && (io.ID_EX_RD === io.rs2)) {
        io.forward_rs2 := "b0001".U
    }

    // EX/MEM Hazard
    when(io.ctrl_branch === 1.U && io.EX_MEM_RD =/= "b00000".U && io.EX_MEM_memRd =/= 1.U && (io.EX_MEM_RD === io.rs1) && (io.EX_MEM_RD === io.rs2) && 
            ~((io.ctrl_branch === "b1".U) && (io.ID_EX_RD =/= "b00000".U) && (io.ID_EX_RD === io.rs1) && (io.ID_EX_RD === io.rs2))) {
        io.forward_rs1 := "b0010".U
        io.forward_rs2 := "b0010".U

    }.elsewhen(io.ctrl_branch === 1.U && io.EX_MEM_RD =/= "b00000".U && io.EX_MEM_memRd =/= 1.U && (io.EX_MEM_RD === io.rs2) && 
             ~((io.ctrl_branch === "b1".U) && (io.ID_EX_RD =/= "b00000".U) && (io.ID_EX_RD === io.rs2))) {
        io.forward_rs2 := "b0010".U

    }.elsewhen(io.ctrl_branch === 1.U && io.EX_MEM_RD =/= "b00000".U && io.EX_MEM_memRd =/= 1.U && (io.EX_MEM_RD === io.rs1) &&
            ~((io.ctrl_branch === "b1".U) && (io.ID_EX_RD =/= "b00000".U) && (io.ID_EX_RD === io.rs1))) {
        io.forward_rs1 := "b0010".U

    }.elsewhen(io.ctrl_branch === 1.U && io.EX_MEM_RD =/= "b00000".U && io.EX_MEM_memRd === 1.U && (io.EX_MEM_RD === io.rs1) && (io.EX_MEM_RD === io.rs2) && 
            ~((io.ctrl_branch === "b1".U) && (io.ID_EX_RD =/= "b00000".U) && (io.ID_EX_RD === io.rs1) && (io.ID_EX_RD === io.rs2))) {
        io.forward_rs1 := "b0100".U
        io.forward_rs2 := "b0100".U

    }.elsewhen(io.ctrl_branch === 1.U && io.EX_MEM_RD =/= "b00000".U && io.EX_MEM_memRd === 1.U && (io.EX_MEM_RD === io.rs2) && 
            ~((io.ctrl_branch === "b1".U) && (io.ID_EX_RD =/= "b00000".U) && (io.ID_EX_RD === io.rs2))) {
        io.forward_rs2 := "b0100".U

    }.elsewhen(io.ctrl_branch === 1.U && io.EX_MEM_RD =/= "b00000".U && io.EX_MEM_memRd === 1.U && (io.EX_MEM_RD === io.rs1) &&
            ~((io.ctrl_branch === "b1".U) && (io.ID_EX_RD =/= "b00000".U) && (io.ID_EX_RD === io.rs1))) {
        io.forward_rs1 := "b0100".U
    }

    // MEM/WB Hazard
    when(io.ctrl_branch === 1.U && io.MEM_WB_RD =/= "b00000".U && io.MEM_WB_memRd =/= 1.U && (io.MEM_WB_RD === io.rs1) && (io.MEM_WB_RD === io.rs2) &&
            ~((io.ctrl_branch === "b1".U) && (io.ID_EX_RD =/= "b00000".U) && (io.ID_EX_RD === io.rs1) && (io.ID_EX_RD === io.rs2)) &&
            ~((io.ctrl_branch === "b1".U) && (io.EX_MEM_RD =/= "b00000".U) && (io.EX_MEM_RD === io.rs1) && (io.EX_MEM_RD === io.rs2))) {
        io.forward_rs1 := "b0011".U
        io.forward_rs2 := "b0011".U

    }.elsewhen(io.ctrl_branch === 1.U && io.MEM_WB_RD =/= "b00000".U && io.MEM_WB_memRd =/= 1.U && (io.MEM_WB_RD === io.rs2) && 
            ~((io.ctrl_branch === "b1".U) && (io.ID_EX_RD =/= "b00000".U) && (io.ID_EX_RD === io.rs2)) &&
            ~((io.ctrl_branch === "b1".U) && (io.EX_MEM_RD =/= "b00000".U) && (io.EX_MEM_RD === io.rs2))) {
        io.forward_rs2 := "b0011".U

    }.elsewhen(io.ctrl_branch === 1.U && io.MEM_WB_RD =/= "b00000".U && io.MEM_WB_memRd =/= 1.U && (io.MEM_WB_RD === io.rs1) &&
            ~((io.ctrl_branch === "b1".U) && (io.ID_EX_RD =/= "b00000".U) && (io.ID_EX_RD === io.rs1)) &&
            ~((io.ctrl_branch === "b1".U) && (io.EX_MEM_RD =/= "b00000".U) && (io.EX_MEM_RD === io.rs1))) {
        io.forward_rs1 := "b0011".U

    }.elsewhen(io.ctrl_branch === 1.U && io.MEM_WB_RD =/= "b00000".U && io.MEM_WB_memRd === 1.U && (io.MEM_WB_RD === io.rs1) && (io.MEM_WB_RD === io.rs2) &&
            ~((io.ctrl_branch === "b1".U) && (io.ID_EX_RD =/= "b00000".U) && (io.ID_EX_RD === io.rs1) && (io.ID_EX_RD === io.rs2)) &&
            ~((io.ctrl_branch === "b1".U) && (io.EX_MEM_RD =/= "b00000".U) && (io.EX_MEM_RD === io.rs1) && (io.EX_MEM_RD === io.rs2))) {
        io.forward_rs1 := "b0101".U
        io.forward_rs2 := "b0101".U

    }.elsewhen(io.ctrl_branch === 1.U && io.MEM_WB_RD =/= "b00000".U && io.MEM_WB_memRd === 1.U && (io.MEM_WB_RD === io.rs2) && 
            ~((io.ctrl_branch === "b1".U) && (io.ID_EX_RD =/= "b00000".U) && (io.ID_EX_RD === io.rs2)) &&
            ~((io.ctrl_branch === "b1".U) && (io.EX_MEM_RD =/= "b00000".U) && (io.EX_MEM_RD === io.rs2))) {
        io.forward_rs2 := "b0101".U

    }.elsewhen(io.ctrl_branch === 1.U && io.MEM_WB_RD =/= "b00000".U && io.MEM_WB_memRd === 1.U && (io.MEM_WB_RD === io.rs1) &&
            ~((io.ctrl_branch === "b1".U) && (io.ID_EX_RD =/= "b00000".U) && (io.ID_EX_RD === io.rs1)) &&
            ~((io.ctrl_branch === "b1".U) && (io.EX_MEM_RD =/= "b00000".U) && (io.EX_MEM_RD === io.rs1))) {
        io.forward_rs1 := "b0101".U
    }

// For Jalr
}.elsewhen(io.ctrl_branch === 0.U) {
    // ALU Hazard
    when(io.ID_EX_RD =/= "b00000".U && io.ID_EX_memRd =/= 1.U && (io.ID_EX_RD === io.rs1)) {
        io.forward_rs1 := "b0110".U
    }

    // EX/MEM Hazard
    when(io.EX_MEM_RD =/= "b00000".U && io.EX_MEM_memRd =/= 1.U && (io.EX_MEM_RD === io.rs1) &&
          ~((io.ID_EX_RD =/= "b00000".U) && (io.ID_EX_RD === io.rs1))) {
        io.forward_rs1 := "b0111".U

    }.elsewhen(io.EX_MEM_RD =/= "b00000".U && io.EX_MEM_memRd === 1.U && (io.EX_MEM_RD === io.rs1) &&
          ~((io.ID_EX_RD =/= "b00000".U) && (io.ID_EX_RD === io.rs1))) {
        io.forward_rs1 := "b1001".U
    }

    // MEM/WB Hazard
    when(io.MEM_WB_RD =/= "b00000".U && io.MEM_WB_memRd =/= 1.U && (io.MEM_WB_RD === io.rs1) &&
          ~((io.ID_EX_RD =/= "b00000".U) && (io.ID_EX_RD === io.rs1)) &&
          ~((io.EX_MEM_RD =/= "b00000".U) && (io.EX_MEM_RD === io.rs1))) {
        io.forward_rs1 := "b1000".U
    
    }.elsewhen(io.MEM_WB_RD =/= "b00000".U && io.MEM_WB_memRd === 1.U && (io.MEM_WB_RD === io.rs1) &&
          ~((io.ID_EX_RD =/= "b00000".U) && (io.ID_EX_RD === io.rs1)) &&
          ~((io.EX_MEM_RD =/= "b00000".U) && (io.EX_MEM_RD === io.rs1))) {
        io.forward_rs1 := "b1010".U
    }
}
}
