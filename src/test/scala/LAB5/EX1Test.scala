package LAB5
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class ParameterTest extends FreeSpec with ChiselScalatestTester{
    "ParameterTest" in {
         test(new Parameter(4)){ c => 
            c.io.alu_oper.poke(1.U)
            c.io.arg_x.poke(5.U)
            c.io.arg_y.poke(5.U)
            c.clock.step(10)
            c.io.alu_out.expect(5.U)

        }
    }
}