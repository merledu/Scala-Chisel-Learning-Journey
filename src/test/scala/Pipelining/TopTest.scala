package Pipelining

import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class TopTest extends FreeSpec with ChiselScalatestTester{
   "Top test" in{
        test(new PipTop ()){
          c =>
          c.clock.step(100) 
        }
    }
  }