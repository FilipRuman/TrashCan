// handle number
Set r250 , 9000
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
RSet r246 , :static_declaration_end10
RJmp r246
:heap_start
Set r0 , 0
:static_declaration_end10
// allocate_stack - current: 1 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
RSet r246 , :heap_start
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

// access_static_variable
// allocate_stack - current: 2 size: 1
Set r247 , 1
Add r254 , r247
// alloc_stack - end
RSet r246 , :heap_start
Add r246 , r251
Set r244 , 0
Sub r246 , r244
// write_directly_to_reference_pointer - 243, input: r246
Set r243 , 2
Add r243 , r255
Write r243 , r246
// write_directly_to_reference_pointer - end
// access_static_variable-end
// allocate_stack - current: 3 size: 1
Set r246 , 1
Add r254 , r246
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r241 , 0
Set r240 , 2
Add r240 , r255
Read r240 , r240
Set r242 , 0
Add r240 , r242
Add r240 , r241
Read r243 , r240
// read_register- end
// write_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r241 , 0
Set r242 , 3
Add r242 , r255
Add r242 , r241
Write r242 , r243
// write_register- end
RSet r243 , :static_declaration_end11
RJmp r243
:heap_main_pool_head
Set r0 , 0
:static_declaration_end11
// allocate_stack - current: 4 size: 1
Set r241 , 1
Add r254 , r241
// alloc_stack - end
RSet r243 , :heap_main_pool_head
Add r243 , r251
Set r240 , 0
Sub r243 , r240
// write_directly_to_reference_pointer - 239, input: r243
Set r239 , 4
Add r239 , r255
Write r239 , r243
// write_directly_to_reference_pointer - end
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r238 , 0
Set r237 , 3
Add r237 , r255
Add r237 , r238
Read r242 , r237
// read_register- end
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r238 , 0
Set r239 , 4
Add r239 , r255
Read r239 , r239
Set r237 , 0
Add r239 , r237
Add r239 , r238
Write r239 , r242
// write_register- end

// handle number
Set r242 , 30000
// allocate_stack - current: 5 size: 1
Set r243 , 1
Add r254 , r243
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r238 , 0
Set r237 , 5
Add r237 , r255
Add r237 , r238
Write r237 , r242
// write_register- end
// handle number end
RSet r237 , :static_declaration_end12
RJmp r237
:heap_end
Set r0 , 0
:static_declaration_end12
// allocate_stack - current: 6 size: 1
Set r239 , 1
Add r254 , r239
// alloc_stack - end
RSet r237 , :heap_end
Add r237 , r251
Set r236 , 0
Sub r237 , r236
// write_directly_to_reference_pointer - 235, input: r237
Set r235 , 6
Add r235 , r255
Write r235 , r237
// write_directly_to_reference_pointer - end
// read_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r234 , 0
Set r233 , 5
Add r233 , r255
Add r233 , r234
Read r238 , r233
// read_register- end
// write_register- self: Data { stack_frame_offset: 6, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r234 , 0
Set r235 , 6
Add r235 , r255
Read r235 , r235
Set r233 , 0
Add r235 , r233
Add r235 , r234
Write r235 , r238
// write_register- end

// handle number
Set r238 , 2
// allocate_stack - current: 7 size: 1
Set r237 , 1
Add r254 , r237
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r234 , 0
Set r233 , 7
Add r233 , r255
Add r233 , r234
Write r233 , r238
// write_register- end
// handle number end
RSet r233 , :static_declaration_end13
RJmp r233
:min_heap_size_pow_2
Set r0 , 0
:static_declaration_end13
// allocate_stack - current: 8 size: 1
Set r235 , 1
Add r254 , r235
// alloc_stack - end
RSet r233 , :min_heap_size_pow_2
Add r233 , r251
Set r232 , 0
Sub r233 , r232
// write_directly_to_reference_pointer - 231, input: r233
Set r231 , 8
Add r231 , r255
Write r231 , r233
// write_directly_to_reference_pointer - end
// read_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r230 , 0
Set r229 , 7
Add r229 , r255
Add r229 , r230
Read r234 , r229
// read_register- end
// write_register- self: Data { stack_frame_offset: 8, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r230 , 0
Set r231 , 8
Add r231 , r255
Read r231 , r231
Set r229 , 0
Add r231 , r229
Add r231 , r230
Write r231 , r234
// write_register- end
// handle number
Set r234 , 10
// allocate_stack - current: 9 size: 1
Set r233 , 1
Add r254 , r233
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r230 , 0
Set r229 , 9
Add r229 , r255
Add r229 , r230
Write r229 , r234
// write_register- end
// handle number end
RSet r229 , :static_declaration_end14
RJmp r229
:max_heap_size_pow_2
Set r0 , 0
:static_declaration_end14
// allocate_stack - current: 10 size: 1
Set r231 , 1
Add r254 , r231
// alloc_stack - end
RSet r229 , :max_heap_size_pow_2
Add r229 , r251
Set r228 , 0
Sub r229 , r228
// write_directly_to_reference_pointer - 227, input: r229
Set r227 , 10
Add r227 , r255
Write r227 , r229
// write_directly_to_reference_pointer - end
// read_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r226 , 0
Set r225 , 9
Add r225 , r255
Add r225 , r226
Read r230 , r225
// read_register- end
// write_register- self: Data { stack_frame_offset: 10, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r226 , 0
Set r227 , 10
Add r227 , r255
Read r227 , r227
Set r225 , 0
Add r227 , r225
Add r227 , r226
Write r227 , r230
// write_register- end
// array_initialization
// allocate_stack - current: 11 size: 9
Set r229 , 9
Add r254 , r229
// alloc_stack - end
Set r230 , 0
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r226 , 0
Set r225 , 11
Add r225 , r255
Add r225 , r226
Write r225 , r230
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r226 , 1
Set r227 , 11
Add r227 , r255
Add r227 , r226
Write r227 , r230
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r226 , 2
Set r225 , 11
Add r225 , r255
Add r225 , r226
Write r225 , r230
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r226 , 3
Set r227 , 11
Add r227 , r255
Add r227 , r226
Write r227 , r230
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r226 , 4
Set r225 , 11
Add r225 , r255
Add r225 , r226
Write r225 , r230
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r226 , 5
Set r227 , 11
Add r227 , r255
Add r227 , r226
Write r227 , r230
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r226 , 6
Set r225 , 11
Add r225 , r255
Add r225 , r226
Write r225 , r230
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r226 , 7
Set r227 , 11
Add r227 , r255
Add r227 , r226
Write r227 , r230
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r226 , 8
Set r225 , 11
Add r225 , r255
Add r225 , r226
Write r225 , r230
// write_register- end
//  write array length
Set r230 , 8
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r226 , 0
Set r227 , 11
Add r227 , r255
Add r227 , r226
Write r227 , r230
// write_register- end
// array_initialization- end
RSet r230 , :static_declaration_end15
RJmp r230
:free_heap_blocks_linked_lists
Set r0 , 0
Set r0 , 0
Set r0 , 0
Set r0 , 0
Set r0 , 0
Set r0 , 0
Set r0 , 0
Set r0 , 0
Set r0 , 0
:static_declaration_end15
// allocate_stack - current: 20 size: 1
Set r226 , 1
Add r254 , r226
// alloc_stack - end
RSet r230 , :free_heap_blocks_linked_lists
Add r230 , r251
Set r225 , 0
Sub r230 , r225
// write_directly_to_reference_pointer - 224, input: r230
Set r224 , 20
Add r224 , r255
Write r224 , r230
// write_directly_to_reference_pointer - end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r223 , 0
Set r222 , 11
Add r222 , r255
Add r222 , r223
Read r227 , r222
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r223 , 0
Set r224 , 20
Add r224 , r255
Read r224 , r224
Set r222 , 0
Add r224 , r222
Add r224 , r223
Write r224 , r227
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r223 , 1
Set r222 , 11
Add r222 , r255
Add r222 , r223
Read r227 , r222
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r223 , 1
Set r224 , 20
Add r224 , r255
Read r224 , r224
Set r222 , 0
Add r224 , r222
Add r224 , r223
Write r224 , r227
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r223 , 2
Set r222 , 11
Add r222 , r255
Add r222 , r223
Read r227 , r222
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r223 , 2
Set r224 , 20
Add r224 , r255
Read r224 , r224
Set r222 , 0
Add r224 , r222
Add r224 , r223
Write r224 , r227
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r223 , 3
Set r222 , 11
Add r222 , r255
Add r222 , r223
Read r227 , r222
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r223 , 3
Set r224 , 20
Add r224 , r255
Read r224 , r224
Set r222 , 0
Add r224 , r222
Add r224 , r223
Write r224 , r227
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r223 , 4
Set r222 , 11
Add r222 , r255
Add r222 , r223
Read r227 , r222
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r223 , 4
Set r224 , 20
Add r224 , r255
Read r224 , r224
Set r222 , 0
Add r224 , r222
Add r224 , r223
Write r224 , r227
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r223 , 5
Set r222 , 11
Add r222 , r255
Add r222 , r223
Read r227 , r222
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r223 , 5
Set r224 , 20
Add r224 , r255
Read r224 , r224
Set r222 , 0
Add r224 , r222
Add r224 , r223
Write r224 , r227
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r223 , 6
Set r222 , 11
Add r222 , r255
Add r222 , r223
Read r227 , r222
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r223 , 6
Set r224 , 20
Add r224 , r255
Read r224 , r224
Set r222 , 0
Add r224 , r222
Add r224 , r223
Write r224 , r227
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r223 , 7
Set r222 , 11
Add r222 , r255
Add r222 , r223
Read r227 , r222
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r223 , 7
Set r224 , 20
Add r224 , r255
Read r224 , r224
Set r222 , 0
Add r224 , r222
Add r224 , r223
Write r224 , r227
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r223 , 8
Set r222 , 11
Add r222 , r255
Add r222 , r223
Read r227 , r222
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r223 , 8
Set r224 , 20
Add r224 , r255
Read r224 , r224
Set r222 , 0
Add r224 , r222
Add r224 , r223
Write r224 , r227
// write_register- end

// assign_new_variable
// handle number
Set r227 , 4
// allocate_stack - current: 21 size: 1
Set r230 , 1
Add r254 , r230
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 21, size: 1, data_type: U32 }
Set r223 , 0
Set r222 , 21
Add r222 , r255
Add r222 , r223
Write r222 , r227
// write_register- end
// handle number end
// call_function_code
// call_function_code - needed_stack: 4
// allocate_stack - current: 22 size: 4
Set r223 , 4
Add r254 , r223
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 21, size: 1, data_type: U32 }
Set r218 , 0
Set r217 , 21
Add r217 , r255
Add r217 , r218
Read r221 , r217
// read_register- end
Set r224 , 4294967294
Add r224 , r254
Write r224 , r221
RSet r221 , :function-return16
Add r221 , r251
Set r217 , 0
Sub r221 , r217
Write r254 , r221
RSet r224 , :function_core_allocate_3
RJmp r224
:function-return16
// function call output: Some(FunctionInputData { name: "core_allocate", data_type: U32, stack_frame_offset: -3 })
// function call converted output data : Some(Data { stack_frame_offset: 23, size: 1, data_type: U32 })
// assign_new_variable - end

// assignment
// memory_access
// allocate_stack - current: 26 size: 1
Set r220 , 1
Add r254 , r220
// alloc_stack - end
// handle_binary_expr
// handle number
Set r221 , 0
// allocate_stack - current: 27 size: 1
Set r224 , 1
Add r254 , r224
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 27, size: 1, data_type: U32 }
Set r218 , 0
Set r219 , 27
Add r219 , r255
Add r219 , r218
Write r219 , r221
// write_register- end
// handle number end
// allocate_stack - current: 28 size: 1
Set r216 , 1
Add r254 , r216
// alloc_stack - end
// handle_binary_expr - output_register- r219
// read_register- self: Data { stack_frame_offset: 23, size: 1, data_type: U32 }
Set r214 , 0
Set r213 , 23
Add r213 , r255
Add r213 , r214
Read r218 , r213
// read_register- end
// read_register- self: Data { stack_frame_offset: 27, size: 1, data_type: U32 }
Set r214 , 0
Set r215 , 27
Add r215 , r255
Add r215 , r214
Read r222 , r215
// read_register- end
Add r218 , r222
Cp r219 , r218
// write_register- self: Data { stack_frame_offset: 28, size: 1, data_type: U32 }
Set r214 , 0
Set r213 , 28
Add r213 , r255
Add r213 , r214
Write r213 , r219
// write_register- end
// handle_binary_expr - end
// read_register- self: Data { stack_frame_offset: 28, size: 1, data_type: U32 }
Set r218 , 0
Set r213 , 28
Add r213 , r255
Add r213 , r218
Read r219 , r213
// read_register- end
// write_directly_to_reference_pointer - 218, input: r219
Set r218 , 26
Add r218 , r255
Write r218 , r219
// write_directly_to_reference_pointer - end
// memory_access- end
// allocate_stack - current: 29 size: 1
Set r213 , 1
Add r254 , r213
// alloc_stack - end
RSet r219 , :function_syscall_handler_9
Add r219 , r251
Set r218 , 0
Sub r219 , r218
// write_register- self: Data { stack_frame_offset: 29, size: 1, data_type: U32 }
Set r214 , 0
Set r215 , 29
Add r215 , r255
Add r215 , r214
Write r215 , r219
// write_register- end
// assignment data: Data { stack_frame_offset: 29, size: 1, data_type: U32 }
// assignment- variable.is_reference: true data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 29, size: 1, data_type: U32 }
Set r214 , 0
Set r222 , 29
Add r222 , r255
Add r222 , r214
Read r219 , r222
// read_register- end
// write_register- self: Data { stack_frame_offset: 26, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r214 , 0
Set r215 , 26
Add r215 , r255
Read r215 , r215
Set r222 , 0
Add r215 , r222
Add r215 , r214
Write r215 , r219
// write_register- end
// end assignment

