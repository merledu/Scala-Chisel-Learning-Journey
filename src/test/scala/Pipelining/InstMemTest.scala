package Pipelining
import chisel3._
import chisel3.util
import org.scalatest.FreeSpec
import chiseltest._

class instMemoryTest extends FreeSpec with ChiselScalatestTester{
    "module4" in{
        test (new InstMemory("/home/laibakhan/Downloads/InstMem")){ c =>
            c.io.address.poke(0.U)
            c.clock.step(10)
            c.io.data.expect("h00200293".U)
    }}
}