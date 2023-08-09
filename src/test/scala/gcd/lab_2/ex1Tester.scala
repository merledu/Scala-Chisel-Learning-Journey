package lab_2

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class ex1Tester extends FreeSpec with ChiselScalatestTester{
    "lab 2 ex1Tester " in {
        test(new ex1){ a=>
        a.io.in_A.poke(45.U)
        a.io.select.poke(1.B)
        a.io.out.expect(45.U)
        a.clock.step(10)

        }
    }
}