// assignment
// memory_access
// allocate_stack - current: 30 size: 1
Set r219 , 1
Add r254 , r219
// alloc_stack - end
// handle_binary_expr
// handle number
Set r215 , 1
// allocate_stack - current: 31 size: 1
Set r214 , 1
Add r254 , r214
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 31, size: 1, data_type: U32 }
Set r212 , 0
Set r211 , 31
Add r211 , r255
Add r211 , r212
Write r211 , r215
// write_register- end
// handle number end
// allocate_stack - current: 32 size: 1
Set r210 , 1
Add r254 , r210
// alloc_stack - end
// handle_binary_expr - output_register- r211
// read_register- self: Data { stack_frame_offset: 23, size: 1, data_type: U32 }
Set r208 , 0
Set r207 , 23
Add r207 , r255
Add r207 , r208
Read r212 , r207
// read_register- end
// read_register- self: Data { stack_frame_offset: 31, size: 1, data_type: U32 }
Set r208 , 0
Set r209 , 31
Add r209 , r255
Add r209 , r208
Read r222 , r209
// read_register- end
Add r212 , r222
Cp r211 , r212
// write_register- self: Data { stack_frame_offset: 32, size: 1, data_type: U32 }
Set r208 , 0
Set r207 , 32
Add r207 , r255
Add r207 , r208
Write r207 , r211
// write_register- end
// handle_binary_expr - end
// read_register- self: Data { stack_frame_offset: 32, size: 1, data_type: U32 }
Set r212 , 0
Set r207 , 32
Add r207 , r255
Add r207 , r212
Read r211 , r207
// read_register- end
// write_directly_to_reference_pointer - 212, input: r211
Set r212 , 30
Add r212 , r255
Write r212 , r211
// write_directly_to_reference_pointer - end
// memory_access- end
// allocate_stack - current: 33 size: 1
Set r207 , 1
Add r254 , r207
// alloc_stack - end
RSet r211 , :function_timer_interrupt_8
Add r211 , r251
Set r212 , 0
Sub r211 , r212
// write_register- self: Data { stack_frame_offset: 33, size: 1, data_type: U32 }
Set r208 , 0
Set r209 , 33
Add r209 , r255
Add r209 , r208
Write r209 , r211
// write_register- end
// assignment data: Data { stack_frame_offset: 33, size: 1, data_type: U32 }
// assignment- variable.is_reference: true data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 33, size: 1, data_type: U32 }
Set r208 , 0
Set r222 , 33
Add r222 , r255
Add r222 , r208
Read r211 , r222
// read_register- end
// write_register- self: Data { stack_frame_offset: 30, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r208 , 0
Set r209 , 30
Add r209 , r255
Read r209 , r209
Set r222 , 0
Add r209 , r222
Add r209 , r208
Write r209 , r211
// write_register- end
// end assignment

// assignment
// memory_access
// allocate_stack - current: 34 size: 1
Set r211 , 1
Add r254 , r211
// alloc_stack - end
// handle_binary_expr
// handle number
Set r209 , 2
// allocate_stack - current: 35 size: 1
Set r208 , 1
Add r254 , r208
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 35, size: 1, data_type: U32 }
Set r206 , 0
Set r205 , 35
Add r205 , r255
Add r205 , r206
Write r205 , r209
// write_register- end
// handle number end
// allocate_stack - current: 36 size: 1
Set r204 , 1
Add r254 , r204
// alloc_stack - end
// handle_binary_expr - output_register- r205
// read_register- self: Data { stack_frame_offset: 23, size: 1, data_type: U32 }
Set r202 , 0
Set r201 , 23
Add r201 , r255
Add r201 , r202
Read r206 , r201
// read_register- end
// read_register- self: Data { stack_frame_offset: 35, size: 1, data_type: U32 }
Set r202 , 0
Set r203 , 35
Add r203 , r255
Add r203 , r202
Read r222 , r203
// read_register- end
Add r206 , r222
Cp r205 , r206
// write_register- self: Data { stack_frame_offset: 36, size: 1, data_type: U32 }
Set r202 , 0
Set r201 , 36
Add r201 , r255
Add r201 , r202
Write r201 , r205
// write_register- end
// handle_binary_expr - end
// read_register- self: Data { stack_frame_offset: 36, size: 1, data_type: U32 }
Set r206 , 0
Set r201 , 36
Add r201 , r255
Add r201 , r206
Read r205 , r201
// read_register- end
// write_directly_to_reference_pointer - 206, input: r205
Set r206 , 34
Add r206 , r255
Write r206 , r205
// write_directly_to_reference_pointer - end
// memory_access- end
// allocate_stack - current: 37 size: 1
Set r201 , 1
Add r254 , r201
// alloc_stack - end
RSet r205 , :function_keyboard_interrupt_7
Add r205 , r251
Set r206 , 0
Sub r205 , r206
// write_register- self: Data { stack_frame_offset: 37, size: 1, data_type: U32 }
Set r202 , 0
Set r203 , 37
Add r203 , r255
Add r203 , r202
Write r203 , r205
// write_register- end
// assignment data: Data { stack_frame_offset: 37, size: 1, data_type: U32 }
// assignment- variable.is_reference: true data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 37, size: 1, data_type: U32 }
Set r202 , 0
Set r222 , 37
Add r222 , r255
Add r222 , r202
Read r205 , r222
// read_register- end
// write_register- self: Data { stack_frame_offset: 34, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r202 , 0
Set r203 , 34
Add r203 , r255
Read r203 , r203
Set r222 , 0
Add r203 , r222
Add r203 , r202
Write r203 , r205
// write_register- end
// end assignment

// read_register- self: Data { stack_frame_offset: 23, size: 1, data_type: U32 }
Set r202 , 0
Set r222 , 23
Add r222 , r255
Add r222 , r202
Read r205 , r222
// read_register- end
Idt r205

// handle number
Set r205 , 0
// allocate_stack - current: 38 size: 1
Set r222 , 1
Add r254 , r222
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 38, size: 1, data_type: U32 }
Set r203 , 0
Set r200 , 38
Add r200 , r255
Add r200 , r203
Write r200 , r205
// write_register- end
// handle number end
// allocate_stack - current: 39 size: 2
Set r203 , 2
Add r254 , r203
// alloc_stack - end
Set r200 , 1
// write_register- self: Data { stack_frame_offset: 39, size: 2, data_type: Array { inside: Char, len: 1 } }
Set r199 , 0
Set r198 , 39
Add r198 , r255
Add r198 , r199
Write r198 , r200
// write_register- end
Set r200 , 10
// write_register- self: Data { stack_frame_offset: 39, size: 2, data_type: Array { inside: Char, len: 1 } }
Set r199 , 1
Set r202 , 39
Add r202 , r255
Add r202 , r199
Write r202 , r200
// write_register- end
// allocate_stack - current: 41 size: 1
Set r202 , 1
Add r254 , r202
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 38, size: 1, data_type: U32 }
Set r197 , 0
Set r196 , 38
Add r196 , r255
Add r196 , r197
Read r199 , r196
// read_register- end
// read_addr_of_self
Set r196 , 39
Add r196 , r255
// read_addr_of_self - end
// read_addr_of_self
Set r197 , 41
Add r197 , r255
// read_addr_of_self - end
Syscall r199 , r196 , r197
// write_register- self: Data { stack_frame_offset: 41, size: 1, data_type: U32 }
Set r195 , 0
Set r194 , 41
Add r194 , r255
Add r194 , r195
Write r194 , r197
// write_register- end

// assign_new_variable
// handle number
Set r196 , 5000
// allocate_stack - current: 42 size: 1
Set r199 , 1
Add r254 , r199
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 42, size: 1, data_type: U32 }
Set r194 , 0
Set r195 , 42
Add r195 , r255
Add r195 , r194
Write r195 , r196
// write_register- end
// handle number end
// assign_new_variable - end

// read_register- self: Data { stack_frame_offset: 42, size: 1, data_type: U32 }
Set r197 , 0
Set r198 , 42
Add r198 , r255
Add r198 , r197
Read r195 , r198
// read_register- end
Jmp r195

// allocate_stack - current: 43 size: 1
Set r198 , 1
Add r254 , r198
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 43, size: 1, data_type: U32 }
Set r194 , 0
Set r193 , 43
Add r193 , r255
Add r193 , r194
Write r193 , r254
// write_register- end
:while_start17
Set r197 , 1
// allocate_stack - current: 44 size: 1
Set r192 , 1
Add r254 , r192
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 44, size: 1, data_type: Bool }
Set r190 , 0
Set r189 , 44
Add r189 , r255
Add r189 , r190
Write r189 , r197
// write_register- end
// read_register- self: Data { stack_frame_offset: 44, size: 1, data_type: Bool }
Set r190 , 0
Set r191 , 44
Add r191 , r255
Add r191 , r190
Read r193 , r191
// read_register- end
Not r193
RSet r194 , :while_end18
RJmpc r194 , r193
// while loop contents:
Halt

// handle number
Set r191 , 0
// allocate_stack - current: 45 size: 1
Set r190 , 1
Add r254 , r190
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 45, size: 1, data_type: U32 }
Set r188 , 0
Set r187 , 45
Add r187 , r255
Add r187 , r188
Write r187 , r191
// write_register- end
// handle number end
// allocate_stack - current: 46 size: 6
Set r188 , 6
Add r254 , r188
// alloc_stack - end
Set r187 , 5
// write_register- self: Data { stack_frame_offset: 46, size: 6, data_type: Array { inside: Char, len: 5 } }
Set r186 , 0
Set r185 , 46
Add r185 , r255
Add r185 , r186
Write r185 , r187
// write_register- end
Set r187 , 67
// write_register- self: Data { stack_frame_offset: 46, size: 6, data_type: Array { inside: Char, len: 5 } }
Set r186 , 1
Set r189 , 46
Add r189 , r255
Add r189 , r186
Write r189 , r187
// write_register- end
Set r187 , 108
// write_register- self: Data { stack_frame_offset: 46, size: 6, data_type: Array { inside: Char, len: 5 } }
Set r186 , 2
Set r185 , 46
Add r185 , r255
Add r185 , r186
Write r185 , r187
// write_register- end
Set r187 , 111
// write_register- self: Data { stack_frame_offset: 46, size: 6, data_type: Array { inside: Char, len: 5 } }
Set r186 , 3
Set r189 , 46
Add r189 , r255
Add r189 , r186
Write r189 , r187
// write_register- end
Set r187 , 99
// write_register- self: Data { stack_frame_offset: 46, size: 6, data_type: Array { inside: Char, len: 5 } }
Set r186 , 4
Set r185 , 46
Add r185 , r255
Add r185 , r186
Write r185 , r187
// write_register- end
Set r187 , 107
// write_register- self: Data { stack_frame_offset: 46, size: 6, data_type: Array { inside: Char, len: 5 } }
Set r186 , 5
Set r189 , 46
Add r189 , r255
Add r189 , r186
Write r189 , r187
// write_register- end
// allocate_stack - current: 52 size: 1
Set r189 , 1
Add r254 , r189
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 45, size: 1, data_type: U32 }
Set r184 , 0
Set r183 , 45
Add r183 , r255
Add r183 , r184
Read r186 , r183
// read_register- end
// read_addr_of_self
Set r183 , 46
Add r183 , r255
// read_addr_of_self - end
// read_addr_of_self
Set r184 , 52
Add r184 , r255
// read_addr_of_self - end
Syscall r186 , r183 , r184
// write_register- self: Data { stack_frame_offset: 52, size: 1, data_type: U32 }
Set r182 , 0
Set r181 , 52
Add r181 , r255
Add r181 , r182
Write r181 , r184
// write_register- end

