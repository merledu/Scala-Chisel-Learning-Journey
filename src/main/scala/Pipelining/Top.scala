package Pipelining

import chisel3._
import chisel3.util._

class PipTop extends Module {
    val io = IO (new Bundle{
        val out = Output(SInt(32.W))
        val reg_Wdata_out = Output (SInt(32.W))
        val reg_out = Output (UInt(32.W))
        val data_mem_addr = Output (UInt(32.W))
        val data_mem_dataIn = Output (SInt(32.W))
        val imme_out = Output (SInt(32.W))
    })
    

    //objects
    val Alu_mod = Module(new ALU)
    dontTouch(Alu_mod.io)
    val AluControl_mod = Module(new AluControl)
    dontTouch(AluControl_mod.io)
    val Branch_mod = Module(new Branch)
    dontTouch(Branch_mod.io)
    val Control_mod = Module(new Control)
    dontTouch(Control_mod.io)
    val DataMem_mod = Module(new DataMemory)   
    dontTouch(DataMem_mod.io)
    val ImmGen_mod = Module(new ImmGen)
    dontTouch(ImmGen_mod.io)
<<<<<<< HEAD
    val InstMem = Module(new InstMemory( "/home/masfiyan/Desktop/asm.txt"))
=======
    val InstMem = Module(new InstMemory( "/home/laiba-khan/Downloads/InstMem"))
>>>>>>> 89e481d5c559b232a672fb36d60b384eb795bb1b
    dontTouch(InstMem.io)
    val JalR_mod = Module(new JalR)
    dontTouch(JalR_mod.io)
    val PC_mod = Module(new PC)
    dontTouch(PC_mod.io)
    val PC4_mod = Module(new PC4)
    dontTouch(PC4_mod.io)
    val RegFile_mod = Module(new RegFile)
    dontTouch(RegFile_mod.io)
    val IFID = Module(new IF_ID)
    dontTouch(IFID.io)
    val IDEX = Module(new ID_EX)
    dontTouch(IDEX.io)
    val EXMEM = Module(new EX_MEM)
    dontTouch(EXMEM.io)
    val MEMWB = Module(new MEM_WB)
    dontTouch(MEMWB.io)
    val ForwardingUnit = Module(new ForwardUnit)
    dontTouch(ForwardingUnit.io)
    val Branchforward_mod = Module(new BranchForward)
    dontTouch(Branchforward_mod.io)
    val HazardDetection_mod = Module(new HazardDetection)
    dontTouch(HazardDetection_mod.io)
    val Structuralhazard_mod = Module(new StructuralHazard)
    dontTouch(Structuralhazard_mod.io)
<<<<<<< HEAD
    val AMOOperation = Module(new AtomicOperations)
    dontTouch(AMOOperation.io)
=======
>>>>>>> 89e481d5c559b232a672fb36d60b384eb795bb1b


    val d = Wire(SInt(32.W))

    // fetch
    val o = MuxLookup (HazardDetection_mod.io.pc_forward, 0.S, Array (
        (0.U) -> PC4_mod.io.out.asSInt,
        (1.U) -> HazardDetection_mod.io.pc_out))

    PC_mod.io.in := o
    PC4_mod.io.pc := PC_mod.io.out.asUInt()
    InstMem.io.address := PC_mod.io.out(21, 2)

    val m = MuxLookup(HazardDetection_mod.io.inst_forward, 0.S, Array(
        (0.U) -> PC_mod.io.out,
        (1.U) -> HazardDetection_mod.io.current_pc_out
    ))

    val n = MuxLookup(HazardDetection_mod.io.inst_forward, 0.U, Array(
        (0.U) -> InstMem.io.data,
        (1.U) -> HazardDetection_mod.io.inst_out
    ))

    //IFID
    IFID.io.pc_in := PC_mod.io.out
    IFID.io.pc4_in := PC4_mod.io.out
    IFID.io.mux_pc_in := m
    IFID.io.mux_inst_in := n 


    //Decode
    Control_mod.io.opcode := IFID.io.mux_inst_out(6,0)
    ImmGen_mod.io.pc := IFID.io.mux_pc_out.asUInt
    ImmGen_mod.io.instr := IFID.io.mux_inst_out.asUInt()
<<<<<<< HEAD

