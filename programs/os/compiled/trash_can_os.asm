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
RSet r246 , :static_declaration_end11
RJmp r246
:heap_start
Set r0 , 0
:static_declaration_end11
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
Set r250 , 1
Add r254 , r250
// alloc_stack - end
RSet r249 , :heap_start
Add r249 , r251
Set r248 , 0
Sub r249 , r248
// write_directly_to_reference_pointer - 247, input: r249
Set r247 , 2
Add r247 , r255
Write r247 , r249
// write_directly_to_reference_pointer - end
// access_static_variable-end
// allocate_stack - current: 3 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r245 , 0
Set r244 , 2
Add r244 , r255
Read r244 , r244
Set r246 , 0
Add r244 , r246
Add r244 , r245
Read r247 , r244
// read_register- end
// write_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r245 , 0
Set r246 , 3
Add r246 , r255
Add r246 , r245
Write r246 , r247
// write_register- end
RSet r247 , :static_declaration_end12
RJmp r247
:heap_main_pool_head
Set r0 , 0
:static_declaration_end12
// allocate_stack - current: 4 size: 1
Set r245 , 1
Add r254 , r245
// alloc_stack - end
RSet r247 , :heap_main_pool_head
Add r247 , r251
Set r244 , 0
Sub r247 , r244
// write_directly_to_reference_pointer - 243, input: r247
Set r243 , 4
Add r243 , r255
Write r243 , r247
// write_directly_to_reference_pointer - end
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r242 , 0
Set r241 , 3
Add r241 , r255
Add r241 , r242
Read r246 , r241
// read_register- end
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r242 , 0
Set r243 , 4
Add r243 , r255
Read r243 , r243
Set r241 , 0
Add r243 , r241
Add r243 , r242
Write r243 , r246
// write_register- end

// handle number
Set r250 , 30000
// allocate_stack - current: 5 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 5
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// handle number end
RSet r246 , :static_declaration_end13
RJmp r246
:heap_end
Set r0 , 0
:static_declaration_end13
// allocate_stack - current: 6 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
RSet r246 , :heap_end
Add r246 , r251
Set r245 , 0
Sub r246 , r245
// write_directly_to_reference_pointer - 244, input: r246
Set r244 , 6
Add r244 , r255
Write r244 , r246
// write_directly_to_reference_pointer - end
// read_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 5
Add r242 , r255
Add r242 , r243
Read r247 , r242
// read_register- end
// write_register- self: Data { stack_frame_offset: 6, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r243 , 0
Set r244 , 6
Add r244 , r255
Read r244 , r244
Set r242 , 0
Add r244 , r242
Add r244 , r243
Write r244 , r247
// write_register- end

// handle number
Set r250 , 2
// allocate_stack - current: 7 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 7
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// handle number end
RSet r246 , :static_declaration_end14
RJmp r246
:min_heap_size_pow_2
Set r0 , 0
:static_declaration_end14
// allocate_stack - current: 8 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
RSet r246 , :min_heap_size_pow_2
Add r246 , r251
Set r245 , 0
Sub r246 , r245
// write_directly_to_reference_pointer - 244, input: r246
Set r244 , 8
Add r244 , r255
Write r244 , r246
// write_directly_to_reference_pointer - end
// read_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 7
Add r242 , r255
Add r242 , r243
Read r247 , r242
// read_register- end
// write_register- self: Data { stack_frame_offset: 8, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r243 , 0
Set r244 , 8
Add r244 , r255
Read r244 , r244
Set r242 , 0
Add r244 , r242
Add r244 , r243
Write r244 , r247
// write_register- end

// handle number
Set r250 , 10
// allocate_stack - current: 9 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 9
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// handle number end
RSet r246 , :static_declaration_end15
RJmp r246
:max_heap_size_pow_2
Set r0 , 0
:static_declaration_end15
// allocate_stack - current: 10 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
RSet r246 , :max_heap_size_pow_2
Add r246 , r251
Set r245 , 0
Sub r246 , r245
// write_directly_to_reference_pointer - 244, input: r246
Set r244 , 10
Add r244 , r255
Write r244 , r246
// write_directly_to_reference_pointer - end
// read_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 9
Add r242 , r255
Add r242 , r243
Read r247 , r242
// read_register- end
// write_register- self: Data { stack_frame_offset: 10, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r243 , 0
Set r244 , 10
Add r244 , r255
Read r244 , r244
Set r242 , 0
Add r244 , r242
Add r244 , r243
Write r244 , r247
// write_register- end

// array_initialization
// allocate_stack - current: 11 size: 9
Set r249 , 9
Add r254 , r249
// alloc_stack - end
Set r250 , 0
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r247 , 0
Set r246 , 11
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r247 , 1
Set r248 , 11
Add r248 , r255
Add r248 , r247
Write r248 , r250
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r247 , 2
Set r246 , 11
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r247 , 3
Set r248 , 11
Add r248 , r255
Add r248 , r247
Write r248 , r250
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r247 , 4
Set r246 , 11
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r247 , 5
Set r248 , 11
Add r248 , r255
Add r248 , r247
Write r248 , r250
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r247 , 6
Set r246 , 11
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r247 , 7
Set r248 , 11
Add r248 , r255
Add r248 , r247
Write r248 , r250
// write_register- end
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r247 , 8
Set r246 , 11
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
//  write array length
Set r250 , 8
// write_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r247 , 0
Set r248 , 11
Add r248 , r255
Add r248 , r247
Write r248 , r250
// write_register- end
// array_initialization- end
RSet r250 , :static_declaration_end16
RJmp r250
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
:static_declaration_end16
// allocate_stack - current: 20 size: 1
Set r247 , 1
Add r254 , r247
// alloc_stack - end
RSet r250 , :free_heap_blocks_linked_lists
Add r250 , r251
Set r246 , 0
Sub r250 , r246
// write_directly_to_reference_pointer - 245, input: r250
Set r245 , 20
Add r245 , r255
Write r245 , r250
// write_directly_to_reference_pointer - end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r244 , 0
Set r243 , 11
Add r243 , r255
Add r243 , r244
Read r248 , r243
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r244 , 0
Set r245 , 20
Add r245 , r255
Read r245 , r245
Set r243 , 0
Add r245 , r243
Add r245 , r244
Write r245 , r248
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r244 , 1
Set r243 , 11
Add r243 , r255
Add r243 , r244
Read r248 , r243
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r244 , 1
Set r245 , 20
Add r245 , r255
Read r245 , r245
Set r243 , 0
Add r245 , r243
Add r245 , r244
Write r245 , r248
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r244 , 2
Set r243 , 11
Add r243 , r255
Add r243 , r244
Read r248 , r243
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r244 , 2
Set r245 , 20
Add r245 , r255
Read r245 , r245
Set r243 , 0
Add r245 , r243
Add r245 , r244
Write r245 , r248
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r244 , 3
Set r243 , 11
Add r243 , r255
Add r243 , r244
Read r248 , r243
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r244 , 3
Set r245 , 20
Add r245 , r255
Read r245 , r245
Set r243 , 0
Add r245 , r243
Add r245 , r244
Write r245 , r248
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r244 , 4
Set r243 , 11
Add r243 , r255
Add r243 , r244
Read r248 , r243
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r244 , 4
Set r245 , 20
Add r245 , r255
Read r245 , r245
Set r243 , 0
Add r245 , r243
Add r245 , r244
Write r245 , r248
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r244 , 5
Set r243 , 11
Add r243 , r255
Add r243 , r244
Read r248 , r243
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r244 , 5
Set r245 , 20
Add r245 , r255
Read r245 , r245
Set r243 , 0
Add r245 , r243
Add r245 , r244
Write r245 , r248
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r244 , 6
Set r243 , 11
Add r243 , r255
Add r243 , r244
Read r248 , r243
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r244 , 6
Set r245 , 20
Add r245 , r255
Read r245 , r245
Set r243 , 0
Add r245 , r243
Add r245 , r244
Write r245 , r248
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r244 , 7
Set r243 , 11
Add r243 , r255
Add r243 , r244
Read r248 , r243
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r244 , 7
Set r245 , 20
Add r245 , r255
Read r245 , r245
Set r243 , 0
Add r245 , r243
Add r245 , r244
Write r245 , r248
// write_register- end
// read_register- self: Data { stack_frame_offset: 11, size: 9, data_type: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 } }
Set r244 , 8
Set r243 , 11
Add r243 , r255
Add r243 , r244
Read r248 , r243
// read_register- end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r244 , 8
Set r245 , 20
Add r245 , r255
Read r245 , r245
Set r243 , 0
Add r245 , r243
Add r245 , r244
Write r245 , r248
// write_register- end

// array_initialization
// allocate_stack - current: 21 size: 9
Set r249 , 9
Add r254 , r249
// alloc_stack - end
Set r250 , 0
// write_register- self: Data { stack_frame_offset: 21, size: 9, data_type: Array { inside: U32, len: 8 } }
Set r247 , 0
Set r246 , 21
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// write_register- self: Data { stack_frame_offset: 21, size: 9, data_type: Array { inside: U32, len: 8 } }
Set r247 , 1
Set r248 , 21
Add r248 , r255
Add r248 , r247
Write r248 , r250
// write_register- end
// write_register- self: Data { stack_frame_offset: 21, size: 9, data_type: Array { inside: U32, len: 8 } }
Set r247 , 2
Set r246 , 21
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// write_register- self: Data { stack_frame_offset: 21, size: 9, data_type: Array { inside: U32, len: 8 } }
Set r247 , 3
Set r248 , 21
Add r248 , r255
Add r248 , r247
Write r248 , r250
// write_register- end
// write_register- self: Data { stack_frame_offset: 21, size: 9, data_type: Array { inside: U32, len: 8 } }
Set r247 , 4
Set r246 , 21
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// write_register- self: Data { stack_frame_offset: 21, size: 9, data_type: Array { inside: U32, len: 8 } }
Set r247 , 5
Set r248 , 21
Add r248 , r255
Add r248 , r247
Write r248 , r250
// write_register- end
// write_register- self: Data { stack_frame_offset: 21, size: 9, data_type: Array { inside: U32, len: 8 } }
Set r247 , 6
Set r246 , 21
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// write_register- self: Data { stack_frame_offset: 21, size: 9, data_type: Array { inside: U32, len: 8 } }
Set r247 , 7
Set r248 , 21
Add r248 , r255
Add r248 , r247
Write r248 , r250
// write_register- end
// write_register- self: Data { stack_frame_offset: 21, size: 9, data_type: Array { inside: U32, len: 8 } }
Set r247 , 8
Set r246 , 21
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
//  write array length
Set r250 , 8
// write_register- self: Data { stack_frame_offset: 21, size: 9, data_type: Array { inside: U32, len: 8 } }
Set r247 , 0
Set r248 , 21
Add r248 , r255
Add r248 , r247
Write r248 , r250
// write_register- end
// array_initialization- end
RSet r250 , :static_declaration_end17
RJmp r250
:task_que
Set r0 , 0
Set r0 , 0
Set r0 , 0
Set r0 , 0
Set r0 , 0
Set r0 , 0
Set r0 , 0
Set r0 , 0
Set r0 , 0
:static_declaration_end17
// allocate_stack - current: 30 size: 1
Set r247 , 1
Add r254 , r247
// alloc_stack - end
RSet r250 , :task_que
Add r250 , r251
Set r246 , 0
Sub r250 , r246
// write_directly_to_reference_pointer - 245, input: r250
Set r245 , 30
Add r245 , r255
Write r245 , r250
// write_directly_to_reference_pointer - end
// read_register- self: Data { stack_frame_offset: 21, size: 9, data_type: Array { inside: U32, len: 8 } }
Set r244 , 0
Set r243 , 21
Add r243 , r255
Add r243 , r244
Read r248 , r243
// read_register- end
// write_register- self: Data { stack_frame_offset: 30, size: 1, data_type: Reference { inside: Array { inside: U32, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r244 , 0
Set r245 , 30
Add r245 , r255
Read r245 , r245
Set r243 , 0
Add r245 , r243
Add r245 , r244
Write r245 , r248
// write_register- end
// read_register- self: Data { stack_frame_offset: 21, size: 9, data_type: Array { inside: U32, len: 8 } }
Set r244 , 1
Set r243 , 21
Add r243 , r255
Add r243 , r244
Read r248 , r243
// read_register- end
// write_register- self: Data { stack_frame_offset: 30, size: 1, data_type: Reference { inside: Array { inside: U32, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r244 , 1
Set r245 , 30
Add r245 , r255
Read r245 , r245
Set r243 , 0
Add r245 , r243
Add r245 , r244
Write r245 , r248
// write_register- end
// read_register- self: Data { stack_frame_offset: 21, size: 9, data_type: Array { inside: U32, len: 8 } }
Set r244 , 2
Set r243 , 21
Add r243 , r255
Add r243 , r244
Read r248 , r243
// read_register- end
// write_register- self: Data { stack_frame_offset: 30, size: 1, data_type: Reference { inside: Array { inside: U32, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r244 , 2
Set r245 , 30
Add r245 , r255
Read r245 , r245
Set r243 , 0
Add r245 , r243
Add r245 , r244
Write r245 , r248
// write_register- end
// read_register- self: Data { stack_frame_offset: 21, size: 9, data_type: Array { inside: U32, len: 8 } }
Set r244 , 3
Set r243 , 21
Add r243 , r255
Add r243 , r244
Read r248 , r243
// read_register- end
// write_register- self: Data { stack_frame_offset: 30, size: 1, data_type: Reference { inside: Array { inside: U32, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r244 , 3
Set r245 , 30
Add r245 , r255
Read r245 , r245
Set r243 , 0
Add r245 , r243
Add r245 , r244
Write r245 , r248
// write_register- end
// read_register- self: Data { stack_frame_offset: 21, size: 9, data_type: Array { inside: U32, len: 8 } }
Set r244 , 4
Set r243 , 21
Add r243 , r255
Add r243 , r244
Read r248 , r243
// read_register- end
// write_register- self: Data { stack_frame_offset: 30, size: 1, data_type: Reference { inside: Array { inside: U32, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r244 , 4
Set r245 , 30
Add r245 , r255
Read r245 , r245
Set r243 , 0
Add r245 , r243
Add r245 , r244
Write r245 , r248
// write_register- end
// read_register- self: Data { stack_frame_offset: 21, size: 9, data_type: Array { inside: U32, len: 8 } }
Set r244 , 5
Set r243 , 21
Add r243 , r255
Add r243 , r244
Read r248 , r243
// read_register- end
// write_register- self: Data { stack_frame_offset: 30, size: 1, data_type: Reference { inside: Array { inside: U32, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r244 , 5
Set r245 , 30
Add r245 , r255
Read r245 , r245
Set r243 , 0
Add r245 , r243
Add r245 , r244
Write r245 , r248
// write_register- end
// read_register- self: Data { stack_frame_offset: 21, size: 9, data_type: Array { inside: U32, len: 8 } }
Set r244 , 6
Set r243 , 21
Add r243 , r255
Add r243 , r244
Read r248 , r243
// read_register- end
// write_register- self: Data { stack_frame_offset: 30, size: 1, data_type: Reference { inside: Array { inside: U32, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r244 , 6
Set r245 , 30
Add r245 , r255
Read r245 , r245
Set r243 , 0
Add r245 , r243
Add r245 , r244
Write r245 , r248
// write_register- end
// read_register- self: Data { stack_frame_offset: 21, size: 9, data_type: Array { inside: U32, len: 8 } }
Set r244 , 7
Set r243 , 21
Add r243 , r255
Add r243 , r244
Read r248 , r243
// read_register- end
// write_register- self: Data { stack_frame_offset: 30, size: 1, data_type: Reference { inside: Array { inside: U32, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r244 , 7
Set r245 , 30
Add r245 , r255
Read r245 , r245
Set r243 , 0
Add r245 , r243
Add r245 , r244
Write r245 , r248
// write_register- end
// read_register- self: Data { stack_frame_offset: 21, size: 9, data_type: Array { inside: U32, len: 8 } }
Set r244 , 8
Set r243 , 21
Add r243 , r255
Add r243 , r244
Read r248 , r243
// read_register- end
// write_register- self: Data { stack_frame_offset: 30, size: 1, data_type: Reference { inside: Array { inside: U32, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r244 , 8
Set r245 , 30
Add r245 , r255
Read r245 , r245
Set r243 , 0
Add r245 , r243
Add r245 , r244
Write r245 , r248
// write_register- end

