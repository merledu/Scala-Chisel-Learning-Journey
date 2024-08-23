package LAB5
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class adderTest  extends FreeSpec with ChiselScalatestTester{
    "TASK1" in {
        test (new ADDER (4)){c =>
            c.io.in0.poke(2.U)
            c.io.in1.poke(3.U)
            c.clock.step(10)
            c.io.sum.expect(5.U)
        }
    }

}