package prac

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

//change karne ki koshish

class UpDownCounterTester extends FreeSpec with ChiselScalatestTester{
    "updownCounter2tester file " in {
        test(new counter_up_down(4)){ a=>
        a.clock.step(12)
        a.io.out.expect(0.B)

        }
    }
}