// while loop contents - end
RSet r194 , :while_start17
RJmp r194
:while_end18
// read_register- self: Data { stack_frame_offset: 43, size: 1, data_type: U32 }
Set r186 , 0
Set r184 , 43
Add r184 , r255
Add r184 , r186
Read r254 , r184
// read_register- end
// function: Function { is_interrupt_function: false, name: "print_chars", input: [FunctionInputData { name: "text", data_type: Reference { inside: Array { inside: U32, len: 0 }, offset_of_data_from_reference_addr: 0 }, stack_frame_offset: -2 }], output: None, label_name: "function_print_chars_1" }
:function_print_chars_1
Cp r194 , r255
Cp r255 , r254
// allocate_stack - current: 0 size: 1
Set r193 , 1
Add r254 , r193
// alloc_stack - end
// allocate_stack - current: 1 size: 1
Set r184 , 1
Add r254 , r184
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r183 , 0
Set r181 , 1
Add r181 , r255
Add r181 , r183
Write r181 , r194
// write_register- end
// assign_new_variable
// allocate_stack - current: 2 size: 1
Set r181 , 1
Add r254 , r181
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: Reference { inside: Array { inside: U32, len: 0 }, offset_of_data_from_reference_addr: 0 } }
Set r182 , 0
Set r185 , 4294967294
Add r185 , r255
Read r185 , r185
Set r186 , 0
Add r185 , r186
Add r185 , r182
Read r183 , r185
// read_register- end
// write_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r182 , 0
Set r186 , 2
Add r186 , r255
Add r186 , r182
Write r186 , r183
// write_register- end
// assign_new_variable - end

// allocate_stack - current: 3 size: 1
Set r186 , 1
Add r254 , r186
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r185 , 0
Set r180 , 3
Add r180 , r255
Add r180 , r185
Write r180 , r254
// write_register- end
// allocate_stack - current: 4 size: 1
Set r178 , 1
Add r254 , r178
// alloc_stack - end
// handle number
Set r177 , 0
// allocate_stack - current: 5 size: 1
Set r176 , 1
Add r254 , r176
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r174 , 0
Set r173 , 5
Add r173 , r255
Add r173 , r174
Write r173 , r177
// write_register- end
// handle number end
// read_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r174 , 0
Set r175 , 5
Add r175 , r255
Add r175 , r174
Read r185 , r175
// read_register- end
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r174 , 0
Set r173 , 2
Add r173 , r255
Add r173 , r174
Read r179 , r173
// read_register- end
Set r180 , 1
Sub r185 , r180
:for_start19
Set r180 , 1
Add r185 , r180
Gte r185 , r179 , r180
RSet r182 , :for_end20
RJmpc r182 , r180
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r174 , 0
Set r175 , 4
Add r175 , r255
Add r175 , r174
Write r175 , r185
// write_register- end
// for loop contents:
// index_array
// index_array - var:Data { stack_frame_offset: -2, size: 1, data_type: Reference { inside: Array { inside: U32, len: 0 }, offset_of_data_from_reference_addr: 0 } }
// allocate_stack - current: 6 size: 1
Set r173 , 1
Add r254 , r173
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r170 , 0
Set r169 , 4
Add r169 , r255
Add r169 , r170
Read r172 , r169
// read_register- end
Set r170 , 4294967294
// array indexing- var_to_index.is_reference: true
Cp r171 , r172
Set r169 , 1
Mul r171 , r169
// add 1 offset to account for 1'st register holding size of array
Set r169 , 1
Add r171 , r169
// read_addr_of_register - self: Data { stack_frame_offset: -2, size: 1, data_type: Reference { inside: Array { inside: U32, len: 0 }, offset_of_data_from_reference_addr: 0 } }
Set r169 , 4294967294
Add r169 , r255
Read r169 , r169
Set r168 , 0
Add r169 , r168
Add r169 , r171
// read_addr_of_register - end
// index_array: read_addr_of_register - end addr_register:169 , offset_register:171
// write_directly_to_reference_pointer - 168, input: r169
Set r168 , 6
Add r168 , r255
Write r168 , r169
// write_directly_to_reference_pointer - end
// index_array - end
Set r175 , 0
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r171 , 0
Set r169 , 6
Add r169 , r255
Read r169 , r169
Set r170 , 0
Add r169 , r170
Add r169 , r171
Read r174 , r169
// read_register- end
Phrp r175 , r174

// for loop contents - end
RSet r182 , :for_start19
RJmp r182
:for_end20
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r175 , 0
Set r169 , 3
Add r169 , r255
Add r169 , r175
Read r254 , r169
// read_register- end
// allocate_stack - current: 4 size: 2
Set r180 , 2
Add r254 , r180
// alloc_stack - end
Set r182 , 1
// write_register- self: Data { stack_frame_offset: 4, size: 2, data_type: Array { inside: Char, len: 1 } }
Set r175 , 0
Set r174 , 4
Add r174 , r255
Add r174 , r175
Write r174 , r182
// write_register- end
Set r182 , 10
// write_register- self: Data { stack_frame_offset: 4, size: 2, data_type: Array { inside: Char, len: 1 } }
Set r175 , 1
Set r169 , 4
Add r169 , r255
Add r169 , r175
Write r169 , r182
// write_register- end
Set r179 , 0
// read_register- self: Data { stack_frame_offset: 4, size: 2, data_type: Array { inside: Char, len: 1 } }
Set r175 , 0
Set r174 , 4
Add r174 , r255
Add r174 , r175
Read r185 , r174
// read_register- end
Phrp r179 , r185
// read_register- self: Data { stack_frame_offset: 4, size: 2, data_type: Array { inside: Char, len: 1 } }
Set r175 , 1
Set r169 , 4
Add r169 , r255
Add r169 , r175
Read r185 , r169
// read_register- end
Phrp r179 , r185

// Return

Cp r185 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r175 , 0
Set r174 , 1
Add r174 , r255
Add r174 , r175
Read r179 , r174
// read_register- end
Cp r255 , r179
Read r185 , r185
Jmp r185
// function: Function { is_interrupt_function: false, name: "core_deallocate", input: [FunctionInputData { name: "addr", data_type: U32, stack_frame_offset: -2 }, FunctionInputData { name: "size_raw", data_type: U32, stack_frame_offset: -3 }], output: None, label_name: "function_core_deallocate_2" }
:function_core_deallocate_2
Cp r194 , r255
Cp r255 , r254
// allocate_stack - current: 0 size: 1
Set r179 , 1
Add r254 , r179
// alloc_stack - end
// allocate_stack - current: 1 size: 1
Set r185 , 1
Add r254 , r185
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r175 , 0
Set r169 , 1
Add r169 , r255
Add r169 , r175
Write r169 , r194
// write_register- end
// assign_new_variable
// call_function_code
// call_function_code - needed_stack: 4
// allocate_stack - current: 2 size: 4
Set r175 , 4
Add r254 , r175
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: -3, size: 1, data_type: U32 }
Set r168 , 0
Set r167 , 4294967293
Add r167 , r255
Add r167 , r168
Read r171 , r167
// read_register- end
Set r174 , 4294967294
Add r174 , r254
Write r174 , r171
RSet r171 , :function-return21
Add r171 , r251
Set r167 , 0
Sub r171 , r167
Write r254 , r171
RSet r174 , :function_ceil_log2_6
RJmp r174
:function-return21
// function call output: Some(FunctionInputData { name: "ceil_log2", data_type: U32, stack_frame_offset: -3 })
// function call converted output data : Some(Data { stack_frame_offset: 3, size: 1, data_type: U32 })
// assign_new_variable - end

// assign_new_variable
// access_static_variable
// allocate_stack - current: 6 size: 1
Set r170 , 1
Add r254 , r170
// alloc_stack - end
RSet r171 , :min_heap_size_pow_2
Add r171 , r251
Set r174 , 0
Sub r171 , r174
// write_directly_to_reference_pointer - 169, input: r171
Set r169 , 6
Add r169 , r255
Write r169 , r171
// write_directly_to_reference_pointer - end
// access_static_variable-end
// assign_new_variable - end

// assign_new_variable
// handle_binary_expr
// call_function_code
// call_function_code - needed_stack: 5
// allocate_stack - current: 7 size: 5
Set r169 , 5
Add r254 , r169
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r164 , 0
Set r163 , 6
Add r163 , r255
Read r163 , r163
Set r165 , 0
Add r163 , r165
Add r163 , r164
Read r172 , r163
// read_register- end
Set r168 , 4294967294
Add r168 , r254
Write r168 , r172
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r164 , 0
Set r165 , 3
Add r165 , r255
Add r165 , r164
Read r172 , r165
// read_register- end
Set r168 , 4294967293
Add r168 , r254
Write r168 , r172
RSet r172 , :function-return22
Add r172 , r251
Set r165 , 0
Sub r172 , r165
Write r254 , r172
RSet r168 , :function_max_5
RJmp r168
:function-return22
// function call output: Some(FunctionInputData { name: "max", data_type: U32, stack_frame_offset: -4 })
// function call converted output data : Some(Data { stack_frame_offset: 8, size: 1, data_type: U32 })
// allocate_stack - current: 12 size: 1
Set r171 , 1
Add r254 , r171
// alloc_stack - end
// handle_binary_expr - output_register- r166
// read_register- self: Data { stack_frame_offset: 8, size: 1, data_type: U32 }
Set r163 , 0
Set r162 , 8
Add r162 , r255
Add r162 , r163
Read r172 , r162
// read_register- end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r163 , 0
Set r164 , 6
Add r164 , r255
Read r164 , r164
Set r162 , 0
Add r164 , r162
Add r164 , r163
Read r168 , r164
// read_register- end
Sub r172 , r168
Cp r166 , r172
// write_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r163 , 0
Set r162 , 12
Add r162 , r255
Add r162 , r163
Write r162 , r166
// write_register- end
// handle_binary_expr - end
// assign_new_variable - end

// assign_new_variable
// handle_binary_expr
// handle number
Set r166 , 2
// allocate_stack - current: 13 size: 1
Set r168 , 1
Add r254 , r168
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 13, size: 1, data_type: U32 }
Set r162 , 0
Set r163 , 13
Add r163 , r255
Add r163 , r162
Write r163 , r166
// write_register- end
// handle number end
// handle_binary_expr
// handle_binary_expr
// allocate_stack - current: 14 size: 1
Set r164 , 1
Add r254 , r164
// alloc_stack - end
// handle_binary_expr - output_register- r163
// read_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r160 , 0
Set r159 , 12
Add r159 , r255
Add r159 , r160
Read r162 , r159
// read_register- end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r160 , 0
Set r161 , 6
Add r161 , r255
Read r161 , r161
Set r159 , 0
Add r161 , r159
Add r161 , r160
Read r172 , r161
// read_register- end
Add r162 , r172
Cp r163 , r162
// write_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r160 , 0
Set r159 , 14
Add r159 , r255
Add r159 , r160
Write r159 , r163
// write_register- end
// handle_binary_expr - end
// handle number
Set r163 , 1
// allocate_stack - current: 15 size: 1
Set r172 , 1
Add r254 , r172
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 15, size: 1, data_type: U32 }
Set r159 , 0
Set r160 , 15
Add r160 , r255
Add r160 , r159
Write r160 , r163
// write_register- end
// handle number end
// allocate_stack - current: 16 size: 1
Set r161 , 1
Add r254 , r161
// alloc_stack - end
// handle_binary_expr - output_register- r160
// read_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r157 , 0
Set r156 , 14
Add r156 , r255
Add r156 , r157
Read r159 , r156
// read_register- end
// read_register- self: Data { stack_frame_offset: 15, size: 1, data_type: U32 }
Set r157 , 0
Set r158 , 15
Add r158 , r255
Add r158 , r157
Read r162 , r158
// read_register- end
Sub r159 , r162
Cp r160 , r159
// write_register- self: Data { stack_frame_offset: 16, size: 1, data_type: U32 }
Set r157 , 0
Set r156 , 16
Add r156 , r255
Add r156 , r157
Write r156 , r160
// write_register- end
// handle_binary_expr - end
// allocate_stack - current: 17 size: 1
Set r156 , 1
Add r254 , r156
// alloc_stack - end
// handle_binary_expr - output_register- r160
// read_register- self: Data { stack_frame_offset: 13, size: 1, data_type: U32 }
Set r158 , 0
Set r155 , 13
Add r155 , r255
Add r155 , r158
Read r162 , r155
// read_register- end
// read_register- self: Data { stack_frame_offset: 16, size: 1, data_type: U32 }
Set r158 , 0
Set r157 , 16
Add r157 , r255
Add r157 , r158
Read r159 , r157
// read_register- end
Shl r162 , r159
Cp r160 , r162
// write_register- self: Data { stack_frame_offset: 17, size: 1, data_type: U32 }
Set r158 , 0
Set r155 , 17
Add r155 , r255
Add r155 , r158
Write r155 , r160
// write_register- end
// handle_binary_expr - end
// assign_new_variable - end

