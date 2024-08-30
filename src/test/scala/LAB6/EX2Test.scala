package LAB6
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class COUNTERTest extends FreeSpec with ChiselScalatestTester{
    "EX2Test" in{
        test(new COUNTER(10)){c =>
            c.clock.step(30)
        }
    }
}