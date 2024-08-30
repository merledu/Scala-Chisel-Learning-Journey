package RISCV
import chisel3._
import chisel3.util
import org.scalatest.FreeSpec
import chiseltest._

class aluControlTest extends FreeSpec with ChiselScalatestTester{
    "module2" in{
        test (new AluControl){ c =>
            c.io.func3.poke(0.U)
            c.io.func7.poke(0.B)
            c.io.alu_op.poke(0.U)
            c.clock.step(10)
            c.io.out.expect(0.U)
    }}
}