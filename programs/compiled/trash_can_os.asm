// handle number
Set r253 , 9000
// allocate_stack - current: 0 size: 1
Set r252 , 1
Add r254 , r252
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 0, size: 1, data_type: U32 }
Set r250 , 0
Set r249 , 0
Add r249 , r255
Add r249 , r250
Write r249 , r253
// write_register- end
// handle number end
Set r249 , :static_declaration_end10
Jmp r249
:heap_start
Set r0 , 0
:static_declaration_end10
// allocate_stack - current: 1 size: 1
Set r251 , 1
Add r254 , r251
// alloc_stack - end
Set r249 , :heap_start
// write_directly_to_reference_pointer - 248, input: r249
Set r248 , 1
Add r248 , r255
Write r248 , r249
// write_directly_to_reference_pointer - end
// read_register- self: Data { stack_frame_offset: 0, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 0
Add r246 , r255
Add r246 , r247
Read r250 , r246
// read_register- end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r247 , 0
Set r248 , 1
Add r248 , r255
Read r248 , r248
Set r246 , 0
Add r248 , r246
Add r248 , r247
Write r248 , r250
// write_register- end

// access_static_variable
// allocate_stack - current: 2 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
Set r249 , :heap_start
// write_directly_to_reference_pointer - 248, input: r249
Set r248 , 2
Add r248 , r255
Write r248 , r249
// write_directly_to_reference_pointer - end
// access_static_variable-end
// allocate_stack - current: 3 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r246 , 0
Set r245 , 2
Add r245 , r255
Read r245 , r245
Set r247 , 0
Add r245 , r247
Add r245 , r246
Read r248 , r245
// read_register- end
// write_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r246 , 0
Set r247 , 3
Add r247 , r255
Add r247 , r246
Write r247 , r248
// write_register- end
Set r248 , :static_declaration_end11
Jmp r248
:heap_main_pool_head
Set r0 , 0
:static_declaration_end11
// allocate_stack - current: 4 size: 1
Set r246 , 1
Add r254 , r246
// alloc_stack - end
Set r248 , :heap_main_pool_head
// write_directly_to_reference_pointer - 245, input: r248
Set r245 , 4
Add r245 , r255
Write r245 , r248
// write_directly_to_reference_pointer - end
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r244 , 0
Set r243 , 3
Add r243 , r255
Add r243 , r244
Read r247 , r243
// read_register- end
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r244 , 0
Set r245 , 4
Add r245 , r255
Read r245 , r245
Set r243 , 0
Add r245 , r243
Add r245 , r244
Write r245 , r247
// write_register- end

// handle number
Set r247 , 30000
// allocate_stack - current: 5 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r244 , 0
Set r243 , 5
Add r243 , r255
Add r243 , r244
Write r243 , r247
// write_register- end
// handle number end
Set r243 , :static_declaration_end12
Jmp r243
:heap_end
Set r0 , 0
:static_declaration_end12
// allocate_stack - current: 6 size: 1
Set r245 , 1
Add r254 , r245
// alloc_stack - end
Set r243 , :heap_end
// write_directly_to_reference_pointer - 242, input: r243
Set r242 , 6
Add r242 , r255
Write r242 , r243
// write_directly_to_reference_pointer - end
// read_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r241 , 0
Set r240 , 5
Add r240 , r255
Add r240 , r241
Read r244 , r240
// read_register- end
// write_register- self: Data { stack_frame_offset: 6, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r241 , 0
Set r242 , 6
Add r242 , r255
Read r242 , r242
Set r240 , 0
Add r242 , r240
Add r242 , r241
Write r242 , r244
// write_register- end

// handle number
Set r244 , 2
// allocate_stack - current: 7 size: 1
Set r243 , 1
Add r254 , r243
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r241 , 0
Set r240 , 7
Add r240 , r255
Add r240 , r241
Write r240 , r244
// write_register- end
// handle number end
Set r240 , :static_declaration_end13
Jmp r240
:min_heap_size_pow_2
Set r0 , 0
:static_declaration_end13
// allocate_stack - current: 8 size: 1
Set r242 , 1
Add r254 , r242
// alloc_stack - end
Set r240 , :min_heap_size_pow_2
// write_directly_to_reference_pointer - 239, input: r240
Set r239 , 8
Add r239 , r255
Write r239 , r240
// write_directly_to_reference_pointer - end
// read_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r238 , 0
Set r237 , 7
Add r237 , r255
Add r237 , r238
Read r241 , r237
// read_register- end
// write_register- self: Data { stack_frame_offset: 8, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r238 , 0
Set r239 , 8
Add r239 , r255
Read r239 , r239
Set r237 , 0
Add r239 , r237
Add r239 , r238
Write r239 , r241
// write_register- end
// handle number
Set r241 , 10
// allocate_stack - current: 9 size: 1
Set r240 , 1
Add r254 , r240
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r238 , 0
Set r237 , 9
Add r237 , r255
Add r237 , r238
Write r237 , r241
// write_register- end
// handle number end
Set r237 , :static_declaration_end14
Jmp r237
:max_heap_size_pow_2
Set r0 , 0
:static_declaration_end14
// allocate_stack - current: 10 size: 1
Set r239 , 1
Add r254 , r239
// alloc_stack - end
Set r237 , :max_heap_size_pow_2
// write_directly_to_reference_pointer - 236, input: r237
Set r236 , 10
Add r236 , r255
Write r236 , r237
// write_directly_to_reference_pointer - end
// read_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r235 , 0
Set r234 , 9
Add r234 , r255
Add r234 , r235
Read r238 , r234
// read_register- end
// write_register- self: Data { stack_frame_offset: 10, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r235 , 0
Set r236 , 10
Add r236 , r255
Read r236 , r236
Set r234 , 0
Add r236 , r234
Add r236 , r235
Write r236 , r238
// write_register- end
// array_initialization
// allocate_stack - current: 11 size: 9
Set r237 , 9
Add r254 , r237
// alloc_stack - end
Set r238 , 0
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r235 , 0
Set r234 , 11
Add r234 , r255
Add r234 , r235
Write r234 , r238
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r235 , 1
Set r236 , 11
Add r236 , r255
Add r236 , r235
Write r236 , r238
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r235 , 2
Set r234 , 11
Add r234 , r255
Add r234 , r235
Write r234 , r238
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r235 , 3
Set r236 , 11
Add r236 , r255
Add r236 , r235
Write r236 , r238
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r235 , 4
Set r234 , 11
Add r234 , r255
Add r234 , r235
Write r234 , r238
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r235 , 5
Set r236 , 11
Add r236 , r255
Add r236 , r235
Write r236 , r238
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r235 , 6
Set r234 , 11
Add r234 , r255
Add r234 , r235
Write r234 , r238
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r235 , 7
Set r236 , 11
Add r236 , r255
Add r236 , r235
Write r236 , r238
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r235 , 8
Set r234 , 11
Add r234 , r255
Add r234 , r235
Write r234 , r238
// write_register- end
//  write array length
Set r238 , 8
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r235 , 0
Set r236 , 11
Add r236 , r255
Add r236 , r235
Write r236 , r238
// write_register- end
// array_initialization- end
Set r238 , :static_declaration_end15
Jmp r238
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
Set r235 , 1
Add r254 , r235
// alloc_stack - end
Set r238 , :free_heap_blocks_linked_lists
// write_directly_to_reference_pointer - 234, input: r238
Set r234 , 20
Add r234 , r255
Write r234 , r238
// write_directly_to_reference_pointer - end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r233 , 0
Set r232 , 11
Add r232 , r255
Add r232 , r233
Read r236 , r232
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r233 , 0
Set r234 , 20
Add r234 , r255
Read r234 , r234
Set r232 , 0
Add r234 , r232
Add r234 , r233
Write r234 , r236
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r233 , 1
Set r232 , 11
Add r232 , r255
Add r232 , r233
Read r236 , r232
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r233 , 1
Set r234 , 20
Add r234 , r255
Read r234 , r234
Set r232 , 0
Add r234 , r232
Add r234 , r233
Write r234 , r236
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r233 , 2
Set r232 , 11
Add r232 , r255
Add r232 , r233
Read r236 , r232
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r233 , 2
Set r234 , 20
Add r234 , r255
Read r234 , r234
Set r232 , 0
Add r234 , r232
Add r234 , r233
Write r234 , r236
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r233 , 3
Set r232 , 11
Add r232 , r255
Add r232 , r233
Read r236 , r232
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r233 , 3
Set r234 , 20
Add r234 , r255
Read r234 , r234
Set r232 , 0
Add r234 , r232
Add r234 , r233
Write r234 , r236
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r233 , 4
Set r232 , 11
Add r232 , r255
Add r232 , r233
Read r236 , r232
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r233 , 4
Set r234 , 20
Add r234 , r255
Read r234 , r234
Set r232 , 0
Add r234 , r232
Add r234 , r233
Write r234 , r236
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r233 , 5
Set r232 , 11
Add r232 , r255
Add r232 , r233
Read r236 , r232
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r233 , 5
Set r234 , 20
Add r234 , r255
Read r234 , r234
Set r232 , 0
Add r234 , r232
Add r234 , r233
Write r234 , r236
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r233 , 6
Set r232 , 11
Add r232 , r255
Add r232 , r233
Read r236 , r232
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r233 , 6
Set r234 , 20
Add r234 , r255
Read r234 , r234
Set r232 , 0
Add r234 , r232
Add r234 , r233
Write r234 , r236
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r233 , 7
Set r232 , 11
Add r232 , r255
Add r232 , r233
Read r236 , r232
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r233 , 7
Set r234 , 20
Add r234 , r255
Read r234 , r234
Set r232 , 0
Add r234 , r232
Add r234 , r233
Write r234 , r236
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r233 , 8
Set r232 , 11
Add r232 , r255
Add r232 , r233
Read r236 , r232
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r233 , 8
Set r234 , 20
Add r234 , r255
Read r234 , r234
Set r232 , 0
Add r234 , r232
Add r234 , r233
Write r234 , r236
// write_register- end

