package prac

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Counter2tester extends FreeSpec with ChiselScalatestTester{
    "Counter2tester file " in {
        test(new Counter2(4, 4)){ a=>
        a.clock.step(12)
        a.io.result.expect(0.B)

        }
    }
}