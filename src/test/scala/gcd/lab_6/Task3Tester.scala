package lab_6

import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.fromIntToLiteral



class Task3Tester extends FreeSpec with ChiselScalatestTester {
  "lab 6 task 3  " in {
    test(new shift_reg_with_parallel_load) { d =>
      d.io.load_in(0).poke(1.B)
      d.io.load_in(1).poke(1.B)

      d.io.load.poke(1.B)
      d.clock.step()
      d.io.load.poke(1.B)
      d.io.out(0).expect(1.B)
      d.io.out(1).expect(1.B)

      d.clock.step()

                //c.io.out.expect(1.U)

    }
  }
}