// assign_new_variable
// direct_reference_access
// allocate_stack - current: 21 size: 1
Set r236 , 1
Add r254 , r236
// alloc_stack - end
// direct_reference_access - handle_inside_expr
// malloc
// malloc- input expr
// array_initialization
// allocate_stack - current: 22 size: 4
Set r234 , 4
Add r254 , r234
// alloc_stack - end
Set r238 , 0
// write_register- self: Data { stack_frame_offset: 22, size: 4, data_type: Array { inside: U32, len: 3 } }
Set r232 , 0
Set r231 , 22
Add r231 , r255
Add r231 , r232
Write r231 , r238
// write_register- end
// write_register- self: Data { stack_frame_offset: 22, size: 4, data_type: Array { inside: U32, len: 3 } }
Set r232 , 1
Set r233 , 22
Add r233 , r255
Add r233 , r232
Write r233 , r238
// write_register- end
// write_register- self: Data { stack_frame_offset: 22, size: 4, data_type: Array { inside: U32, len: 3 } }
Set r232 , 2
Set r231 , 22
Add r231 , r255
Add r231 , r232
Write r231 , r238
// write_register- end
// write_register- self: Data { stack_frame_offset: 22, size: 4, data_type: Array { inside: U32, len: 3 } }
Set r232 , 3
Set r233 , 22
Add r233 , r255
Add r233 , r232
Write r233 , r238
// write_register- end
//  write array length
Set r238 , 3
// write_register- self: Data { stack_frame_offset: 22, size: 4, data_type: Array { inside: U32, len: 3 } }
Set r232 , 0
Set r231 , 22
Add r231 , r255
Add r231 , r232
Write r231 , r238
// write_register- end
// array_initialization- end
// malloc- input expr end
// allocate_stack - current: 26 size: 1
Set r238 , 1
Add r254 , r238
// alloc_stack - end
Set r231 , 4
// write_register- self: Data { stack_frame_offset: 26, size: 1, data_type: U32 }
Set r233 , 0
Set r230 , 26
Add r230 , r255
Add r230 , r233
Write r230 , r231
// write_register- end
// call_function_code
// call_function_code - needed_stack: 4
// allocate_stack - current: 27 size: 4
Set r233 , 4
Add r254 , r233
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 26, size: 1, data_type: U32 }
Set r226 , 0
Set r225 , 26
Add r225 , r255
Add r225 , r226
Read r229 , r225
// read_register- end
Set r232 , 4294967294
Add r232 , r254
Write r232 , r229
Set r229 , :function-return16
Write r254 , r229
Set r232 , :function_core_allocate_4
Jmp r232
:function-return16
// function call output: Some(FunctionInputData { name: "core_allocate", data_type: U32, stack_frame_offset: -3 })
// function call converted output data : Some(Data { stack_frame_offset: 28, size: 1, data_type: U32 })
// read_register- self: Data { stack_frame_offset: 28, size: 1, data_type: U32 }
Set r232 , 0
Set r230 , 28
Add r230 , r255
Add r230 , r232
Read r228 , r230
// read_register- end
// write_directly_to_reference_pointer - 230, input: r228
Set r230 , 26
Add r230 , r255
Write r230 , r228
// write_directly_to_reference_pointer - end
// malloc- copy data
// read_register- self: Data { stack_frame_offset: 22, size: 4, data_type: Array { inside: U32, len: 3 } }
Set r229 , 0
Set r225 , 22
Add r225 , r255
Add r225 , r229
Read r230 , r225
// read_register- end
// write_register- self: Data { stack_frame_offset: 26, size: 4, data_type: Reference { inside: Array { inside: U32, len: 3 }, offset_of_data_from_reference_addr: 0 } }
Set r229 , 0
Set r232 , 26
Add r232 , r255
Read r232 , r232
Set r225 , 0
Add r232 , r225
Add r232 , r229
Write r232 , r230
// write_register- end
// read_register- self: Data { stack_frame_offset: 22, size: 4, data_type: Array { inside: U32, len: 3 } }
Set r229 , 1
Set r225 , 22
Add r225 , r255
Add r225 , r229
Read r230 , r225
// read_register- end
// write_register- self: Data { stack_frame_offset: 26, size: 4, data_type: Reference { inside: Array { inside: U32, len: 3 }, offset_of_data_from_reference_addr: 0 } }
Set r229 , 1
Set r232 , 26
Add r232 , r255
Read r232 , r232
Set r225 , 0
Add r232 , r225
Add r232 , r229
Write r232 , r230
// write_register- end
// read_register- self: Data { stack_frame_offset: 22, size: 4, data_type: Array { inside: U32, len: 3 } }
Set r229 , 2
Set r225 , 22
Add r225 , r255
Add r225 , r229
Read r230 , r225
// read_register- end
// write_register- self: Data { stack_frame_offset: 26, size: 4, data_type: Reference { inside: Array { inside: U32, len: 3 }, offset_of_data_from_reference_addr: 0 } }
Set r229 , 2
Set r232 , 26
Add r232 , r255
Read r232 , r232
Set r225 , 0
Add r232 , r225
Add r232 , r229
Write r232 , r230
// write_register- end
// read_register- self: Data { stack_frame_offset: 22, size: 4, data_type: Array { inside: U32, len: 3 } }
Set r229 , 3
Set r225 , 22
Add r225 , r255
Add r225 , r229
Read r230 , r225
// read_register- end
// write_register- self: Data { stack_frame_offset: 26, size: 4, data_type: Reference { inside: Array { inside: U32, len: 3 }, offset_of_data_from_reference_addr: 0 } }
Set r229 , 3
Set r232 , 26
Add r232 , r255
Read r232 , r232
Set r225 , 0
Add r232 , r225
Add r232 , r229
Write r232 , r230
// write_register- end
// malloc- end
// direct_reference_access - handle_inside_expr- end
// read_addr_of_last_reference_in_chain -output_register - r228
Set r228 , 26
Add r228 , r255
// read_addr_of_last_reference_in_chain 
// write_directly_to_reference_pointer - 230, input: r228
Set r230 , 21
Add r230 , r255
Write r230 , r228
// write_directly_to_reference_pointer - end
// direct_reference_accesss - end
// allocate_stack - current: 31 size: 1
Set r228 , 1
Add r254 , r228
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 21, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r232 , 0
Set r229 , 21
Add r229 , r255
Read r229 , r229
Set r231 , 0
Add r229 , r231
Add r229 , r232
Read r230 , r229
// read_register- end
// write_register- self: Data { stack_frame_offset: 31, size: 1, data_type: U32 }
Set r232 , 0
Set r231 , 31
Add r231 , r255
Add r231 , r232
Write r231 , r230
// write_register- end
// assign_new_variable - end

// assignment
// memory_access
// allocate_stack - current: 32 size: 1
Set r230 , 1
Add r254 , r230
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 31, size: 1, data_type: U32 }
Set r229 , 0
Set r225 , 31
Add r225 , r255
Add r225 , r229
Read r231 , r225
// read_register- end
// write_directly_to_reference_pointer - 229, input: r231
Set r229 , 32
Add r229 , r255
Write r229 , r231
// write_directly_to_reference_pointer - end
// memory_access- end
// allocate_stack - current: 33 size: 1
Set r225 , 1
Add r254 , r225
// alloc_stack - end
Set r231 , :function_timer_interrupt_2
// write_register- self: Data { stack_frame_offset: 33, size: 1, data_type: U32 }
Set r232 , 0
Set r226 , 33
Add r226 , r255
Add r226 , r232
Write r226 , r231
// write_register- end
// assignment data: Data { stack_frame_offset: 33, size: 1, data_type: U32 }
// assignment- variable.is_reference: true data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 33, size: 1, data_type: U32 }
Set r232 , 0
Set r229 , 33
Add r229 , r255
Add r229 , r232
Read r231 , r229
// read_register- end
// write_register- self: Data { stack_frame_offset: 32, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r232 , 0
Set r226 , 32
Add r226 , r255
Read r226 , r226
Set r229 , 0
Add r226 , r229
Add r226 , r232
Write r226 , r231
// write_register- end
// end assignment

// assignment
// memory_access
// allocate_stack - current: 34 size: 1
Set r231 , 1
Add r254 , r231
// alloc_stack - end
// handle_binary_expr
// handle number
Set r226 , 1
// allocate_stack - current: 35 size: 1
Set r232 , 1
Add r254 , r232
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 35, size: 1, data_type: U32 }
Set r227 , 0
Set r224 , 35
Add r224 , r255
Add r224 , r227
Write r224 , r226
// write_register- end
// handle number end
// allocate_stack - current: 36 size: 1
Set r223 , 1
Add r254 , r223
// alloc_stack - end
// handle_binary_expr - output_register- r224
// read_register- self: Data { stack_frame_offset: 31, size: 1, data_type: U32 }
Set r221 , 0
Set r220 , 31
Add r220 , r255
Add r220 , r221
Read r227 , r220
// read_register- end
// read_register- self: Data { stack_frame_offset: 35, size: 1, data_type: U32 }
Set r221 , 0
Set r222 , 35
Add r222 , r255
Add r222 , r221
Read r229 , r222
// read_register- end
Add r227 , r229
Cp r224 , r227
// write_register- self: Data { stack_frame_offset: 36, size: 1, data_type: U32 }
Set r221 , 0
Set r220 , 36
Add r220 , r255
Add r220 , r221
Write r220 , r224
// write_register- end
// handle_binary_expr - end
// read_register- self: Data { stack_frame_offset: 36, size: 1, data_type: U32 }
Set r227 , 0
Set r220 , 36
Add r220 , r255
Add r220 , r227
Read r224 , r220
// read_register- end
// write_directly_to_reference_pointer - 227, input: r224
Set r227 , 34
Add r227 , r255
Write r227 , r224
// write_directly_to_reference_pointer - end
// memory_access- end
// allocate_stack - current: 37 size: 1
Set r220 , 1
Add r254 , r220
// alloc_stack - end
Set r224 , :function_keyboard_interrupt_1
// write_register- self: Data { stack_frame_offset: 37, size: 1, data_type: U32 }
Set r229 , 0
Set r221 , 37
Add r221 , r255
Add r221 , r229
Write r221 , r224
// write_register- end
// assignment data: Data { stack_frame_offset: 37, size: 1, data_type: U32 }
// assignment- variable.is_reference: true data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 37, size: 1, data_type: U32 }
Set r229 , 0
Set r227 , 37
Add r227 , r255
Add r227 , r229
Read r224 , r227
// read_register- end
// write_register- self: Data { stack_frame_offset: 34, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r229 , 0
Set r221 , 34
Add r221 , r255
Read r221 , r221
Set r227 , 0
Add r221 , r227
Add r221 , r229
Write r221 , r224
// write_register- end
// end assignment

// read_register- self: Data { stack_frame_offset: 31, size: 1, data_type: U32 }
Set r229 , 0
Set r227 , 31
Add r227 , r255
Add r227 , r229
Read r224 , r227
// read_register- end
Idt r224

// allocate_stack - current: 38 size: 1
Set r224 , 1
Add r254 , r224
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 38, size: 1, data_type: U32 }
Set r229 , 0
Set r221 , 38
Add r221 , r255
Add r221 , r229
Write r221 , r254
// write_register- end
:while_start17
Set r227 , 1
// allocate_stack - current: 39 size: 1
Set r222 , 1
Add r254 , r222
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 39, size: 1, data_type: Bool }
Set r218 , 0
Set r217 , 39
Add r217 , r255
Add r217 , r218
Write r217 , r227
// write_register- end
// read_register- self: Data { stack_frame_offset: 39, size: 1, data_type: Bool }
Set r218 , 0
Set r219 , 39
Add r219 , r255
Add r219 , r218
Read r221 , r219
// read_register- end
Not r221
Set r229 , :while_end18
Jmpc r221 , r229
// while loop contents:
Halt

// while loop contents - end
Set r229 , :while_start17
Jmp r229
:while_end18
// read_register- self: Data { stack_frame_offset: 38, size: 1, data_type: U32 }
Set r218 , 0
Set r217 , 38
Add r217 , r255
Add r217 , r218
Read r254 , r217
// read_register- end
:function_keyboard_interrupt_1
Cp r229 , r255
Cp r255 , r254
// allocate_stack - current: 0 size: 1
Set r221 , 1
Add r254 , r221
// alloc_stack - end
// allocate_stack - current: 1 size: 1
Set r217 , 1
Add r254 , r217
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r219 , 0
Set r216 , 1
Add r216 , r255
Add r216 , r219
Write r216 , r229
// write_register- end
Set r216 , 0
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r215 , 0
Set r214 , 4294967294
Add r214 , r255
Add r214 , r215
Read r219 , r214
// read_register- end
Phrp r216 , r219

