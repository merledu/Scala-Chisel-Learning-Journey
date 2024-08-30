package Pipelining

import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class ForwardUnitTest extends FreeSpec with ChiselScalatestTester{
   "ForwardUnitTest test" in{
       test(new ForwardUnit ()){c =>
         c.clock.step(1) 
       }
   }
}