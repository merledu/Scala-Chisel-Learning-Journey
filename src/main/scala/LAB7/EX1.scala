package LAB7
import chisel3._
import chisel3.util._
import chisel3.experimental.ChiselEnum

class Statess extends Module{
    val io = IO (new Bundle {
        val in = Input (Bool())
        val out = Output (Bool())
})
val s0 :: s1 :: s2 :: Nil = Enum (3)
val state = RegInit ( s0 ) 

io.out := (state === s2) & (!io.in ) 
switch (state) {
    is (s0) {
        when (io.in ) {
        state := s1
}
}
is (s1) {
    when ( io.in ) {
    state := s2
}.otherwise {
    state := s0
}
}
is ( s2 ) {
    when (!io.in ) {
        state := s0
}
}
}
}