// Return
Cp r219 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r215 , 0
Set r218 , 1
Add r218 , r255
Add r218 , r215
Read r216 , r218
// read_register- end
Cp r255 , r216
Read r219 , r219
Iret r219
:function_timer_interrupt_2
Cp r229 , r255
Cp r255 , r254
// allocate_stack - current: 0 size: 1
Set r216 , 1
Add r254 , r216
// alloc_stack - end
// allocate_stack - current: 1 size: 1
Set r219 , 1
Add r254 , r219
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r215 , 0
Set r214 , 1
Add r214 , r255
Add r214 , r215
Write r214 , r229
// write_register- end
Set r214 , 0
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r213 , 0
Set r212 , 4294967294
Add r212 , r255
Add r212 , r213
Read r215 , r212
// read_register- end
Phrp r214 , r215

// Return
Cp r215 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r213 , 0
Set r218 , 1
Add r218 , r255
Add r218 , r213
Read r214 , r218
// read_register- end
Cp r255 , r214
Read r215 , r215
Iret r215
:function_core_deallocate_3
Cp r229 , r255
Cp r255 , r254
// allocate_stack - current: 0 size: 1
Set r214 , 1
Add r254 , r214
// alloc_stack - end
// allocate_stack - current: 1 size: 1
Set r215 , 1
Add r254 , r215
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r213 , 0
Set r212 , 1
Add r212 , r255
Add r212 , r213
Write r212 , r229
// write_register- end
// assign_new_variable
// call_function_code
// call_function_code - needed_stack: 4
// allocate_stack - current: 2 size: 4
Set r213 , 4
Add r254 , r213
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: -3, size: 1, data_type: U32 }
Set r208 , 0
Set r207 , 4294967293
Add r207 , r255
Add r207 , r208
Read r211 , r207
// read_register- end
Set r218 , 4294967294
Add r218 , r254
Write r218 , r211
Set r211 , :function-return19
Write r254 , r211
Set r218 , :function_ceil_log2_7
Jmp r218
:function-return19
// function call output: Some(FunctionInputData { name: "ceil_log2", data_type: U32, stack_frame_offset: -3 })
// function call converted output data : Some(Data { stack_frame_offset: 3, size: 1, data_type: U32 })
// assign_new_variable - end

// assign_new_variable
// access_static_variable
// allocate_stack - current: 6 size: 1
Set r210 , 1
Add r254 , r210
// alloc_stack - end
Set r211 , :min_heap_size_pow_2
// write_directly_to_reference_pointer - 218, input: r211
Set r218 , 6
Add r218 , r255
Write r218 , r211
// write_directly_to_reference_pointer - end
// access_static_variable-end
// assign_new_variable - end

// assign_new_variable
// handle_binary_expr
// call_function_code
// call_function_code - needed_stack: 5
// allocate_stack - current: 7 size: 5
Set r218 , 5
Add r254 , r218
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r206 , 0
Set r205 , 6
Add r205 , r255
Read r205 , r205
Set r209 , 0
Add r205 , r209
Add r205 , r206
Read r207 , r205
// read_register- end
Set r212 , 4294967294
Add r212 , r254
Write r212 , r207
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r206 , 0
Set r209 , 3
Add r209 , r255
Add r209 , r206
Read r207 , r209
// read_register- end
Set r212 , 4294967293
Add r212 , r254
Write r212 , r207
Set r207 , :function-return20
Write r254 , r207
Set r212 , :function_max_6
Jmp r212
:function-return20
// function call output: Some(FunctionInputData { name: "max", data_type: U32, stack_frame_offset: -4 })
// function call converted output data : Some(Data { stack_frame_offset: 8, size: 1, data_type: U32 })
// allocate_stack - current: 12 size: 1
Set r211 , 1
Add r254 , r211
// alloc_stack - end
// handle_binary_expr - output_register- r208
// read_register- self: Data { stack_frame_offset: 8, size: 1, data_type: U32 }
Set r206 , 0
Set r205 , 8
Add r205 , r255
Add r205 , r206
Read r207 , r205
// read_register- end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r206 , 0
Set r209 , 6
Add r209 , r255
Read r209 , r209
Set r205 , 0
Add r209 , r205
Add r209 , r206
Read r212 , r209
// read_register- end
Sub r207 , r212
Cp r208 , r207
// write_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r206 , 0
Set r205 , 12
Add r205 , r255
Add r205 , r206
Write r205 , r208
// write_register- end
// handle_binary_expr - end
// assign_new_variable - end

// assign_new_variable
// handle_binary_expr
// handle number
Set r208 , 2
// allocate_stack - current: 13 size: 1
Set r212 , 1
Add r254 , r212
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 13, size: 1, data_type: U32 }
Set r205 , 0
Set r206 , 13
Add r206 , r255
Add r206 , r205
Write r206 , r208
// write_register- end
// handle number end
// handle_binary_expr
// handle_binary_expr
// allocate_stack - current: 14 size: 1
Set r209 , 1
Add r254 , r209
// alloc_stack - end
// handle_binary_expr - output_register- r206
// read_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r203 , 0
Set r202 , 12
Add r202 , r255
Add r202 , r203
Read r205 , r202
// read_register- end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r203 , 0
Set r204 , 6
Add r204 , r255
Read r204 , r204
Set r202 , 0
Add r204 , r202
Add r204 , r203
Read r207 , r204
// read_register- end
Add r205 , r207
Cp r206 , r205
// write_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r203 , 0
Set r202 , 14
Add r202 , r255
Add r202 , r203
Write r202 , r206
// write_register- end
// handle_binary_expr - end
// handle number
Set r206 , 1
// allocate_stack - current: 15 size: 1
Set r207 , 1
Add r254 , r207
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 15, size: 1, data_type: U32 }
Set r202 , 0
Set r203 , 15
Add r203 , r255
Add r203 , r202
Write r203 , r206
// write_register- end
// handle number end
// allocate_stack - current: 16 size: 1
Set r204 , 1
Add r254 , r204
// alloc_stack - end
// handle_binary_expr - output_register- r203
// read_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r200 , 0
Set r199 , 14
Add r199 , r255
Add r199 , r200
Read r202 , r199
// read_register- end
// read_register- self: Data { stack_frame_offset: 15, size: 1, data_type: U32 }
Set r200 , 0
Set r201 , 15
Add r201 , r255
Add r201 , r200
Read r205 , r201
// read_register- end
Sub r202 , r205
Cp r203 , r202
// write_register- self: Data { stack_frame_offset: 16, size: 1, data_type: U32 }
Set r200 , 0
Set r199 , 16
Add r199 , r255
Add r199 , r200
Write r199 , r203
// write_register- end
// handle_binary_expr - end
// allocate_stack - current: 17 size: 1
Set r199 , 1
Add r254 , r199
// alloc_stack - end
// handle_binary_expr - output_register- r203
// read_register- self: Data { stack_frame_offset: 13, size: 1, data_type: U32 }
Set r201 , 0
Set r198 , 13
Add r198 , r255
Add r198 , r201
Read r205 , r198
// read_register- end
// read_register- self: Data { stack_frame_offset: 16, size: 1, data_type: U32 }
Set r201 , 0
Set r200 , 16
Add r200 , r255
Add r200 , r201
Read r202 , r200
// read_register- end
Shl r205 , r202
Cp r203 , r205
// write_register- self: Data { stack_frame_offset: 17, size: 1, data_type: U32 }
Set r201 , 0
Set r198 , 17
Add r198 , r255
Add r198 , r201
Write r198 , r203
// write_register- end
// handle_binary_expr - end
// assign_new_variable - end

// assign_new_variable
// access_static_variable
// allocate_stack - current: 18 size: 1
Set r203 , 1
Add r254 , r203
// alloc_stack - end
Set r202 , :free_heap_blocks_linked_lists
// write_directly_to_reference_pointer - 205, input: r202
Set r205 , 18
Add r205 , r255
Write r205 , r202
// write_directly_to_reference_pointer - end
// access_static_variable-end
// index_array
// index_array - var:Data { stack_frame_offset: 18, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
// allocate_stack - current: 19 size: 1
Set r202 , 1
Add r254 , r202
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r201 , 0
Set r200 , 12
Add r200 , r255
Add r200 , r201
Read r205 , r200
// read_register- end
Set r201 , 18
// array indexing- var_to_index.is_reference: true
Cp r198 , r205
Set r200 , 1
Mul r198 , r200
// add 1 offset to account for 1'st register holding size of array
Set r200 , 1
Add r198 , r200
// read_addr_of_register - self: Data { stack_frame_offset: 18, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r200 , 18
Add r200 , r255
Read r200 , r200
Set r197 , 0
Add r200 , r197
Add r200 , r198
// read_addr_of_register - end
// index_array: read_addr_of_register - end addr_register:200 , offset_register:198
// write_directly_to_reference_pointer - 197, input: r200
Set r197 , 19
Add r197 , r255
Write r197 , r200
// write_directly_to_reference_pointer - end
// index_array - end
// assign_new_variable - end

// assign_new_variable
// direct_reference_access
// allocate_stack - current: 20 size: 1
Set r201 , 1
Add r254 , r201
// alloc_stack - end
// direct_reference_access - handle_inside_expr
// direct_reference_access - handle_inside_expr- end
// read_addr_of_last_reference_in_chain -output_register - r198
Set r198 , 19
Add r198 , r255
Read r198 , r198
Set r200 , 0
Add r198 , r200
// read_addr_of_last_reference_in_chain 
// write_directly_to_reference_pointer - 200, input: r198
Set r200 , 20
Add r200 , r255
Write r200 , r198
// write_directly_to_reference_pointer - end
// direct_reference_accesss - end
// allocate_stack - current: 21 size: 1
Set r198 , 1
Add r254 , r198
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r197 , 0
Set r196 , 20
Add r196 , r255
Read r196 , r196
Set r205 , 0
Add r196 , r205
Add r196 , r197
Read r200 , r196
// read_register- end
// write_register- self: Data { stack_frame_offset: 21, size: 1, data_type: U32 }
Set r197 , 0
Set r205 , 21
Add r205 , r255
Add r205 , r197
Write r205 , r200
// write_register- end
// assign_new_variable - end

Set r200 , 0
// read_register- self: Data { stack_frame_offset: 21, size: 1, data_type: U32 }
Set r196 , 0
Set r195 , 21
Add r195 , r255
Add r195 , r196
Read r205 , r195
// read_register- end
Phrp r200 , r205

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
Set r205 , 1
Add r254 , r205
// alloc_stack - end
// assignment
// allocate_stack - current: 23 size: 1
Set r200 , 1
Add r254 , r200
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 21, size: 1, data_type: U32 }
Set r197 , 0
Set r194 , 21
Add r194 , r255
Add r194 , r197
Read r195 , r194
// read_register- end
// write_register- self: Data { stack_frame_offset: 23, size: 1, data_type: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 } }
Set r197 , 0
Set r196 , 23
Add r196 , r255
Read r196 , r196
Set r194 , 0
Add r196 , r194
Add r196 , r197
Write r196 , r195
// write_register- end
// assignment data: Data { stack_frame_offset: 23, size: 1, data_type: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 } }
// assignment- variable.is_reference: true data.is_reference: true 
// read_referenced_address
Set r195 , 23
Add r195 , r255
Read r195 , r195
Set r196 , 0
Add r195 , r196
// read_referenced_address - end
Set r197 , 22
Add r197 , r255
Write r197 , r195
// end assignment
// handle_struct_initialization end
// assign_new_variable - end

