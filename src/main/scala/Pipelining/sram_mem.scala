package Pipelining
import chisel3._
import chisel3.util._
import chisel3.experimental._
import chisel3.util.experimental._


class SRAMIO extends Bundle {
    val clk_i = Input(Bool())
    val rst_i = Input(Bool())
    val csb_i = Input(Bool())
    val we_i = Input(Bool())
    val wmask_i = Input(UInt(4.W))
    val addr_i = Input(UInt(13.W))
    val wdata_i = Input(UInt(32.W))
    val rdata_o = Output(UInt(32.W))
}


class sram_top(programFile:Option[String] ) extends BlackBox(
    Map("IFILE_IN" -> {if (programFile.isDefined) programFile.get else ""})
) with HasBlackBoxResource {
    val io = IO(new SRAMIO)
    addResource("/sram_top.v")
    addResource("/sram.v")
}


class sram_mem extends Module{
    val io = IO (new Bundle{
        val Addr = Input(UInt(32.W))
        val mem_read = Input(Bool())
        val mem_write = Input(Bool())
        val DataIn = Input(SInt(32.W))
        val DataOut = Output(UInt(32.W))
    })
    val sram = Module(new sram_top(None))  
    sram.io.clk_i := clock.asBool()
    sram.io.rst_i := reset.asBool()
    sram.io.csb_i := (io.mem_read || io.mem_write)
    sram.io.we_i := io.mem_write
    sram.io.wmask_i := Mux(io.mem_write, "b1111".U, 0.U)
    sram.io.addr_i := io.Addr(12,0) 
    sram.io.wdata_i := io.DataIn.asUInt()
    io.DataOut := sram.io.rdata_o
}