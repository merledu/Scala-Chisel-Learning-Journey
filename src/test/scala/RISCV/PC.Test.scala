package RISCV
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class  PCTest extends FreeSpec with ChiselScalatestTester{
    "module 10" in{
        test (new ProgramCounter){ c =>
            c.io.pc_in.poke(4.S)
            c.clock.step(10)
            // c.io.pc_out.expect(4.S)
            // c.io.pc4.expect(8.S)
        }
    }
}