// assign_new_variable
// access_static_variable
// allocate_stack - current: 18 size: 1
Set r160 , 1
Add r254 , r160
// alloc_stack - end
RSet r159 , :free_heap_blocks_linked_lists
Add r159 , r251
Set r162 , 0
Sub r159 , r162
// write_directly_to_reference_pointer - 155, input: r159
Set r155 , 18
Add r155 , r255
Write r155 , r159
// write_directly_to_reference_pointer - end
// access_static_variable-end
// index_array
// index_array - var:Data { stack_frame_offset: 18, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
// allocate_stack - current: 19 size: 1
Set r159 , 1
Add r254 , r159
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r157 , 0
Set r154 , 12
Add r154 , r255
Add r154 , r157
Read r155 , r154
// read_register- end
Set r157 , 18
// array indexing- var_to_index.is_reference: true
Cp r158 , r155
Set r154 , 1
Mul r158 , r154
// add 1 offset to account for 1'st register holding size of array
Set r154 , 1
Add r158 , r154
// read_addr_of_register - self: Data { stack_frame_offset: 18, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r154 , 18
Add r154 , r255
Read r154 , r154
Set r153 , 0
Add r154 , r153
Add r154 , r158
// read_addr_of_register - end
// index_array: read_addr_of_register - end addr_register:154 , offset_register:158
// write_directly_to_reference_pointer - 153, input: r154
Set r153 , 19
Add r153 , r255
Write r153 , r154
// write_directly_to_reference_pointer - end
// index_array - end
// assign_new_variable - end

// assign_new_variable
// direct_reference_access
// allocate_stack - current: 20 size: 1
Set r157 , 1
Add r254 , r157
// alloc_stack - end
// direct_reference_access - handle_inside_expr
// direct_reference_access - handle_inside_expr- end
// read_addr_of_last_reference_in_chain -output_register - r158
Set r158 , 19
Add r158 , r255
Read r158 , r158
Set r154 , 0
Add r158 , r154
// read_addr_of_last_reference_in_chain 
// write_directly_to_reference_pointer - 154, input: r158
Set r154 , 20
Add r154 , r255
Write r154 , r158
// write_directly_to_reference_pointer - end
// direct_reference_accesss - end
// allocate_stack - current: 21 size: 1
Set r158 , 1
Add r254 , r158
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r153 , 0
Set r152 , 20
Add r152 , r255
Read r152 , r152
Set r155 , 0
Add r152 , r155
Add r152 , r153
Read r154 , r152
// read_register- end
// write_register- self: Data { stack_frame_offset: 21, size: 1, data_type: U32 }
Set r153 , 0
Set r155 , 21
Add r155 , r255
Add r155 , r153
Write r155 , r154
// write_register- end
// assign_new_variable - end

// assign_new_variable
// handle_struct_initialization Struct {
 //    size: 1,
 //    name: "HeapBlock",
 //    properties: {
 //        "next": StructProperty {
 //            data_type: Reference {
 //                inside: Struct {
 //                    name: "HeapBlock",
 //                },
 //                offset_of_data_from_reference_addr: 0,
 //            },
 //            offset_from_struct_base: 0,
 //        },
 //    },
 //    contents_parsed: Done,
 //}
// allocate_stack - current: 22 size: 1
Set r154 , 1
Add r254 , r154
// alloc_stack - end
// assignment
// assignment data: Data { stack_frame_offset: 21, size: 1, data_type: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 } }
// assignment- variable.is_reference: true data.is_reference: true 
// read_referenced_address
Set r155 , 21
Add r155 , r255
Read r155 , r155
Set r153 , 0
Add r155 , r153
// read_referenced_address - end
Set r152 , 22
Add r152 , r255
Write r152 , r155
// end assignment
// handle_struct_initialization end
// assign_new_variable - end

// assignment
// memory_access
// allocate_stack - current: 23 size: 1
Set r155 , 1
Add r254 , r155
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r151 , 0
Set r150 , 4294967294
Add r150 , r255
Add r150 , r151
Read r152 , r150
// read_register- end
// write_directly_to_reference_pointer - 151, input: r152
Set r151 , 23
Add r151 , r255
Write r151 , r152
// write_directly_to_reference_pointer - end
// memory_access- end
// assignment data: Data { stack_frame_offset: 21, size: 1, data_type: U32 }
// assignment- variable.is_reference: true data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 21, size: 1, data_type: U32 }
Set r151 , 0
Set r153 , 21
Add r153 , r255
Add r153 , r151
Read r150 , r153
// read_register- end
// write_register- self: Data { stack_frame_offset: 23, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r151 , 0
Set r152 , 23
Add r152 , r255
Read r152 , r152
Set r153 , 0
Add r152 , r153
Add r152 , r151
Write r152 , r150
// write_register- end
// end assignment

// assignment
// direct_reference_access
// allocate_stack - current: 24 size: 1
Set r150 , 1
Add r254 , r150
// alloc_stack - end
// direct_reference_access - handle_inside_expr
// access_static_variable
// allocate_stack - current: 25 size: 1
Set r152 , 1
Add r254 , r152
// alloc_stack - end
RSet r151 , :free_heap_blocks_linked_lists
Add r151 , r251
Set r153 , 0
Sub r151 , r153
// write_directly_to_reference_pointer - 149, input: r151
Set r149 , 25
Add r149 , r255
Write r149 , r151
// write_directly_to_reference_pointer - end
// access_static_variable-end
// index_array
// index_array - var:Data { stack_frame_offset: 25, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
// allocate_stack - current: 26 size: 1
Set r151 , 1
Add r254 , r151
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r147 , 0
Set r146 , 12
Add r146 , r255
Add r146 , r147
Read r149 , r146
// read_register- end
Set r147 , 25
// array indexing- var_to_index.is_reference: true
Cp r148 , r149
Set r146 , 1
Mul r148 , r146
// add 1 offset to account for 1'st register holding size of array
Set r146 , 1
Add r148 , r146
// read_addr_of_register - self: Data { stack_frame_offset: 25, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r146 , 25
Add r146 , r255
Read r146 , r146
Set r145 , 0
Add r146 , r145
Add r146 , r148
// read_addr_of_register - end
// index_array: read_addr_of_register - end addr_register:146 , offset_register:148
// write_directly_to_reference_pointer - 145, input: r146
Set r145 , 26
Add r145 , r255
Write r145 , r146
// write_directly_to_reference_pointer - end
// index_array - end
// direct_reference_access - handle_inside_expr- end
// read_addr_of_last_reference_in_chain -output_register - r147
Set r147 , 26
Add r147 , r255
Read r147 , r147
Set r148 , 0
Add r147 , r148
// read_addr_of_last_reference_in_chain 
// write_directly_to_reference_pointer - 148, input: r147
Set r148 , 24
Add r148 , r255
Write r148 , r147
// write_directly_to_reference_pointer - end
// direct_reference_accesss - end
// assignment data: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
// assignment- variable.is_reference: true data.is_reference: false 
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r146 , 0
Set r149 , 4294967294
Add r149 , r255
Add r149 , r146
Read r147 , r149
// read_register- end
// write_register- self: Data { stack_frame_offset: 24, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r146 , 0
Set r148 , 24
Add r148 , r255
Read r148 , r148
Set r149 , 0
Add r148 , r149
Add r148 , r146
Write r148 , r147
// write_register- end
// end assignment

// Return

Cp r147 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r149 , 0
Set r145 , 1
Add r145 , r255
Add r145 , r149
Read r148 , r145
// read_register- end
Cp r255 , r148
Read r147 , r147
Jmp r147
// function: Function { is_interrupt_function: false, name: "core_allocate", input: [FunctionInputData { name: "size", data_type: U32, stack_frame_offset: -2 }], output: Some(FunctionInputData { name: "core_allocate", data_type: U32, stack_frame_offset: -3 }), label_name: "function_core_allocate_3" }
:function_core_allocate_3
Cp r194 , r255
Cp r255 , r254
// allocate_stack - current: 0 size: 1
Set r148 , 1
Add r254 , r148
// alloc_stack - end
// allocate_stack - current: 1 size: 1
Set r147 , 1
Add r254 , r147
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r149 , 0
Set r146 , 1
Add r146 , r255
Add r146 , r149
Write r146 , r194
// write_register- end
// handle number
Set r145 , 66
// allocate_stack - current: 2 size: 1
Set r144 , 1
Add r254 , r144
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r142 , 0
Set r141 , 2
Add r141 , r255
Add r141 , r142
Write r141 , r145
// write_register- end
// handle number end
Set r146 , 0
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r142 , 0
Set r143 , 2
Add r143 , r255
Add r143 , r142
Read r149 , r143
// read_register- end
Phrp r146 , r149

// assign_new_variable
// call_function_code
// call_function_code - needed_stack: 4
// allocate_stack - current: 3 size: 4
Set r146 , 4
Add r254 , r146
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r139 , 0
Set r138 , 4294967294
Add r138 , r255
Add r138 , r139
Read r142 , r138
// read_register- end
Set r143 , 4294967294
Add r143 , r254
Write r143 , r142
RSet r142 , :function-return23
Add r142 , r251
Set r138 , 0
Sub r142 , r138
Write r254 , r142
RSet r143 , :function_ceil_log2_6
RJmp r143
:function-return23
// function call output: Some(FunctionInputData { name: "ceil_log2", data_type: U32, stack_frame_offset: -3 })
// function call converted output data : Some(Data { stack_frame_offset: 4, size: 1, data_type: U32 })
// assign_new_variable - end

// assign_new_variable
// access_static_variable
// allocate_stack - current: 7 size: 1
Set r141 , 1
Add r254 , r141
// alloc_stack - end
RSet r142 , :min_heap_size_pow_2
Add r142 , r251
Set r143 , 0
Sub r142 , r143
// write_directly_to_reference_pointer - 149, input: r142
Set r149 , 7
Add r149 , r255
Write r149 , r142
// write_directly_to_reference_pointer - end
// access_static_variable-end
// assign_new_variable - end

// assign_new_variable
// access_static_variable
// allocate_stack - current: 8 size: 1
Set r142 , 1
Add r254 , r142
// alloc_stack - end
RSet r149 , :max_heap_size_pow_2
Add r149 , r251
Set r139 , 0
Sub r149 , r139
// write_directly_to_reference_pointer - 140, input: r149
Set r140 , 8
Add r140 , r255
Write r140 , r149
// write_directly_to_reference_pointer - end
// access_static_variable-end
// assign_new_variable - end

// if- condition: Binary { left: Identifier("size_log2", DebugData { line: 45, file: "allocator.tip" }), operator: Token { kind: Greater, value: ">", line: 45 }, right: Identifier("max", DebugData { line: 45, file: "allocator.tip" }), debug_data: DebugData { line: 45, file: "allocator.tip" } }
// allocate_stack - current: 9 size: 1
Set r149 , 1
Add r254 , r149
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r137 , 0
Set r136 , 9
Add r136 , r255
Add r136 , r137
Write r136 , r254
// write_register- end
// if condition data
// handle_binary_expr
// allocate_stack - current: 10 size: 1
Set r135 , 1
Add r254 , r135
// alloc_stack - end
// handle_binary_expr - output_register- r136
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r133 , 0
Set r132 , 4
Add r132 , r255
Add r132 , r133
Read r137 , r132
// read_register- end
// read_register- self: Data { stack_frame_offset: 8, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r133 , 0
Set r134 , 8
Add r134 , r255
Read r134 , r134
Set r132 , 0
Add r134 , r132
Add r134 , r133
Read r140 , r134
// read_register- end
Gt r137 , r140 , r136
// write_register- self: Data { stack_frame_offset: 10, size: 1, data_type: Bool }
Set r133 , 0
Set r132 , 10
Add r132 , r255
Add r132 , r133
Write r132 , r136
// write_register- end
// handle_binary_expr - end
// read condition
// read_register- self: Data { stack_frame_offset: 10, size: 1, data_type: Bool }
Set r137 , 0
Set r132 , 10
Add r132 , r255
Add r132 , r137
Read r136 , r132
// read_register- end
Not r136
RSet r132 , :if25
RJmpc r132 , r136
// if contents
// handle number
Set r133 , 250
// allocate_stack - current: 11 size: 1
Set r134 , 1
Add r254 , r134
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 11, size: 1, data_type: U32 }
Set r130 , 0
Set r129 , 11
Add r129 , r255
Add r129 , r130
Write r129 , r133
// write_register- end
// handle number end
Set r137 , 0
// read_register- self: Data { stack_frame_offset: 11, size: 1, data_type: U32 }
Set r130 , 0
Set r131 , 11
Add r131 , r255
Add r131 , r130
Read r140 , r131
// read_register- end
Phrp r137 , r140

Set r140 , 0
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r130 , 0
Set r129 , 4294967294
Add r129 , r255
Add r129 , r130
Read r137 , r129
// read_register- end
Phrp r140 , r137

Set r137 , 0
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r130 , 0
Set r131 , 4
Add r131 , r255
Add r131 , r130
Read r140 , r131
// read_register- end
Phrp r137 , r140

