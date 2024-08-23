package LAB3
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class  EncoderTest extends FreeSpec with ChiselScalatestTester{
    "EX1" in {
         test(new Encoder4to2){ c => 
            c.clock.step(1)
         }
    }
}