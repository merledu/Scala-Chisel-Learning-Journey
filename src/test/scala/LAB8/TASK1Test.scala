package LAB8
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class memoryTest extends FreeSpec with ChiselScalatestTester{
    "EX1Test" in{
        test(new Memory_assignment){c =>
            c.io.requestor(0).bits.poke(4.U)
            c.io.requestor(0).valid.poke(1.B)
            c.io.requestor(1).bits.poke(5.U)
            c.io.requestor(1).valid.poke(0.B)
            c.io.requestor(2).bits.poke(6.U)
            c.io.requestor(2).valid.poke(0.B)
            c.io.requestor(3).bits.poke(7.U)
            c.io.requestor(3).valid.poke(0.B)
            c.io.Readaddr.poke(5.U)
            c.io.Writeaddr.poke(5.U)
            c.clock.step(10)
            c.io.memory_out(0).expect(4.U)
            c.io.memory_out(1).expect(0.U)
            c.io.memory_out(2).expect(0.U)
            c.io.memory_out(3).expect(0.U)
        }
    }
}