Set r140 , 0
// read_register- self: Data { stack_frame_offset: 8, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r130 , 0
Set r129 , 8
Add r129 , r255
Read r129 , r129
Set r131 , 0
Add r129 , r131
Add r129 , r130
Read r137 , r129
// read_register- end
Phrp r140 , r137

RSet r132 , :if_chain_end24
RJmp r132
// if contents end
:if25
// read_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r140 , 0
Set r129 , 9
Add r129 , r255
Add r129 , r140
Read r254 , r129
// read_register- end
:if_chain_end24
// assign_new_variable
// handle_binary_expr
// call_function_code
// call_function_code - needed_stack: 5
// allocate_stack - current: 10 size: 5
Set r136 , 5
Add r254 , r136
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 7, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r131 , 0
Set r128 , 7
Add r128 , r255
Read r128 , r128
Set r130 , 0
Add r128 , r130
Add r128 , r131
Read r140 , r128
// read_register- end
Set r129 , 4294967294
Add r129 , r254
Write r129 , r140
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r131 , 0
Set r130 , 4
Add r130 , r255
Add r130 , r131
Read r140 , r130
// read_register- end
Set r129 , 4294967293
Add r129 , r254
Write r129 , r140
RSet r140 , :function-return26
Add r140 , r251
Set r130 , 0
Sub r140 , r130
Write r254 , r140
RSet r129 , :function_max_5
RJmp r129
:function-return26
// function call output: Some(FunctionInputData { name: "max", data_type: U32, stack_frame_offset: -4 })
// function call converted output data : Some(Data { stack_frame_offset: 11, size: 1, data_type: U32 })
// allocate_stack - current: 15 size: 1
Set r132 , 1
Add r254 , r132
// alloc_stack - end
// handle_binary_expr - output_register- r137
// read_register- self: Data { stack_frame_offset: 11, size: 1, data_type: U32 }
Set r128 , 0
Set r127 , 11
Add r127 , r255
Add r127 , r128
Read r140 , r127
// read_register- end
// read_register- self: Data { stack_frame_offset: 7, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r128 , 0
Set r131 , 7
Add r131 , r255
Read r131 , r131
Set r127 , 0
Add r131 , r127
Add r131 , r128
Read r129 , r131
// read_register- end
Sub r140 , r129
Cp r137 , r140
// write_register- self: Data { stack_frame_offset: 15, size: 1, data_type: U32 }
Set r128 , 0
Set r127 , 15
Add r127 , r255
Add r127 , r128
Write r127 , r137
// write_register- end
// handle_binary_expr - end
// assign_new_variable - end

// assign_new_variable
// access_static_variable
// allocate_stack - current: 16 size: 1
Set r137 , 1
Add r254 , r137
// alloc_stack - end
RSet r129 , :free_heap_blocks_linked_lists
Add r129 , r251
Set r140 , 0
Sub r129 , r140
// write_directly_to_reference_pointer - 127, input: r129
Set r127 , 16
Add r127 , r255
Write r127 , r129
// write_directly_to_reference_pointer - end
// access_static_variable-end
// index_array
// index_array - var:Data { stack_frame_offset: 16, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
// allocate_stack - current: 17 size: 1
Set r129 , 1
Add r254 , r129
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 15, size: 1, data_type: U32 }
Set r131 , 0
Set r126 , 15
Add r126 , r255
Add r126 , r131
Read r127 , r126
// read_register- end
Set r131 , 16
// array indexing- var_to_index.is_reference: true
Cp r128 , r127
Set r126 , 1
Mul r128 , r126
// add 1 offset to account for 1'st register holding size of array
Set r126 , 1
Add r128 , r126
// read_addr_of_register - self: Data { stack_frame_offset: 16, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r126 , 16
Add r126 , r255
Read r126 , r126
Set r125 , 0
Add r126 , r125
Add r126 , r128
// read_addr_of_register - end
// index_array: read_addr_of_register - end addr_register:126 , offset_register:128
// write_directly_to_reference_pointer - 125, input: r126
Set r125 , 17
Add r125 , r255
Write r125 , r126
// write_directly_to_reference_pointer - end
// index_array - end
// assign_new_variable - end

// assign_new_variable
// direct_reference_access
// allocate_stack - current: 18 size: 1
Set r131 , 1
Add r254 , r131
// alloc_stack - end
// direct_reference_access - handle_inside_expr
// direct_reference_access - handle_inside_expr- end
// read_addr_of_last_reference_in_chain -output_register - r128
Set r128 , 17
Add r128 , r255
Read r128 , r128
Set r126 , 0
Add r128 , r126
// read_addr_of_last_reference_in_chain 
// write_directly_to_reference_pointer - 126, input: r128
Set r126 , 18
Add r126 , r255
Write r126 , r128
// write_directly_to_reference_pointer - end
// direct_reference_accesss - end
// allocate_stack - current: 19 size: 1
Set r128 , 1
Add r254 , r128
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 18, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r125 , 0
Set r124 , 18
Add r124 , r255
Read r124 , r124
Set r127 , 0
Add r124 , r127
Add r124 , r125
Read r126 , r124
// read_register- end
// write_register- self: Data { stack_frame_offset: 19, size: 1, data_type: U32 }
Set r125 , 0
Set r127 , 19
Add r127 , r255
Add r127 , r125
Write r127 , r126
// write_register- end
// assign_new_variable - end

// if- condition: Binary { left: Identifier("addr", DebugData { line: 56, file: "allocator.tip" }), operator: Token { kind: Equals, value: "==", line: 56 }, right: Number(0, DebugData { line: 56, file: "allocator.tip" }), debug_data: DebugData { line: 56, file: "allocator.tip" } }
// allocate_stack - current: 20 size: 1
Set r126 , 1
Add r254 , r126
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: U32 }
Set r125 , 0
Set r124 , 20
Add r124 , r255
Add r124 , r125
Write r124 , r254
// write_register- end
// if condition data
// handle_binary_expr
// handle number
Set r124 , 0
// allocate_stack - current: 21 size: 1
Set r125 , 1
Add r254 , r125
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 21, size: 1, data_type: U32 }
Set r123 , 0
Set r122 , 21
Add r122 , r255
Add r122 , r123
Write r122 , r124
// write_register- end
// handle number end
// allocate_stack - current: 22 size: 1
Set r121 , 1
Add r254 , r121
// alloc_stack - end
// handle_binary_expr - output_register- r122
// read_register- self: Data { stack_frame_offset: 19, size: 1, data_type: U32 }
Set r119 , 0
Set r118 , 19
Add r118 , r255
Add r118 , r119
Read r123 , r118
// read_register- end
// read_register- self: Data { stack_frame_offset: 21, size: 1, data_type: U32 }
Set r119 , 0
Set r120 , 21
Add r120 , r255
Add r120 , r119
Read r127 , r120
// read_register- end
Eq r123 , r127 , r122
// write_register- self: Data { stack_frame_offset: 22, size: 1, data_type: Bool }
Set r119 , 0
Set r118 , 22
Add r118 , r255
Add r118 , r119
Write r118 , r122
// write_register- end
// handle_binary_expr - end
// read condition
// read_register- self: Data { stack_frame_offset: 22, size: 1, data_type: Bool }
Set r123 , 0
Set r118 , 22
Add r118 , r255
Add r118 , r123
Read r122 , r118
// read_register- end
Not r122
RSet r118 , :if28
RJmpc r118 , r122
// if contents
// assignment
// call_function_code
// call_function_code - needed_stack: 4
// allocate_stack - current: 23 size: 4
Set r127 , 4
Add r254 , r127
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 15, size: 1, data_type: U32 }
Set r115 , 0
Set r114 , 15
Add r114 , r255
Add r114 , r115
Read r120 , r114
// read_register- end
Set r119 , 4294967294
Add r119 , r254
Write r119 , r120
RSet r120 , :function-return29
Add r120 , r251
Set r114 , 0
Sub r120 , r114
Write r254 , r120
RSet r119 , :function_allocate_new_block_of_memory_from_main_pool_4
RJmp r119
:function-return29
// function call output: Some(FunctionInputData { name: "allocate_new_block_of_memory_from_main_pool", data_type: U32, stack_frame_offset: -3 })
// function call converted output data : Some(Data { stack_frame_offset: 24, size: 1, data_type: U32 })
// assignment data: Data { stack_frame_offset: 24, size: 1, data_type: U32 }
// assignment- variable.is_reference: false data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 24, size: 1, data_type: U32 }
Set r119 , 0
Set r123 , 24
Add r123 , r255
Add r123 , r119
Read r117 , r123
// read_register- end
// write_register- self: Data { stack_frame_offset: 19, size: 1, data_type: U32 }
Set r119 , 0
Set r120 , 19
Add r120 , r255
Add r120 , r119
Write r120 , r117
// write_register- end
// end assignment

RSet r118 , :if_chain_end27
RJmp r118
// if contents end
:if28
// read_register- self: Data { stack_frame_offset: 20, size: 1, data_type: U32 }
Set r120 , 0
Set r119 , 20
Add r119 , r255
Add r119 , r120
Read r254 , r119
// read_register- end
// else - condition: None
// allocate_stack - current: 21 size: 1
Set r119 , 1
Add r254 , r119
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 21, size: 1, data_type: U32 }
Set r117 , 0
Set r123 , 21
Add r123 , r255
Add r123 , r117
Write r123 , r254
// write_register- end
// else contents
// assign_new_variable
// memory_access
// allocate_stack - current: 22 size: 1
Set r120 , 1
Add r254 , r120
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 19, size: 1, data_type: U32 }
Set r113 , 0
Set r112 , 19
Add r112 , r255
Add r112 , r113
Read r115 , r112
// read_register- end
// write_directly_to_reference_pointer - 113, input: r115
Set r113 , 22
Add r113 , r255
Write r113 , r115
// write_directly_to_reference_pointer - end
// memory_access- end
// assign_new_variable - end

// assign_new_variable
// access_static_variable
// allocate_stack - current: 23 size: 1
Set r112 , 1
Add r254 , r112
// alloc_stack - end
RSet r115 , :free_heap_blocks_linked_lists
Add r115 , r251
Set r113 , 0
Sub r115 , r113
// write_directly_to_reference_pointer - 116, input: r115
Set r116 , 23
Add r116 , r255
Write r116 , r115
// write_directly_to_reference_pointer - end
// access_static_variable-end
// index_array
// index_array - var:Data { stack_frame_offset: 23, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
// allocate_stack - current: 24 size: 1
Set r115 , 1
Add r254 , r115
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 15, size: 1, data_type: U32 }
Set r110 , 0
Set r109 , 15
Add r109 , r255
Add r109 , r110
Read r116 , r109
// read_register- end
Set r110 , 23
// array indexing- var_to_index.is_reference: true
Cp r111 , r116
Set r109 , 1
Mul r111 , r109
// add 1 offset to account for 1'st register holding size of array
Set r109 , 1
Add r111 , r109
// read_addr_of_register - self: Data { stack_frame_offset: 23, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r109 , 23
Add r109 , r255
Read r109 , r109
Set r108 , 0
Add r109 , r108
Add r109 , r111
// read_addr_of_register - end
// index_array: read_addr_of_register - end addr_register:109 , offset_register:111
// write_directly_to_reference_pointer - 108, input: r109
Set r108 , 24
Add r108 , r255
Write r108 , r109
// write_directly_to_reference_pointer - end
// index_array - end
// assign_new_variable - end

