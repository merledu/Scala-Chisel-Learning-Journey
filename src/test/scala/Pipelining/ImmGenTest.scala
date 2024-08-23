package Pipelining
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class  ImmGenTest extends FreeSpec with ChiselScalatestTester{
    "module7" in {
         test(new ImmGen){ c => 
            c.io.instr.poke("h00830193".U)
            c.io.pc.poke(0.U)
            c.clock.step(10)
            
        }
    }
}