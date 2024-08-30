package LAB6
import chisel3._
import chisel3.util._

class COUNTER (val max : Int , val min : Int = 0) extends Module {
    val io = IO (new Bundle {
    val out = Output (UInt (log2Ceil (max) .W))
})
    val counter = RegInit (min.U (log2Ceil(max) .W))

    val count_buffer = Mux( (isPow2 ( max ) && ( min ==0)).B , counter +1. U , Mux( counter ===
max .U , min .U , counter +1. U ) )

    counter := count_buffer
    io.out := counter
}
