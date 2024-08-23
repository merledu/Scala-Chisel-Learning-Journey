package LAB1
import chisel3._


class Castings extends Module{
    val io = IO(new Bundle{
    val x = Input ( SInt (4. W ) )
    val y = Input ( SInt (4. W ) )
    val z = Output ( SInt (4. W ) )   
   
    })
    val y1 = io.y.asUInt 
    val x1 = io.x.asUInt
    val z1 = x1 + y1
    io.z := z1.asSInt

    
}

 
// println(( new chisel3.stage.ChiselStage ) .emitVerilog (new Castings ) )