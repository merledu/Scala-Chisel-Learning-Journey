package Pipelining
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class  PCTest extends FreeSpec with ChiselScalatestTester{
    "module 10" in{
        test (new PC){ c =>
            c.io.in.poke(4.S)
            c.clock.step(10)
            c.io.out.expect(4.S)
            
        }
    }
}
