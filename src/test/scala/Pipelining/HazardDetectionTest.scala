package Pipelining

import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class HAZARDdetectionTest extends FreeSpec with ChiselScalatestTester{
   "HAZARDdetectionTest test" in{
       test(new HazardDetection ()){c =>
         c.clock.step(1) 
       }
   }
}