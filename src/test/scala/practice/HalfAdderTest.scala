package practice
import chisel3._
import chisel3.util._
import org.scalatest.FreeSpec
import chiseltest._

class HalfAdderTest extends FreeSpec with ChiselScalatestTester{
    "halfadder" in{
        test (new HalfAdder ){ c =>
            c.io.a.poke(2.U)
            c.io.b.poke(4.U)
            c.clock.step(10)
            c.io.sum.expect(6.U)
            c.io.out.expect(0.U)
    }}
}