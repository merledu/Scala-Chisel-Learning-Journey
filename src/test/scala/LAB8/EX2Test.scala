package LAB8
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class ForwardingTest extends FreeSpec with ChiselScalatestTester{
    "EX1Test" in{
        test(new Forwarding){c =>
            c.io.enable.poke(1.B)
            c.io.rdAddr.poke(5.U)
            c.io.wrAddr.poke(5.U)
            c.io.wrData(0).poke(2.U)
            c.io.wrData(1).poke(3.U)
            c.io.wr_en.poke(1.B)
            c.io.mask(0).poke(1.B)
            c.io.mask(1).poke(1.B)
            c.clock.step(10)
            c.io.out(0).expect(2.U)
            c.io.out(1).expect(3.U)
        
        }
    }
}