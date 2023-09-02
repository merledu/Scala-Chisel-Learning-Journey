circuit My_Queue :
  module Queue :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1>
    input io_enq_valid : UInt<1>
    input io_enq_bits : UInt<8>
    input io_deq_ready : UInt<1>
    output io_deq_valid : UInt<1>
    output io_deq_bits : UInt<8>
    output io_count : UInt<3>

    mem ram : @[Decoupled.scala 218:16]
      data-type => UInt<8>
      depth => 5
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    reg value : UInt<3>, clock with :
      reset => (UInt<1>("h0"), value) @[Counter.scala 60:40]
    reg value_1 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), value_1) @[Counter.scala 60:40]
    reg maybe_full : UInt<1>, clock with :
      reset => (UInt<1>("h0"), maybe_full) @[Decoupled.scala 221:27]
    node ptr_match = eq(value, value_1) @[Decoupled.scala 223:33]
    node _empty_T = eq(maybe_full, UInt<1>("h0")) @[Decoupled.scala 224:28]
    node empty = and(ptr_match, _empty_T) @[Decoupled.scala 224:25]
    node full = and(ptr_match, maybe_full) @[Decoupled.scala 225:24]
    node _do_enq_T = and(io_enq_ready, io_enq_valid) @[Decoupled.scala 40:37]
    node _do_deq_T = and(io_deq_ready, io_deq_valid) @[Decoupled.scala 40:37]
    node wrap = eq(value, UInt<3>("h4")) @[Counter.scala 72:24]
    node _value_T = add(value, UInt<1>("h1")) @[Counter.scala 76:24]
    node _value_T_1 = tail(_value_T, 1) @[Counter.scala 76:24]
    node _GEN_0 = mux(wrap, UInt<1>("h0"), _value_T_1) @[Counter.scala 86:20 Counter.scala 86:28 Counter.scala 76:15]
    node do_enq = _do_enq_T
    node _GEN_1 = validif(do_enq, value) @[Decoupled.scala 229:17 Decoupled.scala 230:8]
    node _GEN_2 = validif(do_enq, clock) @[Decoupled.scala 229:17 Decoupled.scala 230:8]
    node _GEN_3 = mux(do_enq, UInt<1>("h1"), UInt<1>("h0")) @[Decoupled.scala 229:17 Decoupled.scala 230:8 Decoupled.scala 218:16]
    node _GEN_4 = validif(do_enq, UInt<1>("h1")) @[Decoupled.scala 229:17 Decoupled.scala 230:24]
    node _GEN_5 = validif(do_enq, io_enq_bits) @[Decoupled.scala 229:17 Decoupled.scala 230:24]
    node _GEN_6 = mux(do_enq, _GEN_0, value) @[Decoupled.scala 229:17 Counter.scala 60:40]
    node wrap_1 = eq(value_1, UInt<3>("h4")) @[Counter.scala 72:24]
    node _value_T_2 = add(value_1, UInt<1>("h1")) @[Counter.scala 76:24]
    node _value_T_3 = tail(_value_T_2, 1) @[Counter.scala 76:24]
    node _GEN_7 = mux(wrap_1, UInt<1>("h0"), _value_T_3) @[Counter.scala 86:20 Counter.scala 86:28 Counter.scala 76:15]
    node do_deq = _do_deq_T
    node _GEN_8 = mux(do_deq, _GEN_7, value_1) @[Decoupled.scala 233:17 Counter.scala 60:40]
    node _T = neq(do_enq, do_deq) @[Decoupled.scala 236:16]
    node _GEN_9 = mux(_T, do_enq, maybe_full) @[Decoupled.scala 236:28 Decoupled.scala 237:16 Decoupled.scala 221:27]
    node _io_deq_valid_T = eq(empty, UInt<1>("h0")) @[Decoupled.scala 240:19]
    node _io_enq_ready_T = eq(full, UInt<1>("h0")) @[Decoupled.scala 241:19]
    node _ptr_diff_T = sub(value, value_1) @[Decoupled.scala 257:32]
    node ptr_diff = tail(_ptr_diff_T, 1) @[Decoupled.scala 257:32]
    node _io_count_T = mux(maybe_full, UInt<3>("h5"), UInt<1>("h0")) @[Decoupled.scala 262:24]
    node _io_count_T_1 = gt(value_1, value) @[Decoupled.scala 264:39]
    node _io_count_T_2 = add(UInt<3>("h5"), ptr_diff) @[Decoupled.scala 265:38]
    node _io_count_T_3 = tail(_io_count_T_2, 1) @[Decoupled.scala 265:38]
    node _io_count_T_4 = mux(_io_count_T_1, _io_count_T_3, ptr_diff) @[Decoupled.scala 264:24]
    node _io_count_T_5 = mux(ptr_match, _io_count_T, _io_count_T_4) @[Decoupled.scala 261:20]
    io_enq_ready <= _io_enq_ready_T @[Decoupled.scala 241:16]
    io_deq_valid <= _io_deq_valid_T @[Decoupled.scala 240:16]
    io_deq_bits <= ram.io_deq_bits_MPORT.data @[Decoupled.scala 242:15]
    io_count <= _io_count_T_5 @[Decoupled.scala 261:14]
    ram.io_deq_bits_MPORT.addr <= value_1 @[Decoupled.scala 242:21]
    ram.io_deq_bits_MPORT.en <= UInt<1>("h1") @[Decoupled.scala 242:21]
    ram.io_deq_bits_MPORT.clk <= clock @[Decoupled.scala 242:21]
    ram.MPORT.addr <= _GEN_1
    ram.MPORT.en <= _GEN_3
    ram.MPORT.clk <= _GEN_2
    ram.MPORT.data <= _GEN_5
    ram.MPORT.mask <= _GEN_4
    value <= mux(reset, UInt<3>("h0"), _GEN_6) @[Counter.scala 60:40 Counter.scala 60:40]
    value_1 <= mux(reset, UInt<3>("h0"), _GEN_8) @[Counter.scala 60:40 Counter.scala 60:40]
    maybe_full <= mux(reset, UInt<1>("h0"), _GEN_9) @[Decoupled.scala 221:27 Decoupled.scala 221:27]

  module My_Queue :
    input clock : Clock
    input reset : UInt<1>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : UInt<8>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits : UInt<8>

    inst que1 of Queue @[Decoupled.scala 296:21]
    inst que2 of Queue @[Decoupled.scala 296:21]
    io_out_valid <= que2.io_deq_valid @[ex4.scala 15:10]
    io_out_bits <= que2.io_deq_bits @[ex4.scala 15:10]
    io_in_ready <= que1.io_enq_ready @[Decoupled.scala 299:17]
    que1.clock <= clock
    que1.reset <= reset
    que1.io_enq_valid <= io_in_valid @[Decoupled.scala 297:22]
    que1.io_enq_bits <= io_in_bits @[Decoupled.scala 298:21]
    que1.io_deq_ready <= que2.io_enq_ready @[Decoupled.scala 299:17]
    que2.clock <= clock
    que2.reset <= reset
    que2.io_enq_valid <= que1.io_deq_valid @[Decoupled.scala 297:22]
    que2.io_enq_bits <= que1.io_deq_bits @[Decoupled.scala 298:21]
    que2.io_deq_ready <= io_out_ready @[ex4.scala 15:10]
