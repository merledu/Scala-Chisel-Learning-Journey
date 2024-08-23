package LAB6
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class ParalleloadSRegTest extends FreeSpec with ChiselScalatestTester{
    "TASK3Test" in{
        test(new ParalleloadSReg(3)){c =>
            c.io.in.poke(1.B)
            c.io.load_in(0).poke(0.B)
            c.io.load_in(1).poke(1.B)
            c.io.load_in(2).poke(0.B)
            c.io.load.poke(1.B)
            c.clock.step(1)
            c.io.out(0).expect(0.B)
            c.io.out(1).expect(1.B)
            c.io.out(2).expect(0.B)
        }
    }
}