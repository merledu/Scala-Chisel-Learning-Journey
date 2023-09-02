package lab_6
import chisel3 . _
import chisel3 . util . _

class My_Queue extends Module {
  val io = IO(new Bundle{
    val out = Decoupled(Input(UInt(8.W)))
    val in = Flipped(Decoupled(Output(UInt(8.W))))
  } )

  val que1 = Queue(io.in , 5)
  val que2 = Queue(que1 , 5)

  //que2 <> que1
  io.out <> que2


}