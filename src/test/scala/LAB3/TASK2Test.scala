package LAB3
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class  ImmdValGenTest extends FreeSpec with ChiselScalatestTester{
    "TASK2" in {
         test(new ImmdValGen){ c => 
            c.io.instr.poke("b00000000010100000000001010010011".U)
            c.clock.step(10)
            c.io.immd_se.expect(5.U)

        }
    }
}