package LAB7
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class stateTest extends FreeSpec with ChiselScalatestTester{
    "EX1Test" in{
        test(new Statess){c =>
            c.io.in.poke(1.B)
            c.clock.step(4)
            c.io.out.expect(0.B)
        
        }
    }
}