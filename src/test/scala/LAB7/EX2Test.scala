package LAB7
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class CounterUpDownTest extends FreeSpec with ChiselScalatestTester{
    "EX2Test" in{
        test(new CounterUpDown(4)){c =>
            c.io.data_in.poke(1.B)
            c.clock.step(4)
            c.io.out.expect(0.B)
        
        }
    }
}