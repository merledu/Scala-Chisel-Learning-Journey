package practice

import chisel3._
import org.scalatest.FreeSpec
import chiseltest._



class ANDTest extends FreeSpec with ChiselScalatestTester{
    "AND Gate Test" in {
        test(new AND()){ c =>
        c.io.a.poke(4.S)
        c.io.b.poke(5.S)
        c.clock.step(1)
        c.io.c.expect(4.S)
        }
    
}
}