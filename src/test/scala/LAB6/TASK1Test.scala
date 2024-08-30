package LAB6
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class C1Test extends FreeSpec with ChiselScalatestTester{
    "TASK1Test" in{
        test(new C1(13)){c =>
            c.clock.step(30)
        }
    }
}