    val nextamo = RegInit(0.B)
    val nextNextamo = RegInit(0.B)
    nextamo := Control_mod.io.AMO_out
    nextNextamo := nextamo
    dontTouch(nextNextamo)
    AMOOperation.io.execute := nextNextamo

=======
>>>>>>> 89e481d5c559b232a672fb36d60b384eb795bb1b
    
    when (Control_mod.io.AMO_out){
        RegFile_mod.io.Reg1 := IFID.io.mux_inst_out(19, 15)
        RegFile_mod.io.Reg2 := IFID.io.mux_inst_out(24, 20)
    }.otherwise{
        RegFile_mod.io.Reg1 := Mux(Control_mod.io.opcode === 51.U || Control_mod.io.opcode === 19.U || Control_mod.io.opcode === 35.U || Control_mod.io.opcode === 3.U || Control_mod.io.opcode === 99.U || Control_mod.io.opcode === 103.U, IFID.io.mux_inst_out(19, 15), 0.U )
        RegFile_mod.io.Reg2 := Mux(Control_mod.io.opcode === 51.U || Control_mod.io.opcode === 35.U || Control_mod.io.opcode === 99.U,IFID.io.mux_inst_out(24,20), 0.U)
    }
    
    
    RegFile_mod.io.Reg_write := Control_mod.io.regWrite


    val a = MuxLookup(Control_mod.io.extend_sel, 0.S, Array(
        (0.U) -> ImmGen_mod.io.I_Type,
        (1.U) -> ImmGen_mod.io.S_Type,
        (2.U) -> ImmGen_mod.io.U_Type
    ))

    //Structural Hazard
    Structuralhazard_mod.io.rs1 := IFID.io.mux_inst_out(19,15)
    Structuralhazard_mod.io.rs2 := IFID.io.mux_inst_out(24,20)
    Structuralhazard_mod.io.MEM_WB_Rd := MEMWB.io.MEMWB_rd_out
    Structuralhazard_mod.io.MEM_WB_regWr := MEMWB.io.MEMWB_reg_w_out

    IDEX.io.rs1_data_in := MuxLookup(Structuralhazard_mod.io.fwd_rs1, 0.S, Array(
        (0.U) -> RegFile_mod.io.rData1,
        (1.U) -> RegFile_mod.io.write_data
    ))
    IDEX.io.rs2_data_in := MuxLookup(Structuralhazard_mod.io.fwd_rs2, 0.S, Array(
        (0.U) -> RegFile_mod.io.rData2,
        (1.U) -> RegFile_mod.io.write_data
    ))

    when(HazardDetection_mod.io.ctrl_forward === "b1".U){
        IDEX.io.ctrl_memWrite_in := 0.B 
        IDEX.io.ctrl_memRead_in := 0.B
        IDEX.io.ctrl_branch_in := 0.B 
        IDEX.io.ctrl_memtoReg_in := 0.B 
        IDEX.io.ctrl_regWrite_in := 0.B 
        IDEX.io.ctrl_aluOp_in := 0.U 
        IDEX.io.ctrl_OpA_in := 0.U  
        IDEX.io.ctrl_OpB_in := 0.B 
        IDEX.io.ctrl_nextpc_in := 0.U  
    }.otherwise{
        IDEX.io.ctrl_memWrite_in := Control_mod.io.memwrite
        IDEX.io.ctrl_memRead_in := Control_mod.io.memRead
        IDEX.io.ctrl_branch_in := Control_mod.io.branch
        IDEX.io.ctrl_memtoReg_in := Control_mod.io.memtoReg
        IDEX.io.ctrl_regWrite_in := Control_mod.io.regWrite
        IDEX.io.ctrl_aluOp_in := Control_mod.io.aLUoperation
        IDEX.io.ctrl_OpA_in := Control_mod.io.operand_A_sel
        IDEX.io.ctrl_OpB_in := Control_mod.io.operand_B_sel
        IDEX.io.ctrl_nextpc_in := Control_mod.io.next_pc_sel
    }
    //HazardDetection
    HazardDetection_mod.io.IF_ID_inst := IFID.io.mux_inst_out.asUInt()
    HazardDetection_mod.io.ID_EX_memRead := IDEX.io.ctrl_memRead_out
    HazardDetection_mod.io.ID_EX_rd := IDEX.io.rd_out
    HazardDetection_mod.io.pc_in := IFID.io.pc4_out.asSInt
    HazardDetection_mod.io.current_pc := IFID.io.mux_pc_out

