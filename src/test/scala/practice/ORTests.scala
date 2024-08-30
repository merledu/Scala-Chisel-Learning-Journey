package practice

import chisel3._
import org.scalatest.FreeSpec
import chiseltest._



class ORTests extends FreeSpec with ChiselScalatestTester {
    "OR Gate Test" in {
        test(new OR()){ c =>
        c.io.a.poke(4.S)
        c.io.b.poke(5.S)
        c.clock.step(1)
        c.io.c.expect(5.S)
        }
    }
}
