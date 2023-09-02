package lab_6
import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.fromIntToLiteral



class MyqueTester extends FreeSpec with ChiselScalatestTester {
  "lab 6 ex 4  " in {
    test(new My_Queue) { c =>
      c.io.in.bits.poke(8.U)
      c.io.in.valid.poke(1.B)
      c.clock.step(20)
      c.io.out.ready.poke(1.B)
      c.io.out.bits.expect(8.U)

    }
  }
}