// assignment
// access_static_variable
// allocate_stack - current: 25 size: 1
Set r110 , 1
Add r254 , r110
// alloc_stack - end
RSet r111 , :free_heap_blocks_linked_lists
Add r111 , r251
Set r109 , 0
Sub r111 , r109
// write_directly_to_reference_pointer - 116, input: r111
Set r116 , 25
Add r116 , r255
Write r116 , r111
// write_directly_to_reference_pointer - end
// access_static_variable-end
// index_array
// index_array - var:Data { stack_frame_offset: 25, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
// allocate_stack - current: 26 size: 1
Set r111 , 1
Add r254 , r111
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 15, size: 1, data_type: U32 }
Set r107 , 0
Set r106 , 15
Add r106 , r255
Add r106 , r107
Read r116 , r106
// read_register- end
Set r107 , 25
// array indexing- var_to_index.is_reference: true
Cp r108 , r116
Set r106 , 1
Mul r108 , r106
// add 1 offset to account for 1'st register holding size of array
Set r106 , 1
Add r108 , r106
// read_addr_of_register - self: Data { stack_frame_offset: 25, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r106 , 25
Add r106 , r255
Read r106 , r106
Set r105 , 0
Add r106 , r105
Add r106 , r108
// read_addr_of_register - end
// index_array: read_addr_of_register - end addr_register:106 , offset_register:108
// write_directly_to_reference_pointer - 105, input: r106
Set r105 , 26
Add r105 , r255
Write r105 , r106
// write_directly_to_reference_pointer - end
// index_array - end
// handle_struct_access- Data { stack_frame_offset: 17, size: 1, data_type: Reference { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, offset_of_data_from_reference_addr: 0 } } "HeapBlock"
Set r108 , 0
// read_addr_of_register - self: Data { stack_frame_offset: 17, size: 1, data_type: Reference { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, offset_of_data_from_reference_addr: 0 } }
Set r107 , 17
Add r107 , r255
Read r107 , r107
Set r106 , 0
Add r107 , r106
Read r107 , r107
Set r106 , 0
Add r107 , r106
Add r107 , r108
// read_addr_of_register - end
// allocate_stack - current: 27 size: 1
Set r106 , 1
Add r254 , r106
// alloc_stack - end
Set r108 , 27
Add r108 , r255
Write r108 , r107
// handle_struct_access- end
// assignment data: Data { stack_frame_offset: 27, size: 1, data_type: Reference { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, offset_of_data_from_reference_addr: 0 } }
// assignment- variable.is_reference: true data.is_reference: true 
// read_referenced_address
Set r108 , 27
Add r108 , r255
Read r108 , r108
Set r107 , 0
Add r108 , r107
// read_referenced_address - end
Read r108 , r108
Set r107 , 0
Add r108 , r107
// read_referenced_address - end
Set r116 , 26
Add r116 , r255
Read r116 , r116
Set r107 , 0
Add r116 , r107
Write r116 , r108
// end assignment

RSet r123 , :if_chain_end27
RJmp r123
// else contents end
:else30
// read_register- self: Data { stack_frame_offset: 21, size: 1, data_type: U32 }
Set r116 , 0
Set r107 , 21
Add r107 , r255
Add r107 , r116
Read r254 , r107
// read_register- end
:if_chain_end27
Set r118 , 0
// read_register- self: Data { stack_frame_offset: 19, size: 1, data_type: U32 }
Set r123 , 0
Set r107 , 19
Add r107 , r255
Add r107 , r123
Read r122 , r107
// read_register- end
Phrp r118 , r122

// Return
Set r118 , 4294967293
// read_register- self: Data { stack_frame_offset: 19, size: 1, data_type: U32 }
Set r123 , 0
Set r117 , 19
Add r117 , r255
Add r117 , r123
Read r122 , r117
// read_register- end
Add r118 , r255
Write r118 , r122
Cp r122 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r123 , 0
Set r107 , 1
Add r107 , r255
Add r107 , r123
Read r118 , r107
// read_register- end
Cp r255 , r118
Read r122 , r122
Jmp r122

// function: Function { is_interrupt_function: false, name: "allocate_new_block_of_memory_from_main_pool", input: [FunctionInputData { name: "size_index", data_type: U32, stack_frame_offset: -2 }], output: Some(FunctionInputData { name: "allocate_new_block_of_memory_from_main_pool", data_type: U32, stack_frame_offset: -3 }), label_name: "function_allocate_new_block_of_memory_from_main_pool_4" }
:function_allocate_new_block_of_memory_from_main_pool_4
Cp r194 , r255
Cp r255 , r254
// allocate_stack - current: 0 size: 1
Set r118 , 1
Add r254 , r118
// alloc_stack - end
// allocate_stack - current: 1 size: 1
Set r122 , 1
Add r254 , r122
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r123 , 0
Set r117 , 1
Add r117 , r255
Add r117 , r123
Write r117 , r194
// write_register- end
// assign_new_variable
// handle_binary_expr
// handle number
Set r117 , 2
// allocate_stack - current: 2 size: 1
Set r123 , 1
Add r254 , r123
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r116 , 0
Set r108 , 2
Add r108 , r255
Add r108 , r116
Write r108 , r117
// write_register- end
// handle number end
// handle_binary_expr
// handle_binary_expr
// access_static_variable
// allocate_stack - current: 3 size: 1
Set r108 , 1
Add r254 , r108
// alloc_stack - end
RSet r116 , :min_heap_size_pow_2
Add r116 , r251
Set r107 , 0
Sub r116 , r107
// write_directly_to_reference_pointer - 105, input: r116
Set r105 , 3
Add r105 , r255
Write r105 , r116
// write_directly_to_reference_pointer - end
// access_static_variable-end
// allocate_stack - current: 4 size: 1
Set r103 , 1
Add r254 , r103
// alloc_stack - end
// handle_binary_expr - output_register- r116
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r101 , 0
Set r100 , 4294967294
Add r100 , r255
Add r100 , r101
Read r105 , r100
// read_register- end
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r101 , 0
Set r102 , 3
Add r102 , r255
Read r102 , r102
Set r100 , 0
Add r102 , r100
Add r102 , r101
Read r104 , r102
// read_register- end
Add r105 , r104
Cp r116 , r105
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r101 , 0
Set r100 , 4
Add r100 , r255
Add r100 , r101
Write r100 , r116
// write_register- end
// handle_binary_expr - end
// handle number
Set r116 , 1
// allocate_stack - current: 5 size: 1
Set r104 , 1
Add r254 , r104
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r100 , 0
Set r101 , 5
Add r101 , r255
Add r101 , r100
Write r101 , r116
// write_register- end
// handle number end
// allocate_stack - current: 6 size: 1
Set r102 , 1
Add r254 , r102
// alloc_stack - end
// handle_binary_expr - output_register- r101
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r98 , 0
Set r97 , 4
Add r97 , r255
Add r97 , r98
Read r100 , r97
// read_register- end
// read_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r98 , 0
Set r99 , 5
Add r99 , r255
Add r99 , r98
Read r105 , r99
// read_register- end
Sub r100 , r105
Cp r101 , r100
// write_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r98 , 0
Set r97 , 6
Add r97 , r255
Add r97 , r98
Write r97 , r101
// write_register- end
// handle_binary_expr - end
// allocate_stack - current: 7 size: 1
Set r97 , 1
Add r254 , r97
// alloc_stack - end
// handle_binary_expr - output_register- r101
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r99 , 0
Set r96 , 2
Add r96 , r255
Add r96 , r99
Read r105 , r96
// read_register- end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r99 , 0
Set r98 , 6
Add r98 , r255
Add r98 , r99
Read r100 , r98
// read_register- end
Shl r105 , r100
Cp r101 , r105
// write_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r99 , 0
Set r96 , 7
Add r96 , r255
Add r96 , r99
Write r96 , r101
// write_register- end
// handle_binary_expr - end
// assign_new_variable - end

// assign_new_variable
// access_static_variable
// allocate_stack - current: 8 size: 1
Set r101 , 1
Add r254 , r101
// alloc_stack - end
RSet r100 , :heap_main_pool_head
Add r100 , r251
Set r105 , 0
Sub r100 , r105
// write_directly_to_reference_pointer - 96, input: r100
Set r96 , 8
Add r96 , r255
Write r96 , r100
// write_directly_to_reference_pointer - end
// access_static_variable-end
// assign_new_variable - end

// assign_new_variable
// allocate_stack - current: 9 size: 1
Set r100 , 1
Add r254 , r100
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 8, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r98 , 0
Set r95 , 8
Add r95 , r255
Read r95 , r95
Set r99 , 0
Add r95 , r99
Add r95 , r98
Read r96 , r95
// read_register- end
// write_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r98 , 0
Set r99 , 9
Add r99 , r255
Add r99 , r98
Write r99 , r96
// write_register- end
// assign_new_variable - end

// assignment
// access_static_variable
// allocate_stack - current: 10 size: 1
Set r96 , 1
Add r254 , r96
// alloc_stack - end
RSet r99 , :heap_main_pool_head
Add r99 , r251
Set r98 , 0
Sub r99 , r98
// write_directly_to_reference_pointer - 95, input: r99
Set r95 , 10
Add r95 , r255
Write r95 , r99
// write_directly_to_reference_pointer - end
// access_static_variable-end
// handle_binary_expr
// access_static_variable
// allocate_stack - current: 11 size: 1
Set r99 , 1
Add r254 , r99
// alloc_stack - end
RSet r95 , :heap_main_pool_head
Add r95 , r251
Set r94 , 0
Sub r95 , r94
// write_directly_to_reference_pointer - 93, input: r95
Set r93 , 11
Add r93 , r255
Write r93 , r95
// write_directly_to_reference_pointer - end
// access_static_variable-end
// allocate_stack - current: 12 size: 1
Set r95 , 1
Add r254 , r95
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r91 , 0
Set r90 , 7
Add r90 , r255
Add r90 , r91
Read r93 , r90
// read_register- end
// write_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r91 , 0
Set r92 , 12
Add r92 , r255
Add r92 , r91
Write r92 , r93
// write_register- end
// allocate_stack - current: 13 size: 1
Set r90 , 1
Add r254 , r90
// alloc_stack - end
// handle_binary_expr - output_register- r93
// read_register- self: Data { stack_frame_offset: 11, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r88 , 0
Set r87 , 11
Add r87 , r255
Read r87 , r87
Set r89 , 0
Add r87 , r89
Add r87 , r88
Read r92 , r87
// read_register- end
// read_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r88 , 0
Set r89 , 12
Add r89 , r255
Add r89 , r88
Read r91 , r89
// read_register- end
Add r92 , r91
Cp r93 , r92
// write_register- self: Data { stack_frame_offset: 13, size: 1, data_type: U32 }
Set r88 , 0
Set r87 , 13
Add r87 , r255
Add r87 , r88
Write r87 , r93
// write_register- end
// handle_binary_expr - end
// assignment data: Data { stack_frame_offset: 13, size: 1, data_type: U32 }
// assignment- variable.is_reference: true data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 13, size: 1, data_type: U32 }
Set r92 , 0
Set r87 , 13
Add r87 , r255
Add r87 , r92
Read r93 , r87
// read_register- end
// write_register- self: Data { stack_frame_offset: 10, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r92 , 0
Set r91 , 10
Add r91 , r255
Read r91 , r91
Set r87 , 0
Add r91 , r87
Add r91 , r92
Write r91 , r93
// write_register- end
// end assignment

// if- condition: Binary { left: Identifier("heap_pool_head", DebugData { line: 77, file: "allocator.tip" }), operator: Token { kind: Greater, value: ">", line: 77 }, right: FunctionCall { left: Identifier("access_static", DebugData { line: 77, file: "allocator.tip" }), values: [String("\"heap_end", DebugData { line: 77, file: "allocator.tip" })], debug_data: DebugData { line: 77, file: "allocator.tip" } }, debug_data: DebugData { line: 77, file: "allocator.tip" } }
// allocate_stack - current: 14 size: 1
Set r93 , 1
Add r254 , r93
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r92 , 0
Set r87 , 14
Add r87 , r255
Add r87 , r92
Write r87 , r254
// write_register- end
// if condition data
// handle_binary_expr
// access_static_variable
// allocate_stack - current: 15 size: 1
Set r87 , 1
Add r254 , r87
// alloc_stack - end
RSet r92 , :heap_end
Add r92 , r251
Set r91 , 0
Sub r92 , r91
// write_directly_to_reference_pointer - 88, input: r92
Set r88 , 15
Add r88 , r255
Write r88 , r92
// write_directly_to_reference_pointer - end
// access_static_variable-end
// allocate_stack - current: 16 size: 1
Set r86 , 1
Add r254 , r86
// alloc_stack - end
// handle_binary_expr - output_register- r92
// read_register- self: Data { stack_frame_offset: 8, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r84 , 0
Set r83 , 8
Add r83 , r255
Read r83 , r83
Set r85 , 0
Add r83 , r85
Add r83 , r84
Read r88 , r83
// read_register- end
// read_register- self: Data { stack_frame_offset: 15, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r84 , 0
Set r85 , 15
Add r85 , r255
Read r85 , r85
Set r83 , 0
Add r85 , r83
Add r85 , r84
Read r89 , r85
// read_register- end
Gt r88 , r89 , r92
// write_register- self: Data { stack_frame_offset: 16, size: 1, data_type: Bool }
Set r84 , 0
Set r83 , 16
Add r83 , r255
Add r83 , r84
Write r83 , r92
// write_register- end
// handle_binary_expr - end
// read condition
// read_register- self: Data { stack_frame_offset: 16, size: 1, data_type: Bool }
Set r88 , 0
Set r83 , 16
Add r83 , r255
Add r83 , r88
Read r92 , r83
// read_register- end
Not r92
RSet r83 , :if32
RJmpc r83 , r92
// if contents
// handle number
Set r84 , 251
// allocate_stack - current: 17 size: 1
Set r85 , 1
Add r254 , r85
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 17, size: 1, data_type: U32 }
Set r81 , 0
Set r80 , 17
Add r80 , r255
Add r80 , r81
Write r80 , r84
// write_register- end
// handle number end
Set r88 , 0
// read_register- self: Data { stack_frame_offset: 17, size: 1, data_type: U32 }
Set r81 , 0
Set r82 , 17
Add r82 , r255
Add r82 , r81
Read r89 , r82
// read_register- end
Phrp r88 , r89

