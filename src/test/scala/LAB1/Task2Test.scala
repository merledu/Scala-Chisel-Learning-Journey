package LAB1

import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class Task2Test extends FreeSpec with ChiselScalatestTester{
   "Task2 test" in{
       test(new counter_up_down(4)){c =>
          c.clock.step(30)
          
       }
   }
}