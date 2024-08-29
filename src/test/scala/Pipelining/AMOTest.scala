package Pipelining
import chisel3._
import chisel3.util
import org.scalatest.FreeSpec
import chiseltest._


class AMOOperations extends FreeSpec with ChiselScalatestTester {
   "AMOTest" in {
        test(new AtomicOperations()) { c =>
        // Initialize the memory at address 0 with a known value
            c.io.DataIn.poke(5.S)
            c.io.DataIn2.poke(5.S)
            c.io.atomic_op.poke(1.U)
            c.io.execute.poke(1.B)
            c.clock.step(1)
    }
  }
}
