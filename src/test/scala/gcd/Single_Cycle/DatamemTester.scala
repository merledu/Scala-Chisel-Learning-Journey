// package Single_Cycle
// import chisel3._
// import org.scalatest._
// import chiseltest._

// class DatamemTester extends FreeSpec with ChiselScalatestTester {
//   "Datamem Test" in {
//     test(new Datamem) { c =>
//       c.clock.step()
//       c.io.Wen.poke(1.B)
//       c.io.datain.poke(15.S)
//       c.io.addr.poke(2.U)
//       c.io.fun3.poke(0.U)
//       c.clock.step(5)
//       c.io.dataout.expect(15.S)

//     }
//   }
// }
