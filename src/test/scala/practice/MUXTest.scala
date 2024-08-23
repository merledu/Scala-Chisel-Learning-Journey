 package practice

import chisel3._
import org.scalatest._
import chiseltest._



class MUXTest extends FreeSpec with ChiselScalatestTester {
    "MUX Gate Test" in {
       test(new MUX()){ out =>
       out.io.a.poke(1.U)
       out.io.b.poke(1.U)
       out.io.s.poke(0.U)
       out.clock.step(1)
       out.io.out.expect(2.U)
        }
    }
}