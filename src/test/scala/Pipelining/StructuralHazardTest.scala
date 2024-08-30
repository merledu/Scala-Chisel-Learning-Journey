package Pipelining

import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class StructuralHazardTest extends FreeSpec with ChiselScalatestTester{
   "StructuralHazard test" in{
       test(new StructuralHazard()){c =>
         c.clock.step(1) 
       }
   }
}