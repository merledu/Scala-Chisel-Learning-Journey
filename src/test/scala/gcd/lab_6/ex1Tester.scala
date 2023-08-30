package lab_6

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.fromIntToLiteral



class ex1Tester extends FreeSpec with ChiselScalatestTester {
  "lab 6 ex 1 " in {
    test(new shift_register) { d =>

      d.io.in.poke("b1000".U)

      d.clock.step()
      d.io.out.expect("b1000".U)
    }
  }
}