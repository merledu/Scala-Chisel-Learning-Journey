// package LAB4
// import chisel3._ 
// import chisel3.util._ 


// object ALUOP {
//     val ALU_ADD = 0.U(4.W)
//     val ALU_SUB = 1.U(4.W)
//     val ALU_AND = 2.U(4.W)
//     val ALU_OR  = 3.U(4.W)
//     val ALU_XOR = 4.U(4.W)
//     val ALU_SLT = 5.U(4.W)
//     val ALU_SLL = 6.U(4.W)
//     val ALU_SRL = 7.U(4.W)
//     val ALU_BEQ = 5.U(4.W)
//     val ALU_BNE = 6.U(4.W)
//     val ALU_COPY_A = 7.U(4.W)
//     val ALU_COPY_B = 8.U(4.W)
//     val ALU_XXX = 9.U(4.W) 
// }
// trait Config{
//     val WLEN = 32
//     val ALUOP_SIG_LEN = 4
// }

// import ALUOP._

// class ALUIO extends Bundle with Config {
//     val in_A = Input(UInt(WLEN.W))
//     val in_B = Input(UInt(WLEN.W))
//     val alu_Op = Input(UInt(ALUOP_SIG_LEN.W))
//     val out = Output(UInt(WLEN.W))
//     val sum = Output(UInt(WLEN.W))
// }

// class ALU extends Module with Config {
//     val io = IO(new ALUIO)

//     val sum = io.in_A + Mux(io.alu_Op(0), io.in_B, -io.in_B)

//     val out = 
//     Mux(io.alu_Op === ALU_ADD,(io.in_A + io.in_B),
//     Mux(io.alu_Op === ALU_SUB,(io.in_A - io.in_B),
//     Mux(io.alu_Op === ALU_SLT,(io.in_A > io.in_B)
//     Mux(io.alu_Op === ALU_SRL,(io.in_A << io.in_B)
//     Mux(io.alu_Op === ALU_SLL,(io.in_A >> io.in_B) 
//     Mux(io.alu_Op === ALU_AND, (io.in_A & io.in_B),
//     Mux(io.alu_Op === ALU_OR, (io.in_A | io.in_B),
//     Mux(io.alu_Op === ALU_XOR, (io.in_A ^ io.in_B),
//     Mux(io.alu_Op === ALU_BEQ, (io.in_A === io.in_B),
//     Mux(io.alu_Op === ALU_BNE, (io.in_A =/= io.in_B),
//     Mux(io.alu_Op === ALU_COPY_A, (io.in_A), 
//     Mux(io.alu_Op === ALU_COPY_B, (io.in_B), 0.U))))))))))))


//     io.out := out
//     io.sum := sum
// }