// handle number
Set r250 , 300
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
RSet r246 , :static_declaration_end2
RJmp r246
:screen_width
Set r0 , 0
:static_declaration_end2
// allocate_stack - current: 1 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
RSet r246 , :screen_width
Add r246 , r251
Set r245 , 0
Sub r246 , r245
// write_directly_to_reference_pointer - 244, input: r246
Set r244 , 1
Add r244 , r255
Write r244 , r246
// write_directly_to_reference_pointer - end
// read_register- self: Data { stack_frame_offset: 0, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 0
Add r242 , r255
Add r242 , r243
Read r247 , r242
// read_register- end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r243 , 0
Set r244 , 1
Add r244 , r255
Read r244 , r244
Set r242 , 0
Add r244 , r242
Add r244 , r243
Write r244 , r247
// write_register- end

// handle number
Set r250 , 100
// allocate_stack - current: 2 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 2
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// handle number end
RSet r246 , :static_declaration_end3
RJmp r246
:screen_height
Set r0 , 0
:static_declaration_end3
// allocate_stack - current: 3 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
RSet r246 , :screen_height
Add r246 , r251
Set r245 , 0
Sub r246 , r245
// write_directly_to_reference_pointer - 244, input: r246
Set r244 , 3
Add r244 , r255
Write r244 , r246
// write_directly_to_reference_pointer - end
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 2
Add r242 , r255
Add r242 , r243
Read r247 , r242
// read_register- end
// write_register- self: Data { stack_frame_offset: 3, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r243 , 0
Set r244 , 3
Add r244 , r255
Read r244 , r244
Set r242 , 0
Add r244 , r242
Add r244 , r243
Write r244 , r247
// write_register- end

// handle number
Set r250 , 0
// allocate_stack - current: 4 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 4
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// handle number end
// allocate_stack - current: 5 size: 4
Set r247 , 4
Add r254 , r247
// alloc_stack - end
Set r246 , 3
// write_register- self: Data { stack_frame_offset: 5, size: 4, data_type: Array { inside: Char, len: 3 } }
Set r245 , 0
Set r244 , 5
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 99
// write_register- self: Data { stack_frame_offset: 5, size: 4, data_type: Array { inside: Char, len: 3 } }
Set r245 , 1
Set r248 , 5
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 109
// write_register- self: Data { stack_frame_offset: 5, size: 4, data_type: Array { inside: Char, len: 3 } }
Set r245 , 2
Set r244 , 5
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 100
// write_register- self: Data { stack_frame_offset: 5, size: 4, data_type: Array { inside: Char, len: 3 } }
Set r245 , 3
Set r248 , 5
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
// allocate_stack - current: 9 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 4
Add r242 , r255
Add r242 , r243
Read r245 , r242
// read_register- end
// read_addr_of_self
Set r242 , 5
Add r242 , r255
// read_addr_of_self - end
// read_addr_of_self
Set r243 , 9
Add r243 , r255
// read_addr_of_self - end
Syscall r245 , r242 , r243
// write_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r241 , 0
Set r240 , 9
Add r240 , r255
Add r240 , r241
Write r240 , r243
// write_register- end

// call_function_code
// call_function_code - needed_stack: 1
// allocate_stack - current: 10 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
RSet r247 , :function-return4
Add r247 , r251
Set r245 , 0
Sub r247 , r245
Write r254 , r247
RSet r248 , :function_test_screen_1
RJmp r248
:function-return4
// function call output: None
// function call converted output data : None

// handle number
Set r250 , 0
// allocate_stack - current: 11 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 11, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 11
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// handle number end
// allocate_stack - current: 12 size: 5
Set r247 , 5
Add r254 , r247
// alloc_stack - end
Set r246 , 4
// write_register- self: Data { stack_frame_offset: 12, size: 5, data_type: Array { inside: Char, len: 4 } }
Set r245 , 0
Set r244 , 12
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 69
// write_register- self: Data { stack_frame_offset: 12, size: 5, data_type: Array { inside: Char, len: 4 } }
Set r245 , 1
Set r248 , 12
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 78
// write_register- self: Data { stack_frame_offset: 12, size: 5, data_type: Array { inside: Char, len: 4 } }
Set r245 , 2
Set r244 , 12
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 68
// write_register- self: Data { stack_frame_offset: 12, size: 5, data_type: Array { inside: Char, len: 4 } }
Set r245 , 3
Set r248 , 12
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 33
// write_register- self: Data { stack_frame_offset: 12, size: 5, data_type: Array { inside: Char, len: 4 } }
Set r245 , 4
Set r244 , 12
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
// allocate_stack - current: 17 size: 1
Set r244 , 1
Add r254 , r244
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 11, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 11
Add r242 , r255
Add r242 , r243
Read r245 , r242
// read_register- end
// read_addr_of_self
Set r242 , 12
Add r242 , r255
// read_addr_of_self - end
// read_addr_of_self
Set r243 , 17
Add r243 , r255
// read_addr_of_self - end
Syscall r245 , r242 , r243
// write_register- self: Data { stack_frame_offset: 17, size: 1, data_type: U32 }
Set r241 , 0
Set r240 , 17
Add r240 , r255
Add r240 , r241
Write r240 , r243
// write_register- end