// assignment
// memory_access
// allocate_stack - current: 24 size: 1
Set r195 , 1
Add r254 , r195
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r194 , 0
Set r193 , 4294967294
Add r193 , r255
Add r193 , r194
Read r197 , r193
// read_register- end
// write_directly_to_reference_pointer - 194, input: r197
Set r194 , 24
Add r194 , r255
Write r194 , r197
// write_directly_to_reference_pointer - end
// memory_access- end
// assignment data: Data { stack_frame_offset: 21, size: 1, data_type: U32 }
// assignment- variable.is_reference: true data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 21, size: 1, data_type: U32 }
Set r194 , 0
Set r196 , 21
Add r196 , r255
Add r196 , r194
Read r193 , r196
// read_register- end
// write_register- self: Data { stack_frame_offset: 24, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r194 , 0
Set r197 , 24
Add r197 , r255
Read r197 , r197
Set r196 , 0
Add r197 , r196
Add r197 , r194
Write r197 , r193
// write_register- end
// end assignment

// assignment
// direct_reference_access
// allocate_stack - current: 25 size: 1
Set r193 , 1
Add r254 , r193
// alloc_stack - end
// direct_reference_access - handle_inside_expr
// access_static_variable
// allocate_stack - current: 26 size: 1
Set r197 , 1
Add r254 , r197
// alloc_stack - end
Set r194 , :free_heap_blocks_linked_lists
// write_directly_to_reference_pointer - 196, input: r194
Set r196 , 26
Add r196 , r255
Write r196 , r194
// write_directly_to_reference_pointer - end
// access_static_variable-end
// index_array
// index_array - var:Data { stack_frame_offset: 26, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
// allocate_stack - current: 27 size: 1
Set r194 , 1
Add r254 , r194
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r191 , 0
Set r190 , 12
Add r190 , r255
Add r190 , r191
Read r196 , r190
// read_register- end
Set r191 , 26
// array indexing- var_to_index.is_reference: true
Cp r192 , r196
Set r190 , 1
Mul r192 , r190
// add 1 offset to account for 1'st register holding size of array
Set r190 , 1
Add r192 , r190
// read_addr_of_register - self: Data { stack_frame_offset: 26, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r190 , 26
Add r190 , r255
Read r190 , r190
Set r189 , 0
Add r190 , r189
Add r190 , r192
// read_addr_of_register - end
// index_array: read_addr_of_register - end addr_register:190 , offset_register:192
// write_directly_to_reference_pointer - 189, input: r190
Set r189 , 27
Add r189 , r255
Write r189 , r190
// write_directly_to_reference_pointer - end
// index_array - end
// direct_reference_access - handle_inside_expr- end
// read_addr_of_last_reference_in_chain -output_register - r191
Set r191 , 27
Add r191 , r255
Read r191 , r191
Set r192 , 0
Add r191 , r192
// read_addr_of_last_reference_in_chain 
// write_directly_to_reference_pointer - 192, input: r191
Set r192 , 25
Add r192 , r255
Write r192 , r191
// write_directly_to_reference_pointer - end
// direct_reference_accesss - end
// assignment data: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
// assignment- variable.is_reference: true data.is_reference: false 
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r190 , 0
Set r196 , 4294967294
Add r196 , r255
Add r196 , r190
Read r191 , r196
// read_register- end
// write_register- self: Data { stack_frame_offset: 25, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r190 , 0
Set r192 , 25
Add r192 , r255
Read r192 , r192
Set r196 , 0
Add r192 , r196
Add r192 , r190
Write r192 , r191
// write_register- end
// end assignment

Set r191 , 0
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r196 , 0
Set r189 , 4294967294
Add r189 , r255
Add r189 , r196
Read r192 , r189
// read_register- end
Phrp r191 , r192

// Return

Cp r192 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r196 , 0
Set r190 , 1
Add r190 , r255
Add r190 , r196
Read r191 , r190
// read_register- end
Cp r255 , r191
Read r192 , r192
Jmp r192
:function_core_allocate_4
Cp r229 , r255
Cp r255 , r254
// allocate_stack - current: 0 size: 1
Set r191 , 1
Add r254 , r191
// alloc_stack - end
// allocate_stack - current: 1 size: 1
Set r192 , 1
Add r254 , r192
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r196 , 0
Set r189 , 1
Add r189 , r255
Add r189 , r196
Write r189 , r229
// write_register- end
// assign_new_variable
// call_function_code
// call_function_code - needed_stack: 4
// allocate_stack - current: 2 size: 4
Set r196 , 4
Add r254 , r196
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r185 , 0
Set r184 , 4294967294
Add r184 , r255
Add r184 , r185
Read r188 , r184
// read_register- end
Set r190 , 4294967294
Add r190 , r254
Write r190 , r188
Set r188 , :function-return21
Write r254 , r188
Set r190 , :function_ceil_log2_7
Jmp r190
:function-return21
// function call output: Some(FunctionInputData { name: "ceil_log2", data_type: U32, stack_frame_offset: -3 })
// function call converted output data : Some(Data { stack_frame_offset: 3, size: 1, data_type: U32 })
// assign_new_variable - end

// assign_new_variable
// access_static_variable
// allocate_stack - current: 6 size: 1
Set r187 , 1
Add r254 , r187
// alloc_stack - end
Set r188 , :min_heap_size_pow_2
// write_directly_to_reference_pointer - 190, input: r188
Set r190 , 6
Add r190 , r255
Write r190 , r188
// write_directly_to_reference_pointer - end
// access_static_variable-end
// assign_new_variable - end

// assign_new_variable
// access_static_variable
// allocate_stack - current: 7 size: 1
Set r188 , 1
Add r254 , r188
// alloc_stack - end
Set r190 , :max_heap_size_pow_2
// write_directly_to_reference_pointer - 189, input: r190
Set r189 , 7
Add r189 , r255
Write r189 , r190
// write_directly_to_reference_pointer - end
// access_static_variable-end
// assign_new_variable - end

// if- condition: Binary { left: Identifier("size_log2", DebugData { line: 42 }), operator: Token { kind: Greater, value: ">", line: 42 }, right: Identifier("max", DebugData { line: 42 }), debug_data: DebugData { line: 42 } }
// allocate_stack - current: 8 size: 1
Set r190 , 1
Add r254 , r190
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 8, size: 1, data_type: U32 }
Set r184 , 0
Set r185 , 8
Add r185 , r255
Add r185 , r184
Write r185 , r254
// write_register- end
// if condition data
// handle_binary_expr
// allocate_stack - current: 9 size: 1
Set r186 , 1
Add r254 , r186
// alloc_stack - end
// handle_binary_expr - output_register- r185
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r182 , 0
Set r181 , 3
Add r181 , r255
Add r181 , r182
Read r184 , r181
// read_register- end
// read_register- self: Data { stack_frame_offset: 7, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r182 , 0
Set r183 , 7
Add r183 , r255
Read r183 , r183
Set r181 , 0
Add r183 , r181
Add r183 , r182
Read r189 , r183
// read_register- end
Gt r184 , r189 , r185
// write_register- self: Data { stack_frame_offset: 9, size: 1, data_type: Bool }
Set r182 , 0
Set r181 , 9
Add r181 , r255
Add r181 , r182
Write r181 , r185
// write_register- end
// handle_binary_expr - end
// read condition
// read_register- self: Data { stack_frame_offset: 9, size: 1, data_type: Bool }
Set r184 , 0
Set r181 , 9
Add r181 , r255
Add r181 , r184
Read r185 , r181
// read_register- end
Not r185
Set r181 , :if23
Jmpc r185 , r181
// if contents
// allocate_stack - current: 10 size: 59
Set r189 , 59
Add r254 , r189
// alloc_stack - end
Set r184 , 58
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 0
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 116
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 1
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 114
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 2
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 105
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 3
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 101
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 4
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 100
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 5
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 32
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 6
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 116
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 7
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 111
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 8
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 32
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 9
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 97
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 10
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 108
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 11
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 108
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 12
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 111
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 13
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 99
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 14
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 97
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 15
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 116
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 16
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 101
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 17
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 32
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 18
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 109
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 19
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 101
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 20
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 109
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 21
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 111
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 22
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 114
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 23
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 121
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 24
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 32
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 25
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 119
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 26
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 105
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 27
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 116
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 28
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 104
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 29
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 32
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 30
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 115
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 31
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 105
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 32
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 122
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 33
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 101
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 34
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 32
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 35
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 116
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 36
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 104
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 37
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 97
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 38
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 116
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 39
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 32
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 40
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 101
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 41
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 120
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 42
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 99
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 43
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 101
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 44
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 101
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 45
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 100
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 46
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 101
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 47
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 100
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 48
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 32
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 49
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 109
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 50
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 97
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 51
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 120
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 52
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 32
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 53
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 108
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 54
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 105
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 55
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 109
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 56
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
Set r184 , 105
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 57
Set r182 , 10
Add r182 , r255
Add r182 , r183
Write r182 , r184
// write_register- end
Set r184 , 116
// write_register- self: Data { stack_frame_offset: 10, size: 59, data_type: Array { inside: Char, len: 58 } }
Set r183 , 58
Set r180 , 10
Add r180 , r255
Add r180 , r183
Write r180 , r184
// write_register- end
// call_function_code
// function.input.is_empty(), 0, 3
// call_function_code - needed_stack: 3
// allocate_stack - current: 69 size: 3
Set r183 , 3
Add r254 , r183
// alloc_stack - end
// call_function_code - handle reference variable
Set r182 , 4294967294
Add r182 , r254
// read_addr_of_self
Set r179 , 10
Add r179 , r255
// read_addr_of_self - end
Write r182 , r179
// call_function_code - handle reference variable, end
Set r179 , :function-return24
Write r254 , r179
Set r182 , :function_panic_9
Jmp r182
:function-return24
// function call output: None
// function call converted output data : None

Set r181 , :if_chain_end22
Jmp r181
// if contents end
:if23
// read_register- self: Data { stack_frame_offset: 8, size: 1, data_type: U32 }
Set r179 , 0
Set r182 , 8
Add r182 , r255
Add r182 , r179
Read r254 , r182
// read_register- end
:if_chain_end22
// assign_new_variable
// handle_binary_expr
// call_function_code
// call_function_code - needed_stack: 5
// allocate_stack - current: 9 size: 5
Set r185 , 5
Add r254 , r185
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r177 , 0
Set r176 , 6
Add r176 , r255
Read r176 , r176
Set r180 , 0
Add r176 , r180
Add r176 , r177
Read r179 , r176
// read_register- end
Set r182 , 4294967294
Add r182 , r254
Write r182 , r179
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r177 , 0
Set r180 , 3
Add r180 , r255
Add r180 , r177
Read r179 , r180
// read_register- end
Set r182 , 4294967293
Add r182 , r254
Write r182 , r179
Set r179 , :function-return25
Write r254 , r179
Set r182 , :function_max_6
Jmp r182
:function-return25
// function call output: Some(FunctionInputData { name: "max", data_type: U32, stack_frame_offset: -4 })
// function call converted output data : Some(Data { stack_frame_offset: 10, size: 1, data_type: U32 })
// allocate_stack - current: 14 size: 1
Set r181 , 1
Add r254 , r181
// alloc_stack - end
// handle_binary_expr - output_register- r178
// read_register- self: Data { stack_frame_offset: 10, size: 1, data_type: U32 }
Set r177 , 0
Set r176 , 10
Add r176 , r255
Add r176 , r177
Read r179 , r176
// read_register- end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r177 , 0
Set r180 , 6
Add r180 , r255
Read r180 , r180
Set r176 , 0
Add r180 , r176
Add r180 , r177
Read r182 , r180
// read_register- end
Sub r179 , r182
Cp r178 , r179
// write_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r177 , 0
Set r176 , 14
Add r176 , r255
Add r176 , r177
Write r176 , r178
// write_register- end
// handle_binary_expr - end
// assign_new_variable - end

