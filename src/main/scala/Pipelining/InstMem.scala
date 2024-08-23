package Pipelining

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile
import scala.io.Source

trait Config2{
    val WLEN = 32
    val INST_LEN = 1024
}

class InstMemory ( initFile : String ) extends Module with Config2{
    val io = IO (new Bundle{
        val address = Input(UInt(WLEN.W))
        val data = Output(UInt(WLEN.W))
    })
    val imem = Mem (INST_LEN, UInt (WLEN . W))

    loadMemoryFromFile(imem, initFile)
    io.data := imem(io.address)
}