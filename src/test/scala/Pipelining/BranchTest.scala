package Pipelining
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class  BranchTest extends FreeSpec with ChiselScalatestTester{
    "module8" in {
         test(new Branch){ c => 
            c.io.fnct3.poke(0.U)
            c.io.branch.poke(1.B)
            c.io.arg_x.poke(5.S)
            c.io.arg_y.poke(5.S)
            c.clock.step(10)
            c.io.br_taken.expect(1.B)

        }
    }
}