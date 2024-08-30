package RISCV

import chisel3._
import chisel3.util._
import org.scalatest.FreeSpec
import chiseltest._

class TopTest extends FreeSpec with ChiselScalatestTester{
    "Top" in{
        test (new Top ){ c =>
           c.clock.step(100)
    }}
}