package Single_Cycle

import chisel3._ 
import chisel3.util._ 


object ALUOP {
    val ALU_ADD = 0.U(4.W)
    val ALU_SUB = 1.U(4.W)
    val ALU_SLL = 2.U(4.W)
    val ALU_SLT = 4.U(4.W)
    val ALU_SLTU= 6.U(4.W)
    val ALU_XOR = 8.U(4.W)
    val ALU_SRL = 10.U(4.W)
    val ALU_SRA = 11.U(4.W)
    val ALU_OR  = 12.U(4.W)
    val ALU_AND = 14.U(4.W)

    val ALU_BEQ = 5.U(4.W)
    val ALU_BLT = 3.U(4.W)
    val ALU_BNE = 7.U(4.W)
    val ALU_BGE = 9.U(4.W)
    val ALU_BLTU = 13.U(4.W)
    val ALU_BGEU = 15.U(4.W)
}

trait Config{
    val WLEN = 32
    val ALUOP_SIG_LEN = 4
}

import ALUOP._

class ALUIO extends Bundle with Config {
    val in_A = Input(UInt(WLEN.W))
    val in_B = Input(UInt(WLEN.W))
    val alu_Op = Input(UInt(ALUOP_SIG_LEN.W))
    val out = Output(UInt(WLEN.W))
    val sum = Output(UInt(WLEN.W))
    //val instype = Input(UInt (2.W)) //0=I,R ,S =1, L = 2 , B =3

}

class ALU1 extends Module with Config {
    val io = IO(new ALUIO)

    val sum = io.in_A +  io.in_B
    val sub = io.in_A - io.in_B
    val cmp = (io.in_A.asSInt < io.in_B.asSInt).asUInt
    val cmpU = (io.in_A < io.in_B)
    val shamt = io.in_B(4, 0)
    val shin = io.in_A
    val shiftrl = io.in_A >> shamt//(Cat(io.alu_Op(0) && shin(WLEN - 1), shin).asSInt >> shamt) (WLEN - 1, 0)
    val shitfl = io.in_A << shamt
    val shiftrA = (io.in_A.asSInt >> shamt.asUInt).asUInt
    val beq = (io.in_A === io.in_B)
    val bge = (cmp | beq )
    val bgeu = io.in_A.asUInt() >= io.in_B.asUInt()



    io.out :=
            Mux((io.alu_Op === ALU_ADD) , sum,
                Mux((io.alu_Op === ALU_SUB), sub,
                    Mux(io.alu_Op === ALU_SLT , cmp,
                        Mux(io.alu_Op === ALU_SLTU, cmpU ,
                            Mux(io.alu_Op === ALU_SRL, shiftrl,
                                Mux(io.alu_Op === ALU_SRA, shiftrA,
                                    Mux(io.alu_Op === ALU_SLL, shitfl,
                                        Mux(io.alu_Op === ALU_AND, (io.in_A & io.in_B),
                                            Mux(io.alu_Op === ALU_OR, (io.in_A | io.in_B),
                                                 Mux(io.alu_Op === ALU_XOR, (io.in_A ^ io.in_B),0.U))))))))))


    io.sum := sum
}
