package LAB5
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class operatorTest  extends FreeSpec with ChiselScalatestTester{
    "EX3" in {
        test(new Operator(2, UInt(4.W))(_+_)){c=>
            c.io.in(0).poke(8.U)
            c.io.in(1).poke(2.U)
            c.clock.step(10)
            c.io.out(0).expect(10.U)
            c.io.out(1).expect(10.U)
        }
    }
}