// assign_new_variable
// access_static_variable
// allocate_stack - current: 15 size: 1
Set r178 , 1
Add r254 , r178
// alloc_stack - end
Set r182 , :free_heap_blocks_linked_lists
// write_directly_to_reference_pointer - 179, input: r182
Set r179 , 15
Add r179 , r255
Write r179 , r182
// write_directly_to_reference_pointer - end
// access_static_variable-end
// index_array
// index_array - var:Data { stack_frame_offset: 15, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
// allocate_stack - current: 16 size: 1
Set r182 , 1
Add r254 , r182
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r177 , 0
Set r180 , 14
Add r180 , r255
Add r180 , r177
Read r179 , r180
// read_register- end
Set r177 , 15
// array indexing- var_to_index.is_reference: true
Cp r176 , r179
Set r180 , 1
Mul r176 , r180
// add 1 offset to account for 1'st register holding size of array
Set r180 , 1
Add r176 , r180
// read_addr_of_register - self: Data { stack_frame_offset: 15, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r180 , 15
Add r180 , r255
Read r180 , r180
Set r175 , 0
Add r180 , r175
Add r180 , r176
// read_addr_of_register - end
// index_array: read_addr_of_register - end addr_register:180 , offset_register:176
// write_directly_to_reference_pointer - 175, input: r180
Set r175 , 16
Add r175 , r255
Write r175 , r180
// write_directly_to_reference_pointer - end
// index_array - end
// assign_new_variable - end

// assign_new_variable
// direct_reference_access
// allocate_stack - current: 17 size: 1
Set r177 , 1
Add r254 , r177
// alloc_stack - end
// direct_reference_access - handle_inside_expr
// direct_reference_access - handle_inside_expr- end
// read_addr_of_last_reference_in_chain -output_register - r176
Set r176 , 16
Add r176 , r255
Read r176 , r176
Set r180 , 0
Add r176 , r180
// read_addr_of_last_reference_in_chain 
// write_directly_to_reference_pointer - 180, input: r176
Set r180 , 17
Add r180 , r255
Write r180 , r176
// write_directly_to_reference_pointer - end
// direct_reference_accesss - end
// allocate_stack - current: 18 size: 1
Set r176 , 1
Add r254 , r176
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 17, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r175 , 0
Set r174 , 17
Add r174 , r255
Read r174 , r174
Set r179 , 0
Add r174 , r179
Add r174 , r175
Read r180 , r174
// read_register- end
// write_register- self: Data { stack_frame_offset: 18, size: 1, data_type: U32 }
Set r175 , 0
Set r179 , 18
Add r179 , r255
Add r179 , r175
Write r179 , r180
// write_register- end
// assign_new_variable - end

// if- condition: Binary { left: Identifier("addr", DebugData { line: 49 }), operator: Token { kind: Equals, value: "==", line: 49 }, right: Number(0, DebugData { line: 49 }), debug_data: DebugData { line: 49 } }
// allocate_stack - current: 19 size: 1
Set r180 , 1
Add r254 , r180
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 19, size: 1, data_type: U32 }
Set r175 , 0
Set r174 , 19
Add r174 , r255
Add r174 , r175
Write r174 , r254
// write_register- end
// if condition data
// handle_binary_expr
// handle number
Set r174 , 0
// allocate_stack - current: 20 size: 1
Set r175 , 1
Add r254 , r175
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: U32 }
Set r173 , 0
Set r172 , 20
Add r172 , r255
Add r172 , r173
Write r172 , r174
// write_register- end
// handle number end
// allocate_stack - current: 21 size: 1
Set r171 , 1
Add r254 , r171
// alloc_stack - end
// handle_binary_expr - output_register- r172
// read_register- self: Data { stack_frame_offset: 18, size: 1, data_type: U32 }
Set r169 , 0
Set r168 , 18
Add r168 , r255
Add r168 , r169
Read r173 , r168
// read_register- end
// read_register- self: Data { stack_frame_offset: 20, size: 1, data_type: U32 }
Set r169 , 0
Set r170 , 20
Add r170 , r255
Add r170 , r169
Read r179 , r170
// read_register- end
Eq r173 , r179 , r172
// write_register- self: Data { stack_frame_offset: 21, size: 1, data_type: Bool }
Set r169 , 0
Set r168 , 21
Add r168 , r255
Add r168 , r169
Write r168 , r172
// write_register- end
// handle_binary_expr - end
// read condition
// read_register- self: Data { stack_frame_offset: 21, size: 1, data_type: Bool }
Set r173 , 0
Set r168 , 21
Add r168 , r255
Add r168 , r173
Read r172 , r168
// read_register- end
Not r172
Set r168 , :if27
Jmpc r172 , r168
// if contents
// assignment
// call_function_code
// call_function_code - needed_stack: 4
// allocate_stack - current: 22 size: 4
Set r179 , 4
Add r254 , r179
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r165 , 0
Set r164 , 14
Add r164 , r255
Add r164 , r165
Read r170 , r164
// read_register- end
Set r169 , 4294967294
Add r169 , r254
Write r169 , r170
Set r170 , :function-return28
Write r254 , r170
Set r169 , :function_allocate_new_block_of_memory_from_main_pool_5
Jmp r169
:function-return28
// function call output: Some(FunctionInputData { name: "allocate_new_block_of_memory_from_main_pool", data_type: U32, stack_frame_offset: -3 })
// function call converted output data : Some(Data { stack_frame_offset: 23, size: 1, data_type: U32 })
// assignment data: Data { stack_frame_offset: 23, size: 1, data_type: U32 }
// assignment- variable.is_reference: false data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 23, size: 1, data_type: U32 }
Set r169 , 0
Set r173 , 23
Add r173 , r255
Add r173 , r169
Read r167 , r173
// read_register- end
// write_register- self: Data { stack_frame_offset: 18, size: 1, data_type: U32 }
Set r169 , 0
Set r170 , 18
Add r170 , r255
Add r170 , r169
Write r170 , r167
// write_register- end
// end assignment

Set r168 , :if_chain_end26
Jmp r168
// if contents end
:if27
// read_register- self: Data { stack_frame_offset: 19, size: 1, data_type: U32 }
Set r170 , 0
Set r169 , 19
Add r169 , r255
Add r169 , r170
Read r254 , r169
// read_register- end
// else - condition: None
// allocate_stack - current: 20 size: 1
Set r169 , 1
Add r254 , r169
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: U32 }
Set r167 , 0
Set r173 , 20
Add r173 , r255
Add r173 , r167
Write r173 , r254
// write_register- end
// else contents
// assign_new_variable
// memory_access
// allocate_stack - current: 21 size: 1
Set r170 , 1
Add r254 , r170
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 18, size: 1, data_type: U32 }
Set r166 , 0
Set r163 , 18
Add r163 , r255
Add r163 , r166
Read r164 , r163
// read_register- end
// write_directly_to_reference_pointer - 166, input: r164
Set r166 , 21
Add r166 , r255
Write r166 , r164
// write_directly_to_reference_pointer - end
// memory_access- end
// assign_new_variable - end

Set r163 , 0
// read_register- self: Data { stack_frame_offset: 21, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r165 , 0
Set r162 , 21
Add r162 , r255
Read r162 , r162
Set r166 , 0
Add r162 , r166
Add r162 , r165
Read r164 , r162
// read_register- end
Phrp r163 , r164

// assign_new_variable
// access_static_variable
// allocate_stack - current: 22 size: 1
Set r164 , 1
Add r254 , r164
// alloc_stack - end
Set r163 , :free_heap_blocks_linked_lists
// write_directly_to_reference_pointer - 162, input: r163
Set r162 , 22
Add r162 , r255
Write r162 , r163
// write_directly_to_reference_pointer - end
// access_static_variable-end
// index_array
// index_array - var:Data { stack_frame_offset: 22, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
// allocate_stack - current: 23 size: 1
Set r163 , 1
Add r254 , r163
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r166 , 0
Set r161 , 14
Add r161 , r255
Add r161 , r166
Read r162 , r161
// read_register- end
Set r166 , 22
// array indexing- var_to_index.is_reference: true
Cp r165 , r162
Set r161 , 1
Mul r165 , r161
// add 1 offset to account for 1'st register holding size of array
Set r161 , 1
Add r165 , r161
// read_addr_of_register - self: Data { stack_frame_offset: 22, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r161 , 22
Add r161 , r255
Read r161 , r161
Set r160 , 0
Add r161 , r160
Add r161 , r165
// read_addr_of_register - end
// index_array: read_addr_of_register - end addr_register:161 , offset_register:165
// write_directly_to_reference_pointer - 160, input: r161
Set r160 , 23
Add r160 , r255
Write r160 , r161
// write_directly_to_reference_pointer - end
// index_array - end
// assign_new_variable - end

// assignment
// access_static_variable
// allocate_stack - current: 24 size: 1
Set r166 , 1
Add r254 , r166
// alloc_stack - end
Set r165 , :free_heap_blocks_linked_lists
// write_directly_to_reference_pointer - 161, input: r165
Set r161 , 24
Add r161 , r255
Write r161 , r165
// write_directly_to_reference_pointer - end
// access_static_variable-end
// index_array
// index_array - var:Data { stack_frame_offset: 24, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
// allocate_stack - current: 25 size: 1
Set r165 , 1
Add r254 , r165
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r160 , 0
Set r159 , 14
Add r159 , r255
Add r159 , r160
Read r161 , r159
// read_register- end
Set r160 , 24
// array indexing- var_to_index.is_reference: true
Cp r162 , r161
Set r159 , 1
Mul r162 , r159
// add 1 offset to account for 1'st register holding size of array
Set r159 , 1
Add r162 , r159
// read_addr_of_register - self: Data { stack_frame_offset: 24, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r159 , 24
Add r159 , r255
Read r159 , r159
Set r158 , 0
Add r159 , r158
Add r159 , r162
// read_addr_of_register - end
// index_array: read_addr_of_register - end addr_register:159 , offset_register:162
// write_directly_to_reference_pointer - 158, input: r159
Set r158 , 25
Add r158 , r255
Write r158 , r159
// write_directly_to_reference_pointer - end
// index_array - end
// handle_struct_access- Data { stack_frame_offset: 16, size: 1, data_type: Reference { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, offset_of_data_from_reference_addr: 0 } } "HeapBlock"
Set r162 , 0
// read_addr_of_register - self: Data { stack_frame_offset: 16, size: 1, data_type: Reference { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, offset_of_data_from_reference_addr: 0 } }
Set r160 , 16
Add r160 , r255
Read r160 , r160
Set r159 , 0
Add r160 , r159
Read r160 , r160
Set r159 , 0
Add r160 , r159
Add r160 , r162
// read_addr_of_register - end
// allocate_stack - current: 26 size: 1
Set r159 , 1
Add r254 , r159
// alloc_stack - end
Set r162 , 26
Add r162 , r255
Write r162 , r160
// handle_struct_access- end
// assignment data: Data { stack_frame_offset: 26, size: 1, data_type: Reference { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, offset_of_data_from_reference_addr: 0 } }
// assignment- variable.is_reference: true data.is_reference: true 
// read_referenced_address
Set r162 , 26
Add r162 , r255
Read r162 , r162
Set r160 , 0
Add r162 , r160
// read_referenced_address - end
Read r162 , r162
Set r160 , 0
Add r162 , r160
// read_referenced_address - end
Set r161 , 25
Add r161 , r255
Read r161 , r161
Set r160 , 0
Add r161 , r160
Write r161 , r162
// end assignment

