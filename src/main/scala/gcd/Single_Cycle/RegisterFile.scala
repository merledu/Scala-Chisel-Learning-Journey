package Single_Cycle
import chisel3 . _
import chisel3 . util . _
class RegisterFile  extends Module {
  val io = IO(new Bundle {
    val Wen = Input(Bool())
    val RD = Input(UInt(5.W))
    val Rs1in = Input(UInt(5.W))
    val Rs2in = Input(UInt(5.W))
    val Rs1out = Output(UInt(32.W))
    val Rs2out = Output(UInt(32.W))
    val datain = Input(UInt(32.W))
  })

  val regFile = Reg ( Vec ( 32 , UInt ( 32.W ) ) )

  io.Rs1out := 0.U
  io.Rs2out := 0.U

  regFile(0) := 0.U


  when(io.Wen && (io.RD =/= 0.U)){
    regFile(io.RD) := io.datain
    io.Rs1out := regFile(io.Rs1in)
    io.Rs2out := regFile(io.Rs2in)
  }
    .otherwise{
      io.Rs1out := regFile(io.Rs1in)
      io.Rs2out := regFile(io.Rs2in)

    }

}