package lab_5

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.fromIntToLiteral



class ex1Tester extends FreeSpec with ChiselScalatestTester {
  "ALU heeh Test" in {
    test(new ALU(4, 32)) { c =>

      c.io.arg_x.poke(50.U)
      c.io.arg_y.poke(50.U)
      c.io.alu_oper.poke("b0000".U)
      c.io.alu_out.expect(50.U)
      c.clock.step()
    }
  }
}

