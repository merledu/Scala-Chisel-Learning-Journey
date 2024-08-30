package RISCV
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class  JalrTest extends FreeSpec with ChiselScalatestTester{
    "module 9" in{
        test (new JalR){ c =>
            c.io.readata1.poke(4.U)
            c.io.immed.poke(4.U)
            c.clock.step(10)
            c.io.out.expect(8.U)
        }
    }
}