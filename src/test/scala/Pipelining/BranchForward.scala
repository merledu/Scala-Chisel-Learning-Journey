package Pipelining

import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class BranchForwardTest extends FreeSpec with ChiselScalatestTester{
   "BranchForwardTest test" in{
       test(new BranchForward ()){c =>
         c.clock.step(1) 
       }
   }
}