    MEMWB.io.EXMEM_MEMRD := EXMEM.io.EXMEM_memRd_out

    Branchforward_mod.io.ID_EX_RD := IDEX.io.rd_out
    Branchforward_mod.io.ID_EX_memRd := IDEX.io.ctrl_memRead_out
    Branchforward_mod.io.EX_MEM_RD := EXMEM.io.EXMEM_rd_out
    Branchforward_mod.io.EX_MEM_memRd := EXMEM.io.EXMEM_memRd_out
    Branchforward_mod.io.MEM_WB_RD := MEMWB.io.MEMWB_rd_out
    Branchforward_mod.io.MEM_WB_memRd := MEMWB.io.MEMWB_memRd_out
    Branchforward_mod.io.rs1 := IFID.io.mux_inst_out(19,15)
    Branchforward_mod.io.rs2 := IFID.io.mux_inst_out(24,20)
    Branchforward_mod.io.ctrl_branch := Control_mod.io.branch

    Branch_mod.io.arg_x := MuxLookup(Branchforward_mod.io.forward_rs1, 0.S, Array(
        (0.U) -> RegFile_mod.io.rData1,
        (1.U) -> Alu_mod.io.out, 
        (2.U) -> EXMEM.io.EXMEM_alu_out, 
        (3.U) -> RegFile_mod.io.write_data, 
        (4.U) -> DataMem_mod.io.DataOut, 
        (5.U) -> RegFile_mod.io.write_data,
        (6.U) -> RegFile_mod.io.rData1,
        (7.U) -> RegFile_mod.io.rData1,
        (8.U) -> RegFile_mod.io.rData1,
        (9.U) -> RegFile_mod.io.rData1,
        (10.U) -> RegFile_mod.io.rData1
    ))
    //jalR
    JalR_mod.io.readata1 := MuxLookup(Branchforward_mod.io.forward_rs1, 0.U, Array(
        (0.U) -> RegFile_mod.io.rData1.asUInt,
        (1.U) -> RegFile_mod.io.rData1.asUInt, 
        (2.U) -> RegFile_mod.io.rData1.asUInt, 
        (3.U) -> RegFile_mod.io.rData1.asUInt, 
        (4.U) -> RegFile_mod.io.rData1.asUInt, 
        (5.U) -> RegFile_mod.io.rData1.asUInt,
        (6.U) -> Alu_mod.io.out.asUInt,
        (7.U) -> EXMEM.io.EXMEM_alu_out.asUInt,
        (8.U) -> RegFile_mod.io.write_data.asUInt,
        (9.U) -> DataMem_mod.io.DataOut.asUInt,
        (10.U) -> RegFile_mod.io.write_data.asUInt
    ))

    JalR_mod.io.immed := a.asUInt

    Branch_mod.io.arg_y := MuxLookup(Branchforward_mod.io.forward_rs2, 0.S, Array(
        (0.U) -> RegFile_mod.io.rData2,
        (1.U) -> Alu_mod.io.out,
        (2.U) -> EXMEM.io.EXMEM_alu_out,
        (3.U) -> RegFile_mod.io.write_data,
        (4.U) -> DataMem_mod.io.DataOut,
        (5.U) -> RegFile_mod.io.write_data
    ))


    Branch_mod.io.fnct3 := IFID.io.mux_inst_out(14, 12)
    Branch_mod.io.branch := Control_mod.io.branch