// handle number
Set r250 , 0
// allocate_stack - current: 31 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 31, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 31
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// handle number end
RSet r246 , :static_declaration_end18
RJmp r246
:task_que_head_index
Set r0 , 0
:static_declaration_end18
// allocate_stack - current: 32 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
RSet r246 , :task_que_head_index
Add r246 , r251
Set r245 , 0
Sub r246 , r245
// write_directly_to_reference_pointer - 244, input: r246
Set r244 , 32
Add r244 , r255
Write r244 , r246
// write_directly_to_reference_pointer - end
// read_register- self: Data { stack_frame_offset: 31, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 31
Add r242 , r255
Add r242 , r243
Read r247 , r242
// read_register- end
// write_register- self: Data { stack_frame_offset: 32, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r243 , 0
Set r244 , 32
Add r244 , r255
Read r244 , r244
Set r242 , 0
Add r244 , r242
Add r244 , r243
Write r244 , r247
// write_register- end

// assign_new_variable
// handle number
Set r250 , 4
// allocate_stack - current: 33 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 33, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 33
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// handle number end
// call_function_code
// call_function_code - needed_stack: 4
// allocate_stack - current: 34 size: 4
Set r247 , 4
Add r254 , r247
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 33, size: 1, data_type: U32 }
Set r242 , 0
Set r241 , 33
Add r241 , r255
Add r241 , r242
Read r245 , r241
// read_register- end
Set r248 , 4294967294
Add r248 , r254
Write r248 , r245
RSet r245 , :function-return19
Add r245 , r251
Set r241 , 0
Sub r245 , r241
Write r254 , r245
RSet r248 , :function_core_allocate_4
RJmp r248
:function-return19
// function call output: Some(FunctionInputData { name: "core_allocate", data_type: U32, stack_frame_offset: -3 })
// function call converted output data : Some(Data { stack_frame_offset: 35, size: 1, data_type: U32 })
// assign_new_variable - end

RSet r250 , :static_declaration_end20
RJmp r250
:idt_addr
Set r0 , 0
:static_declaration_end20
// allocate_stack - current: 38 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
RSet r250 , :idt_addr
Add r250 , r251
Set r247 , 0
Sub r250 , r247
// write_directly_to_reference_pointer - 246, input: r250
Set r246 , 38
Add r246 , r255
Write r246 , r250
// write_directly_to_reference_pointer - end
// read_register- self: Data { stack_frame_offset: 35, size: 1, data_type: U32 }
Set r245 , 0
Set r244 , 35
Add r244 , r255
Add r244 , r245
Read r249 , r244
// read_register- end
// write_register- self: Data { stack_frame_offset: 38, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r245 , 0
Set r246 , 38
Add r246 , r255
Read r246 , r246
Set r244 , 0
Add r246 , r244
Add r246 , r245
Write r246 , r249
// write_register- end

// assignment
// memory_access
// allocate_stack - current: 39 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
// handle_binary_expr
// handle number
Set r249 , 0
// allocate_stack - current: 40 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 40, size: 1, data_type: U32 }
Set r246 , 0
Set r245 , 40
Add r245 , r255
Add r245 , r246
Write r245 , r249
// write_register- end
// handle number end
// allocate_stack - current: 41 size: 1
Set r244 , 1
Add r254 , r244
// alloc_stack - end
// handle_binary_expr - output_register- r245
// read_register- self: Data { stack_frame_offset: 35, size: 1, data_type: U32 }
Set r242 , 0
Set r241 , 35
Add r241 , r255
Add r241 , r242
Read r246 , r241
// read_register- end
// read_register- self: Data { stack_frame_offset: 40, size: 1, data_type: U32 }
Set r242 , 0
Set r243 , 40
Add r243 , r255
Add r243 , r242
Read r247 , r243
// read_register- end
Add r246 , r247
Cp r245 , r246
// write_register- self: Data { stack_frame_offset: 41, size: 1, data_type: U32 }
Set r242 , 0
Set r241 , 41
Add r241 , r255
Add r241 , r242
Write r241 , r245
// write_register- end
// handle_binary_expr - end
// read_register- self: Data { stack_frame_offset: 41, size: 1, data_type: U32 }
Set r246 , 0
Set r241 , 41
Add r241 , r255
Add r241 , r246
Read r245 , r241
// read_register- end
// write_directly_to_reference_pointer - 246, input: r245
Set r246 , 39
Add r246 , r255
Write r246 , r245
// write_directly_to_reference_pointer - end
// memory_access- end
// allocate_stack - current: 42 size: 1
Set r241 , 1
Add r254 , r241
// alloc_stack - end
RSet r245 , :function_syscall_handler_10
Add r245 , r251
Set r246 , 0
Sub r245 , r246
// write_register- self: Data { stack_frame_offset: 42, size: 1, data_type: U32 }
Set r242 , 0
Set r243 , 42
Add r243 , r255
Add r243 , r242
Write r243 , r245
// write_register- end
// assignment data: Data { stack_frame_offset: 42, size: 1, data_type: U32 }
// assignment- variable.is_reference: true data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 42, size: 1, data_type: U32 }
Set r242 , 0
Set r247 , 42
Add r247 , r255
Add r247 , r242
Read r245 , r247
// read_register- end
// write_register- self: Data { stack_frame_offset: 39, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r242 , 0
Set r243 , 39
Add r243 , r255
Read r243 , r243
Set r247 , 0
Add r243 , r247
Add r243 , r242
Write r243 , r245
// write_register- end
// end assignment

// assignment
// memory_access
// allocate_stack - current: 43 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
// handle_binary_expr
// handle number
Set r249 , 1
// allocate_stack - current: 44 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 44, size: 1, data_type: U32 }
Set r246 , 0
Set r245 , 44
Add r245 , r255
Add r245 , r246
Write r245 , r249
// write_register- end
// handle number end
// allocate_stack - current: 45 size: 1
Set r244 , 1
Add r254 , r244
// alloc_stack - end
// handle_binary_expr - output_register- r245
// read_register- self: Data { stack_frame_offset: 35, size: 1, data_type: U32 }
Set r242 , 0
Set r241 , 35
Add r241 , r255
Add r241 , r242
Read r246 , r241
// read_register- end
// read_register- self: Data { stack_frame_offset: 44, size: 1, data_type: U32 }
Set r242 , 0
Set r243 , 44
Add r243 , r255
Add r243 , r242
Read r247 , r243
// read_register- end
Add r246 , r247
Cp r245 , r246
// write_register- self: Data { stack_frame_offset: 45, size: 1, data_type: U32 }
Set r242 , 0
Set r241 , 45
Add r241 , r255
Add r241 , r242
Write r241 , r245
// write_register- end
// handle_binary_expr - end
// read_register- self: Data { stack_frame_offset: 45, size: 1, data_type: U32 }
Set r246 , 0
Set r241 , 45
Add r241 , r255
Add r241 , r246
Read r245 , r241
// read_register- end
// write_directly_to_reference_pointer - 246, input: r245
Set r246 , 43
Add r246 , r255
Write r246 , r245
// write_directly_to_reference_pointer - end
// memory_access- end
// allocate_stack - current: 46 size: 1
Set r241 , 1
Add r254 , r241
// alloc_stack - end
RSet r245 , :function_timer_interrupt_9
Add r245 , r251
Set r246 , 0
Sub r245 , r246
// write_register- self: Data { stack_frame_offset: 46, size: 1, data_type: U32 }
Set r242 , 0
Set r243 , 46
Add r243 , r255
Add r243 , r242
Write r243 , r245
// write_register- end
// assignment data: Data { stack_frame_offset: 46, size: 1, data_type: U32 }
// assignment- variable.is_reference: true data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 46, size: 1, data_type: U32 }
Set r242 , 0
Set r247 , 46
Add r247 , r255
Add r247 , r242
Read r245 , r247
// read_register- end
// write_register- self: Data { stack_frame_offset: 43, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r242 , 0
Set r243 , 43
Add r243 , r255
Read r243 , r243
Set r247 , 0
Add r243 , r247
Add r243 , r242
Write r243 , r245
// write_register- end
// end assignment

// assignment
// memory_access
// allocate_stack - current: 47 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
// handle_binary_expr
// handle number
Set r249 , 2
// allocate_stack - current: 48 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 48, size: 1, data_type: U32 }
Set r246 , 0
Set r245 , 48
Add r245 , r255
Add r245 , r246
Write r245 , r249
// write_register- end
// handle number end
// allocate_stack - current: 49 size: 1
Set r244 , 1
Add r254 , r244
// alloc_stack - end
// handle_binary_expr - output_register- r245
// read_register- self: Data { stack_frame_offset: 35, size: 1, data_type: U32 }
Set r242 , 0
Set r241 , 35
Add r241 , r255
Add r241 , r242
Read r246 , r241
// read_register- end
// read_register- self: Data { stack_frame_offset: 48, size: 1, data_type: U32 }
Set r242 , 0
Set r243 , 48
Add r243 , r255
Add r243 , r242
Read r247 , r243
// read_register- end
Add r246 , r247
Cp r245 , r246
// write_register- self: Data { stack_frame_offset: 49, size: 1, data_type: U32 }
Set r242 , 0
Set r241 , 49
Add r241 , r255
Add r241 , r242
Write r241 , r245
// write_register- end
// handle_binary_expr - end
// read_register- self: Data { stack_frame_offset: 49, size: 1, data_type: U32 }
Set r246 , 0
Set r241 , 49
Add r241 , r255
Add r241 , r246
Read r245 , r241
// read_register- end
// write_directly_to_reference_pointer - 246, input: r245
Set r246 , 47
Add r246 , r255
Write r246 , r245
// write_directly_to_reference_pointer - end
// memory_access- end
// allocate_stack - current: 50 size: 1
Set r241 , 1
Add r254 , r241
// alloc_stack - end
RSet r245 , :function_keyboard_interrupt_8
Add r245 , r251
Set r246 , 0
Sub r245 , r246
// write_register- self: Data { stack_frame_offset: 50, size: 1, data_type: U32 }
Set r242 , 0
Set r243 , 50
Add r243 , r255
Add r243 , r242
Write r243 , r245
// write_register- end
// assignment data: Data { stack_frame_offset: 50, size: 1, data_type: U32 }
// assignment- variable.is_reference: true data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 50, size: 1, data_type: U32 }
Set r242 , 0
Set r247 , 50
Add r247 , r255
Add r247 , r242
Read r245 , r247
// read_register- end
// write_register- self: Data { stack_frame_offset: 47, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r242 , 0
Set r243 , 47
Add r243 , r255
Read r243 , r243
Set r247 , 0
Add r243 , r247
Add r243 , r242
Write r243 , r245
// write_register- end
// end assignment

// read_register- self: Data { stack_frame_offset: 35, size: 1, data_type: U32 }
Set r248 , 0
Set r247 , 35
Add r247 , r255
Add r247 , r248
Read r250 , r247
// read_register- end
Idt r250

Halt

// handle number
Set r250 , 0
// allocate_stack - current: 51 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 51, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 51
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// handle number end
// allocate_stack - current: 52 size: 8
Set r247 , 8
Add r254 , r247
// alloc_stack - end
Set r246 , 7
// write_register- self: Data { stack_frame_offset: 52, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 0
Set r244 , 52
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 50
// write_register- self: Data { stack_frame_offset: 52, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 1
Set r248 , 52
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 52, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 2
Set r244 , 52
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 52, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 3
Set r248 , 52
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 52, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 4
Set r244 , 52
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 52, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 5
Set r248 , 52
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 52, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 6
Set r244 , 52
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 52, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 7
Set r248 , 52
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
// allocate_stack - current: 60 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 51, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 51
Add r242 , r255
Add r242 , r243
Read r245 , r242
// read_register- end
// read_addr_of_self
Set r242 , 52
Add r242 , r255
// read_addr_of_self - end
// read_addr_of_self
Set r243 , 60
Add r243 , r255
// read_addr_of_self - end
Syscall r245 , r242 , r243
// write_register- self: Data { stack_frame_offset: 60, size: 1, data_type: U32 }
Set r241 , 0
Set r240 , 60
Add r240 , r255
Add r240 , r241
Write r240 , r243
// write_register- end