Set r173 , :if_chain_end26
Jmp r173
// else contents end
:else29
// read_register- self: Data { stack_frame_offset: 20, size: 1, data_type: U32 }
Set r161 , 0
Set r160 , 20
Add r160 , r255
Add r160 , r161
Read r254 , r160
// read_register- end
:if_chain_end26
Set r168 , 0
// read_register- self: Data { stack_frame_offset: 18, size: 1, data_type: U32 }
Set r173 , 0
Set r160 , 18
Add r160 , r255
Add r160 , r173
Read r172 , r160
// read_register- end
Phrp r168 , r172

// Return
Set r168 , 4294967293
// read_register- self: Data { stack_frame_offset: 18, size: 1, data_type: U32 }
Set r173 , 0
Set r167 , 18
Add r167 , r255
Add r167 , r173
Read r172 , r167
// read_register- end
Add r168 , r255
Write r168 , r172
Cp r172 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r173 , 0
Set r160 , 1
Add r160 , r255
Add r160 , r173
Read r168 , r160
// read_register- end
Cp r255 , r168
Read r172 , r172
Jmp r172

:function_allocate_new_block_of_memory_from_main_pool_5
Cp r229 , r255
Cp r255 , r254
// allocate_stack - current: 0 size: 1
Set r168 , 1
Add r254 , r168
// alloc_stack - end
// allocate_stack - current: 1 size: 1
Set r172 , 1
Add r254 , r172
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r173 , 0
Set r167 , 1
Add r167 , r255
Add r167 , r173
Write r167 , r229
// write_register- end
// assign_new_variable
// handle_binary_expr
// handle number
Set r167 , 2
// allocate_stack - current: 2 size: 1
Set r173 , 1
Add r254 , r173
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r161 , 0
Set r162 , 2
Add r162 , r255
Add r162 , r161
Write r162 , r167
// write_register- end
// handle number end
// handle_binary_expr
// handle_binary_expr
// access_static_variable
// allocate_stack - current: 3 size: 1
Set r162 , 1
Add r254 , r162
// alloc_stack - end
Set r161 , :min_heap_size_pow_2
// write_directly_to_reference_pointer - 160, input: r161
Set r160 , 3
Add r160 , r255
Write r160 , r161
// write_directly_to_reference_pointer - end
// access_static_variable-end
// allocate_stack - current: 4 size: 1
Set r157 , 1
Add r254 , r157
// alloc_stack - end
// handle_binary_expr - output_register- r161
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r155 , 0
Set r154 , 4294967294
Add r154 , r255
Add r154 , r155
Read r160 , r154
// read_register- end
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r155 , 0
Set r156 , 3
Add r156 , r255
Read r156 , r156
Set r154 , 0
Add r156 , r154
Add r156 , r155
Read r158 , r156
// read_register- end
Add r160 , r158
Cp r161 , r160
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r155 , 0
Set r154 , 4
Add r154 , r255
Add r154 , r155
Write r154 , r161
// write_register- end
// handle_binary_expr - end
// handle number
Set r161 , 1
// allocate_stack - current: 5 size: 1
Set r158 , 1
Add r254 , r158
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r154 , 0
Set r155 , 5
Add r155 , r255
Add r155 , r154
Write r155 , r161
// write_register- end
// handle number end
// allocate_stack - current: 6 size: 1
Set r156 , 1
Add r254 , r156
// alloc_stack - end
// handle_binary_expr - output_register- r155
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r152 , 0
Set r151 , 4
Add r151 , r255
Add r151 , r152
Read r154 , r151
// read_register- end
// read_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r152 , 0
Set r153 , 5
Add r153 , r255
Add r153 , r152
Read r160 , r153
// read_register- end
Sub r154 , r160
Cp r155 , r154
// write_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r152 , 0
Set r151 , 6
Add r151 , r255
Add r151 , r152
Write r151 , r155
// write_register- end
// handle_binary_expr - end
// allocate_stack - current: 7 size: 1
Set r151 , 1
Add r254 , r151
// alloc_stack - end
// handle_binary_expr - output_register- r155
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r153 , 0
Set r150 , 2
Add r150 , r255
Add r150 , r153
Read r160 , r150
// read_register- end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r153 , 0
Set r152 , 6
Add r152 , r255
Add r152 , r153
Read r154 , r152
// read_register- end
Shl r160 , r154
Cp r155 , r160
// write_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r153 , 0
Set r150 , 7
Add r150 , r255
Add r150 , r153
Write r150 , r155
// write_register- end
// handle_binary_expr - end
// assign_new_variable - end

// assign_new_variable
// access_static_variable
// allocate_stack - current: 8 size: 1
Set r155 , 1
Add r254 , r155
// alloc_stack - end
Set r154 , :heap_main_pool_head
// write_directly_to_reference_pointer - 160, input: r154
Set r160 , 8
Add r160 , r255
Write r160 , r154
// write_directly_to_reference_pointer - end
// access_static_variable-end
// assign_new_variable - end

// assign_new_variable
// allocate_stack - current: 9 size: 1
Set r154 , 1
Add r254 , r154
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 8, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r153 , 0
Set r152 , 8
Add r152 , r255
Read r152 , r152
Set r150 , 0
Add r152 , r150
Add r152 , r153
Read r160 , r152
// read_register- end
// write_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r153 , 0
Set r150 , 9
Add r150 , r255
Add r150 , r153
Write r150 , r160
// write_register- end
// assign_new_variable - end

// assignment
// access_static_variable
// allocate_stack - current: 10 size: 1
Set r160 , 1
Add r254 , r160
// alloc_stack - end
Set r150 , :heap_main_pool_head
// write_directly_to_reference_pointer - 153, input: r150
Set r153 , 10
Add r153 , r255
Write r153 , r150
// write_directly_to_reference_pointer - end
// access_static_variable-end
// handle_binary_expr
// access_static_variable
// allocate_stack - current: 11 size: 1
Set r150 , 1
Add r254 , r150
// alloc_stack - end
Set r153 , :heap_main_pool_head
// write_directly_to_reference_pointer - 152, input: r153
Set r152 , 11
Add r152 , r255
Write r152 , r153
// write_directly_to_reference_pointer - end
// access_static_variable-end
// allocate_stack - current: 12 size: 1
Set r153 , 1
Add r254 , r153
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r148 , 0
Set r147 , 7
Add r147 , r255
Add r147 , r148
Read r152 , r147
// read_register- end
// write_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r148 , 0
Set r149 , 12
Add r149 , r255
Add r149 , r148
Write r149 , r152
// write_register- end
// allocate_stack - current: 13 size: 1
Set r147 , 1
Add r254 , r147
// alloc_stack - end
// handle_binary_expr - output_register- r152
// read_register- self: Data { stack_frame_offset: 11, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r145 , 0
Set r144 , 11
Add r144 , r255
Read r144 , r144
Set r146 , 0
Add r144 , r146
Add r144 , r145
Read r149 , r144
// read_register- end
// read_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r145 , 0
Set r146 , 12
Add r146 , r255
Add r146 , r145
Read r148 , r146
// read_register- end
Add r149 , r148
Cp r152 , r149
// write_register- self: Data { stack_frame_offset: 13, size: 1, data_type: U32 }
Set r145 , 0
Set r144 , 13
Add r144 , r255
Add r144 , r145
Write r144 , r152
// write_register- end
// handle_binary_expr - end
// assignment data: Data { stack_frame_offset: 13, size: 1, data_type: U32 }
// assignment- variable.is_reference: true data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 13, size: 1, data_type: U32 }
Set r149 , 0
Set r144 , 13
Add r144 , r255
Add r144 , r149
Read r152 , r144
// read_register- end
// write_register- self: Data { stack_frame_offset: 10, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r149 , 0
Set r148 , 10
Add r148 , r255
Read r148 , r148
Set r144 , 0
Add r148 , r144
Add r148 , r149
Write r148 , r152
// write_register- end
// end assignment

