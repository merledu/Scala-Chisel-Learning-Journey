package LAB2
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class  Mux_2to1Test extends FreeSpec with ChiselScalatestTester{
    "EX1" in {
         test(new Mux_2to1 ){ c => 
            c.io.sel.poke(1.B)
            c.io.in_A.poke(10.U)
            c.io.in_B.poke(5.U)
            c.clock.step(1)
            c.io.out.expect(5.U)
        }
    }
}