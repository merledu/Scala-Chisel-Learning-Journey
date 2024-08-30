package LAB1

import chisel3._
import org.scalatest.FreeSpec
import chiseltest._



class EX3Test extends FreeSpec with ChiselScalatestTester{
    "Max Counter Test" in {
        test(new MaxCounter(2, 3)){ c =>

        c.clock.step(100)
       
        }
    
}
}