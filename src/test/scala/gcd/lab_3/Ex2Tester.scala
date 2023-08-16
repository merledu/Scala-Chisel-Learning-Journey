package lab_3
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._
import chisel3.fromIntToLiteral
import chisel3._


class Ex2Tester extends FreeSpec with ChiselScalatestTester {
  "Lab 3 Ex2 Tester file" in {
    test(new Ex2){a =>
        a.io.in_A.poke(23.U)
        a.io.in_B.poke(23.U)
        a.io.alu_Op.poke("b0001".U)
        a.io.out.expect(0.U)
        a.io.sum.expect(0.U)
        a.clock.step(10)

    }
  }
}