// handle number
Set r250 , 0
// allocate_stack - current: 61 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 61, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 61
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// handle number end
// allocate_stack - current: 62 size: 8
Set r247 , 8
Add r254 , r247
// alloc_stack - end
Set r246 , 7
// write_register- self: Data { stack_frame_offset: 62, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 0
Set r244 , 62
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 50
// write_register- self: Data { stack_frame_offset: 62, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 1
Set r248 , 62
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 62, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 2
Set r244 , 62
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 62, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 3
Set r248 , 62
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 62, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 4
Set r244 , 62
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 62, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 5
Set r248 , 62
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 62, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 6
Set r244 , 62
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 62, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 7
Set r248 , 62
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
// allocate_stack - current: 70 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 61, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 61
Add r242 , r255
Add r242 , r243
Read r245 , r242
// read_register- end
// read_addr_of_self
Set r242 , 62
Add r242 , r255
// read_addr_of_self - end
// read_addr_of_self
Set r243 , 70
Add r243 , r255
// read_addr_of_self - end
Syscall r245 , r242 , r243
// write_register- self: Data { stack_frame_offset: 70, size: 1, data_type: U32 }
Set r241 , 0
Set r240 , 70
Add r240 , r255
Add r240 , r241
Write r240 , r243
// write_register- end

// handle number
Set r250 , 0
// allocate_stack - current: 71 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 71, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 71
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// handle number end
// allocate_stack - current: 72 size: 8
Set r247 , 8
Add r254 , r247
// alloc_stack - end
Set r246 , 7
// write_register- self: Data { stack_frame_offset: 72, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 0
Set r244 , 72
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 50
// write_register- self: Data { stack_frame_offset: 72, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 1
Set r248 , 72
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 72, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 2
Set r244 , 72
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 72, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 3
Set r248 , 72
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 72, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 4
Set r244 , 72
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 72, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 5
Set r248 , 72
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 72, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 6
Set r244 , 72
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 72, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 7
Set r248 , 72
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
// allocate_stack - current: 80 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 71, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 71
Add r242 , r255
Add r242 , r243
Read r245 , r242
// read_register- end
// read_addr_of_self
Set r242 , 72
Add r242 , r255
// read_addr_of_self - end
// read_addr_of_self
Set r243 , 80
Add r243 , r255
// read_addr_of_self - end
Syscall r245 , r242 , r243
// write_register- self: Data { stack_frame_offset: 80, size: 1, data_type: U32 }
Set r241 , 0
Set r240 , 80
Add r240 , r255
Add r240 , r241
Write r240 , r243
// write_register- end

// handle number
Set r250 , 0
// allocate_stack - current: 81 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 81, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 81
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// handle number end
// allocate_stack - current: 82 size: 8
Set r247 , 8
Add r254 , r247
// alloc_stack - end
Set r246 , 7
// write_register- self: Data { stack_frame_offset: 82, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 0
Set r244 , 82
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 50
// write_register- self: Data { stack_frame_offset: 82, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 1
Set r248 , 82
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 82, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 2
Set r244 , 82
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 82, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 3
Set r248 , 82
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 82, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 4
Set r244 , 82
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 82, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 5
Set r248 , 82
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 82, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 6
Set r244 , 82
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 82, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 7
Set r248 , 82
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
// allocate_stack - current: 90 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 81, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 81
Add r242 , r255
Add r242 , r243
Read r245 , r242
// read_register- end
// read_addr_of_self
Set r242 , 82
Add r242 , r255
// read_addr_of_self - end
// read_addr_of_self
Set r243 , 90
Add r243 , r255
// read_addr_of_self - end
Syscall r245 , r242 , r243
// write_register- self: Data { stack_frame_offset: 90, size: 1, data_type: U32 }
Set r241 , 0
Set r240 , 90
Add r240 , r255
Add r240 , r241
Write r240 , r243
// write_register- end

// handle number
Set r250 , 0
// allocate_stack - current: 91 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 91, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 91
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// handle number end
// allocate_stack - current: 92 size: 8
Set r247 , 8
Add r254 , r247
// alloc_stack - end
Set r246 , 7
// write_register- self: Data { stack_frame_offset: 92, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 0
Set r244 , 92
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 50
// write_register- self: Data { stack_frame_offset: 92, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 1
Set r248 , 92
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 92, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 2
Set r244 , 92
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 92, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 3
Set r248 , 92
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 92, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 4
Set r244 , 92
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 92, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 5
Set r248 , 92
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 92, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 6
Set r244 , 92
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 92, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 7
Set r248 , 92
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
// allocate_stack - current: 100 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 91, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 91
Add r242 , r255
Add r242 , r243
Read r245 , r242
// read_register- end
// read_addr_of_self
Set r242 , 92
Add r242 , r255
// read_addr_of_self - end
// read_addr_of_self
Set r243 , 100
Add r243 , r255
// read_addr_of_self - end
Syscall r245 , r242 , r243
// write_register- self: Data { stack_frame_offset: 100, size: 1, data_type: U32 }
Set r241 , 0
Set r240 , 100
Add r240 , r255
Add r240 , r241
Write r240 , r243
// write_register- end

// handle number
Set r250 , 0
// allocate_stack - current: 101 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 101, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 101
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// handle number end
// allocate_stack - current: 102 size: 8
Set r247 , 8
Add r254 , r247
// alloc_stack - end
Set r246 , 7
// write_register- self: Data { stack_frame_offset: 102, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 0
Set r244 , 102
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 50
// write_register- self: Data { stack_frame_offset: 102, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 1
Set r248 , 102
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 102, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 2
Set r244 , 102
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 102, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 3
Set r248 , 102
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 102, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 4
Set r244 , 102
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 102, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 5
Set r248 , 102
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 102, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 6
Set r244 , 102
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
Set r246 , 53
// write_register- self: Data { stack_frame_offset: 102, size: 8, data_type: Array { inside: Char, len: 7 } }
Set r245 , 7
Set r248 , 102
Add r248 , r255
Add r248 , r245
Write r248 , r246
// write_register- end
// allocate_stack - current: 110 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 101, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 101
Add r242 , r255
Add r242 , r243
Read r245 , r242
// read_register- end
// read_addr_of_self
Set r242 , 102
Add r242 , r255
// read_addr_of_self - end
// read_addr_of_self
Set r243 , 110
Add r243 , r255
// read_addr_of_self - end
Syscall r245 , r242 , r243
// write_register- self: Data { stack_frame_offset: 110, size: 1, data_type: U32 }
Set r241 , 0
Set r240 , 110
Add r240 , r255
Add r240 , r241
Write r240 , r243
// write_register- end

// assign_new_variable
// handle number
Set r250 , 5000
// allocate_stack - current: 111 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 111, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 111
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// handle number end
// assign_new_variable - end

// read_register- self: Data { stack_frame_offset: 111, size: 1, data_type: U32 }
Set r248 , 0
Set r247 , 111
Add r247 , r255
Add r247 , r248
Read r250 , r247
// read_register- end
Jmp r250

// allocate_stack - current: 112 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 112, size: 1, data_type: U32 }
Set r248 , 0
Set r247 , 112
Add r247 , r255
Add r247 , r248
Write r247 , r254
// write_register- end
:while_start21
Set r249 , 1
// allocate_stack - current: 113 size: 1
Set r246 , 1
Add r254 , r246
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 113, size: 1, data_type: Bool }
Set r244 , 0
Set r243 , 113
Add r243 , r255
Add r243 , r244
Write r243 , r249
// write_register- end
// read_register- self: Data { stack_frame_offset: 113, size: 1, data_type: Bool }
Set r244 , 0
Set r245 , 113
Add r245 , r255
Add r245 , r244
Read r247 , r245
// read_register- end
Not r247
RSet r248 , :while_end22
RJmpc r248 , r247
// while loop contents:
Halt

// handle number
Set r245 , 0
// allocate_stack - current: 114 size: 1
Set r244 , 1
Add r254 , r244
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 114, size: 1, data_type: U32 }
Set r242 , 0
Set r241 , 114
Add r241 , r255
Add r241 , r242
Write r241 , r245
// write_register- end
// handle number end
// allocate_stack - current: 115 size: 6
Set r242 , 6
Add r254 , r242
// alloc_stack - end
Set r241 , 5
// write_register- self: Data { stack_frame_offset: 115, size: 6, data_type: Array { inside: Char, len: 5 } }
Set r240 , 0
Set r239 , 115
Add r239 , r255
Add r239 , r240
Write r239 , r241
// write_register- end
Set r241 , 67
// write_register- self: Data { stack_frame_offset: 115, size: 6, data_type: Array { inside: Char, len: 5 } }
Set r240 , 1
Set r243 , 115
Add r243 , r255
Add r243 , r240
Write r243 , r241
// write_register- end
Set r241 , 108
// write_register- self: Data { stack_frame_offset: 115, size: 6, data_type: Array { inside: Char, len: 5 } }
Set r240 , 2
Set r239 , 115
Add r239 , r255
Add r239 , r240
Write r239 , r241
// write_register- end
Set r241 , 111
// write_register- self: Data { stack_frame_offset: 115, size: 6, data_type: Array { inside: Char, len: 5 } }
Set r240 , 3
Set r243 , 115
Add r243 , r255
Add r243 , r240
Write r243 , r241
// write_register- end
Set r241 , 99
// write_register- self: Data { stack_frame_offset: 115, size: 6, data_type: Array { inside: Char, len: 5 } }
Set r240 , 4
Set r239 , 115
Add r239 , r255
Add r239 , r240
Write r239 , r241
// write_register- end
Set r241 , 107
// write_register- self: Data { stack_frame_offset: 115, size: 6, data_type: Array { inside: Char, len: 5 } }
Set r240 , 5
Set r243 , 115
Add r243 , r255
Add r243 , r240
Write r243 , r241
// write_register- end
// allocate_stack - current: 121 size: 1
Set r243 , 1
Add r254 , r243
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 114, size: 1, data_type: U32 }
Set r238 , 0
Set r237 , 114
Add r237 , r255
Add r237 , r238
Read r240 , r237
// read_register- end
// read_addr_of_self
Set r237 , 115
Add r237 , r255
// read_addr_of_self - end
// read_addr_of_self
Set r238 , 121
Add r238 , r255
// read_addr_of_self - end
Syscall r240 , r237 , r238
// write_register- self: Data { stack_frame_offset: 121, size: 1, data_type: U32 }
Set r236 , 0
Set r235 , 121
Add r235 , r255
Add r235 , r236
Write r235 , r238
// write_register- end

// while loop contents - end
RSet r248 , :while_start21
RJmp r248
:while_end22
// read_register- self: Data { stack_frame_offset: 112, size: 1, data_type: U32 }
Set r240 , 0
Set r238 , 112
Add r238 , r255
Add r238 , r240
Read r254 , r238
// read_register- end
// function: Function { is_interrupt_function: false, name: "print_chars", input: [FunctionInputData { name: "text", data_type: Reference { inside: Array { inside: U32, len: 0 }, offset_of_data_from_reference_addr: 0 }, stack_frame_offset: -2 }], output: None, label_name: "function_print_chars_1" }
:function_print_chars_1
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
// allocate_stack - current: 2 size: 1
Set r245 , 1
Add r254 , r245
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: Reference { inside: Array { inside: U32, len: 0 }, offset_of_data_from_reference_addr: 0 } }
Set r244 , 0
Set r243 , 4294967294
Add r243 , r255
Read r243 , r243
Set r247 , 0
Add r243 , r247
Add r243 , r244
Read r246 , r243
// read_register- end
// write_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r244 , 0
Set r247 , 2
Add r247 , r255
Add r247 , r244
Write r247 , r246
// write_register- end
// assign_new_variable - end

// allocate_stack - current: 3 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r248 , 0
Set r247 , 3
Add r247 , r255
Add r247 , r248
Write r247 , r254
// write_register- end
// allocate_stack - current: 4 size: 1
Set r245 , 1
Add r254 , r245
// alloc_stack - end
// handle number
Set r244 , 0
// allocate_stack - current: 5 size: 1
Set r243 , 1
Add r254 , r243
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r241 , 0
Set r240 , 5
Add r240 , r255
Add r240 , r241
Write r240 , r244
// write_register- end
// handle number end
// read_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r241 , 0
Set r242 , 5
Add r242 , r255
Add r242 , r241
Read r248 , r242
// read_register- end
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r241 , 0
Set r240 , 2
Add r240 , r255
Add r240 , r241
Read r246 , r240
// read_register- end
Set r247 , 1
Sub r248 , r247
:for_start23
Set r247 , 1
Add r248 , r247
Gte r248 , r246 , r247
RSet r249 , :for_end24
RJmpc r249 , r247
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r241 , 0
Set r242 , 4
Add r242 , r255
Add r242 , r241
Write r242 , r248
// write_register- end
// for loop contents:
// index_array
// index_array - var:Data { stack_frame_offset: -2, size: 1, data_type: Reference { inside: Array { inside: U32, len: 0 }, offset_of_data_from_reference_addr: 0 } }
// allocate_stack - current: 6 size: 1
Set r240 , 1
Add r254 , r240
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r237 , 0
Set r236 , 4
Add r236 , r255
Add r236 , r237
Read r239 , r236
// read_register- end
Set r237 , 4294967294
// array indexing- var_to_index.is_reference: true
Cp r238 , r239
Set r236 , 1
Mul r238 , r236
// add 1 offset to account for 1'st register holding size of array
Set r236 , 1
Add r238 , r236
// read_addr_of_register - self: Data { stack_frame_offset: -2, size: 1, data_type: Reference { inside: Array { inside: U32, len: 0 }, offset_of_data_from_reference_addr: 0 } }
Set r236 , 4294967294
Add r236 , r255
Read r236 , r236
Set r235 , 0
Add r236 , r235
Add r236 , r238
// read_addr_of_register - end
// index_array: read_addr_of_register - end addr_register:236 , offset_register:238
// write_directly_to_reference_pointer - 235, input: r236
Set r235 , 6
Add r235 , r255
Write r235 , r236
// write_directly_to_reference_pointer - end
// index_array - end
Set r242 , 0
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r238 , 0
Set r236 , 6
Add r236 , r255
Read r236 , r236
Set r237 , 0
Add r236 , r237
Add r236 , r238
Read r241 , r236
// read_register- end
Phrp r242 , r241