    when(HazardDetection_mod.io.pc_forward === 1.B){
        PC_mod.io.in := HazardDetection_mod.io.pc_out
    }.otherwise{
        when(Control_mod.io.next_pc_sel === "b01".U){
            when(Branch_mod.io.br_taken === 1.B && Control_mod.io.branch === 1.B){
                PC_mod.io.in := ImmGen_mod.io.SB_Type
                IFID.io.pc_in := 0.S 
                IFID.io.pc4_in := 0.U
                IFID.io.mux_inst_in := 0.U
                IFID.io.mux_pc_in := 0.S
            }.otherwise{
                PC_mod.io.in := PC4_mod.io.out.asSInt
            }
        }.elsewhen(Control_mod.io.next_pc_sel === "b10".U){
            PC_mod.io.in := ImmGen_mod.io.UJ_Type
            IFID.io.pc_in := 0.S 
            IFID.io.pc4_in := 0.U
            IFID.io.mux_inst_in := 0.U
            IFID.io.mux_pc_in := 0.S
        }.elsewhen(Control_mod.io.next_pc_sel === "b11".U){
            PC_mod.io.in := JalR_mod.io.out.asSInt
            IFID.io.pc_in := 0.S 
            IFID.io.pc4_in := 0.U
            IFID.io.mux_inst_in := 0.U
            IFID.io.mux_pc_in := 0.S
        }.otherwise{
            PC_mod.io.in := PC4_mod.io.out.asSInt 
        }
    }
    // ID_EX pipeline
    IDEX.io.rs1_in := RegFile_mod.io.Reg1
    IDEX.io.rs2_in := RegFile_mod.io.Reg2
    when (Control_mod.io.AMO_out){
        
    }.otherwise{
    //    IDEX.io.rs1_in := RegFile_mod.io.Reg1
    //     IDEX.io.rs2_in := RegFile_mod.io.Reg2 
    }
    IDEX.io.immm_in := a
    IDEX.io.fun3_in := IFID.io.mux_inst_out(14,12)
    IDEX.io.func7_in := IFID.io.mux_inst_out(30)
    IDEX.io.rd_in := IFID.io.mux_inst_out(11,7)

<<<<<<< HEAD
    val inst = WireInit(0.U(32.W))
    dontTouch(inst)
    val nextinst = RegInit(0.U(32.W))
    val high = IFID.io.mux_inst_out(6,0) === "b0101111".U
    dontTouch(high)
    when (IFID.io.mux_inst_out(6,0) === "b0101111".U){
        inst := IFID.io.mux_inst_out
        nextinst := inst
    }

=======
>>>>>>> 89e481d5c559b232a672fb36d60b384eb795bb1b
    //Execute
    ForwardingUnit.io.IDEX_rs1 := IDEX.io.rs1_out 
    ForwardingUnit.io.IDEX_rs2:= IDEX.io.rs2_out
    ForwardingUnit.io.EXMEM_rd := EXMEM.io.EXMEM_rd_out
    ForwardingUnit.io.EXMEM_regWr := EXMEM.io.EXMEM_regWrite_out
    ForwardingUnit.io.MEMWB_rd := MEMWB.io.MEMWB_rd_out
    ForwardingUnit.io.MEMWB_regWr := MEMWB.io.MEMWB_reg_w_out

    IDEX.io.ctrl_OpA_in := Control_mod.io.operand_A_sel
    IDEX.io.IF_ID_pc4_in := IFID.io.pc4_out

    

    //  Controlling Operand A for ALU
    when(IDEX.io.ctrl_OpA_out === "b10".U){
            Alu_mod.io.in_A := IDEX.io.IF_ID_pc4_out.asSInt()
        }
        .otherwise{
            when(ForwardingUnit.io.forward_a === "b00".U){
                Alu_mod.io.in_A := IDEX.io.rs1_data_out
            }
            .elsewhen(ForwardingUnit.io.forward_a === "b01".U){
                Alu_mod.io.in_A := d
            }
            .elsewhen(ForwardingUnit.io.forward_a === "b10".U){
                Alu_mod.io.in_A := EXMEM.io.EXMEM_alu_out
            }
            .otherwise{
                Alu_mod.io.in_A := IDEX.io.rs1_data_out
            }
        }

<<<<<<< HEAD
    Alu_mod.io.amo := nextamo


=======
>>>>>>> 89e481d5c559b232a672fb36d60b384eb795bb1b
    val b = MuxLookup(ForwardingUnit.io.forward_b, 0.S, Array(
        (0.U) -> IDEX.io.rs2_data_out,
        (1.U) -> d,
        (2.U) -> EXMEM.io.EXMEM_alu_out
    ))
    Alu_mod.io.in_B := MuxLookup(IDEX.io.ctrl_OpB_out, 0.S, Array(
        (0.U) -> b,
        (1.U) -> IDEX.io.immm_out
    ))

