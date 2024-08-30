package LAB7
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class ArbriterTest extends FreeSpec with ChiselScalatestTester{
    "ex1Test" in{
        test(new Arbriter){c =>
            c.io.in1.bits.poke(4.U)
            c.io.in1.valid.poke(1.B)
            c.io.in2.bits.poke(1.U)
            c.io.in2.valid.poke(1.B)
            c.clock.step(4)
            c.io.out.bits.expect(4.U)
            c.io.out.valid.expect(1.B)
            c.io.out.ready.expect(0.B)
        }
    }
}