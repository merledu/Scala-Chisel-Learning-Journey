//package Single_Cycle
//import chisel3._
//import org.scalatest._
//import chiseltest._
//
//class CUTester extends FreeSpec with ChiselScalatestTester {
//  "CU Test" in {
//    test(new CU) { c =>
//      c.io.ins.poke("b00000000011100110000001010110011".U)
//      c.clock.step()
//      c.io.Rs1.expect(6.U)
//      c.io.Rs2.expect(7.U)
//      c.io.RD.expect(5.U)
//      c.io.func.expect(0.U)
//
//    }
//  }
//}