// for loop contents - end
RSet r249 , :for_start23
RJmp r249
:for_end24
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r242 , 0
Set r236 , 3
Add r236 , r255
Add r236 , r242
Read r254 , r236
// read_register- end
// allocate_stack - current: 4 size: 2
Set r247 , 2
Add r254 , r247
// alloc_stack - end
Set r248 , 1
// write_register- self: Data { stack_frame_offset: 4, size: 2, data_type: Array { inside: Char, len: 1 } }
Set r245 , 0
Set r244 , 4
Add r244 , r255
Add r244 , r245
Write r244 , r248
// write_register- end
Set r248 , 10
// write_register- self: Data { stack_frame_offset: 4, size: 2, data_type: Array { inside: Char, len: 1 } }
Set r245 , 1
Set r246 , 4
Add r246 , r255
Add r246 , r245
Write r246 , r248
// write_register- end
Set r250 , 0
// read_register- self: Data { stack_frame_offset: 4, size: 2, data_type: Array { inside: Char, len: 1 } }
Set r245 , 0
Set r244 , 4
Add r244 , r255
Add r244 , r245
Read r249 , r244
// read_register- end
Phrp r250 , r249
// read_register- self: Data { stack_frame_offset: 4, size: 2, data_type: Array { inside: Char, len: 1 } }
Set r245 , 1
Set r246 , 4
Add r246 , r255
Add r246 , r245
Read r249 , r246
// read_register- end
Phrp r250 , r249

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
// function: Function { is_interrupt_function: false, name: "panic", input: [FunctionInputData { name: "text", data_type: Reference { inside: Array { inside: U32, len: 0 }, offset_of_data_from_reference_addr: 0 }, stack_frame_offset: -2 }], output: None, label_name: "function_panic_2" }
:function_panic_2
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
// call_function_code
// function.input.is_empty(), 0, 3
// call_function_code - needed_stack: 3
// allocate_stack - current: 2 size: 3
Set r246 , 3
Add r254 , r246
// alloc_stack - end
// call_function_code - handle reference variable
Set r247 , 4294967294
Add r247 , r254
// read_referenced_address
Set r244 , 4294967294
Add r244 , r255
Read r244 , r244
Set r242 , 0
Add r244 , r242
// read_referenced_address - end
Write r247 , r244
// call_function_code - handle reference variable, end
RSet r244 , :function-return25
Add r244 , r251
Set r242 , 0
Sub r244 , r242
Write r254 , r244
RSet r247 , :function_print_chars_1
RJmp r247
:function-return25
// function call output: None
// function call converted output data : None

Halt

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
// function: Function { is_interrupt_function: false, name: "core_deallocate", input: [FunctionInputData { name: "addr", data_type: U32, stack_frame_offset: -2 }, FunctionInputData { name: "size_raw", data_type: U32, stack_frame_offset: -3 }], output: None, label_name: "function_core_deallocate_3" }
:function_core_deallocate_3
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
// call_function_code
// call_function_code - needed_stack: 4
// allocate_stack - current: 2 size: 4
Set r246 , 4
Add r254 , r246
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: -3, size: 1, data_type: U32 }
Set r241 , 0
Set r240 , 4294967293
Add r240 , r255
Add r240 , r241
Read r244 , r240
// read_register- end
Set r247 , 4294967294
Add r247 , r254
Write r247 , r244
RSet r244 , :function-return26
Add r244 , r251
Set r240 , 0
Sub r244 , r240
Write r254 , r244
RSet r247 , :function_ceil_log2_7
RJmp r247
:function-return26
// function call output: Some(FunctionInputData { name: "ceil_log2", data_type: U32, stack_frame_offset: -3 })
// function call converted output data : Some(Data { stack_frame_offset: 3, size: 1, data_type: U32 })
// assign_new_variable - end

// assign_new_variable
// access_static_variable
// allocate_stack - current: 6 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
RSet r249 , :min_heap_size_pow_2
Add r249 , r251
Set r248 , 0
Sub r249 , r248
// write_directly_to_reference_pointer - 247, input: r249
Set r247 , 6
Add r247 , r255
Write r247 , r249
// write_directly_to_reference_pointer - end
// access_static_variable-end
// assign_new_variable - end

// assign_new_variable
// handle_binary_expr
// call_function_code
// call_function_code - needed_stack: 5
// allocate_stack - current: 7 size: 5
Set r249 , 5
Add r254 , r249
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r244 , 0
Set r243 , 6
Add r243 , r255
Read r243 , r243
Set r245 , 0
Add r243 , r245
Add r243 , r244
Read r247 , r243
// read_register- end
Set r248 , 4294967294
Add r248 , r254
Write r248 , r247
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r244 , 0
Set r245 , 3
Add r245 , r255
Add r245 , r244
Read r247 , r245
// read_register- end
Set r248 , 4294967293
Add r248 , r254
Write r248 , r247
RSet r247 , :function-return27
Add r247 , r251
Set r245 , 0
Sub r247 , r245
Write r254 , r247
RSet r248 , :function_max_6
RJmp r248
:function-return27
// function call output: Some(FunctionInputData { name: "max", data_type: U32, stack_frame_offset: -4 })
// function call converted output data : Some(Data { stack_frame_offset: 8, size: 1, data_type: U32 })
// allocate_stack - current: 12 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
// handle_binary_expr - output_register- r246
// read_register- self: Data { stack_frame_offset: 8, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 8
Add r242 , r255
Add r242 , r243
Read r247 , r242
// read_register- end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r243 , 0
Set r244 , 6
Add r244 , r255
Read r244 , r244
Set r242 , 0
Add r244 , r242
Add r244 , r243
Read r248 , r244
// read_register- end
Sub r247 , r248
Cp r246 , r247
// write_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 12
Add r242 , r255
Add r242 , r243
Write r242 , r246
// write_register- end
// handle_binary_expr - end
// assign_new_variable - end

// assign_new_variable
// handle_binary_expr
// handle number
Set r250 , 2
// allocate_stack - current: 13 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 13, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 13
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// handle number end
// handle_binary_expr
// handle_binary_expr
// allocate_stack - current: 14 size: 1
Set r245 , 1
Add r254 , r245
// alloc_stack - end
// handle_binary_expr - output_register- r246
// read_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 12
Add r242 , r255
Add r242 , r243
Read r247 , r242
// read_register- end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r243 , 0
Set r244 , 6
Add r244 , r255
Read r244 , r244
Set r242 , 0
Add r244 , r242
Add r244 , r243
Read r248 , r244
// read_register- end
Add r247 , r248
Cp r246 , r247
// write_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 14
Add r242 , r255
Add r242 , r243
Write r242 , r246
// write_register- end
// handle_binary_expr - end
// handle number
Set r246 , 1
// allocate_stack - current: 15 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 15, size: 1, data_type: U32 }
Set r242 , 0
Set r243 , 15
Add r243 , r255
Add r243 , r242
Write r243 , r246
// write_register- end
// handle number end
// allocate_stack - current: 16 size: 1
Set r244 , 1
Add r254 , r244
// alloc_stack - end
// handle_binary_expr - output_register- r243
// read_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r240 , 0
Set r239 , 14
Add r239 , r255
Add r239 , r240
Read r242 , r239
// read_register- end
// read_register- self: Data { stack_frame_offset: 15, size: 1, data_type: U32 }
Set r240 , 0
Set r241 , 15
Add r241 , r255
Add r241 , r240
Read r247 , r241
// read_register- end
Sub r242 , r247
Cp r243 , r242
// write_register- self: Data { stack_frame_offset: 16, size: 1, data_type: U32 }
Set r240 , 0
Set r239 , 16
Add r239 , r255
Add r239 , r240
Write r239 , r243
// write_register- end
// handle_binary_expr - end
// allocate_stack - current: 17 size: 1
Set r239 , 1
Add r254 , r239
// alloc_stack - end
// handle_binary_expr - output_register- r243
// read_register- self: Data { stack_frame_offset: 13, size: 1, data_type: U32 }
Set r241 , 0
Set r238 , 13
Add r238 , r255
Add r238 , r241
Read r247 , r238
// read_register- end
// read_register- self: Data { stack_frame_offset: 16, size: 1, data_type: U32 }
Set r241 , 0
Set r240 , 16
Add r240 , r255
Add r240 , r241
Read r242 , r240
// read_register- end
Shl r247 , r242
Cp r243 , r247
// write_register- self: Data { stack_frame_offset: 17, size: 1, data_type: U32 }
Set r241 , 0
Set r238 , 17
Add r238 , r255
Add r238 , r241
Write r238 , r243
// write_register- end
// handle_binary_expr - end
// assign_new_variable - end

// assign_new_variable
// access_static_variable
// allocate_stack - current: 18 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
RSet r249 , :free_heap_blocks_linked_lists
Add r249 , r251
Set r248 , 0
Sub r249 , r248
// write_directly_to_reference_pointer - 247, input: r249
Set r247 , 18
Add r247 , r255
Write r247 , r249
// write_directly_to_reference_pointer - end
// access_static_variable-end
// index_array
// index_array - var:Data { stack_frame_offset: 18, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
// allocate_stack - current: 19 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r245 , 0
Set r244 , 12
Add r244 , r255
Add r244 , r245
Read r247 , r244
// read_register- end
Set r245 , 18
// array indexing- var_to_index.is_reference: true
Cp r246 , r247
Set r244 , 1
Mul r246 , r244
// add 1 offset to account for 1'st register holding size of array
Set r244 , 1
Add r246 , r244
// read_addr_of_register - self: Data { stack_frame_offset: 18, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r244 , 18
Add r244 , r255
Read r244 , r244
Set r243 , 0
Add r244 , r243
Add r244 , r246
// read_addr_of_register - end
// index_array: read_addr_of_register - end addr_register:244 , offset_register:246
// write_directly_to_reference_pointer - 243, input: r244
Set r243 , 19
Add r243 , r255
Write r243 , r244
// write_directly_to_reference_pointer - end
// index_array - end
// assign_new_variable - end

// assign_new_variable
// direct_reference_access
// allocate_stack - current: 20 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
// direct_reference_access - handle_inside_expr
// direct_reference_access - handle_inside_expr- end
// read_addr_of_last_reference_in_chain -output_register - r249
Set r249 , 19
Add r249 , r255
Read r249 , r249
Set r248 , 0
Add r249 , r248
// read_addr_of_last_reference_in_chain 
// write_directly_to_reference_pointer - 248, input: r249
Set r248 , 20
Add r248 , r255
Write r248 , r249
// write_directly_to_reference_pointer - end
// direct_reference_accesss - end
// allocate_stack - current: 21 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 20, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r246 , 0
Set r245 , 20
Add r245 , r255
Read r245 , r245
Set r247 , 0
Add r245 , r247
Add r245 , r246
Read r248 , r245
// read_register- end
// write_register- self: Data { stack_frame_offset: 21, size: 1, data_type: U32 }
Set r246 , 0
Set r247 , 21
Add r247 , r255
Add r247 , r246
Write r247 , r248
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
Set r250 , 1
Add r254 , r250
// alloc_stack - end
// assignment
// assignment data: Data { stack_frame_offset: 21, size: 1, data_type: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 } }
// assignment- variable.is_reference: true data.is_reference: true 
// read_referenced_address
Set r249 , 21
Add r249 , r255
Read r249 , r249
Set r248 , 0
Add r249 , r248
// read_referenced_address - end
Set r247 , 22
Add r247 , r255
Write r247 , r249
// end assignment
// handle_struct_initialization end
// assign_new_variable - end

// assignment
// memory_access
// allocate_stack - current: 23 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 4294967294
Add r246 , r255
Add r246 , r247
Read r249 , r246
// read_register- end
// write_directly_to_reference_pointer - 247, input: r249
Set r247 , 23
Add r247 , r255
Write r247 , r249
// write_directly_to_reference_pointer - end
// memory_access- end
// assignment data: Data { stack_frame_offset: 21, size: 1, data_type: U32 }
// assignment- variable.is_reference: true data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 21, size: 1, data_type: U32 }
Set r247 , 0
Set r248 , 21
Add r248 , r255
Add r248 , r247
Read r246 , r248
// read_register- end
// write_register- self: Data { stack_frame_offset: 23, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r247 , 0
Set r249 , 23
Add r249 , r255
Read r249 , r249
Set r248 , 0
Add r249 , r248
Add r249 , r247
Write r249 , r246
// write_register- end
// end assignment

// assignment
// direct_reference_access
// allocate_stack - current: 24 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
// direct_reference_access - handle_inside_expr
// access_static_variable
// allocate_stack - current: 25 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
RSet r248 , :free_heap_blocks_linked_lists
Add r248 , r251
Set r247 , 0
Sub r248 , r247
// write_directly_to_reference_pointer - 246, input: r248
Set r246 , 25
Add r246 , r255
Write r246 , r248
// write_directly_to_reference_pointer - end
// access_static_variable-end
// index_array
// index_array - var:Data { stack_frame_offset: 25, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
// allocate_stack - current: 26 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r244 , 0
Set r243 , 12
Add r243 , r255
Add r243 , r244
Read r246 , r243
// read_register- end
Set r244 , 25
// array indexing- var_to_index.is_reference: true
Cp r245 , r246
Set r243 , 1
Mul r245 , r243
// add 1 offset to account for 1'st register holding size of array
Set r243 , 1
Add r245 , r243
// read_addr_of_register - self: Data { stack_frame_offset: 25, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r243 , 25
Add r243 , r255
Read r243 , r243
Set r242 , 0
Add r243 , r242
Add r243 , r245
// read_addr_of_register - end
// index_array: read_addr_of_register - end addr_register:243 , offset_register:245
// write_directly_to_reference_pointer - 242, input: r243
Set r242 , 26
Add r242 , r255
Write r242 , r243
// write_directly_to_reference_pointer - end
// index_array - end
// direct_reference_access - handle_inside_expr- end
// read_addr_of_last_reference_in_chain -output_register - r244
Set r244 , 26
Add r244 , r255
Read r244 , r244
Set r245 , 0
Add r244 , r245
// read_addr_of_last_reference_in_chain 
// write_directly_to_reference_pointer - 245, input: r244
Set r245 , 24
Add r245 , r255
Write r245 , r244
// write_directly_to_reference_pointer - end
// direct_reference_accesss - end
// assignment data: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
// assignment- variable.is_reference: true data.is_reference: false 
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r243 , 0
Set r246 , 4294967294
Add r246 , r255
Add r246 , r243
Read r244 , r246
// read_register- end
// write_register- self: Data { stack_frame_offset: 24, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r243 , 0
Set r245 , 24
Add r245 , r255
Read r245 , r245
Set r246 , 0
Add r245 , r246
Add r245 , r243
Write r245 , r244
// write_register- end
// end assignment

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
// function: Function { is_interrupt_function: false, name: "core_allocate", input: [FunctionInputData { name: "size", data_type: U32, stack_frame_offset: -2 }], output: Some(FunctionInputData { name: "core_allocate", data_type: U32, stack_frame_offset: -3 }), label_name: "function_core_allocate_4" }
:function_core_allocate_4
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
// call_function_code
// call_function_code - needed_stack: 4
// allocate_stack - current: 2 size: 4
Set r246 , 4
Add r254 , r246
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r241 , 0
Set r240 , 4294967294
Add r240 , r255
Add r240 , r241
Read r244 , r240
// read_register- end
Set r247 , 4294967294
Add r247 , r254
Write r247 , r244
RSet r244 , :function-return28
Add r244 , r251
Set r240 , 0
Sub r244 , r240
Write r254 , r244
RSet r247 , :function_ceil_log2_7
RJmp r247
:function-return28
// function call output: Some(FunctionInputData { name: "ceil_log2", data_type: U32, stack_frame_offset: -3 })
// function call converted output data : Some(Data { stack_frame_offset: 3, size: 1, data_type: U32 })
// assign_new_variable - end

