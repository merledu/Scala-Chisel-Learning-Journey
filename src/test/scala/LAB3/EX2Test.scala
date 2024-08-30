package LAB3
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class  ALUTest extends FreeSpec with ChiselScalatestTester{
    "EX2" in {
         test(new ALU){ c => 
            c.io.in_A.poke(10.U)
            c.io.in_B.poke(5.U)
            c.io.alu_Op.poke(1.U)
            c.clock.step(10)
            c.io.out.expect(5.U)
         }
    }
}                                       