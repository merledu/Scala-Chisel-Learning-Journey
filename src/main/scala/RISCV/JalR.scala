package RISCV
import chisel3._ 
import chisel3.util._ 

class JalR extends Module {
    val io = IO (new Bundle{
        val readata1 = Input(UInt(32.W))
        val immed = Input(UInt(32.W))
        val out = Output(UInt(32.W))
    })
    val a = io.immed + io.readata1
    val b = "hFFFFFFFE".U & a
    io.out := b
}