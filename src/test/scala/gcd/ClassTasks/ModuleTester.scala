package ClassTasks
import chisel3._
import chisel3.tester._
import org.scalatest.FreeSpec
import chisel3.fromIntToLiteral



class mytest extends FreeSpec with ChiselScalatestTester {
  "transfer check test" in {
    test(new Main) { d =>
      d.io.tx.poke(false.B)
      d.io.busy.poke(false.B)

//

      d.io.data.expect(0.U)
      d.clock.step()

      d.io.tx.poke(true.B)
      d.io.busy.poke(true.B)
      d.io.data.expect(0.U)
      d.clock.step(2)

//      d.io.valid.expect(false.B)
//      d.io.data.expect(0.U)

//
//      d.io.tx.poke(true.B)
//      d.io.ready.poke(true.B)
//      d.clock.step()
//      d.io.valid.expect(false.B)
//      d.io.data.expect(0.U)
//
//      d.clock.step()
    }
  }
}