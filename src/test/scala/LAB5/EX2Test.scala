package LAB5
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class AMuxTest extends FreeSpec with ChiselScalatestTester{
    "EX2Test" in {
         test(new AMux (UInt(4.W))){ c => 
            c.io.sel.poke(1.B)
            c.io.in1.poke(2.U)
            c.io.in2.poke(3.U)
            c.clock.step(10)
            c.io.out.expect(3.U)

        }
    }
}