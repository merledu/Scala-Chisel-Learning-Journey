package LAB8
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class maskingTest extends FreeSpec with ChiselScalatestTester{
    "EX1Test" in{
        test(new MaskedReadWriteSmem){c =>
            c.io.enable.poke(1.B)
            c.io.write.poke(1.B)
            c.io.addr.poke(10.U)
            c.io.mask(0).poke(1.B)
            c.io.dataIn(0).poke(5.U)
            c.clock.step(10)
            c.io.dataOut(0).expect(5.U)
        
        }
    }
}