// handle number
Set r250 , 0
// allocate_stack - current: 0 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 0, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 0
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// handle number end
// allocate_stack - current: 1 size: 13
Set r247 , 13
Add r254 , r247
// alloc_stack - end
Set r246 , 12
// write_register- self: Data { stack_frame_offset: 1, size: 13, data_type: Array { inside: Char, len: 12 } }
Set r245 , 0
Set r244 , 1
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 99
// write_register- self: Data { stack_frame_offset: 1, size: 13, data_type: Array { inside: Char, len: 12 } }
Set r245 , 1
Set r248 , 1
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 111
// write_register- self: Data { stack_frame_offset: 1, size: 13, data_type: Array { inside: Char, len: 12 } }
Set r245 , 2
Set r244 , 1
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 109
// write_register- self: Data { stack_frame_offset: 1, size: 13, data_type: Array { inside: Char, len: 12 } }
Set r245 , 3
Set r248 , 1
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 109
// write_register- self: Data { stack_frame_offset: 1, size: 13, data_type: Array { inside: Char, len: 12 } }
Set r245 , 4
Set r244 , 1
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 97
// write_register- self: Data { stack_frame_offset: 1, size: 13, data_type: Array { inside: Char, len: 12 } }
Set r245 , 5
Set r248 , 1
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 110
// write_register- self: Data { stack_frame_offset: 1, size: 13, data_type: Array { inside: Char, len: 12 } }
Set r245 , 6
Set r244 , 1
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 100
// write_register- self: Data { stack_frame_offset: 1, size: 13, data_type: Array { inside: Char, len: 12 } }
Set r245 , 7
Set r248 , 1
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 95
// write_register- self: Data { stack_frame_offset: 1, size: 13, data_type: Array { inside: Char, len: 12 } }
Set r245 , 8
Set r244 , 1
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 108
// write_register- self: Data { stack_frame_offset: 1, size: 13, data_type: Array { inside: Char, len: 12 } }
Set r245 , 9
Set r248 , 1
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 105
// write_register- self: Data { stack_frame_offset: 1, size: 13, data_type: Array { inside: Char, len: 12 } }
Set r245 , 10
Set r244 , 1
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 110
// write_register- self: Data { stack_frame_offset: 1, size: 13, data_type: Array { inside: Char, len: 12 } }
Set r245 , 11
Set r248 , 1
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 101
// write_register- self: Data { stack_frame_offset: 1, size: 13, data_type: Array { inside: Char, len: 12 } }
Set r245 , 12
Set r244 , 1
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
// allocate_stack - current: 14 size: 1
Set r244 , 1
Add r254 , r244
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 0, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 0
Add r242 , r255
Add r242 , r243
Read r245 , r242
// read_register- end
// read_addr_of_self
Set r242 , 1
Add r242 , r255
// read_addr_of_self - end
// read_addr_of_self
Set r243 , 14
Add r243 , r255
// read_addr_of_self - end
Syscall r245 , r242 , r243
// write_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r241 , 0
Set r240 , 14
Add r240 , r255
Add r240 , r241
Write r240 , r243
// write_register- end

Halt

Halt

Halt

// allocate_stack - current: 15 size: 1
Set r242 , 1
Add r254 , r242
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 15, size: 1, data_type: U32 }
Set r243 , 0
Set r240 , 15
Add r240 , r255
Add r240 , r243
Write r240 , r254
// write_register- end
:while_start2
Set r245 , 1
// allocate_stack - current: 16 size: 1
Set r241 , 1
Add r254 , r241
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 16, size: 1, data_type: Bool }
Set r239 , 0
Set r238 , 16
Add r238 , r255
Add r238 , r239
Write r238 , r245
// write_register- end
// read_register- self: Data { stack_frame_offset: 16, size: 1, data_type: Bool }
Set r239 , 0
Set r248 , 16
Add r248 , r255
Add r248 , r239
Read r240 , r248
// read_register- end
Not r240
RSet r243 , :while_end3
RJmpc r243 , r240
// while loop contents:
Halt

// while loop contents - end
RSet r243 , :while_start2
RJmp r243
:while_end3
// read_register- self: Data { stack_frame_offset: 15, size: 1, data_type: U32 }
Set r239 , 0
Set r238 , 15
Add r238 , r255
Add r238 , r239
Read r254 , r238
// read_register- end
// function: Function { is_interrupt_function: false, name: "test_fn", input: [FunctionInputData { name: "val", data_type: U32, stack_frame_offset: -2 }], output: None, label_name: "function_test_fn_1" }
:function_test_fn_1
Cp r243 , r255
Cp r255 , r254
// allocate_stack - current: 0 size: 1
Set r240 , 1
Add r254 , r240
// alloc_stack - end
// allocate_stack - current: 1 size: 1
Set r238 , 1
Add r254 , r238
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r248 , 0
Set r237 , 1
Add r237 , r255
Add r237 , r248
Write r237 , r243
// write_register- end
Set r237 , 0
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r236 , 0
Set r235 , 4294967294
Add r235 , r255
Add r235 , r236
Read r248 , r235
// read_register- end
Phrp r237 , r248

Halt
