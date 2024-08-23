package LAB2
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class TASK1Test extends FreeSpec with ChiselScalatestTester{
    "TASK 1" in {
         test(new TASK1){ c =>
            c.clock.step(10)
       
        }
    }
}