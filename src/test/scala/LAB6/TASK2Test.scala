package LAB6
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class COUNTXTest extends FreeSpec with ChiselScalatestTester{
    "TASK2Test" in{
        test(new COUNTX()){c =>
            c.clock.step(30)
        }
    }
}