package lab_6
import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.fromIntToLiteral



class ex3Tester extends FreeSpec with ChiselScalatestTester {
  "lab 6 ex 3  " in {
    test(new twoshot) { d =>
      d.io.din.poke(5.U)
      d.clock.step(25)





    }
  }
}