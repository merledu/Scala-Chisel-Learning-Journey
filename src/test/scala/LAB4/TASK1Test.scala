package LAB4
import chisel3._
import chisel3.util
import org.scalatest.FreeSpec
import chiseltest._
import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.VerilatorBackendAnnotation
import scala.util.Random
import Br._

class  BranchTest extends FreeSpec with ChiselScalatestTester{
    "TASK1" in {
         test(new BranchControl){ c => 
         val array_op = Array(Br_beq, Br_bne, Br_blt, Br_bge)
            for ( i <- 0 until 100) {
                val src_a = Random .nextLong () & 0xFFFFFFFFL 
                val src_b = Random .nextLong () & 0xFFFFFFFFL
                val opr = Random .nextInt (4)
                val func3 = array_op(opr)
                val branch1 = Random .nextBoolean
                val result = func3 match {
                    case Br_beq => src_a === src_b
                    case Br_bne => src_a != src_b
                    case Br_blt => src_a <= src_b
                    case Br_bge => src_a >= src_b
                    }
                    
            c.io.fnct3.poke(func3)
            c.io.branch.poke(branch1.B)
            c.io.x.poke(src_a .U)
            c.io.y.poke(src_b .U)
            c.clock.step(10)

        if (branch1 === 1.B){
            c.io.out.expect( 1.B)
        }
        else if (branch1 === 0.B)
        c.io.out.expect(0.B)

            
}
}
}
}