package LAB1

import chisel3._
import org.scalatest.FreeSpec
import chiseltest._



class EX2Test extends FreeSpec with ChiselScalatestTester{
    "MSBCounter Test" in {
        test(new MSBCounter(3.U)){ c =>
        c.clock.step(10)
        c.io.result.expect(0.B)
        }
    
}
}