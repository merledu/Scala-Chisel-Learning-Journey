package Pipelining
import chisel3._
import chisel3.util
import org.scalatest.FreeSpec
import chiseltest._

class RegFileTest extends FreeSpec with ChiselScalatestTester{
    "module6" in{
        test (new RegFile){ c =>
            c.io.Reg1.poke(2.U)
            c.io.Reg2.poke(4.U)
            c.io.Reg_write.poke(1.B)
            c.io.write_Reg.poke(3.U)
            c.io.write_data.poke(15.S)
            c.clock.step(10)

    }}
}