// allocate_stack - current: 18 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 18, size: 1, data_type: U32 }
Set r248 , 0
Set r247 , 18
Add r247 , r255
Add r247 , r248
Write r247 , r254
// write_register- end
:while_start5
Set r249 , 1
// allocate_stack - current: 19 size: 1
Set r246 , 1
Add r254 , r246
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 19, size: 1, data_type: Bool }
Set r244 , 0
Set r243 , 19
Add r243 , r255
Add r243 , r244
Write r243 , r249
// write_register- end
// read_register- self: Data { stack_frame_offset: 19, size: 1, data_type: Bool }
Set r244 , 0
Set r245 , 19
Add r245 , r255
Add r245 , r244
Read r247 , r245
// read_register- end
Not r247
RSet r248 , :while_end6
RJmpc r248 , r247
// while loop contents:
Halt

// while loop contents - end
RSet r248 , :while_start5
RJmp r248
:while_end6
// read_register- self: Data { stack_frame_offset: 18, size: 1, data_type: U32 }
Set r244 , 0
Set r243 , 18
Add r243 , r255
Add r243 , r244
Read r254 , r243
// read_register- end
// function: Function { is_interrupt_function: false, name: "test_screen", input: [], output: None, label_name: "function_test_screen_1" }
:function_test_screen_1
Cp r250 , r255
Cp r255 , r254
// allocate_stack - current: 0 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// allocate_stack - current: 1 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r246 , 0
Set r245 , 1
Add r245 , r255
Add r245 , r246
Write r245 , r250
// write_register- end
// assign_new_variable
// access_static_variable
// allocate_stack - current: 2 size: 1
Set r245 , 1
Add r254 , r245
// alloc_stack - end
RSet r246 , :screen_width
Add r246 , r251
Set r247 , 0
Sub r246 , r247
// write_directly_to_reference_pointer - 244, input: r246
Set r244 , 2
Add r244 , r255
Write r244 , r246
// write_directly_to_reference_pointer - end
// access_static_variable-end
// assign_new_variable - end

// assign_new_variable
// access_static_variable
// allocate_stack - current: 3 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
RSet r249 , :screen_height
Add r249 , r251
Set r248 , 0
Sub r249 , r248
// write_directly_to_reference_pointer - 247, input: r249
Set r247 , 3
Add r247 , r255
Write r247 , r249
// write_directly_to_reference_pointer - end
// access_static_variable-end
// assign_new_variable - end

