package lab_6
import chisel3._
import org.scalatest._
import chiseltest._

class updowntest6  extends FreeSpec with ChiselScalatestTester {
  "up_down_counter6 Test" in {
    test(new up_down_counter()){c=>
      c.io.up_down.poke(1.B)
      c.clock.step(30)
      c.io.out.expect(1.U)

    }
  }
}