RSet r83 , :if_chain_end31
RJmp r83
// if contents end
:if32
// read_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r88 , 0
Set r82 , 14
Add r82 , r255
Add r82 , r88
Read r254 , r82
// read_register- end
:if_chain_end31
// Return
Set r92 , 4294967293
// read_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r88 , 0
Set r89 , 9
Add r89 , r255
Add r89 , r88
Read r83 , r89
// read_register- end
Add r92 , r255
Write r92 , r83
Cp r83 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r88 , 0
Set r82 , 1
Add r82 , r255
Add r82 , r88
Read r92 , r82
// read_register- end
Cp r255 , r92
Read r83 , r83
Jmp r83

// function: Function { is_interrupt_function: false, name: "max", input: [FunctionInputData { name: "a", data_type: U32, stack_frame_offset: -2 }, FunctionInputData { name: "b", data_type: U32, stack_frame_offset: -3 }], output: Some(FunctionInputData { name: "max", data_type: U32, stack_frame_offset: -4 }), label_name: "function_max_5" }
:function_max_5
Cp r194 , r255
Cp r255 , r254
// allocate_stack - current: 0 size: 1
Set r92 , 1
Add r254 , r92
// alloc_stack - end
// allocate_stack - current: 1 size: 1
Set r83 , 1
Add r254 , r83
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r88 , 0
Set r89 , 1
Add r89 , r255
Add r89 , r88
Write r89 , r194
// write_register- end
// assign_new_variable
// allocate_stack - current: 3 size: 1
Set r82 , 1
Add r254 , r82
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r81 , 0
Set r76 , 2
Add r76 , r255
Add r76 , r81
Read r89 , r76
// read_register- end
Not r89
// write_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r81 , 0
Set r80 , 3
Add r80 , r255
Add r80 , r81
Write r80 , r89
// write_register- end
// handle_binary_expr - end
// assign_new_variable - end

// Return
// handle_binary_expr
// handle_binary_expr
// allocate_stack - current: 4 size: 1
Set r80 , 1
Add r254 , r80
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r76 , 0
Set r77 , 3
Add r77 , r255
Add r77 , r76
Read r88 , r77
// read_register- end
Not r88
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r76 , 0
Set r81 , 4
Add r81 , r255
Add r81 , r76
Write r81 , r88
// write_register- end
// handle_binary_expr - end
// allocate_stack - current: 5 size: 1
Set r76 , 1
Add r254 , r76
// alloc_stack - end
// handle_binary_expr - output_register- r89
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r78 , 0
Set r75 , 4294967294
Add r75 , r255
Add r75 , r78
Read r88 , r75
// read_register- end
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r78 , 0
Set r77 , 4
Add r77 , r255
Add r77 , r78
Read r81 , r77
// read_register- end
And r88 , r81
Cp r89 , r88
// write_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r78 , 0
Set r75 , 5
Add r75 , r255
Add r75 , r78
Write r75 , r89
// write_register- end
// handle_binary_expr - end
// handle_binary_expr
// allocate_stack - current: 6 size: 1
Set r75 , 1
Add r254 , r75
// alloc_stack - end
// handle_binary_expr - output_register- r89
// read_register- self: Data { stack_frame_offset: -3, size: 1, data_type: U32 }
Set r77 , 0
Set r74 , 4294967293
Add r74 , r255
Add r74 , r77
Read r81 , r74
// read_register- end
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r77 , 0
Set r78 , 3
Add r78 , r255
Add r78 , r77
Read r88 , r78
// read_register- end
And r81 , r88
Cp r89 , r81
// write_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r77 , 0
Set r74 , 6
Add r74 , r255
Add r74 , r77
Write r74 , r89
// write_register- end
// handle_binary_expr - end
// allocate_stack - current: 7 size: 1
Set r74 , 1
Add r254 , r74
// alloc_stack - end
// handle_binary_expr - output_register- r89
// read_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r78 , 0
Set r73 , 5
Add r73 , r255
Add r73 , r78
Read r88 , r73
// read_register- end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r78 , 0
Set r77 , 6
Add r77 , r255
Add r77 , r78
Read r81 , r77
// read_register- end
Or r88 , r81
Cp r89 , r88
// write_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r78 , 0
Set r73 , 7
Add r73 , r255
Add r73 , r78
Write r73 , r89
// write_register- end
// handle_binary_expr - end
Set r81 , 4294967292
// read_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r73 , 0
Set r78 , 7
Add r78 , r255
Add r78 , r73
Read r89 , r78
// read_register- end
Add r81 , r255
Write r81 , r89
Cp r89 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r73 , 0
Set r88 , 1
Add r88 , r255
Add r88 , r73
Read r81 , r88
// read_register- end
Cp r255 , r81
Read r89 , r89
Jmp r89

// function: Function { is_interrupt_function: false, name: "ceil_log2", input: [FunctionInputData { name: "x", data_type: U32, stack_frame_offset: -2 }], output: Some(FunctionInputData { name: "ceil_log2", data_type: U32, stack_frame_offset: -3 }), label_name: "function_ceil_log2_6" }
:function_ceil_log2_6
Cp r194 , r255
Cp r255 , r254
// allocate_stack - current: 0 size: 1
Set r81 , 1
Add r254 , r81
// alloc_stack - end
// allocate_stack - current: 1 size: 1
Set r89 , 1
Add r254 , r89
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r73 , 0
Set r78 , 1
Add r78 , r255
Add r78 , r73
Write r78 , r194
// write_register- end
// assign_new_variable
// handle number
Set r78 , 0
// allocate_stack - current: 2 size: 1
Set r73 , 1
Add r254 , r73
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r77 , 0
Set r72 , 2
Add r72 , r255
Add r72 , r77
Write r72 , r78
// write_register- end
// handle number end
// assign_new_variable - end

// assign_new_variable
// handle number
Set r72 , 1
// allocate_stack - current: 3 size: 1
Set r77 , 1
Add r254 , r77
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r71 , 0
Set r70 , 3
Add r70 , r255
Add r70 , r71
Write r70 , r72
// write_register- end
// handle number end
// assign_new_variable - end

// allocate_stack - current: 4 size: 1
Set r70 , 1
Add r254 , r70
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r88 , 0
Set r69 , 4
Add r69 , r255
Add r69 , r88
Write r69 , r254
// write_register- end
:while_start33
// handle_binary_expr
// allocate_stack - current: 5 size: 1
Set r66 , 1
Add r254 , r66
// alloc_stack - end
// handle_binary_expr - output_register- r71
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r64 , 0
Set r63 , 3
Add r63 , r255
Add r63 , r64
Read r68 , r63
// read_register- end
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r64 , 0
Set r65 , 4294967294
Add r65 , r255
Add r65 , r64
Read r67 , r65
// read_register- end
Lt r68 , r67 , r71
// write_register- self: Data { stack_frame_offset: 5, size: 1, data_type: Bool }
Set r64 , 0
Set r63 , 5
Add r63 , r255
Add r63 , r64
Write r63 , r71
// write_register- end
// handle_binary_expr - end
// read_register- self: Data { stack_frame_offset: 5, size: 1, data_type: Bool }
Set r67 , 0
Set r68 , 5
Add r68 , r255
Add r68 , r67
Read r69 , r68
// read_register- end
Not r69
RSet r88 , :while_end34
RJmpc r88 , r69
// while loop contents:
// assignment
// handle_binary_expr
// handle number
Set r68 , 1
// allocate_stack - current: 6 size: 1
Set r67 , 1
Add r254 , r67
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r63 , 0
Set r64 , 6
Add r64 , r255
Add r64 , r63
Write r64 , r68
// write_register- end
// handle number end
// allocate_stack - current: 7 size: 1
Set r65 , 1
Add r254 , r65
// alloc_stack - end
// handle_binary_expr - output_register- r64
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r61 , 0
Set r60 , 3
Add r60 , r255
Add r60 , r61
Read r63 , r60
// read_register- end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r61 , 0
Set r62 , 6
Add r62 , r255
Add r62 , r61
Read r71 , r62
// read_register- end
Shl r63 , r71
Cp r64 , r63
// write_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r61 , 0
Set r60 , 7
Add r60 , r255
Add r60 , r61
Write r60 , r64
// write_register- end
// handle_binary_expr - end
// assignment data: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
// assignment- variable.is_reference: false data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r63 , 0
Set r60 , 7
Add r60 , r255
Add r60 , r63
Read r64 , r60
// read_register- end
// write_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r63 , 0
Set r71 , 3
Add r71 , r255
Add r71 , r63
Write r71 , r64
// write_register- end
// end assignment

// assignment
// handle_binary_expr
// handle number
Set r64 , 1
// allocate_stack - current: 8 size: 1
Set r71 , 1
Add r254 , r71
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 8, size: 1, data_type: U32 }
Set r60 , 0
Set r61 , 8
Add r61 , r255
Add r61 , r60
Write r61 , r64
// write_register- end
// handle number end
// allocate_stack - current: 9 size: 1
Set r62 , 1
Add r254 , r62
// alloc_stack - end
// handle_binary_expr - output_register- r61
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r58 , 0
Set r57 , 2
Add r57 , r255
Add r57 , r58
Read r60 , r57
// read_register- end
// read_register- self: Data { stack_frame_offset: 8, size: 1, data_type: U32 }
Set r58 , 0
Set r59 , 8
Add r59 , r255
Add r59 , r58
Read r63 , r59
// read_register- end
Add r60 , r63
Cp r61 , r60
// write_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r58 , 0
Set r57 , 9
Add r57 , r255
Add r57 , r58
Write r57 , r61
// write_register- end
// handle_binary_expr - end
// assignment data: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
// assignment- variable.is_reference: false data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r60 , 0
Set r57 , 9
Add r57 , r255
Add r57 , r60
Read r61 , r57
// read_register- end
// write_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r60 , 0
Set r63 , 2
Add r63 , r255
Add r63 , r60
Write r63 , r61
// write_register- end
// end assignment

// while loop contents - end
RSet r88 , :while_start33
RJmp r88
:while_end34
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r63 , 0
Set r60 , 4
Add r60 , r255
Add r60 , r63
Read r254 , r60
// read_register- end
// Return
Set r69 , 4294967293
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r63 , 0
Set r61 , 2
Add r61 , r255
Add r61 , r63
Read r88 , r61
// read_register- end
Add r69 , r255
Write r69 , r88
Cp r88 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r63 , 0
Set r60 , 1
Add r60 , r255
Add r60 , r63
Read r69 , r60
// read_register- end
Cp r255 , r69
Read r88 , r88
Jmp r88

// function: Function { is_interrupt_function: true, name: "keyboard_interrupt", input: [FunctionInputData { name: "data", data_type: U32, stack_frame_offset: -2 }], output: None, label_name: "function_keyboard_interrupt_7" }
:function_keyboard_interrupt_7
Cp r194 , r255
Cp r255 , r254
// allocate_stack - current: 0 size: 1
Set r69 , 1
Add r254 , r69
// alloc_stack - end
// allocate_stack - current: 1 size: 1
Set r88 , 1
Add r254 , r88
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r63 , 0
Set r61 , 1
Add r61 , r255
Add r61 , r63
Write r61 , r194
// write_register- end
Set r61 , 0
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r57 , 0
Set r58 , 4294967294
Add r58 , r255
Add r58 , r57
Read r63 , r58
// read_register- end
Phrp r61 , r63

// Return
Cp r63 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r57 , 0
Set r60 , 1
Add r60 , r255
Add r60 , r57
Read r61 , r60
// read_register- end
Cp r255 , r61
Read r63 , r63
Iret r63
// function: Function { is_interrupt_function: true, name: "timer_interrupt", input: [FunctionInputData { name: "data", data_type: U32, stack_frame_offset: -2 }], output: None, label_name: "function_timer_interrupt_8" }
:function_timer_interrupt_8
Cp r194 , r255
Cp r255 , r254
// allocate_stack - current: 0 size: 1
Set r61 , 1
Add r254 , r61
// alloc_stack - end
// allocate_stack - current: 1 size: 1
Set r63 , 1
Add r254 , r63
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r57 , 0
Set r58 , 1
Add r58 , r255
Add r58 , r57
Write r58 , r194
// write_register- end
Set r58 , 0
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r59 , 0
Set r56 , 4294967294
Add r56 , r255
Add r56 , r59
Read r57 , r56
// read_register- end
Phrp r58 , r57

