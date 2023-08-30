package lab_6

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.fromIntToLiteral



class Task2Tester extends FreeSpec with ChiselScalatestTester {
  "lab 6 task 2  " in {
    test(new counter_with_xor(6)) { d =>
      d.clock.step(10)

    }
  }
}