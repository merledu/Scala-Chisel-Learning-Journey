package Pipelining
import chisel3._
import chisel3.util
import org.scalatest.FreeSpec
import chiseltest._
import chiseltest.experimental.TestOptionBuilder._ 
import chiseltest.internal.VerilatorBackendAnnotation

class DataMemoryTest extends FreeSpec with ChiselScalatestTester{
    "module5" in{
        test (new sram_mem).withAnnotations(Seq(VerilatorBackendAnnotation)){ c =>
            c.io.DataIn.poke(2.S)
            c.io.Addr.poke(4.U)
            c.io.mem_write.poke(0.B)
            c.io.mem_read.poke(0.B)
            c.clock.step(1)

            c.io.DataIn.poke(2.S)
            c.io.Addr.poke(4.U)
            c.io.mem_write.poke(1.B)
            c.io.mem_read.poke(0.B)
            c.clock.step(1)

            c.io.DataIn.poke(2.S)
            c.io.Addr.poke(4.U)
            c.io.mem_write.poke(1.B)
            c.io.mem_read.poke(0.B)
            c.clock.step(1)

            c.io.DataIn.poke(2.S)
            c.io.Addr.poke(4.U)
            c.io.mem_write.poke(0.B)
            c.io.mem_read.poke(1.B)
            c.clock.step(3)
    }}
}