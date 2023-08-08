package prac

import chisel3._


class Counter ( counterBits : UInt ) extends Module {
val io = IO (new Bundle {
    val result = Output ( Bool () )
})
val max = (1.U<<counterBits ) - 1.U
val count = RegInit (0.U (16.W ) )
when(count(counterBits) === 1.U ) {
    println(s"value of counter bits :  $counterBits")
    count := 0.U
    io.result:= (1.B)
    
} .otherwise {
    count := count + 1.U
    io.result:=(0.B)
}

println ( s" counter created with max value $max ")
}
