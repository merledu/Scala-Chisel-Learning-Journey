package Single_Cycle
import chisel3._
import org.scalatest._
import chiseltest._

class DatamemTester extends FreeSpec with ChiselScalatestTester {
  "Datamem Test" in {
    test(new Datamem) { c =>
      c.io.Wen.poke(1.B)
      c.io.datain.poke(15.U)
      c.io.addr.poke(1.U)
      c.clock.step()
      c.io.dataout.expect(15.U)
      c.io.Wen.poke(0.B)
      c.io.datain.poke(30.U)
      c.io.addr.poke(1.U)
      c.clock.step()
      c.io.dataout.expect(15.U)
    }
  }
}
