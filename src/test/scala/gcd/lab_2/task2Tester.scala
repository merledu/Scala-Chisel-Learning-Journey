package lab_2

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._

class Task2Tester extends FreeSpec with ChiselScalatestTester{
    "lab 2 task 2 tester " in {
        test(new task2){ a=>
        a.io.in(0).poke(1.B)
        a.io.in(1).poke(1.B)
        a.io.in(2).poke(0.B)
        a.io.in(3).poke(1.B)
        a.io.sel(0).poke(0.B)
        a.io.sel(1).poke(1.B)
        a.io.out(0).expect(0.B)
        a.clock.step(2)

        }
    }
}