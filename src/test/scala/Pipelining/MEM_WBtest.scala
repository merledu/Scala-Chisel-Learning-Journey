package Pipelining

import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class MEM_WBtest extends FreeSpec with ChiselScalatestTester{
   "MEM_WBTest test" in{
       test(new MEM_WB ()){c =>
         c.clock.step(1) 
       }
   }
}