// if- condition: Binary { left: Identifier("heap_pool_head", DebugData { line: 69 }), operator: Token { kind: Greater, value: ">", line: 69 }, right: FunctionCall { left: Identifier("access_static", DebugData { line: 69 }), values: [String("\"heap_end", DebugData { line: 69 })], debug_data: DebugData { line: 69 } }, debug_data: DebugData { line: 69 } }
// allocate_stack - current: 14 size: 1
Set r152 , 1
Add r254 , r152
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r149 , 0
Set r144 , 14
Add r144 , r255
Add r144 , r149
Write r144 , r254
// write_register- end
// if condition data
// handle_binary_expr
// access_static_variable
// allocate_stack - current: 15 size: 1
Set r144 , 1
Add r254 , r144
// alloc_stack - end
Set r149 , :heap_end
// write_directly_to_reference_pointer - 148, input: r149
Set r148 , 15
Add r148 , r255
Write r148 , r149
// write_directly_to_reference_pointer - end
// access_static_variable-end
// allocate_stack - current: 16 size: 1
Set r146 , 1
Add r254 , r146
// alloc_stack - end
// handle_binary_expr - output_register- r149
// read_register- self: Data { stack_frame_offset: 8, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r142 , 0
Set r141 , 8
Add r141 , r255
Read r141 , r141
Set r143 , 0
Add r141 , r143
Add r141 , r142
Read r148 , r141
// read_register- end
// read_register- self: Data { stack_frame_offset: 15, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r142 , 0
Set r143 , 15
Add r143 , r255
Read r143 , r143
Set r141 , 0
Add r143 , r141
Add r143 , r142
Read r145 , r143
// read_register- end
Gt r148 , r145 , r149
// write_register- self: Data { stack_frame_offset: 16, size: 1, data_type: Bool }
Set r142 , 0
Set r141 , 16
Add r141 , r255
Add r141 , r142
Write r141 , r149
// write_register- end
// handle_binary_expr - end
// read condition
// read_register- self: Data { stack_frame_offset: 16, size: 1, data_type: Bool }
Set r148 , 0
Set r141 , 16
Add r141 , r255
Add r141 , r148
Read r149 , r141
// read_register- end
Not r149
Set r141 , :if31
Jmpc r149 , r141
// if contents
// allocate_stack - current: 17 size: 38
Set r145 , 38
Add r254 , r145
// alloc_stack - end
Set r148 , 37
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 0
Set r140 , 17
Add r140 , r255
Add r140 , r143
Write r140 , r148
// write_register- end
Set r148 , 97
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 1
Set r142 , 17
Add r142 , r255
Add r142 , r143
Write r142 , r148
// write_register- end
Set r148 , 112
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 2
Set r140 , 17
Add r140 , r255
Add r140 , r143
Write r140 , r148
// write_register- end
Set r148 , 112
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 3
Set r142 , 17
Add r142 , r255
Add r142 , r143
Write r142 , r148
// write_register- end
Set r148 , 108
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 4
Set r140 , 17
Add r140 , r255
Add r140 , r143
Write r140 , r148
// write_register- end
Set r148 , 105
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 5
Set r142 , 17
Add r142 , r255
Add r142 , r143
Write r142 , r148
// write_register- end
Set r148 , 99
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 6
Set r140 , 17
Add r140 , r255
Add r140 , r143
Write r140 , r148
// write_register- end
Set r148 , 97
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 7
Set r142 , 17
Add r142 , r255
Add r142 , r143
Write r142 , r148
// write_register- end
Set r148 , 116
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 8
Set r140 , 17
Add r140 , r255
Add r140 , r143
Write r140 , r148
// write_register- end
Set r148 , 105
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 9
Set r142 , 17
Add r142 , r255
Add r142 , r143
Write r142 , r148
// write_register- end
Set r148 , 111
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 10
Set r140 , 17
Add r140 , r255
Add r140 , r143
Write r140 , r148
// write_register- end
Set r148 , 110
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 11
Set r142 , 17
Add r142 , r255
Add r142 , r143
Write r142 , r148
// write_register- end
Set r148 , 32
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 12
Set r140 , 17
Add r140 , r255
Add r140 , r143
Write r140 , r148
// write_register- end
Set r148 , 104
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 13
Set r142 , 17
Add r142 , r255
Add r142 , r143
Write r142 , r148
// write_register- end
Set r148 , 97
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 14
Set r140 , 17
Add r140 , r255
Add r140 , r143
Write r140 , r148
// write_register- end
Set r148 , 115
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 15
Set r142 , 17
Add r142 , r255
Add r142 , r143
Write r142 , r148
// write_register- end
Set r148 , 32
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 16
Set r140 , 17
Add r140 , r255
Add r140 , r143
Write r140 , r148
// write_register- end
Set r148 , 111
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 17
Set r142 , 17
Add r142 , r255
Add r142 , r143
Write r142 , r148
// write_register- end
Set r148 , 118
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 18
Set r140 , 17
Add r140 , r255
Add r140 , r143
Write r140 , r148
// write_register- end
Set r148 , 101
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 19
Set r142 , 17
Add r142 , r255
Add r142 , r143
Write r142 , r148
// write_register- end
Set r148 , 114
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 20
Set r140 , 17
Add r140 , r255
Add r140 , r143
Write r140 , r148
// write_register- end
Set r148 , 102
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 21
Set r142 , 17
Add r142 , r255
Add r142 , r143
Write r142 , r148
// write_register- end
Set r148 , 108
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 22
Set r140 , 17
Add r140 , r255
Add r140 , r143
Write r140 , r148
// write_register- end
Set r148 , 111
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 23
Set r142 , 17
Add r142 , r255
Add r142 , r143
Write r142 , r148
// write_register- end
Set r148 , 119
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 24
Set r140 , 17
Add r140 , r255
Add r140 , r143
Write r140 , r148
// write_register- end
Set r148 , 101
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 25
Set r142 , 17
Add r142 , r255
Add r142 , r143
Write r142 , r148
// write_register- end
Set r148 , 100
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 26
Set r140 , 17
Add r140 , r255
Add r140 , r143
Write r140 , r148
// write_register- end
Set r148 , 32
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 27
Set r142 , 17
Add r142 , r255
Add r142 , r143
Write r142 , r148
// write_register- end
Set r148 , 105
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 28
Set r140 , 17
Add r140 , r255
Add r140 , r143
Write r140 , r148
// write_register- end
Set r148 , 116
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 29
Set r142 , 17
Add r142 , r255
Add r142 , r143
Write r142 , r148
// write_register- end
Set r148 , 39
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 30
Set r140 , 17
Add r140 , r255
Add r140 , r143
Write r140 , r148
// write_register- end
Set r148 , 115
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 31
Set r142 , 17
Add r142 , r255
Add r142 , r143
Write r142 , r148
// write_register- end
Set r148 , 32
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 32
Set r140 , 17
Add r140 , r255
Add r140 , r143
Write r140 , r148
// write_register- end
Set r148 , 104
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 33
Set r142 , 17
Add r142 , r255
Add r142 , r143
Write r142 , r148
// write_register- end
Set r148 , 101
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 34
Set r140 , 17
Add r140 , r255
Add r140 , r143
Write r140 , r148
// write_register- end
Set r148 , 97
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 35
Set r142 , 17
Add r142 , r255
Add r142 , r143
Write r142 , r148
// write_register- end
Set r148 , 112
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 36
Set r140 , 17
Add r140 , r255
Add r140 , r143
Write r140 , r148
// write_register- end
Set r148 , 33
// write_register- self: Data { stack_frame_offset: 17, size: 38, data_type: Array { inside: Char, len: 37 } }
Set r143 , 37
Set r142 , 17
Add r142 , r255
Add r142 , r143
Write r142 , r148
// write_register- end
// call_function_code
// function.input.is_empty(), 0, 3
// call_function_code - needed_stack: 3
// allocate_stack - current: 55 size: 3
Set r143 , 3
Add r254 , r143
// alloc_stack - end
// call_function_code - handle reference variable
Set r140 , 4294967294
Add r140 , r254
// read_addr_of_self
Set r139 , 17
Add r139 , r255
// read_addr_of_self - end
Write r140 , r139
// call_function_code - handle reference variable, end
Set r139 , :function-return32
Write r254 , r139
Set r140 , :function_panic_9
Jmp r140
:function-return32
// function call output: None
// function call converted output data : None

Set r141 , :if_chain_end30
Jmp r141
// if contents end
:if31
// read_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r139 , 0
Set r140 , 14
Add r140 , r255
Add r140 , r139
Read r254 , r140
// read_register- end
:if_chain_end30
// Return
Set r149 , 4294967293
// read_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r139 , 0
Set r138 , 9
Add r138 , r255
Add r138 , r139
Read r141 , r138
// read_register- end
Add r149 , r255
Write r149 , r141
Cp r141 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r139 , 0
Set r140 , 1
Add r140 , r255
Add r140 , r139
Read r149 , r140
// read_register- end
Cp r255 , r149
Read r141 , r141
Jmp r141

:function_max_6
Cp r229 , r255
Cp r255 , r254
// allocate_stack - current: 0 size: 1
Set r149 , 1
Add r254 , r149
// alloc_stack - end
// allocate_stack - current: 1 size: 1
Set r141 , 1
Add r254 , r141
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r139 , 0
Set r138 , 1
Add r138 , r255
Add r138 , r139
Write r138 , r229
// write_register- end
// assign_new_variable
// handle_binary_expr
// allocate_stack - current: 2 size: 1
Set r136 , 1
Add r254 , r136
// alloc_stack - end
// handle_binary_expr - output_register- r140
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r134 , 0
Set r133 , 4294967294
Add r133 , r255
Add r133 , r134
Read r142 , r133
// read_register- end
// read_register- self: Data { stack_frame_offset: -3, size: 1, data_type: U32 }
Set r134 , 0
Set r135 , 4294967293
Add r135 , r255
Add r135 , r134
Read r137 , r135
// read_register- end
Gt r142 , r137 , r140
// write_register- self: Data { stack_frame_offset: 2, size: 1, data_type: Bool }
Set r134 , 0
Set r133 , 2
Add r133 , r255
Add r133 , r134
Write r133 , r140
// write_register- end
// handle_binary_expr - end
// allocate_stack - current: 3 size: 1
Set r140 , 1
Add r254 , r140
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: Bool }
Set r133 , 0
Set r134 , 2
Add r134 , r255
Add r134 , r133
Read r137 , r134
// read_register- end
// write_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r133 , 0
Set r142 , 3
Add r142 , r255
Add r142 , r133
Write r142 , r137
// write_register- end
// allocate_stack - current: 4 size: 1
Set r137 , 1
Add r254 , r137
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r133 , 0
Set r134 , 3
Add r134 , r255
Add r134 , r133
Read r138 , r134
// read_register- end
Not r138
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r133 , 0
Set r142 , 4
Add r142 , r255
Add r142 , r133
Write r142 , r138
// write_register- end
// handle_binary_expr - end
// assign_new_variable - end

// Return
// handle_binary_expr
// handle_binary_expr
// allocate_stack - current: 5 size: 1
Set r142 , 1
Add r254 , r142
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r134 , 0
Set r135 , 4
Add r135 , r255
Add r135 , r134
Read r139 , r135
// read_register- end
Not r139
// write_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r134 , 0
Set r133 , 5
Add r133 , r255
Add r133 , r134
Write r133 , r139
// write_register- end
// handle_binary_expr - end
// allocate_stack - current: 6 size: 1
Set r134 , 1
Add r254 , r134
// alloc_stack - end
// handle_binary_expr - output_register- r138
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r132 , 0
Set r131 , 4294967294
Add r131 , r255
Add r131 , r132
Read r139 , r131
// read_register- end
// read_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r132 , 0
Set r135 , 5
Add r135 , r255
Add r135 , r132
Read r133 , r135
// read_register- end
And r139 , r133
Cp r138 , r139
// write_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r132 , 0
Set r131 , 6
Add r131 , r255
Add r131 , r132
Write r131 , r138
// write_register- end
// handle_binary_expr - end
// handle_binary_expr
// allocate_stack - current: 7 size: 1
Set r131 , 1
Add r254 , r131
// alloc_stack - end
// handle_binary_expr - output_register- r138
// read_register- self: Data { stack_frame_offset: -3, size: 1, data_type: U32 }
Set r135 , 0
Set r130 , 4294967293
Add r130 , r255
Add r130 , r135
Read r133 , r130
// read_register- end
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r135 , 0
Set r132 , 4
Add r132 , r255
Add r132 , r135
Read r139 , r132
// read_register- end
And r133 , r139
Cp r138 , r133
// write_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r135 , 0
Set r130 , 7
Add r130 , r255
Add r130 , r135
Write r130 , r138
// write_register- end
// handle_binary_expr - end
// allocate_stack - current: 8 size: 1
Set r130 , 1
Add r254 , r130
// alloc_stack - end
// handle_binary_expr - output_register- r138
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r132 , 0
Set r129 , 6
Add r129 , r255
Add r129 , r132
Read r139 , r129
// read_register- end
// read_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r132 , 0
Set r135 , 7
Add r135 , r255
Add r135 , r132
Read r133 , r135
// read_register- end
Or r139 , r133
Cp r138 , r139
// write_register- self: Data { stack_frame_offset: 8, size: 1, data_type: U32 }
Set r132 , 0
Set r129 , 8
Add r129 , r255
Add r129 , r132
Write r129 , r138
// write_register- end
// handle_binary_expr - end
Set r133 , 4294967292
// read_register- self: Data { stack_frame_offset: 8, size: 1, data_type: U32 }
Set r129 , 0
Set r132 , 8
Add r132 , r255
Add r132 , r129
Read r138 , r132
// read_register- end
Add r133 , r255
Write r133 , r138
Cp r138 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r129 , 0
Set r139 , 1
Add r139 , r255
Add r139 , r129
Read r133 , r139
// read_register- end
Cp r255 , r133
Read r138 , r138
Jmp r138

:function_ceil_log2_7
Cp r229 , r255
Cp r255 , r254
// allocate_stack - current: 0 size: 1
Set r133 , 1
Add r254 , r133
// alloc_stack - end
// allocate_stack - current: 1 size: 1
Set r138 , 1
Add r254 , r138
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r129 , 0
Set r132 , 1
Add r132 , r255
Add r132 , r129
Write r132 , r229
// write_register- end
// assign_new_variable
// handle number
Set r132 , 0
// allocate_stack - current: 2 size: 1
Set r129 , 1
Add r254 , r129
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r135 , 0
Set r128 , 2
Add r128 , r255
Add r128 , r135
Write r128 , r132
// write_register- end
// handle number end
// assign_new_variable - end