// assign_new_variable
// access_static_variable
// allocate_stack - current: 6 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
RSet r249 , :min_heap_size_pow_2
Add r249 , r251
Set r248 , 0
Sub r249 , r248
// write_directly_to_reference_pointer - 247, input: r249
Set r247 , 6
Add r247 , r255
Write r247 , r249
// write_directly_to_reference_pointer - end
// access_static_variable-end
// assign_new_variable - end

// assign_new_variable
// access_static_variable
// allocate_stack - current: 7 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
RSet r249 , :max_heap_size_pow_2
Add r249 , r251
Set r248 , 0
Sub r249 , r248
// write_directly_to_reference_pointer - 247, input: r249
Set r247 , 7
Add r247 , r255
Write r247 , r249
// write_directly_to_reference_pointer - end
// access_static_variable-end
// assign_new_variable - end

// if- condition: Binary { left: Identifier("size_log2", DebugData { line: 43, file: "allocator.tip" }), operator: Token { kind: Greater, value: ">", line: 43 }, right: Identifier("max", DebugData { line: 43, file: "allocator.tip" }), debug_data: DebugData { line: 43, file: "allocator.tip" } }
// allocate_stack - current: 8 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 8, size: 1, data_type: U32 }
Set r248 , 0
Set r247 , 8
Add r247 , r255
Add r247 , r248
Write r247 , r254
// write_register- end
// if condition data
// handle_binary_expr
// allocate_stack - current: 9 size: 1
Set r246 , 1
Add r254 , r246
// alloc_stack - end
// handle_binary_expr - output_register- r247
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r244 , 0
Set r243 , 3
Add r243 , r255
Add r243 , r244
Read r248 , r243
// read_register- end
// read_register- self: Data { stack_frame_offset: 7, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r244 , 0
Set r245 , 7
Add r245 , r255
Read r245 , r245
Set r243 , 0
Add r245 , r243
Add r245 , r244
Read r249 , r245
// read_register- end
Gt r248 , r249 , r247
// write_register- self: Data { stack_frame_offset: 9, size: 1, data_type: Bool }
Set r244 , 0
Set r243 , 9
Add r243 , r255
Add r243 , r244
Write r243 , r247
// write_register- end
// handle_binary_expr - end
// read condition
// read_register- self: Data { stack_frame_offset: 9, size: 1, data_type: Bool }
Set r248 , 0
Set r243 , 9
Add r243 , r255
Add r243 , r248
Read r247 , r243
// read_register- end
Not r247
RSet r243 , :if30
RJmpc r243 , r247
// if contents
// allocate_stack - current: 10 size: 21
Set r249 , 21
Add r254 , r249
// alloc_stack - end
Set r248 , 20
// write_register- self: Data { stack_frame_offset: 10, size: 21, data_type: Array { inside: Char, len: 20 } }
Set r245 , 0
Set r242 , 10
Add r242 , r255
Add r242 , r245
Write r242 , r248
// write_register- end
Set r248 , 97
// write_register- self: Data { stack_frame_offset: 10, size: 21, data_type: Array { inside: Char, len: 20 } }
Set r245 , 1
Set r244 , 10
Add r244 , r255
Add r244 , r245
Write r244 , r248
// write_register- end
Set r248 , 108
// write_register- self: Data { stack_frame_offset: 10, size: 21, data_type: Array { inside: Char, len: 20 } }
Set r245 , 2
Set r242 , 10
Add r242 , r255
Add r242 , r245
Write r242 , r248
// write_register- end
Set r248 , 108
// write_register- self: Data { stack_frame_offset: 10, size: 21, data_type: Array { inside: Char, len: 20 } }
Set r245 , 3
Set r244 , 10
Add r244 , r255
Add r244 , r245
Write r244 , r248
// write_register- end
Set r248 , 111
// write_register- self: Data { stack_frame_offset: 10, size: 21, data_type: Array { inside: Char, len: 20 } }
Set r245 , 4
Set r242 , 10
Add r242 , r255
Add r242 , r245
Write r242 , r248
// write_register- end
Set r248 , 99
// write_register- self: Data { stack_frame_offset: 10, size: 21, data_type: Array { inside: Char, len: 20 } }
Set r245 , 5
Set r244 , 10
Add r244 , r255
Add r244 , r245
Write r244 , r248
// write_register- end
Set r248 , 32
// write_register- self: Data { stack_frame_offset: 10, size: 21, data_type: Array { inside: Char, len: 20 } }
Set r245 , 6
Set r242 , 10
Add r242 , r255
Add r242 , r245
Write r242 , r248
// write_register- end
Set r248 , 108
// write_register- self: Data { stack_frame_offset: 10, size: 21, data_type: Array { inside: Char, len: 20 } }
Set r245 , 7
Set r244 , 10
Add r244 , r255
Add r244 , r245
Write r244 , r248
// write_register- end
Set r248 , 111
// write_register- self: Data { stack_frame_offset: 10, size: 21, data_type: Array { inside: Char, len: 20 } }
Set r245 , 8
Set r242 , 10
Add r242 , r255
Add r242 , r245
Write r242 , r248
// write_register- end
Set r248 , 110
// write_register- self: Data { stack_frame_offset: 10, size: 21, data_type: Array { inside: Char, len: 20 } }
Set r245 , 9
Set r244 , 10
Add r244 , r255
Add r244 , r245
Write r244 , r248
// write_register- end
Set r248 , 103
// write_register- self: Data { stack_frame_offset: 10, size: 21, data_type: Array { inside: Char, len: 20 } }
Set r245 , 10
Set r242 , 10
Add r242 , r255
Add r242 , r245
Write r242 , r248
// write_register- end
Set r248 , 32
// write_register- self: Data { stack_frame_offset: 10, size: 21, data_type: Array { inside: Char, len: 20 } }
Set r245 , 11
Set r244 , 10
Add r244 , r255
Add r244 , r245
Write r244 , r248
// write_register- end
Set r248 , 108
// write_register- self: Data { stack_frame_offset: 10, size: 21, data_type: Array { inside: Char, len: 20 } }
Set r245 , 12
Set r242 , 10
Add r242 , r255
Add r242 , r245
Write r242 , r248
// write_register- end
Set r248 , 111
// write_register- self: Data { stack_frame_offset: 10, size: 21, data_type: Array { inside: Char, len: 20 } }
Set r245 , 13
Set r244 , 10
Add r244 , r255
Add r244 , r245
Write r244 , r248
// write_register- end
Set r248 , 110
// write_register- self: Data { stack_frame_offset: 10, size: 21, data_type: Array { inside: Char, len: 20 } }
Set r245 , 14
Set r242 , 10
Add r242 , r255
Add r242 , r245
Write r242 , r248
// write_register- end
Set r248 , 103
// write_register- self: Data { stack_frame_offset: 10, size: 21, data_type: Array { inside: Char, len: 20 } }
Set r245 , 15
Set r244 , 10
Add r244 , r255
Add r244 , r245
Write r244 , r248
// write_register- end
Set r248 , 32
// write_register- self: Data { stack_frame_offset: 10, size: 21, data_type: Array { inside: Char, len: 20 } }
Set r245 , 16
Set r242 , 10
Add r242 , r255
Add r242 , r245
Write r242 , r248
// write_register- end
Set r248 , 108
// write_register- self: Data { stack_frame_offset: 10, size: 21, data_type: Array { inside: Char, len: 20 } }
Set r245 , 17
Set r244 , 10
Add r244 , r255
Add r244 , r245
Write r244 , r248
// write_register- end
Set r248 , 111
// write_register- self: Data { stack_frame_offset: 10, size: 21, data_type: Array { inside: Char, len: 20 } }
Set r245 , 18
Set r242 , 10
Add r242 , r255
Add r242 , r245
Write r242 , r248
// write_register- end
Set r248 , 110
// write_register- self: Data { stack_frame_offset: 10, size: 21, data_type: Array { inside: Char, len: 20 } }
Set r245 , 19
Set r244 , 10
Add r244 , r255
Add r244 , r245
Write r244 , r248
// write_register- end
Set r248 , 103
// write_register- self: Data { stack_frame_offset: 10, size: 21, data_type: Array { inside: Char, len: 20 } }
Set r245 , 20
Set r242 , 10
Add r242 , r255
Add r242 , r245
Write r242 , r248
// write_register- end
// call_function_code
// function.input.is_empty(), 0, 3
// call_function_code - needed_stack: 3
// allocate_stack - current: 31 size: 3
Set r245 , 3
Add r254 , r245
// alloc_stack - end
// call_function_code - handle reference variable
Set r244 , 4294967294
Add r244 , r254
// read_addr_of_self
Set r241 , 10
Add r241 , r255
// read_addr_of_self - end
Write r244 , r241
// call_function_code - handle reference variable, end
RSet r241 , :function-return31
Add r241 , r251
Set r239 , 0
Sub r241 , r239
Write r254 , r241
RSet r244 , :function_panic_2
RJmp r244
:function-return31
// function call output: None
// function call converted output data : None

RSet r243 , :if_chain_end29
RJmp r243
// if contents end
:if30
// read_register- self: Data { stack_frame_offset: 8, size: 1, data_type: U32 }
Set r241 , 0
Set r244 , 8
Add r244 , r255
Add r244 , r241
Read r254 , r244
// read_register- end
:if_chain_end29
// assign_new_variable
// handle_binary_expr
// call_function_code
// call_function_code - needed_stack: 5
// allocate_stack - current: 9 size: 5
Set r249 , 5
Add r254 , r249
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r244 , 0
Set r243 , 6
Add r243 , r255
Read r243 , r243
Set r245 , 0
Add r243 , r245
Add r243 , r244
Read r247 , r243
// read_register- end
Set r248 , 4294967294
Add r248 , r254
Write r248 , r247
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r244 , 0
Set r245 , 3
Add r245 , r255
Add r245 , r244
Read r247 , r245
// read_register- end
Set r248 , 4294967293
Add r248 , r254
Write r248 , r247
RSet r247 , :function-return32
Add r247 , r251
Set r245 , 0
Sub r247 , r245
Write r254 , r247
RSet r248 , :function_max_6
RJmp r248
:function-return32
// function call output: Some(FunctionInputData { name: "max", data_type: U32, stack_frame_offset: -4 })
// function call converted output data : Some(Data { stack_frame_offset: 10, size: 1, data_type: U32 })
// allocate_stack - current: 14 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
// handle_binary_expr - output_register- r246
// read_register- self: Data { stack_frame_offset: 10, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 10
Add r242 , r255
Add r242 , r243
Read r247 , r242
// read_register- end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r243 , 0
Set r244 , 6
Add r244 , r255
Read r244 , r244
Set r242 , 0
Add r244 , r242
Add r244 , r243
Read r248 , r244
// read_register- end
Sub r247 , r248
Cp r246 , r247
// write_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 14
Add r242 , r255
Add r242 , r243
Write r242 , r246
// write_register- end
// handle_binary_expr - end
// assign_new_variable - end

// assign_new_variable
// access_static_variable
// allocate_stack - current: 15 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
RSet r249 , :free_heap_blocks_linked_lists
Add r249 , r251
Set r248 , 0
Sub r249 , r248
// write_directly_to_reference_pointer - 247, input: r249
Set r247 , 15
Add r247 , r255
Write r247 , r249
// write_directly_to_reference_pointer - end
// access_static_variable-end
// index_array
// index_array - var:Data { stack_frame_offset: 15, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
// allocate_stack - current: 16 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r245 , 0
Set r244 , 14
Add r244 , r255
Add r244 , r245
Read r247 , r244
// read_register- end
Set r245 , 15
// array indexing- var_to_index.is_reference: true
Cp r246 , r247
Set r244 , 1
Mul r246 , r244
// add 1 offset to account for 1'st register holding size of array
Set r244 , 1
Add r246 , r244
// read_addr_of_register - self: Data { stack_frame_offset: 15, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r244 , 15
Add r244 , r255
Read r244 , r244
Set r243 , 0
Add r244 , r243
Add r244 , r246
// read_addr_of_register - end
// index_array: read_addr_of_register - end addr_register:244 , offset_register:246
// write_directly_to_reference_pointer - 243, input: r244
Set r243 , 16
Add r243 , r255
Write r243 , r244
// write_directly_to_reference_pointer - end
// index_array - end
// assign_new_variable - end

// assign_new_variable
// direct_reference_access
// allocate_stack - current: 17 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
// direct_reference_access - handle_inside_expr
// direct_reference_access - handle_inside_expr- end
// read_addr_of_last_reference_in_chain -output_register - r249
Set r249 , 16
Add r249 , r255
Read r249 , r249
Set r248 , 0
Add r249 , r248
// read_addr_of_last_reference_in_chain 
// write_directly_to_reference_pointer - 248, input: r249
Set r248 , 17
Add r248 , r255
Write r248 , r249
// write_directly_to_reference_pointer - end
// direct_reference_accesss - end
// allocate_stack - current: 18 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 17, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r246 , 0
Set r245 , 17
Add r245 , r255
Read r245 , r245
Set r247 , 0
Add r245 , r247
Add r245 , r246
Read r248 , r245
// read_register- end
// write_register- self: Data { stack_frame_offset: 18, size: 1, data_type: U32 }
Set r246 , 0
Set r247 , 18
Add r247 , r255
Add r247 , r246
Write r247 , r248
// write_register- end
// assign_new_variable - end

