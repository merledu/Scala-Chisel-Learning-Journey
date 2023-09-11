//package Single_Cycle
//import chisel3._
//import org.scalatest._
//import chiseltest._
//
//class RegisterFileTester extends FreeSpec with ChiselScalatestTester {
//  "registerfile Test" in {
//    test(new RegisterFile){c=>
//      c.io.Wen.poke(1.B)
//      c.io.datain.poke(15.U)
//      c.io.RD.poke(5.U)
//      c.clock.step()
//      c.io.Rs2out.expect(0.U)
//      c.io.Rs1out.expect(0.U)
//      c.clock.step()
//      c.io.Wen.poke(0.B)
//      c.io.datain.poke(30.U)
//      c.io.RD.poke(5.U)
//      c.io.Rs1in.poke(5.U)
//      c.io.Rs2in.poke(0.U)
//      c.clock.step()
//      c.io.Rs2out.expect(0.U)
//      c.io.Rs1out.expect(15.U)
//
//
//
//
//
//    }
//  }
//}