// assign_new_variable
// handle number
Set r128 , 1
// allocate_stack - current: 3 size: 1
Set r135 , 1
Add r254 , r135
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r127 , 0
Set r126 , 3
Add r126 , r255
Add r126 , r127
Write r126 , r128
// write_register- end
// handle number end
// assign_new_variable - end

// allocate_stack - current: 4 size: 1
Set r126 , 1
Add r254 , r126
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r139 , 0
Set r125 , 4
Add r125 , r255
Add r125 , r139
Write r125 , r254
// write_register- end
:while_start33
// handle_binary_expr
// allocate_stack - current: 5 size: 1
Set r122 , 1
Add r254 , r122
// alloc_stack - end
// handle_binary_expr - output_register- r127
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r120 , 0
Set r119 , 3
Add r119 , r255
Add r119 , r120
Read r124 , r119
// read_register- end
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r120 , 0
Set r121 , 4294967294
Add r121 , r255
Add r121 , r120
Read r123 , r121
// read_register- end
Lt r124 , r123 , r127
// write_register- self: Data { stack_frame_offset: 5, size: 1, data_type: Bool }
Set r120 , 0
Set r119 , 5
Add r119 , r255
Add r119 , r120
Write r119 , r127
// write_register- end
// handle_binary_expr - end
// read_register- self: Data { stack_frame_offset: 5, size: 1, data_type: Bool }
Set r123 , 0
Set r124 , 5
Add r124 , r255
Add r124 , r123
Read r125 , r124
// read_register- end
Not r125
Set r139 , :while_end34
Jmpc r125 , r139
// while loop contents:
// assignment
// handle_binary_expr
// handle number
Set r124 , 1
// allocate_stack - current: 6 size: 1
Set r123 , 1
Add r254 , r123
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r119 , 0
Set r120 , 6
Add r120 , r255
Add r120 , r119
Write r120 , r124
// write_register- end
// handle number end
// allocate_stack - current: 7 size: 1
Set r121 , 1
Add r254 , r121
// alloc_stack - end
// handle_binary_expr - output_register- r120
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r117 , 0
Set r116 , 3
Add r116 , r255
Add r116 , r117
Read r119 , r116
// read_register- end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r117 , 0
Set r118 , 6
Add r118 , r255
Add r118 , r117
Read r127 , r118
// read_register- end
Shl r119 , r127
Cp r120 , r119
// write_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r117 , 0
Set r116 , 7
Add r116 , r255
Add r116 , r117
Write r116 , r120
// write_register- end
// handle_binary_expr - end
// assignment data: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
// assignment- variable.is_reference: false data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r119 , 0
Set r116 , 7
Add r116 , r255
Add r116 , r119
Read r120 , r116
// read_register- end
// write_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r119 , 0
Set r127 , 3
Add r127 , r255
Add r127 , r119
Write r127 , r120
// write_register- end
// end assignment

// assignment
// handle_binary_expr
// handle number
Set r120 , 1
// allocate_stack - current: 8 size: 1
Set r127 , 1
Add r254 , r127
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 8, size: 1, data_type: U32 }
Set r116 , 0
Set r117 , 8
Add r117 , r255
Add r117 , r116
Write r117 , r120
// write_register- end
// handle number end
// allocate_stack - current: 9 size: 1
Set r118 , 1
Add r254 , r118
// alloc_stack - end
// handle_binary_expr - output_register- r117
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r114 , 0
Set r113 , 2
Add r113 , r255
Add r113 , r114
Read r116 , r113
// read_register- end
// read_register- self: Data { stack_frame_offset: 8, size: 1, data_type: U32 }
Set r114 , 0
Set r115 , 8
Add r115 , r255
Add r115 , r114
Read r119 , r115
// read_register- end
Add r116 , r119
Cp r117 , r116
// write_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r114 , 0
Set r113 , 9
Add r113 , r255
Add r113 , r114
Write r113 , r117
// write_register- end
// handle_binary_expr - end
// assignment data: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
// assignment- variable.is_reference: false data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r116 , 0
Set r113 , 9
Add r113 , r255
Add r113 , r116
Read r117 , r113
// read_register- end
// write_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r116 , 0
Set r119 , 2
Add r119 , r255
Add r119 , r116
Write r119 , r117
// write_register- end
// end assignment

// while loop contents - end
Set r139 , :while_start33
Jmp r139
:while_end34
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r119 , 0
Set r116 , 4
Add r116 , r255
Add r116 , r119
Read r254 , r116
// read_register- end
// Return
Set r125 , 4294967293
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r119 , 0
Set r117 , 2
Add r117 , r255
Add r117 , r119
Read r139 , r117
// read_register- end
Add r125 , r255
Write r125 , r139
Cp r139 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r119 , 0
Set r116 , 1
Add r116 , r255
Add r116 , r119
Read r125 , r116
// read_register- end
Cp r255 , r125
Read r139 , r139
Jmp r139

:function_print_8
Cp r229 , r255
Cp r255 , r254
// allocate_stack - current: 0 size: 1
Set r125 , 1
Add r254 , r125
// alloc_stack - end
// allocate_stack - current: 1 size: 1
Set r139 , 1
Add r254 , r139
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r119 , 0
Set r117 , 1
Add r117 , r255
Add r117 , r119
Write r117 , r229
// write_register- end
// assign_new_variable
// allocate_stack - current: 2 size: 1
Set r117 , 1
Add r254 , r117
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: Reference { inside: Array { inside: U32, len: 0 }, offset_of_data_from_reference_addr: 0 } }
Set r113 , 0
Set r114 , 4294967294
Add r114 , r255
Read r114 , r114
Set r116 , 0
Add r114 , r116
Add r114 , r113
Read r119 , r114
// read_register- end
// write_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r113 , 0
Set r116 , 2
Add r116 , r255
Add r116 , r113
Write r116 , r119
// write_register- end
// assign_new_variable - end

// allocate_stack - current: 3 size: 1
Set r116 , 1
Add r254 , r116
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r114 , 0
Set r115 , 3
Add r115 , r255
Add r115 , r114
Write r115 , r254
// write_register- end
// allocate_stack - current: 4 size: 1
Set r111 , 1
Add r254 , r111
// alloc_stack - end
// handle number
Set r110 , 0
// allocate_stack - current: 5 size: 1
Set r109 , 1
Add r254 , r109
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r107 , 0
Set r106 , 5
Add r106 , r255
Add r106 , r107
Write r106 , r110
// write_register- end
// handle number end
// read_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r107 , 0
Set r108 , 5
Add r108 , r255
Add r108 , r107
Read r114 , r108
// read_register- end
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r107 , 0
Set r106 , 2
Add r106 , r255
Add r106 , r107
Read r112 , r106
// read_register- end
Set r115 , 1
Sub r114 , r115
:for_start35
Set r115 , 1
Add r114 , r115
Gte r114 , r112 , r115
Set r113 , :for_end36
Jmpc r115 , r113
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r107 , 0
Set r108 , 4
Add r108 , r255
Add r108 , r107
Write r108 , r114
// write_register- end
// for loop contents:
// index_array
// index_array - var:Data { stack_frame_offset: -2, size: 1, data_type: Reference { inside: Array { inside: U32, len: 0 }, offset_of_data_from_reference_addr: 0 } }
// allocate_stack - current: 6 size: 1
Set r106 , 1
Add r254 , r106
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r103 , 0
Set r102 , 4
Add r102 , r255
Add r102 , r103
Read r105 , r102
// read_register- end
Set r103 , 4294967294
// array indexing- var_to_index.is_reference: true
Cp r104 , r105
Set r102 , 1
Mul r104 , r102
// add 1 offset to account for 1'st register holding size of array
Set r102 , 1
Add r104 , r102
// read_addr_of_register - self: Data { stack_frame_offset: -2, size: 1, data_type: Reference { inside: Array { inside: U32, len: 0 }, offset_of_data_from_reference_addr: 0 } }
Set r102 , 4294967294
Add r102 , r255
Read r102 , r102
Set r101 , 0
Add r102 , r101
Add r102 , r104
// read_addr_of_register - end
// index_array: read_addr_of_register - end addr_register:102 , offset_register:104
// write_directly_to_reference_pointer - 101, input: r102
Set r101 , 6
Add r101 , r255
Write r101 , r102
// write_directly_to_reference_pointer - end
// index_array - end
Set r108 , 0
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r104 , 0
Set r102 , 6
Add r102 , r255
Read r102 , r102
Set r103 , 0
Add r102 , r103
Add r102 , r104
Read r107 , r102
// read_register- end
Phrp r108 , r107

// for loop contents - end
Set r113 , :for_start35
Jmp r113
:for_end36
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r108 , 0
Set r102 , 3
Add r102 , r255
Add r102 , r108
Read r254 , r102
// read_register- end
// allocate_stack - current: 4 size: 2
Set r115 , 2
Add r254 , r115
// alloc_stack - end
Set r113 , 1
// write_register- self: Data { stack_frame_offset: 4, size: 2, data_type: Array { inside: Char, len: 1 } }
Set r108 , 0
Set r107 , 4
Add r107 , r255
Add r107 , r108
Write r107 , r113
// write_register- end
Set r113 , 10
// write_register- self: Data { stack_frame_offset: 4, size: 2, data_type: Array { inside: Char, len: 1 } }
Set r108 , 1
Set r102 , 4
Add r102 , r255
Add r102 , r108
Write r102 , r113
// write_register- end
Set r112 , 0
// read_register- self: Data { stack_frame_offset: 4, size: 2, data_type: Array { inside: Char, len: 1 } }
Set r108 , 0
Set r107 , 4
Add r107 , r255
Add r107 , r108
Read r114 , r107
// read_register- end
Phrp r112 , r114
// read_register- self: Data { stack_frame_offset: 4, size: 2, data_type: Array { inside: Char, len: 1 } }
Set r108 , 1
Set r102 , 4
Add r102 , r255
Add r102 , r108
Read r114 , r102
// read_register- end
Phrp r112 , r114

// Return

Cp r114 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r108 , 0
Set r107 , 1
Add r107 , r255
Add r107 , r108
Read r112 , r107
// read_register- end
Cp r255 , r112
Read r114 , r114
Jmp r114
:function_panic_9
Cp r229 , r255
Cp r255 , r254
// allocate_stack - current: 0 size: 1
Set r112 , 1
Add r254 , r112
// alloc_stack - end
// allocate_stack - current: 1 size: 1
Set r114 , 1
Add r254 , r114
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r108 , 0
Set r102 , 1
Add r102 , r255
Add r102 , r108
Write r102 , r229
// write_register- end
// call_function_code
// function.input.is_empty(), 0, 3
// call_function_code - needed_stack: 3
// allocate_stack - current: 2 size: 3
Set r108 , 3
Add r254 , r108
// alloc_stack - end
// call_function_code - handle reference variable
Set r107 , 4294967294
Add r107 , r254
// read_referenced_address
Set r104 , 4294967294
Add r104 , r255
Read r104 , r104
Set r105 , 0
Add r104 , r105
// read_referenced_address - end
Write r107 , r104
// call_function_code - handle reference variable, end
Set r104 , :function-return37
Write r254 , r104
Set r107 , :function_print_8
Jmp r107
:function-return37
// function call output: None
// function call converted output data : None

Halt

// Return

Cp r103 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r102 , 0
Set r105 , 1
Add r105 , r255
Add r105 , r102
Read r104 , r105
// read_register- end
Cp r255 , r104
Read r103 , r103
Jmp r103
Halt
