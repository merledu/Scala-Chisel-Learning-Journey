package lab_5

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.fromIntToLiteral



class ex2Tester extends FreeSpec with ChiselScalatestTester {
  "ex2 heeh Test" in {
    test(new eMux(SInt(4.W))) { d =>
      d.io.in1.poke(5.S)
      d.io.in2.poke(1.S)
      d.io.sel.poke(0.B)
      d.io.out.expect(1.S)

      d.clock.step()
    }
  }
}