// if- condition: Binary { left: Identifier("addr", DebugData { line: 50, file: "allocator.tip" }), operator: Token { kind: Equals, value: "==", line: 50 }, right: Number(0, DebugData { line: 50, file: "allocator.tip" }), debug_data: DebugData { line: 50, file: "allocator.tip" } }
// allocate_stack - current: 19 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 19, size: 1, data_type: U32 }
Set r248 , 0
Set r247 , 19
Add r247 , r255
Add r247 , r248
Write r247 , r254
// write_register- end
// if condition data
// handle_binary_expr
// handle number
Set r247 , 0
// allocate_stack - current: 20 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: U32 }
Set r246 , 0
Set r245 , 20
Add r245 , r255
Add r245 , r246
Write r245 , r247
// write_register- end
// handle number end
// allocate_stack - current: 21 size: 1
Set r244 , 1
Add r254 , r244
// alloc_stack - end
// handle_binary_expr - output_register- r245
// read_register- self: Data { stack_frame_offset: 18, size: 1, data_type: U32 }
Set r242 , 0
Set r241 , 18
Add r241 , r255
Add r241 , r242
Read r246 , r241
// read_register- end
// read_register- self: Data { stack_frame_offset: 20, size: 1, data_type: U32 }
Set r242 , 0
Set r243 , 20
Add r243 , r255
Add r243 , r242
Read r249 , r243
// read_register- end
Eq r246 , r249 , r245
// write_register- self: Data { stack_frame_offset: 21, size: 1, data_type: Bool }
Set r242 , 0
Set r241 , 21
Add r241 , r255
Add r241 , r242
Write r241 , r245
// write_register- end
// handle_binary_expr - end
// read condition
// read_register- self: Data { stack_frame_offset: 21, size: 1, data_type: Bool }
Set r246 , 0
Set r241 , 21
Add r241 , r255
Add r241 , r246
Read r245 , r241
// read_register- end
Not r245
RSet r241 , :if34
RJmpc r241 , r245
// if contents
// assignment
// call_function_code
// call_function_code - needed_stack: 4
// allocate_stack - current: 22 size: 4
Set r249 , 4
Add r254 , r249
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r238 , 0
Set r237 , 14
Add r237 , r255
Add r237 , r238
Read r243 , r237
// read_register- end
Set r242 , 4294967294
Add r242 , r254
Write r242 , r243
RSet r243 , :function-return35
Add r243 , r251
Set r237 , 0
Sub r243 , r237
Write r254 , r243
RSet r242 , :function_allocate_new_block_of_memory_from_main_pool_5
RJmp r242
:function-return35
// function call output: Some(FunctionInputData { name: "allocate_new_block_of_memory_from_main_pool", data_type: U32, stack_frame_offset: -3 })
// function call converted output data : Some(Data { stack_frame_offset: 23, size: 1, data_type: U32 })
// assignment data: Data { stack_frame_offset: 23, size: 1, data_type: U32 }
// assignment- variable.is_reference: false data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 23, size: 1, data_type: U32 }
Set r242 , 0
Set r246 , 23
Add r246 , r255
Add r246 , r242
Read r240 , r246
// read_register- end
// write_register- self: Data { stack_frame_offset: 18, size: 1, data_type: U32 }
Set r242 , 0
Set r243 , 18
Add r243 , r255
Add r243 , r242
Write r243 , r240
// write_register- end
// end assignment

RSet r241 , :if_chain_end33
RJmp r241
// if contents end
:if34
// read_register- self: Data { stack_frame_offset: 19, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 19
Add r242 , r255
Add r242 , r243
Read r254 , r242
// read_register- end
// else - condition: None
// allocate_stack - current: 20 size: 1
Set r242 , 1
Add r254 , r242
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 20, size: 1, data_type: U32 }
Set r240 , 0
Set r246 , 20
Add r246 , r255
Add r246 , r240
Write r246 , r254
// write_register- end
// else contents
// assign_new_variable
// memory_access
// allocate_stack - current: 21 size: 1
Set r243 , 1
Add r254 , r243
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 18, size: 1, data_type: U32 }
Set r236 , 0
Set r235 , 18
Add r235 , r255
Add r235 , r236
Read r238 , r235
// read_register- end
// write_directly_to_reference_pointer - 236, input: r238
Set r236 , 21
Add r236 , r255
Write r236 , r238
// write_directly_to_reference_pointer - end
// memory_access- end
// assign_new_variable - end

// assign_new_variable
// access_static_variable
// allocate_stack - current: 22 size: 1
Set r235 , 1
Add r254 , r235
// alloc_stack - end
RSet r238 , :free_heap_blocks_linked_lists
Add r238 , r251
Set r236 , 0
Sub r238 , r236
// write_directly_to_reference_pointer - 239, input: r238
Set r239 , 22
Add r239 , r255
Write r239 , r238
// write_directly_to_reference_pointer - end
// access_static_variable-end
// index_array
// index_array - var:Data { stack_frame_offset: 22, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
// allocate_stack - current: 23 size: 1
Set r238 , 1
Add r254 , r238
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r233 , 0
Set r232 , 14
Add r232 , r255
Add r232 , r233
Read r239 , r232
// read_register- end
Set r233 , 22
// array indexing- var_to_index.is_reference: true
Cp r234 , r239
Set r232 , 1
Mul r234 , r232
// add 1 offset to account for 1'st register holding size of array
Set r232 , 1
Add r234 , r232
// read_addr_of_register - self: Data { stack_frame_offset: 22, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r232 , 22
Add r232 , r255
Read r232 , r232
Set r231 , 0
Add r232 , r231
Add r232 , r234
// read_addr_of_register - end
// index_array: read_addr_of_register - end addr_register:232 , offset_register:234
// write_directly_to_reference_pointer - 231, input: r232
Set r231 , 23
Add r231 , r255
Write r231 , r232
// write_directly_to_reference_pointer - end
// index_array - end
// assign_new_variable - end

// assignment
// access_static_variable
// allocate_stack - current: 24 size: 1
Set r233 , 1
Add r254 , r233
// alloc_stack - end
RSet r234 , :free_heap_blocks_linked_lists
Add r234 , r251
Set r232 , 0
Sub r234 , r232
// write_directly_to_reference_pointer - 239, input: r234
Set r239 , 24
Add r239 , r255
Write r239 , r234
// write_directly_to_reference_pointer - end
// access_static_variable-end
// index_array
// index_array - var:Data { stack_frame_offset: 24, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
// allocate_stack - current: 25 size: 1
Set r234 , 1
Add r254 , r234
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r230 , 0
Set r229 , 14
Add r229 , r255
Add r229 , r230
Read r239 , r229
// read_register- end
Set r230 , 24
// array indexing- var_to_index.is_reference: true
Cp r231 , r239
Set r229 , 1
Mul r231 , r229
// add 1 offset to account for 1'st register holding size of array
Set r229 , 1
Add r231 , r229
// read_addr_of_register - self: Data { stack_frame_offset: 24, size: 1, data_type: Reference { inside: Array { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, len: 8 }, offset_of_data_from_reference_addr: 0 } }
Set r229 , 24
Add r229 , r255
Read r229 , r229
Set r228 , 0
Add r229 , r228
Add r229 , r231
// read_addr_of_register - end
// index_array: read_addr_of_register - end addr_register:229 , offset_register:231
// write_directly_to_reference_pointer - 228, input: r229
Set r228 , 25
Add r228 , r255
Write r228 , r229
// write_directly_to_reference_pointer - end
// index_array - end
// handle_struct_access- Data { stack_frame_offset: 16, size: 1, data_type: Reference { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, offset_of_data_from_reference_addr: 0 } } "HeapBlock"
Set r231 , 0
// read_addr_of_register - self: Data { stack_frame_offset: 16, size: 1, data_type: Reference { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, offset_of_data_from_reference_addr: 0 } }
Set r230 , 16
Add r230 , r255
Read r230 , r230
Set r229 , 0
Add r230 , r229
Read r230 , r230
Set r229 , 0
Add r230 , r229
Add r230 , r231
// read_addr_of_register - end
// allocate_stack - current: 26 size: 1
Set r229 , 1
Add r254 , r229
// alloc_stack - end
Set r231 , 26
Add r231 , r255
Write r231 , r230
// handle_struct_access- end
// assignment data: Data { stack_frame_offset: 26, size: 1, data_type: Reference { inside: Reference { inside: Struct { name: "HeapBlock" }, offset_of_data_from_reference_addr: 0 }, offset_of_data_from_reference_addr: 0 } }
// assignment- variable.is_reference: true data.is_reference: true 
// read_referenced_address
Set r231 , 26
Add r231 , r255
Read r231 , r231
Set r230 , 0
Add r231 , r230
// read_referenced_address - end
Read r231 , r231
Set r230 , 0
Add r231 , r230
// read_referenced_address - end
Set r239 , 25
Add r239 , r255
Read r239 , r239
Set r230 , 0
Add r239 , r230
Write r239 , r231
// end assignment

RSet r246 , :if_chain_end33
RJmp r246
// else contents end
:else36
// read_register- self: Data { stack_frame_offset: 20, size: 1, data_type: U32 }
Set r239 , 0
Set r230 , 20
Add r230 , r255
Add r230 , r239
Read r254 , r230
// read_register- end
:if_chain_end33
// Return
Set r249 , 4294967293
// read_register- self: Data { stack_frame_offset: 18, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 18
Add r246 , r255
Add r246 , r247
Read r250 , r246
// read_register- end
Add r249 , r255
Write r249 , r250
Cp r250 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r247 , 0
Set r248 , 1
Add r248 , r255
Add r248 , r247
Read r249 , r248
// read_register- end
Cp r255 , r249
Read r250 , r250
Jmp r250

// function: Function { is_interrupt_function: false, name: "allocate_new_block_of_memory_from_main_pool", input: [FunctionInputData { name: "size_index", data_type: U32, stack_frame_offset: -2 }], output: Some(FunctionInputData { name: "allocate_new_block_of_memory_from_main_pool", data_type: U32, stack_frame_offset: -3 }), label_name: "function_allocate_new_block_of_memory_from_main_pool_5" }
:function_allocate_new_block_of_memory_from_main_pool_5
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
// handle_binary_expr
// handle number
Set r245 , 2
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
// handle_binary_expr
// handle_binary_expr
// access_static_variable
// allocate_stack - current: 3 size: 1
Set r243 , 1
Add r254 , r243
// alloc_stack - end
RSet r244 , :min_heap_size_pow_2
Add r244 , r251
Set r247 , 0
Sub r244 , r247
// write_directly_to_reference_pointer - 242, input: r244
Set r242 , 3
Add r242 , r255
Write r242 , r244
// write_directly_to_reference_pointer - end
// access_static_variable-end
// allocate_stack - current: 4 size: 1
Set r240 , 1
Add r254 , r240
// alloc_stack - end
// handle_binary_expr - output_register- r244
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r238 , 0
Set r237 , 4294967294
Add r237 , r255
Add r237 , r238
Read r242 , r237
// read_register- end
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r238 , 0
Set r239 , 3
Add r239 , r255
Read r239 , r239
Set r237 , 0
Add r239 , r237
Add r239 , r238
Read r241 , r239
// read_register- end
Add r242 , r241
Cp r244 , r242
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r238 , 0
Set r237 , 4
Add r237 , r255
Add r237 , r238
Write r237 , r244
// write_register- end
// handle_binary_expr - end
// handle number
Set r244 , 1
// allocate_stack - current: 5 size: 1
Set r241 , 1
Add r254 , r241
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r237 , 0
Set r238 , 5
Add r238 , r255
Add r238 , r237
Write r238 , r244
// write_register- end
// handle number end
// allocate_stack - current: 6 size: 1
Set r239 , 1
Add r254 , r239
// alloc_stack - end
// handle_binary_expr - output_register- r238
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r235 , 0
Set r234 , 4
Add r234 , r255
Add r234 , r235
Read r237 , r234
// read_register- end
// read_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r235 , 0
Set r236 , 5
Add r236 , r255
Add r236 , r235
Read r242 , r236
// read_register- end
Sub r237 , r242
Cp r238 , r237
// write_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r235 , 0
Set r234 , 6
Add r234 , r255
Add r234 , r235
Write r234 , r238
// write_register- end
// handle_binary_expr - end
// allocate_stack - current: 7 size: 1
Set r234 , 1
Add r254 , r234
// alloc_stack - end
// handle_binary_expr - output_register- r238
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r236 , 0
Set r233 , 2
Add r233 , r255
Add r233 , r236
Read r242 , r233
// read_register- end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r236 , 0
Set r235 , 6
Add r235 , r255
Add r235 , r236
Read r237 , r235
// read_register- end
Shl r242 , r237
Cp r238 , r242
// write_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r236 , 0
Set r233 , 7
Add r233 , r255
Add r233 , r236
Write r233 , r238
// write_register- end
// handle_binary_expr - end
// assign_new_variable - end

// assign_new_variable
// access_static_variable
// allocate_stack - current: 8 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
RSet r249 , :heap_main_pool_head
Add r249 , r251
Set r248 , 0
Sub r249 , r248
// write_directly_to_reference_pointer - 247, input: r249
Set r247 , 8
Add r247 , r255
Write r247 , r249
// write_directly_to_reference_pointer - end
// access_static_variable-end
// assign_new_variable - end

// assign_new_variable
// allocate_stack - current: 9 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 8, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r247 , 0
Set r246 , 8
Add r246 , r255
Read r246 , r246
Set r248 , 0
Add r246 , r248
Add r246 , r247
Read r249 , r246
// read_register- end
// write_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r247 , 0
Set r248 , 9
Add r248 , r255
Add r248 , r247
Write r248 , r249
// write_register- end
// assign_new_variable - end

