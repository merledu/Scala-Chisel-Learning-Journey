package LAB6

import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class UDCounterTest extends FreeSpec with ChiselScalatestTester{
   "Task4 test" in{
       test(new UDCounter()){c =>
       c.io.up_down.poke(1.B)
          c.clock.step(30)
          
       }
   }
}