// allocate_stack - current: 4 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r248 , 0
Set r247 , 4
Add r247 , r255
Add r247 , r248
Write r247 , r254
// write_register- end
// allocate_stack - current: 5 size: 1
Set r245 , 1
Add r254 , r245
// alloc_stack - end
// handle number
Set r244 , 0
// allocate_stack - current: 6 size: 1
Set r243 , 1
Add r254 , r243
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r241 , 0
Set r240 , 6
Add r240 , r255
Add r240 , r241
Write r240 , r244
// write_register- end
// handle number end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r241 , 0
Set r242 , 6
Add r242 , r255
Add r242 , r241
Read r248 , r242
// read_register- end
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r241 , 0
Set r240 , 3
Add r240 , r255
Read r240 , r240
Set r242 , 0
Add r240 , r242
Add r240 , r241
Read r246 , r240
// read_register- end
Set r247 , 1
Sub r248 , r247
:for_start7
Set r247 , 1
Add r248 , r247
Gte r248 , r246 , r247
RSet r249 , :for_end8
RJmpc r249 , r247
// write_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r241 , 0
Set r242 , 5
Add r242 , r255
Add r242 , r241
Write r242 , r248
// write_register- end
// for loop contents:
// allocate_stack - current: 7 size: 1
Set r242 , 1
Add r254 , r242
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r240 , 0
Set r239 , 7
Add r239 , r255
Add r239 , r240
Write r239 , r254
// write_register- end
// allocate_stack - current: 8 size: 1
Set r237 , 1
Add r254 , r237
// alloc_stack - end
// handle number
Set r236 , 0
// allocate_stack - current: 9 size: 1
Set r235 , 1
Add r254 , r235
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r233 , 0
Set r232 , 9
Add r232 , r255
Add r232 , r233
Write r232 , r236
// write_register- end
// handle number end
// read_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r233 , 0
Set r234 , 9
Add r234 , r255
Add r234 , r233
Read r240 , r234
// read_register- end
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r233 , 0
Set r232 , 2
Add r232 , r255
Read r232 , r232
Set r234 , 0
Add r232 , r234
Add r232 , r233
Read r238 , r232
// read_register- end
Set r239 , 1
Sub r240 , r239
:for_start9
Set r239 , 1
Add r240 , r239
Gte r240 , r238 , r239
RSet r241 , :for_end10
RJmpc r241 , r239
// write_register- self: Data { stack_frame_offset: 8, size: 1, data_type: U32 }
Set r233 , 0
Set r234 , 8
Add r234 , r255
Add r234 , r233
Write r234 , r240
// write_register- end
// for loop contents:
// assign_new_variable
// handle_binary_expr
// handle_binary_expr
// allocate_stack - current: 10 size: 1
Set r231 , 1
Add r254 , r231
// alloc_stack - end
// handle_binary_expr - output_register- r234
// read_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r229 , 0
Set r228 , 5
Add r228 , r255
Add r228 , r229
Read r233 , r228
// read_register- end
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r229 , 0
Set r230 , 2
Add r230 , r255
Read r230 , r230
Set r228 , 0
Add r230 , r228
Add r230 , r229
Read r232 , r230
// read_register- end
Mul r233 , r232
Cp r234 , r233
// write_register- self: Data { stack_frame_offset: 10, size: 1, data_type: U32 }
Set r229 , 0
Set r228 , 10
Add r228 , r255
Add r228 , r229
Write r228 , r234
// write_register- end
// handle_binary_expr - end
// allocate_stack - current: 11 size: 1
Set r228 , 1
Add r254 , r228
// alloc_stack - end
// handle_binary_expr - output_register- r234
// read_register- self: Data { stack_frame_offset: 8, size: 1, data_type: U32 }
Set r230 , 0
Set r227 , 8
Add r227 , r255
Add r227 , r230
Read r232 , r227
// read_register- end
// read_register- self: Data { stack_frame_offset: 10, size: 1, data_type: U32 }
Set r230 , 0
Set r229 , 10
Add r229 , r255
Add r229 , r230
Read r233 , r229
// read_register- end
Add r232 , r233
Cp r234 , r232
// write_register- self: Data { stack_frame_offset: 11, size: 1, data_type: U32 }
Set r230 , 0
Set r227 , 11
Add r227 , r255
Add r227 , r230
Write r227 , r234
// write_register- end
// handle_binary_expr - end
// assign_new_variable - end

// assign_new_variable
// handle number
Set r234 , 11110
// allocate_stack - current: 12 size: 1
Set r233 , 1
Add r254 , r233
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r227 , 0
Set r230 , 12
Add r230 , r255
Add r230 , r227
Write r230 , r234
// write_register- end
// handle number end
// assign_new_variable - end

// handle number
Set r230 , 1
// allocate_stack - current: 13 size: 1
Set r227 , 1
Add r254 , r227
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 13, size: 1, data_type: U32 }
Set r229 , 0
Set r226 , 13
Add r226 , r255
Add r226 , r229
Write r226 , r230
// write_register- end
// handle number end
// read_register- self: Data { stack_frame_offset: 13, size: 1, data_type: U32 }
Set r225 , 0
Set r224 , 13
Add r224 , r255
Add r224 , r225
Read r226 , r224
// read_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 1, data_type: U32 }
Set r225 , 0
Set r232 , 11
Add r232 , r255
Add r232 , r225
Read r229 , r232
// read_register- end
Phrp r226 , r229

// handle number
Set r232 , 1
// allocate_stack - current: 14 size: 1
Set r225 , 1
Add r254 , r225
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r223 , 0
Set r222 , 14
Add r222 , r255
Add r222 , r223
Write r222 , r232
// write_register- end
// handle number end
// read_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r221 , 0
Set r220 , 14
Add r220 , r255
Add r220 , r221
Read r222 , r220
// read_register- end
// read_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r221 , 0
Set r224 , 12
Add r224 , r255
Add r224 , r221
Read r223 , r224
// read_register- end
Phrp r222 , r223

// for loop contents - end
RSet r241 , :for_start9
RJmp r241
:for_end10
// read_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r221 , 0
Set r220 , 7
Add r220 , r255
Add r220 , r221
Read r254 , r220
// read_register- end
// for loop contents - end
RSet r249 , :for_start7
RJmp r249
:for_end8
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r240 , 0
Set r241 , 4
Add r241 , r255
Add r241 , r240
Read r254 , r241
// read_register- end
// Return

Cp r250 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 1
Add r246 , r255
Add r246 , r247
Read r249 , r246
// read_register- end
Cp r255 , r249
Read r250 , r250
Jmp r250
Halt
