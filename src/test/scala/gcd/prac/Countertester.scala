package prac

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Countertester extends FreeSpec with ChiselScalatestTester{
    "Countertester file " in {
        test(new Counter(4.U)){ a=>
        a.clock.step(12)
        a.io.result.expect(0.B)

        }
    }
}