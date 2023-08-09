package lab_2

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._


class ex2Tester extends FreeSpec with ChiselScalatestTester{
    "ex2 lab2 Tester " in {
        test(new MuxLookup){ a=>
        a.io.in0.poke(0.B)
        a.io.in1.poke(1.B)
        a.io.sel.poke(1.U)
        a.clock.step(5)
        a.io.out.expect(1.B)

        }
    }
}