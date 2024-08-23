package practice
import chisel3._

class NOT extends Module{
    val io = IO(new Bundle{
        val a = Input(Bool())
        val c = Output(Bool())
    })

    io.c := ~io.a
}

