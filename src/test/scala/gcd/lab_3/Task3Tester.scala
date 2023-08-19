package lab_3
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.experimental.BundleLiterals._
import chisel3.fromIntToLiteral
import chisel3._


class Task3Tester extends FreeSpec with ChiselScalatestTester {
  "WALID Tester file" in {
    test(new Task3){b =>
       b.io.in.poke("b00".U)
       b.io.out.bits.expect("b0001".U)
       b.io.out.valid.expect(1.B)
       b.clock.step(10)

    }
  }
}