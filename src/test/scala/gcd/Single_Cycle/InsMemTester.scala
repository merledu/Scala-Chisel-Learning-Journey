//package Single_Cycle
//import chisel3._
//import org.scalatest._
//import chiseltest._
//
//class InsMemTester extends FreeSpec with ChiselScalatestTester {
//  "Imem Test" in {
//    test(new InstMem("C:/Users/Hamza's Son/Desktop/DSA SEM2 Java project/Scala-Chisel-Learning-Journey/src/main/scala/gcd/Single_Cycle/Imem.txt")) { c =>
//      c.io.addr.poke(0.U)
//      c.clock.step()
//      c.io.inst.expect("b00000000000100000000001100010011".U)
//
//    }
//  }
//}