package lab_3
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._
import chisel3.fromIntToLiteral
import chisel3._



class Ex1Tester extends FreeSpec with ChiselScalatestTester{
  "lab 3 Ex 1 tester " in {
    test(new Ex1){ a=>
      a.io.in.poke("b0010".U)
      a.io.out.expect(1.U)
      a.clock.step(2)

    }
  }
}