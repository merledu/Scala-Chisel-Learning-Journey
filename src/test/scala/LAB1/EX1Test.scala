package LAB1

import chisel3._
import org.scalatest.FreeSpec
import chiseltest._



class EX1Test extends FreeSpec with ChiselScalatestTester{
    "Counter Test" in {
        test(new Counter(3.U)){ c =>
        c.clock.step(4)
        c.io.result.expect(1.B)
        }
    
}
}