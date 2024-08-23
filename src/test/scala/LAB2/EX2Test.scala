package LAB2
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class  MuxLookupTest extends FreeSpec with ChiselScalatestTester{
    "EX2" in {
         test(new MuxLookup){ c =>
            c.io.in0.poke(0.B)
            c.io.in1.poke(1.B)
            c.io.in2.poke(0.B)
            c.io.in3.poke(1.B)
            c.io.in4.poke(0.B)
            c.io.in5.poke(1.B)
            c.io.in6.poke(0.B)
            c.io.in7.poke(1.B)
            c.io.s0.poke(0.U)
            c.io.s1.poke(2.U)
            c.io.s2.poke(7.U)
            c.clock.step(1)
            c.io.out.expect(0.B)
        }
    }
}