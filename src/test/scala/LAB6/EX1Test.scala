package LAB6
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class SREGTest extends FreeSpec with ChiselScalatestTester{
    "EX1Test" in{
        test(new SREG){c =>
            c.io.in.poke(2.U)
            c.clock.step(4)
            c.io.out.expect(0.B)
        
        }
    }
}