    AluControl_mod.io.alu_op := IDEX.io.ctrl_aluOp_out
    AluControl_mod.io.func3 := IDEX.io.fun3_out
    AluControl_mod.io.func7 := IDEX.io.func7_out
    EXMEM.io.IDEX_rd := IDEX.io.rd_out
    Alu_mod.io.alu_Op := AluControl_mod.io.out 

    //EX_MEM pipeline
    EXMEM.io.IDEX_MEMRD := IDEX.io.ctrl_memRead_out
    EXMEM.io.IDEX_MEMTOREG := IDEX.io.ctrl_memtoReg_out
    EXMEM.io.IDEX_MEMWR := IDEX.io.ctrl_memWrite_out
    EXMEM.io.IDEX_REG_W := IDEX.io.ctrl_regWrite_out

    EXMEM.io.IDEX_rs2 := b
    EXMEM.io.alu_in := Alu_mod.io.out

    //Memory
    DataMem_mod.io.mem_read := EXMEM.io.EXMEM_memRd_out
    DataMem_mod.io.mem_write := EXMEM.io.EXMEM_memWr_out
    MEMWB.io.EXMEM_MEMTOREG := EXMEM.io.EXMEM_memToReg_out
    MEMWB.io.EXMEM_REG_W := EXMEM.io.EXMEM_regWrite_out
    MEMWB.io.EXMEM_rd := EXMEM.io.EXMEM_rd_out
    DataMem_mod.io.Addr := EXMEM.io.EXMEM_alu_out.asUInt()
    DataMem_mod.io.DataIn := EXMEM.io.EXMEM_rs2_out
<<<<<<< HEAD
    when (nextNextamo){
        DataMem_mod.io.DataIn := AMOOperation.io.DataOut
    }
=======
>>>>>>> 89e481d5c559b232a672fb36d60b384eb795bb1b

    RegFile_mod.io.write_Reg := MEMWB.io.MEMWB_rd_out
    RegFile_mod.io.Reg_write := MEMWB.io.MEMWB_reg_w_out

    //MEM_WB Pipeline
    MEMWB.io.in_dataMem := DataMem_mod.io.DataOut
<<<<<<< HEAD
    AMOOperation.io.DataIn := DataMem_mod.io.DataOut
    AMOOperation.io.DataIn2 := EXMEM.io.EXMEM_rs2_out
    AMOOperation.io.atomic_op := 0.U

    switch(nextinst(31, 27)) {
            is("b00001".U) { 
                AMOOperation.io.atomic_op := 0.U
            }
            is("b00000".U) { 
                AMOOperation.io.atomic_op := 1.U
            }
            is("b00100".U) { 
                AMOOperation.io.atomic_op := 4.U
            }
            is("b01100".U) { 
                AMOOperation.io.atomic_op := 2.U
            }
            is("b01000".U) { 
                AMOOperation.io.atomic_op := 3.U
            }
            is("b10000".U) { 
                AMOOperation.io.atomic_op := 6.U
            }
            is("b10100".U) { 
                AMOOperation.io.atomic_op := 5.U
            }
            is("b11000".U) { 
                AMOOperation.io.atomic_op := 8.U
            }
            is("b11100".U) { 
                AMOOperation.io.atomic_op := 7.U
            }
    }

=======
>>>>>>> 89e481d5c559b232a672fb36d60b384eb795bb1b
    MEMWB.io.in_alu_out := EXMEM.io.EXMEM_alu_out

    //WriteBack
    d := MuxLookup(MEMWB.io.MEMWB_memToReg_out, 0.S, Array(
        (0.U) -> MEMWB.io.MEMWB_alu_out,
        (1.U) -> MEMWB.io.MEMWB_dataMem_out
    ))
    RegFile_mod.io.write_data := d

    io.out := 0.S 
    io.reg_out := RegFile_mod.io.write_Reg
    io.reg_Wdata_out := RegFile_mod.io.write_data
    io.data_mem_addr := EXMEM.io.EXMEM_alu_out.asUInt
    io.data_mem_dataIn := EXMEM.io.EXMEM_rs2_out
    io.imme_out := IDEX.io.immm_out
    }