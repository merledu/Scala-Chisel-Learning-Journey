package lab_3
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._
import chisel3.fromIntToLiteral
import chisel3._
import lab3.L3Task2


class Task2Tester extends FreeSpec with ChiselScalatestTester {
  "Lab 3 Task 2 Tester file" in {
    test(new L3Task2){ a =>
      a.io.instr.poke("b11111101001100000000000010010011".U)
      a.io.immd_se.expect(-45.S)
      a.clock.step(10)

    }
  }
}