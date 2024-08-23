package RISCV
import chisel3._
import chisel3.util
import org.scalatest.FreeSpec
import chiseltest._

class instMemoryTest extends FreeSpec with ChiselScalatestTester{
    "module4" in{
        test (new InstMemory("C:/Users/layba/Downloads/CHISEL3LABS/inst.txt")){ c =>
            c.io.address.poke(0.U)
            c.clock.step(10)
            c.io.data.expect("h00200293".U)
    }}
}