// Return
Cp r57 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r59 , 0
Set r60 , 1
Add r60 , r255
Add r60 , r59
Read r58 , r60
// read_register- end
Cp r255 , r58
Read r57 , r57
Iret r57
// function: Function { is_interrupt_function: false, name: "syscall_handler", input: [FunctionInputData { name: "syscall_id", data_type: U32, stack_frame_offset: -2 }, FunctionInputData { name: "additional_data_addr", data_type: U32, stack_frame_offset: -3 }, FunctionInputData { name: "output_data", data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 }, stack_frame_offset: -4 }], output: None, label_name: "function_syscall_handler_9" }
:function_syscall_handler_9
Cp r194 , r255
Cp r255 , r254
// allocate_stack - current: 0 size: 1
Set r58 , 1
Add r254 , r58
// alloc_stack - end
// allocate_stack - current: 1 size: 1
Set r57 , 1
Add r254 , r57
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r59 , 0
Set r56 , 1
Add r56 , r255
Add r56 , r59
Write r56 , r194
// write_register- end
// if- condition: Binary { left: Identifier("syscall_id", DebugData { line: 2, file: "syscall.tip" }), operator: Token { kind: Equals, value: "==", line: 2 }, right: Number(0, DebugData { line: 2, file: "syscall.tip" }), debug_data: DebugData { line: 2, file: "syscall.tip" } }
// allocate_stack - current: 2 size: 1
Set r56 , 1
Add r254 , r56
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r60 , 0
Set r55 , 2
Add r55 , r255
Add r55 , r60
Write r55 , r254
// write_register- end
// if condition data
// handle_binary_expr
// handle number
Set r55 , 0
// allocate_stack - current: 3 size: 1
Set r60 , 1
Add r254 , r60
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r54 , 0
Set r53 , 3
Add r53 , r255
Add r53 , r54
Write r53 , r55
// write_register- end
// handle number end
// allocate_stack - current: 4 size: 1
Set r52 , 1
Add r254 , r52
// alloc_stack - end
// handle_binary_expr - output_register- r53
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r50 , 0
Set r49 , 4294967294
Add r49 , r255
Add r49 , r50
Read r54 , r49
// read_register- end
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r50 , 0
Set r51 , 3
Add r51 , r255
Add r51 , r50
Read r59 , r51
// read_register- end
Eq r54 , r59 , r53
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: Bool }
Set r50 , 0
Set r49 , 4
Add r49 , r255
Add r49 , r50
Write r49 , r53
// write_register- end
// handle_binary_expr - end
// read condition
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: Bool }
Set r54 , 0
Set r49 , 4
Add r49 , r255
Add r49 , r54
Read r53 , r49
// read_register- end
Not r53
RSet r49 , :if36
RJmpc r49 , r53
// if contents
// assign_new_variable
// assign_new_variable - end

// call_function_code
// function.input.is_empty(), 0, 3
// call_function_code - needed_stack: 3
// allocate_stack - current: 5 size: 3
Set r59 , 3
Add r254 , r59
// alloc_stack - end
// call_function_code - handle reference variable
Set r50 , 4294967294
Add r50 , r254
// read_referenced_address
Set r51 , 4294967293
Add r51 , r255
Read r51 , r51
Set r47 , 0
Add r51 , r47
// read_referenced_address - end
Write r50 , r51
// call_function_code - handle reference variable, end
RSet r51 , :function-return37
Add r51 , r251
Set r47 , 0
Sub r51 , r47
Write r254 , r51
RSet r50 , :function_print_chars_1
RJmp r50
:function-return37
// function call output: None
// function call converted output data : None

RSet r49 , :if_chain_end35
RJmp r49
// if contents end
:if36
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r51 , 0
Set r50 , 2
Add r50 , r255
Add r50 , r51
Read r254 , r50
// read_register- end
// else - condition: Some(Binary { left: Identifier("syscall_id", DebugData { line: 5, file: "syscall.tip" }), operator: Token { kind: Equals, value: "==", line: 5 }, right: Number(1, DebugData { line: 5, file: "syscall.tip" }), debug_data: DebugData { line: 5, file: "syscall.tip" } })
// allocate_stack - current: 3 size: 1
Set r50 , 1
Add r254 , r50
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r48 , 0
Set r54 , 3
Add r54 , r255
Add r54 , r48
Write r54 , r254
// write_register- end
// else condition data
// handle_binary_expr
// handle number
Set r51 , 1
// allocate_stack - current: 4 size: 1
Set r46 , 1
Add r254 , r46
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r44 , 0
Set r43 , 4
Add r43 , r255
Add r43 , r44
Write r43 , r51
// write_register- end
// handle number end
// allocate_stack - current: 5 size: 1
Set r42 , 1
Add r254 , r42
// alloc_stack - end
// handle_binary_expr - output_register- r43
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r40 , 0
Set r39 , 4294967294
Add r39 , r255
Add r39 , r40
Read r44 , r39
// read_register- end
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r40 , 0
Set r41 , 4
Add r41 , r255
Add r41 , r40
Read r45 , r41
// read_register- end
Eq r44 , r45 , r43
// write_register- self: Data { stack_frame_offset: 5, size: 1, data_type: Bool }
Set r40 , 0
Set r39 , 5
Add r39 , r255
Add r39 , r40
Write r39 , r43
// write_register- end
// handle_binary_expr - end
// read condition
// read_register- self: Data { stack_frame_offset: 5, size: 1, data_type: Bool }
Set r45 , 0
Set r44 , 5
Add r44 , r255
Add r44 , r45
Read r48 , r44
// read_register- end
Not r48
RSet r54 , :else38
RJmpc r54 , r48
// else contents
// assignment
// call_function_code
// call_function_code - needed_stack: 4
// allocate_stack - current: 6 size: 4
Set r45 , 4
Add r254 , r45
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: -3, size: 1, data_type: U32 }
Set r38 , 0
Set r37 , 4294967293
Add r37 , r255
Add r37 , r38
Read r39 , r37
// read_register- end
Set r43 , 4294967294
Add r43 , r254
Write r43 , r39
RSet r39 , :function-return39
Add r39 , r251
Set r37 , 0
Sub r39 , r37
Write r254 , r39
RSet r43 , :function_core_allocate_3
RJmp r43
:function-return39
// function call output: Some(FunctionInputData { name: "core_allocate", data_type: U32, stack_frame_offset: -3 })
// function call converted output data : Some(Data { stack_frame_offset: 7, size: 1, data_type: U32 })
// assignment data: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
// assignment- variable.is_reference: true data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r43 , 0
Set r44 , 7
Add r44 , r255
Add r44 , r43
Read r40 , r44
// read_register- end
// write_register- self: Data { stack_frame_offset: -4, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r43 , 0
Set r39 , 4294967292
Add r39 , r255
Read r39 , r39
Set r44 , 0
Add r39 , r44
Add r39 , r43
Write r39 , r40
// write_register- end
// end assignment

// handle number
Set r43 , 255
// allocate_stack - current: 10 size: 1
Set r44 , 1
Add r254 , r44
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 10, size: 1, data_type: U32 }
Set r41 , 0
Set r36 , 10
Add r36 , r255
Add r36 , r41
Write r36 , r43
// write_register- end
// handle number end
Set r40 , 0
// read_register- self: Data { stack_frame_offset: 10, size: 1, data_type: U32 }
Set r41 , 0
Set r38 , 10
Add r38 , r255
Add r38 , r41
Read r39 , r38
// read_register- end
Phrp r40 , r39

Set r39 , 0
// read_register- self: Data { stack_frame_offset: -4, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r41 , 0
Set r36 , 4294967292
Add r36 , r255
Read r36 , r36
Set r38 , 0
Add r36 , r38
Add r36 , r41
Read r40 , r36
// read_register- end
Phrp r39 , r40

RSet r54 , :if_chain_end35
RJmp r54
// else contents end
:else38
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r39 , 0
Set r36 , 3
Add r36 , r255
Add r36 , r39
Read r254 , r36
// read_register- end
// else - condition: None
// allocate_stack - current: 4 size: 1
Set r48 , 1
Add r254 , r48
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r36 , 0
Set r39 , 4
Add r39 , r255
Add r39 , r36
Write r39 , r254
// write_register- end
// else contents
// allocate_stack - current: 5 size: 28
Set r40 , 28
Add r254 , r40
// alloc_stack - end
Set r54 , 27
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 0
Set r35 , 5
Add r35 , r255
Add r35 , r38
Write r35 , r54
// write_register- end
Set r54 , 102
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 1
Set r41 , 5
Add r41 , r255
Add r41 , r38
Write r41 , r54
// write_register- end
Set r54 , 111
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 2
Set r35 , 5
Add r35 , r255
Add r35 , r38
Write r35 , r54
// write_register- end
Set r54 , 117
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 3
Set r41 , 5
Add r41 , r255
Add r41 , r38
Write r41 , r54
// write_register- end
Set r54 , 110
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 4
Set r35 , 5
Add r35 , r255
Add r35 , r38
Write r35 , r54
// write_register- end
Set r54 , 100
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 5
Set r41 , 5
Add r41 , r255
Add r41 , r38
Write r41 , r54
// write_register- end
Set r54 , 32
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 6
Set r35 , 5
Add r35 , r255
Add r35 , r38
Write r35 , r54
// write_register- end
Set r54 , 117
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 7
Set r41 , 5
Add r41 , r255
Add r41 , r38
Write r41 , r54
// write_register- end
Set r54 , 110
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 8
Set r35 , 5
Add r35 , r255
Add r35 , r38
Write r35 , r54
// write_register- end
Set r54 , 101
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 9
Set r41 , 5
Add r41 , r255
Add r41 , r38
Write r41 , r54
// write_register- end
Set r54 , 120
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 10
Set r35 , 5
Add r35 , r255
Add r35 , r38
Write r35 , r54
// write_register- end
Set r54 , 112
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 11
Set r41 , 5
Add r41 , r255
Add r41 , r38
Write r41 , r54
// write_register- end
Set r54 , 101
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 12
Set r35 , 5
Add r35 , r255
Add r35 , r38
Write r35 , r54
// write_register- end
Set r54 , 99
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 13
Set r41 , 5
Add r41 , r255
Add r41 , r38
Write r41 , r54
// write_register- end
Set r54 , 116
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 14
Set r35 , 5
Add r35 , r255
Add r35 , r38
Write r35 , r54
// write_register- end
Set r54 , 101
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 15
Set r41 , 5
Add r41 , r255
Add r41 , r38
Write r41 , r54
// write_register- end
Set r54 , 100
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 16
Set r35 , 5
Add r35 , r255
Add r35 , r38
Write r35 , r54
// write_register- end
Set r54 , 32
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 17
Set r41 , 5
Add r41 , r255
Add r41 , r38
Write r41 , r54
// write_register- end
Set r54 , 115
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 18
Set r35 , 5
Add r35 , r255
Add r35 , r38
Write r35 , r54
// write_register- end
Set r54 , 121
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 19
Set r41 , 5
Add r41 , r255
Add r41 , r38
Write r41 , r54
// write_register- end
Set r54 , 115
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 20
Set r35 , 5
Add r35 , r255
Add r35 , r38
Write r35 , r54
// write_register- end
Set r54 , 99
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 21
Set r41 , 5
Add r41 , r255
Add r41 , r38
Write r41 , r54
// write_register- end
Set r54 , 97
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 22
Set r35 , 5
Add r35 , r255
Add r35 , r38
Write r35 , r54
// write_register- end
Set r54 , 108
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 23
Set r41 , 5
Add r41 , r255
Add r41 , r38
Write r41 , r54
// write_register- end
Set r54 , 108
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 24
Set r35 , 5
Add r35 , r255
Add r35 , r38
Write r35 , r54
// write_register- end
Set r54 , 32
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 25
Set r41 , 5
Add r41 , r255
Add r41 , r38
Write r41 , r54
// write_register- end
Set r54 , 105
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 26
Set r35 , 5
Add r35 , r255
Add r35 , r38
Write r35 , r54
// write_register- end
Set r54 , 100
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r38 , 27
Set r41 , 5
Add r41 , r255
Add r41 , r38
Write r41 , r54
// write_register- end
// call_function_code
// function.input.is_empty(), 0, 3
// call_function_code - needed_stack: 3
// allocate_stack - current: 33 size: 3
Set r38 , 3
Add r254 , r38
// alloc_stack - end
// call_function_code - handle reference variable
Set r35 , 4294967294
Add r35 , r254
// read_addr_of_self
Set r34 , 5
Add r34 , r255
// read_addr_of_self - end
Write r35 , r34
// call_function_code - handle reference variable, end
RSet r34 , :function-return41
Add r34 , r251
Set r32 , 0
Sub r34 , r32
Write r254 , r34
RSet r35 , :function_print_chars_1
RJmp r35
:function-return41
// function call output: None
// function call converted output data : None

RSet r39 , :if_chain_end35
RJmp r39
// else contents end
:else40
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r34 , 0
Set r35 , 4
Add r35 , r255
Add r35 , r34
Read r254 , r35
// read_register- end
:if_chain_end35
// Return

Cp r49 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r39 , 0
Set r35 , 1
Add r35 , r255
Add r35 , r39
Read r53 , r35
// read_register- end
Cp r255 , r53
Read r49 , r49
Jmp r49
Halt
