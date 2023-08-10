package lab_2

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Task1Tester extends FreeSpec with ChiselScalatestTester{
    "lab 2 task 1 tester " in {
        test(new Task1){ a=>
        a.io.s0.poke(1.B)
        a.io.s1.poke(1.B)
        a.io.s2.poke(0.B)
        a.io.out.expect(0.U)
        a.clock.step(2)

        }
    }
}