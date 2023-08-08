package prac

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._
import chisel3.tester.experimental.TestOptionBuilder._
import chiseltest.internal.WriteVcdAnnotation

class Task1Tester extends FreeSpec with ChiselScalatestTester{
    "Counter Tester file 3 " in {
        test(new Counter(5.U)){ a=>
        a.clock.step(10)
        a.io.result.expect(0.B)

        }
    }
}