package LAB5
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class eMUXTest extends FreeSpec with ChiselScalatestTester{
    "TASK3Test" in {
         test(new MUX3 (UInt(4.W))){ c => 
            c.io.sel.poke(1.B)
            c.io.in1.poke(2.U)
            c.io.in2.poke(0.B)
            c.clock.step(10)
            c.io.out.expect(0.B)

        }
    }
}