// assignment
// access_static_variable
// allocate_stack - current: 10 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
RSet r249 , :heap_main_pool_head
Add r249 , r251
Set r248 , 0
Sub r249 , r248
// write_directly_to_reference_pointer - 247, input: r249
Set r247 , 10
Add r247 , r255
Write r247 , r249
// write_directly_to_reference_pointer - end
// access_static_variable-end
// handle_binary_expr
// access_static_variable
// allocate_stack - current: 11 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
RSet r247 , :heap_main_pool_head
Add r247 , r251
Set r246 , 0
Sub r247 , r246
// write_directly_to_reference_pointer - 245, input: r247
Set r245 , 11
Add r245 , r255
Write r245 , r247
// write_directly_to_reference_pointer - end
// access_static_variable-end
// allocate_stack - current: 12 size: 1
Set r247 , 1
Add r254 , r247
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 7
Add r242 , r255
Add r242 , r243
Read r245 , r242
// read_register- end
// write_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r243 , 0
Set r244 , 12
Add r244 , r255
Add r244 , r243
Write r244 , r245
// write_register- end
// allocate_stack - current: 13 size: 1
Set r242 , 1
Add r254 , r242
// alloc_stack - end
// handle_binary_expr - output_register- r245
// read_register- self: Data { stack_frame_offset: 11, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r240 , 0
Set r239 , 11
Add r239 , r255
Read r239 , r239
Set r241 , 0
Add r239 , r241
Add r239 , r240
Read r244 , r239
// read_register- end
// read_register- self: Data { stack_frame_offset: 12, size: 1, data_type: U32 }
Set r240 , 0
Set r241 , 12
Add r241 , r255
Add r241 , r240
Read r243 , r241
// read_register- end
Add r244 , r243
Cp r245 , r244
// write_register- self: Data { stack_frame_offset: 13, size: 1, data_type: U32 }
Set r240 , 0
Set r239 , 13
Add r239 , r255
Add r239 , r240
Write r239 , r245
// write_register- end
// handle_binary_expr - end
// assignment data: Data { stack_frame_offset: 13, size: 1, data_type: U32 }
// assignment- variable.is_reference: true data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 13, size: 1, data_type: U32 }
Set r244 , 0
Set r239 , 13
Add r239 , r255
Add r239 , r244
Read r245 , r239
// read_register- end
// write_register- self: Data { stack_frame_offset: 10, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r244 , 0
Set r243 , 10
Add r243 , r255
Read r243 , r243
Set r239 , 0
Add r243 , r239
Add r243 , r244
Write r243 , r245
// write_register- end
// end assignment

// if- condition: Binary { left: Identifier("heap_pool_head", DebugData { line: 70, file: "allocator.tip" }), operator: Token { kind: Greater, value: ">", line: 70 }, right: FunctionCall { left: Identifier("access_static", DebugData { line: 70, file: "allocator.tip" }), values: [String("\"heap_end", DebugData { line: 70, file: "allocator.tip" })], debug_data: DebugData { line: 70, file: "allocator.tip" } }, debug_data: DebugData { line: 70, file: "allocator.tip" } }
// allocate_stack - current: 14 size: 1
Set r250 , 1
Add r254 , r250
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r248 , 0
Set r247 , 14
Add r247 , r255
Add r247 , r248
Write r247 , r254
// write_register- end
// if condition data
// handle_binary_expr
// access_static_variable
// allocate_stack - current: 15 size: 1
Set r247 , 1
Add r254 , r247
// alloc_stack - end
RSet r248 , :heap_end
Add r248 , r251
Set r249 , 0
Sub r248 , r249
// write_directly_to_reference_pointer - 246, input: r248
Set r246 , 15
Add r246 , r255
Write r246 , r248
// write_directly_to_reference_pointer - end
// access_static_variable-end
// allocate_stack - current: 16 size: 1
Set r244 , 1
Add r254 , r244
// alloc_stack - end
// handle_binary_expr - output_register- r248
// read_register- self: Data { stack_frame_offset: 8, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r242 , 0
Set r241 , 8
Add r241 , r255
Read r241 , r241
Set r243 , 0
Add r241 , r243
Add r241 , r242
Read r246 , r241
// read_register- end
// read_register- self: Data { stack_frame_offset: 15, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r242 , 0
Set r243 , 15
Add r243 , r255
Read r243 , r243
Set r241 , 0
Add r243 , r241
Add r243 , r242
Read r245 , r243
// read_register- end
Gt r246 , r245 , r248
// write_register- self: Data { stack_frame_offset: 16, size: 1, data_type: Bool }
Set r242 , 0
Set r241 , 16
Add r241 , r255
Add r241 , r242
Write r241 , r248
// write_register- end
// handle_binary_expr - end
// read condition
// read_register- self: Data { stack_frame_offset: 16, size: 1, data_type: Bool }
Set r246 , 0
Set r241 , 16
Add r241 , r255
Add r241 , r246
Read r248 , r241
// read_register- end
Not r248
RSet r241 , :if38
RJmpc r241 , r248
// if contents
// handle number
Set r242 , 251
// allocate_stack - current: 17 size: 1
Set r243 , 1
Add r254 , r243
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 17, size: 1, data_type: U32 }
Set r239 , 0
Set r238 , 17
Add r238 , r255
Add r238 , r239
Write r238 , r242
// write_register- end
// handle number end
Set r246 , 0
// read_register- self: Data { stack_frame_offset: 17, size: 1, data_type: U32 }
Set r239 , 0
Set r240 , 17
Add r240 , r255
Add r240 , r239
Read r245 , r240
// read_register- end
Phrp r246 , r245

RSet r241 , :if_chain_end37
RJmp r241
// if contents end
:if38
// read_register- self: Data { stack_frame_offset: 14, size: 1, data_type: U32 }
Set r246 , 0
Set r240 , 14
Add r240 , r255
Add r240 , r246
Read r254 , r240
// read_register- end
:if_chain_end37
// Return
Set r249 , 4294967293
// read_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 9
Add r246 , r255
Add r246 , r247
Read r250 , r246
// read_register- end
Add r249 , r255
Write r249 , r250
Cp r250 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r247 , 0
Set r248 , 1
Add r248 , r255
Add r248 , r247
Read r249 , r248
// read_register- end
Cp r255 , r249
Read r250 , r250
Jmp r250

// function: Function { is_interrupt_function: false, name: "max", input: [FunctionInputData { name: "a", data_type: U32, stack_frame_offset: -2 }, FunctionInputData { name: "b", data_type: U32, stack_frame_offset: -3 }], output: Some(FunctionInputData { name: "max", data_type: U32, stack_frame_offset: -4 }), label_name: "function_max_6" }
:function_max_6
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
// allocate_stack - current: 3 size: 1
Set r247 , 1
Add r254 , r247
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r244 , 0
Set r239 , 2
Add r239 , r255
Add r239 , r244
Read r245 , r239
// read_register- end
Not r245
// write_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r244 , 0
Set r243 , 3
Add r243 , r255
Add r243 , r244
Write r243 , r245
// write_register- end
// handle_binary_expr - end
// assign_new_variable - end

// Return
// handle_binary_expr
// handle_binary_expr
// allocate_stack - current: 4 size: 1
Set r248 , 1
Add r254 , r248
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r246 , 0
Set r245 , 3
Add r245 , r255
Add r245 , r246
Read r250 , r245
// read_register- end
Not r250
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r246 , 0
Set r247 , 4
Add r247 , r255
Add r247 , r246
Write r247 , r250
// write_register- end
// handle_binary_expr - end
// allocate_stack - current: 5 size: 1
Set r246 , 1
Add r254 , r246
// alloc_stack - end
// handle_binary_expr - output_register- r249
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r244 , 0
Set r243 , 4294967294
Add r243 , r255
Add r243 , r244
Read r250 , r243
// read_register- end
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r244 , 0
Set r245 , 4
Add r245 , r255
Add r245 , r244
Read r247 , r245
// read_register- end
And r250 , r247
Cp r249 , r250
// write_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r244 , 0
Set r243 , 5
Add r243 , r255
Add r243 , r244
Write r243 , r249
// write_register- end
// handle_binary_expr - end
// handle_binary_expr
// allocate_stack - current: 6 size: 1
Set r243 , 1
Add r254 , r243
// alloc_stack - end
// handle_binary_expr - output_register- r249
// read_register- self: Data { stack_frame_offset: -3, size: 1, data_type: U32 }
Set r245 , 0
Set r242 , 4294967293
Add r242 , r255
Add r242 , r245
Read r247 , r242
// read_register- end
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r245 , 0
Set r244 , 3
Add r244 , r255
Add r244 , r245
Read r250 , r244
// read_register- end
And r247 , r250
Cp r249 , r247
// write_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r245 , 0
Set r242 , 6
Add r242 , r255
Add r242 , r245
Write r242 , r249
// write_register- end
// handle_binary_expr - end
// allocate_stack - current: 7 size: 1
Set r242 , 1
Add r254 , r242
// alloc_stack - end
// handle_binary_expr - output_register- r249
// read_register- self: Data { stack_frame_offset: 5, size: 1, data_type: U32 }
Set r244 , 0
Set r241 , 5
Add r241 , r255
Add r241 , r244
Read r250 , r241
// read_register- end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r244 , 0
Set r245 , 6
Add r245 , r255
Add r245 , r244
Read r247 , r245
// read_register- end
Or r250 , r247
Cp r249 , r250
// write_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r244 , 0
Set r241 , 7
Add r241 , r255
Add r241 , r244
Write r241 , r249
// write_register- end
// handle_binary_expr - end
Set r247 , 4294967292
// read_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r241 , 0
Set r244 , 7
Add r244 , r255
Add r244 , r241
Read r249 , r244
// read_register- end
Add r247 , r255
Write r247 , r249
Cp r249 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r241 , 0
Set r250 , 1
Add r250 , r255
Add r250 , r241
Read r247 , r250
// read_register- end
Cp r255 , r247
Read r249 , r249
Jmp r249

// function: Function { is_interrupt_function: false, name: "ceil_log2", input: [FunctionInputData { name: "x", data_type: U32, stack_frame_offset: -2 }], output: Some(FunctionInputData { name: "ceil_log2", data_type: U32, stack_frame_offset: -3 }), label_name: "function_ceil_log2_7" }
:function_ceil_log2_7
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
Set r245 , 0
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
Set r250 , 1
// allocate_stack - current: 3 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 3
Add r246 , r255
Add r246 , r247
Write r246 , r250
// write_register- end
// handle number end
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
:while_start39
// handle_binary_expr
// allocate_stack - current: 5 size: 1
Set r244 , 1
Add r254 , r244
// alloc_stack - end
// handle_binary_expr - output_register- r249
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r242 , 0
Set r241 , 3
Add r241 , r255
Add r241 , r242
Read r246 , r241
// read_register- end
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r242 , 0
Set r243 , 4294967294
Add r243 , r255
Add r243 , r242
Read r245 , r243
// read_register- end
Lt r246 , r245 , r249
// write_register- self: Data { stack_frame_offset: 5, size: 1, data_type: Bool }
Set r242 , 0
Set r241 , 5
Add r241 , r255
Add r241 , r242
Write r241 , r249
// write_register- end
// handle_binary_expr - end
// read_register- self: Data { stack_frame_offset: 5, size: 1, data_type: Bool }
Set r245 , 0
Set r246 , 5
Add r246 , r255
Add r246 , r245
Read r247 , r246
// read_register- end
Not r247
RSet r248 , :while_end40
RJmpc r248 , r247
// while loop contents:
// assignment
// handle_binary_expr
// handle number
Set r246 , 1
// allocate_stack - current: 6 size: 1
Set r245 , 1
Add r254 , r245
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r241 , 0
Set r242 , 6
Add r242 , r255
Add r242 , r241
Write r242 , r246
// write_register- end
// handle number end
// allocate_stack - current: 7 size: 1
Set r243 , 1
Add r254 , r243
// alloc_stack - end
// handle_binary_expr - output_register- r242
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r239 , 0
Set r238 , 3
Add r238 , r255
Add r238 , r239
Read r241 , r238
// read_register- end
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: U32 }
Set r239 , 0
Set r240 , 6
Add r240 , r255
Add r240 , r239
Read r249 , r240
// read_register- end
Shl r241 , r249
Cp r242 , r241
// write_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r239 , 0
Set r238 , 7
Add r238 , r255
Add r238 , r239
Write r238 , r242
// write_register- end
// handle_binary_expr - end
// assignment data: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
// assignment- variable.is_reference: false data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r241 , 0
Set r238 , 7
Add r238 , r255
Add r238 , r241
Read r242 , r238
// read_register- end
// write_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r241 , 0
Set r249 , 3
Add r249 , r255
Add r249 , r241
Write r249 , r242
// write_register- end
// end assignment

// assignment
// handle_binary_expr
// handle number
Set r242 , 1
// allocate_stack - current: 8 size: 1
Set r249 , 1
Add r254 , r249
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 8, size: 1, data_type: U32 }
Set r238 , 0
Set r239 , 8
Add r239 , r255
Add r239 , r238
Write r239 , r242
// write_register- end
// handle number end
// allocate_stack - current: 9 size: 1
Set r240 , 1
Add r254 , r240
// alloc_stack - end
// handle_binary_expr - output_register- r239
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r236 , 0
Set r235 , 2
Add r235 , r255
Add r235 , r236
Read r238 , r235
// read_register- end
// read_register- self: Data { stack_frame_offset: 8, size: 1, data_type: U32 }
Set r236 , 0
Set r237 , 8
Add r237 , r255
Add r237 , r236
Read r241 , r237
// read_register- end
Add r238 , r241
Cp r239 , r238
// write_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r236 , 0
Set r235 , 9
Add r235 , r255
Add r235 , r236
Write r235 , r239
// write_register- end
// handle_binary_expr - end
// assignment data: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
// assignment- variable.is_reference: false data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 9, size: 1, data_type: U32 }
Set r238 , 0
Set r235 , 9
Add r235 , r255
Add r235 , r238
Read r239 , r235
// read_register- end
// write_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r238 , 0
Set r241 , 2
Add r241 , r255
Add r241 , r238
Write r241 , r239
// write_register- end
// end assignment

// while loop contents - end
RSet r248 , :while_start39
RJmp r248
:while_end40
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r241 , 0
Set r238 , 4
Add r238 , r255
Add r238 , r241
Read r254 , r238
// read_register- end
// Return
Set r249 , 4294967293
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r247 , 0
Set r246 , 2
Add r246 , r255
Add r246 , r247
Read r250 , r246
// read_register- end
Add r249 , r255
Write r249 , r250
Cp r250 , r255
Cp r254 , r255
// read_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r247 , 0
Set r248 , 1
Add r248 , r255
Add r248 , r247
Read r249 , r248
// read_register- end
Cp r255 , r249
Read r250 , r250
Jmp r250

