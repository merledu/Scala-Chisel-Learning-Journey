package RISCV
import chisel3._
import chisel3.util
import org.scalatest.FreeSpec
import chiseltest._

class aluTest extends FreeSpec with ChiselScalatestTester{
    "module3" in{
        test (new ALU){ c =>
            c.io.in_A.poke(2.S)
            c.io.in_B.poke(2.S)
            c.io.alu_Op.poke(0.U)
            c.clock.step(10)
            c.io.out.expect(4.S)
    }}
}