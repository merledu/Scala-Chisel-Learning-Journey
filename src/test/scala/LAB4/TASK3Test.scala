// package LAB4
// import chisel3._
// import chisel3.util
// import org.scalatest.FreeSpec
// import chiseltest._
// import chiseltest.experimental.TestOptionBuilder._
// import chiseltest.internal.VerilatorBackendAnnotation
// import scala.util.Random
// import ALUOP._

// class abc extends FreeSpec with ChiselScalatestTester {
//     "TASK3" in {
//         test (new ALU) { c =>
//             val array_op = Array ( ALU_ADD , ALU_SUB , ALU_AND , ALU_OR , ALU_XOR , ALU_SLT ,
//             ALU_SLL , ALU_SLTU , ALU_SRL , ALU_SRA , ALU_COPY_A , ALU_COPY_B , ALU_XXX )
//             // for ( i <- 0 until 100) {
//             val src_a = Random .nextLong () & 0xFFFFFFFFL
//             val src_b = Random .nextLong () & 0xFFFFFFFFL
//             // val opr = Random .nextInt (12)
//             val opr = 1
//             val aluop = array_op (opr)
//             println(src_a, src_b, opr)

//             val result = aluop match {
//                 case ALU_ADD => src_a + src_b
//                 case ALU_SUB => src_a - src_b
//                 case ALU_AND => src_a & src_b
//                 case ALU_OR => src_a | src_b
//                 case ALU_XOR => src_a ^ src_b
//                 case ALU_SLT => (src_a .toInt < src_b .toInt) .asInstanceOf [ Int ]
//                 case ALU_SLL => src_a << (src_b & 0x1F)
//                 case ALU_SLTU => (src_a < src_b) .asInstanceOf [ Int ]
//                 case ALU_SRL => src_a >> (src_b & 0x1F)
//                 case ALU_SRA => src_a .toInt >> (src_b & 0x1F)
//                 case ALU_COPY_A => src_a
//                 case ALU_COPY_B => src_b
//                 case _=> 0
//                 }
//             val result1 : BigInt = if ( result < 0)
//                 (BigInt (0xFFFFFFFFL ) + result +1) & 0xFFFFFFFFL
//             else result & 0xFFFFFFFFL
//             c.io.in_A.poke(src_a .U)
//             c.io.in_B.poke(src_b .U)
//             c.io.alu_Op.poke(aluop)
//             c.clock.step(1)
//             c.io.out.expect(result1 .U)

// }
//         // c.clock.step(2)
// }
// }