// function: Function { is_interrupt_function: true, name: "keyboard_interrupt", input: [FunctionInputData { name: "data", data_type: U32, stack_frame_offset: -2 }], output: None, label_name: "function_keyboard_interrupt_8" }
:function_keyboard_interrupt_8
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
Set r245 , 0
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r244 , 0
Set r243 , 4294967294
Add r243 , r255
Add r243 , r244
Read r246 , r243
// read_register- end
Phrp r245 , r246

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
Iret r250
// function: Function { is_interrupt_function: true, name: "timer_interrupt", input: [FunctionInputData { name: "data", data_type: U32, stack_frame_offset: -2 }], output: None, label_name: "function_timer_interrupt_9" }
:function_timer_interrupt_9
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
// allocate_stack - current: 2 size: 2
Set r246 , 2
Add r254 , r246
// alloc_stack - end
Set r245 , 1
// write_register- self: Data { stack_frame_offset: 2, size: 2, data_type: Array { inside: Char, len: 1 } }
Set r244 , 0
Set r243 , 2
Add r243 , r255
Add r243 , r244
Write r243 , r245
// write_register- end
Set r245 , 116
// write_register- self: Data { stack_frame_offset: 2, size: 2, data_type: Array { inside: Char, len: 1 } }
Set r244 , 1
Set r247 , 2
Add r247 , r255
Add r247 , r244
Write r247 , r245
// write_register- end
// call_function_code
// function.input.is_empty(), 0, 3
// call_function_code - needed_stack: 3
// allocate_stack - current: 4 size: 3
Set r244 , 3
Add r254 , r244
// alloc_stack - end
// call_function_code - handle reference variable
Set r243 , 4294967294
Add r243 , r254
// read_addr_of_self
Set r242 , 2
Add r242 , r255
// read_addr_of_self - end
Write r243 , r242
// call_function_code - handle reference variable, end
RSet r242 , :function-return41
Add r242 , r251
Set r240 , 0
Sub r242 , r240
Write r254 , r242
RSet r243 , :function_print_chars_1
RJmp r243
:function-return41
// function call output: None
// function call converted output data : None

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
Iret r250
// function: Function { is_interrupt_function: false, name: "syscall_handler", input: [FunctionInputData { name: "syscall_id", data_type: U32, stack_frame_offset: -2 }, FunctionInputData { name: "additional_data_addr", data_type: U32, stack_frame_offset: -3 }, FunctionInputData { name: "output_data", data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 }, stack_frame_offset: -4 }], output: None, label_name: "function_syscall_handler_10" }
:function_syscall_handler_10
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
// if- condition: Binary { left: Identifier("syscall_id", DebugData { line: 2, file: "syscall.tip" }), operator: Token { kind: Equals, value: "==", line: 2 }, right: Number(0, DebugData { line: 2, file: "syscall.tip" }), debug_data: DebugData { line: 2, file: "syscall.tip" } }
// allocate_stack - current: 2 size: 1
Set r245 , 1
Add r254 , r245
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r247 , 0
Set r244 , 2
Add r244 , r255
Add r244 , r247
Write r244 , r254
// write_register- end
// if condition data
// handle_binary_expr
// handle number
Set r244 , 0
// allocate_stack - current: 3 size: 1
Set r247 , 1
Add r254 , r247
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r243 , 0
Set r242 , 3
Add r242 , r255
Add r242 , r243
Write r242 , r244
// write_register- end
// handle number end
// allocate_stack - current: 4 size: 1
Set r241 , 1
Add r254 , r241
// alloc_stack - end
// handle_binary_expr - output_register- r242
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r239 , 0
Set r238 , 4294967294
Add r238 , r255
Add r238 , r239
Read r243 , r238
// read_register- end
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r239 , 0
Set r240 , 3
Add r240 , r255
Add r240 , r239
Read r246 , r240
// read_register- end
Eq r243 , r246 , r242
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: Bool }
Set r239 , 0
Set r238 , 4
Add r238 , r255
Add r238 , r239
Write r238 , r242
// write_register- end
// handle_binary_expr - end
// read condition
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: Bool }
Set r243 , 0
Set r238 , 4
Add r238 , r255
Add r238 , r243
Read r242 , r238
// read_register- end
Not r242
RSet r238 , :if43
RJmpc r238 , r242
// if contents
// assign_new_variable
// assign_new_variable - end

// call_function_code
// function.input.is_empty(), 0, 3
// call_function_code - needed_stack: 3
// allocate_stack - current: 5 size: 3
Set r246 , 3
Add r254 , r246
// alloc_stack - end
// call_function_code - handle reference variable
Set r239 , 4294967294
Add r239 , r254
// read_referenced_address
Set r240 , 4294967293
Add r240 , r255
Read r240 , r240
Set r236 , 0
Add r240 , r236
// read_referenced_address - end
Write r239 , r240
// call_function_code - handle reference variable, end
RSet r240 , :function-return44
Add r240 , r251
Set r236 , 0
Sub r240 , r236
Write r254 , r240
RSet r239 , :function_print_chars_1
RJmp r239
:function-return44
// function call output: None
// function call converted output data : None

RSet r238 , :if_chain_end42
RJmp r238
// if contents end
:if43
// read_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r240 , 0
Set r239 , 2
Add r239 , r255
Add r239 , r240
Read r254 , r239
// read_register- end
// else - condition: Some(Binary { left: Identifier("syscall_id", DebugData { line: 5, file: "syscall.tip" }), operator: Token { kind: Equals, value: "==", line: 5 }, right: Number(1, DebugData { line: 5, file: "syscall.tip" }), debug_data: DebugData { line: 5, file: "syscall.tip" } })
// allocate_stack - current: 3 size: 1
Set r239 , 1
Add r254 , r239
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r237 , 0
Set r243 , 3
Add r243 , r255
Add r243 , r237
Write r243 , r254
// write_register- end
// else condition data
// handle_binary_expr
// handle number
Set r240 , 1
// allocate_stack - current: 4 size: 1
Set r235 , 1
Add r254 , r235
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r233 , 0
Set r232 , 4
Add r232 , r255
Add r232 , r233
Write r232 , r240
// write_register- end
// handle number end
// allocate_stack - current: 5 size: 1
Set r231 , 1
Add r254 , r231
// alloc_stack - end
// handle_binary_expr - output_register- r232
// read_register- self: Data { stack_frame_offset: -2, size: 1, data_type: U32 }
Set r229 , 0
Set r228 , 4294967294
Add r228 , r255
Add r228 , r229
Read r233 , r228
// read_register- end
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r229 , 0
Set r230 , 4
Add r230 , r255
Add r230 , r229
Read r234 , r230
// read_register- end
Eq r233 , r234 , r232
// write_register- self: Data { stack_frame_offset: 5, size: 1, data_type: Bool }
Set r229 , 0
Set r228 , 5
Add r228 , r255
Add r228 , r229
Write r228 , r232
// write_register- end
// handle_binary_expr - end
// read condition
// read_register- self: Data { stack_frame_offset: 5, size: 1, data_type: Bool }
Set r234 , 0
Set r233 , 5
Add r233 , r255
Add r233 , r234
Read r237 , r233
// read_register- end
Not r237
RSet r243 , :else45
RJmpc r243 , r237
// else contents
// assignment
// call_function_code
// call_function_code - needed_stack: 4
// allocate_stack - current: 6 size: 4
Set r234 , 4
Add r254 , r234
// alloc_stack - end
// read_register- self: Data { stack_frame_offset: -3, size: 1, data_type: U32 }
Set r227 , 0
Set r226 , 4294967293
Add r226 , r255
Add r226 , r227
Read r228 , r226
// read_register- end
Set r232 , 4294967294
Add r232 , r254
Write r232 , r228
RSet r228 , :function-return46
Add r228 , r251
Set r226 , 0
Sub r228 , r226
Write r254 , r228
RSet r232 , :function_core_allocate_4
RJmp r232
:function-return46
// function call output: Some(FunctionInputData { name: "core_allocate", data_type: U32, stack_frame_offset: -3 })
// function call converted output data : Some(Data { stack_frame_offset: 7, size: 1, data_type: U32 })
// assignment data: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
// assignment- variable.is_reference: true data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 7, size: 1, data_type: U32 }
Set r232 , 0
Set r233 , 7
Add r233 , r255
Add r233 , r232
Read r229 , r233
// read_register- end
// write_register- self: Data { stack_frame_offset: -4, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r232 , 0
Set r228 , 4294967292
Add r228 , r255
Read r228 , r228
Set r233 , 0
Add r228 , r233
Add r228 , r232
Write r228 , r229
// write_register- end
// end assignment

RSet r243 , :if_chain_end42
RJmp r243
// else contents end
:else45
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r228 , 0
Set r232 , 3
Add r232 , r255
Add r232 , r228
Read r254 , r232
// read_register- end
// else - condition: None
// allocate_stack - current: 4 size: 1
Set r237 , 1
Add r254 , r237
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r232 , 0
Set r228 , 4
Add r228 , r255
Add r228 , r232
Write r228 , r254
// write_register- end
// else contents
// allocate_stack - current: 5 size: 28
Set r229 , 28
Add r254 , r229
// alloc_stack - end
Set r243 , 27
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 0
Set r230 , 5
Add r230 , r255
Add r230 , r227
Write r230 , r243
// write_register- end
Set r243 , 102
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 1
Set r233 , 5
Add r233 , r255
Add r233 , r227
Write r233 , r243
// write_register- end
Set r243 , 111
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 2
Set r230 , 5
Add r230 , r255
Add r230 , r227
Write r230 , r243
// write_register- end
Set r243 , 117
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 3
Set r233 , 5
Add r233 , r255
Add r233 , r227
Write r233 , r243
// write_register- end
Set r243 , 110
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 4
Set r230 , 5
Add r230 , r255
Add r230 , r227
Write r230 , r243
// write_register- end
Set r243 , 100
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 5
Set r233 , 5
Add r233 , r255
Add r233 , r227
Write r233 , r243
// write_register- end
Set r243 , 32
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 6
Set r230 , 5
Add r230 , r255
Add r230 , r227
Write r230 , r243
// write_register- end
Set r243 , 117
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 7
Set r233 , 5
Add r233 , r255
Add r233 , r227
Write r233 , r243
// write_register- end
Set r243 , 110
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 8
Set r230 , 5
Add r230 , r255
Add r230 , r227
Write r230 , r243
// write_register- end
Set r243 , 101
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 9
Set r233 , 5
Add r233 , r255
Add r233 , r227
Write r233 , r243
// write_register- end
Set r243 , 120
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 10
Set r230 , 5
Add r230 , r255
Add r230 , r227
Write r230 , r243
// write_register- end
Set r243 , 112
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 11
Set r233 , 5
Add r233 , r255
Add r233 , r227
Write r233 , r243
// write_register- end
Set r243 , 101
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 12
Set r230 , 5
Add r230 , r255
Add r230 , r227
Write r230 , r243
// write_register- end
Set r243 , 99
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 13
Set r233 , 5
Add r233 , r255
Add r233 , r227
Write r233 , r243
// write_register- end
Set r243 , 116
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 14
Set r230 , 5
Add r230 , r255
Add r230 , r227
Write r230 , r243
// write_register- end
Set r243 , 101
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 15
Set r233 , 5
Add r233 , r255
Add r233 , r227
Write r233 , r243
// write_register- end
Set r243 , 100
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 16
Set r230 , 5
Add r230 , r255
Add r230 , r227
Write r230 , r243
// write_register- end
Set r243 , 32
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 17
Set r233 , 5
Add r233 , r255
Add r233 , r227
Write r233 , r243
// write_register- end
Set r243 , 115
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 18
Set r230 , 5
Add r230 , r255
Add r230 , r227
Write r230 , r243
// write_register- end
Set r243 , 121
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 19
Set r233 , 5
Add r233 , r255
Add r233 , r227
Write r233 , r243
// write_register- end
Set r243 , 115
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 20
Set r230 , 5
Add r230 , r255
Add r230 , r227
Write r230 , r243
// write_register- end
Set r243 , 99
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 21
Set r233 , 5
Add r233 , r255
Add r233 , r227
Write r233 , r243
// write_register- end
Set r243 , 97
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 22
Set r230 , 5
Add r230 , r255
Add r230 , r227
Write r230 , r243
// write_register- end
Set r243 , 108
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 23
Set r233 , 5
Add r233 , r255
Add r233 , r227
Write r233 , r243
// write_register- end
Set r243 , 108
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 24
Set r230 , 5
Add r230 , r255
Add r230 , r227
Write r230 , r243
// write_register- end
Set r243 , 32
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 25
Set r233 , 5
Add r233 , r255
Add r233 , r227
Write r233 , r243
// write_register- end
Set r243 , 105
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 26
Set r230 , 5
Add r230 , r255
Add r230 , r227
Write r230 , r243
// write_register- end
Set r243 , 100
// write_register- self: Data { stack_frame_offset: 5, size: 28, data_type: Array { inside: Char, len: 27 } }
Set r227 , 27
Set r233 , 5
Add r233 , r255
Add r233 , r227
Write r233 , r243
// write_register- end
// call_function_code
// function.input.is_empty(), 0, 3
// call_function_code - needed_stack: 3
// allocate_stack - current: 33 size: 3
Set r227 , 3
Add r254 , r227
// alloc_stack - end
// call_function_code - handle reference variable
Set r230 , 4294967294
Add r230 , r254
// read_addr_of_self
Set r225 , 5
Add r225 , r255
// read_addr_of_self - end
Write r230 , r225
// call_function_code - handle reference variable, end
RSet r225 , :function-return48
Add r225 , r251
Set r223 , 0
Sub r225 , r223
Write r254 , r225
RSet r230 , :function_print_chars_1
RJmp r230
:function-return48
// function call output: None
// function call converted output data : None

RSet r228 , :if_chain_end42
RJmp r228
// else contents end
:else47
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r225 , 0
Set r230 , 4
Add r230 , r255
Add r230 , r225
Read r254 , r230
// read_register- end
:if_chain_end42
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
