package LAB7
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class STATETest extends FreeSpec with ChiselScalatestTester{
    "EX1Test" in{
        test(new STATE){c =>
            c.io.f1.poke(1.B)
            c.io.f2.poke(0.B)
            c.io.r1.poke(0.B)
            c.io.r2.poke(0.B)
            c.clock.step(4)
        
        }
    }
}