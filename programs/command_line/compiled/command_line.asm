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
// handle number
Set r245 , 1280
// allocate_stack - current: 2 size: 1
Set r246 , 1
Add r254 , r246
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r244 , 0
Set r243 , 2
Add r243 , r255
Add r243 , r244
Write r243 , r245
// write_register- end
// handle number end
// assign_new_variable - end

// assign_new_variable
// handle number
Set r243 , 720
// allocate_stack - current: 3 size: 1
Set r244 , 1
Add r254 , r244
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r242 , 0
Set r241 , 3
Add r241 , r255
Add r241 , r242
Write r241 , r243
// write_register- end
// handle number end
// assign_new_variable - end

// allocate_stack - current: 4 size: 1
Set r241 , 1
Add r254 , r241
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r247 , 0
Set r240 , 4
Add r240 , r255
Add r240 , r247
Write r240 , r254
// write_register- end
// allocate_stack - current: 5 size: 1
Set r238 , 1
Add r254 , r238
// alloc_stack - end
// handle number
Set r237 , 0
// allocate_stack - current: 6 size: 1
Set r236 , 1
Add r254 , r236
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r234 , 0
Set r233 , 6
Add r233 , r255
Add r233 , r234
Write r233 , r237
// write_register- end
// handle number end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r234 , 0
Set r235 , 6
Add r235 , r255
Add r235 , r234
Read r247 , r235
// read_register- end
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r234 , 0
Set r233 , 2
Add r233 , r255
Add r233 , r234
Read r239 , r233
// read_register- end
Set r240 , 1
Sub r247 , r240
:for_start2
Set r240 , 1
Add r247 , r240
Gte r247 , r239 , r240
RSet r242 , :for_end3
RJmpc r242 , r240
// write_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r234 , 0
Set r235 , 5
Add r235 , r255
Add r235 , r234
Write r235 , r247
// write_register- end
// for loop contents:
// allocate_stack - current: 7 size: 1
Set r235 , 1
Add r254 , r235
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r233 , 0
Set r232 , 7
Add r232 , r255
Add r232 , r233
Write r232 , r254
// write_register- end
// allocate_stack - current: 8 size: 1
Set r230 , 1
Add r254 , r230
// alloc_stack - end
// handle number
Set r229 , 0
// allocate_stack - current: 9 size: 1
Set r228 , 1
Add r254 , r228
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r226 , 0
Set r225 , 9
Add r225 , r255
Add r225 , r226
Write r225 , r229
// write_register- end
// handle number end
// read_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r226 , 0
Set r227 , 9
Add r227 , r255
Add r227 , r226
Read r233 , r227
// read_register- end
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r226 , 0
Set r225 , 3
Add r225 , r255
Add r225 , r226
Read r231 , r225
// read_register- end
Set r232 , 1
Sub r233 , r232
:for_start4
Set r232 , 1
Add r233 , r232
Gte r233 , r231 , r232
RSet r234 , :for_end5
RJmpc r234 , r232
// write_register- self: Data { stack_frame_offset: 8, size: 1, data_type: U32 }
Set r226 , 0
Set r227 , 8
Add r227 , r255
Add r227 , r226
Write r227 , r233
// write_register- end
// for loop contents:
// assign_new_variable
// handle_binary_expr
// handle_binary_expr
// allocate_stack - current: 10 size: 1
Set r224 , 1
Add r254 , r224
// alloc_stack - end
// handle_binary_expr - output_register- r227
// read_register- self: Data { stack_frame_offset: 8, size: 1, data_type: U32 }
Set r222 , 0
Set r221 , 8
Add r221 , r255
Add r221 , r222
Read r226 , r221
// read_register- end
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r222 , 0
Set r223 , 2
Add r223 , r255
Add r223 , r222
Read r225 , r223
// read_register- end
Mul r226 , r225
Cp r227 , r226
// write_register- self: Data { stack_frame_offset: 10, size: 1, data_type: U32 }
Set r222 , 0
Set r221 , 10
Add r221 , r255
Add r221 , r222
Write r221 , r227
// write_register- end
// handle_binary_expr - end
// allocate_stack - current: 11 size: 1
Set r221 , 1
Add r254 , r221
// alloc_stack - end
// handle_binary_expr - output_register- r227
// read_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r223 , 0
Set r220 , 5
Add r220 , r255
Add r220 , r223
Read r225 , r220
// read_register- end
// read_register- self: Data { stack_frame_offset: 10, size: 1, data_type: U32 }
Set r223 , 0
Set r222 , 10
Add r222 , r255
Add r222 , r223
Read r226 , r222
// read_register- end
Add r225 , r226
Cp r227 , r225
// write_register- self: Data { stack_frame_offset: 11, size: 1, data_type: U32 }
Set r223 , 0
Set r220 , 11
Add r220 , r255
Add r220 , r223
Write r220 , r227
// write_register- end
// handle_binary_expr - end
// assign_new_variable - end

// assign_new_variable
// handle number
Set r227 , 11110
// allocate_stack - current: 12 size: 1
Set r226 , 1
Add r254 , r226
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r220 , 0
Set r223 , 12
Add r223 , r255
Add r223 , r220
Write r223 , r227
// write_register- end
// handle number end
// assign_new_variable - end

// handle number
Set r223 , 1
// allocate_stack - current: 13 size: 1
Set r220 , 1
Add r254 , r220
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 13, size: 1, data_type: U32 }
Set r222 , 0
Set r219 , 13
Add r219 , r255
Add r219 , r222
Write r219 , r223
// write_register- end
// handle number end
// read_register- self: Data { stack_frame_offset: 13, size: 1, data_type: U32 }
Set r218 , 0
Set r217 , 13
Add r217 , r255
Add r217 , r218
Read r219 , r217
// read_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 1, data_type: U32 }
Set r218 , 0
Set r225 , 11
Add r225 , r255
Add r225 , r218
Read r222 , r225
// read_register- end
Phrp r219 , r222

// handle number
Set r225 , 1
// allocate_stack - current: 14 size: 1
Set r218 , 1
Add r254 , r218
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r216 , 0
Set r215 , 14
Add r215 , r255
Add r215 , r216
Write r215 , r225
// write_register- end
// handle number end
// read_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r214 , 0
Set r213 , 14
Add r213 , r255
Add r213 , r214
Read r215 , r213
// read_register- end
// read_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r214 , 0
Set r217 , 12
Add r217 , r255
Add r217 , r214
Read r216 , r217
// read_register- end
Phrp r215 , r216

// for loop contents - end
RSet r234 , :for_start4
RJmp r234
:for_end5
// read_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r214 , 0
Set r213 , 7
Add r213 , r255
Add r213 , r214
Read r254 , r213
// read_register- end
// for loop contents - end
RSet r242 , :for_start2
RJmp r242
:for_end3
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r233 , 0
Set r234 , 4
Add r234 , r255
Add r234 , r233
Read r254 , r234
// read_register- end
Halt
