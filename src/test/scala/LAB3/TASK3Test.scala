package LAB3
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class  DecoderTest extends FreeSpec with ChiselScalatestTester{
    "TASK3" in {
         test(new decoder_with_valid){ c => 
            c.io.in.poke("b00".U)
            c.clock.step(10)
            c.io.out.bits.expect(1.U)
            c.io.out.valid.expect(1.B)

        }
    }
}