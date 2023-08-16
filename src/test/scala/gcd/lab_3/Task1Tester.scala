package lab_3
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._
import chisel3.fromIntToLiteral
import chisel3._


class Task1Tester extends FreeSpec with ChiselScalatestTester {
  "Lab 3 Task 1 Tester file" in {
    test(new Ltask1){ a =>
      a.io.arg_y.poke(5.U)
      a.io.arg_x.poke(2.U)
      a.io.branch.poke(1.B)
      a.io.fnct3.poke("b100".U)
      a.io.br_taken.expect(1.B)
      a.clock.step(10)

    }
  }
}