package Pipelining

import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class ID_EXtest extends FreeSpec with ChiselScalatestTester{
   "IDEXTest test" in{
       test(new ID_EX ()){c =>
         c.clock.step(1) 
       }
   }
 }

 