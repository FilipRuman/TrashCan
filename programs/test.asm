// assignment
// variable declaration: tst
// allocate_stack - current: 0 size: 1
Set r253 , 1
Add r254 , r253
// alloc_stack - end
// variable declaration end
// handle_reference
// handle_struct_initialization Struct {
 //    size: 2,
 //    name: "TestStruct",
 //    properties: {
 //        "a": StructProperty {
 //            data_type: U32,
 //            offset_from_struct_base: 0,
 //        },
 //        "b": StructProperty {
 //            data_type: U32,
 //            offset_from_struct_base: 1,
 //        },
 //    },
 //}
// allocate_stack - current: 1 size: 2
Set r251 , 2
Add r254 , r251
// alloc_stack - end
// assignment
// handle number
Set r250 , 66
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
// assignment data: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
// assignment- variable.is_reference: false data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 3, size: 1, data_type: U32 }
Set r248 , 0
Set r245 , 3
Add r245 , r255
Add r245 , r248
Read r246 , r245
// read_register- end
// write_register- self: Data { stack_frame_offset: 1, size: 1, data_type: U32 }
Set r248 , 0
Set r247 , 1
Add r247 , r255
Add r247 , r248
Write r247 , r246
// write_register- end
// end assignment
// assignment
// handle number
Set r246 , 1
// allocate_stack - current: 4 size: 1
Set r247 , 1
Add r254 , r247
// alloc_stack - end
// write_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r245 , 0
Set r244 , 4
Add r244 , r255
Add r244 , r245
Write r244 , r246
// write_register- end
// handle number end
// assignment data: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
// assignment- variable.is_reference: false data.is_reference: false 
// read_register- self: Data { stack_frame_offset: 4, size: 1, data_type: U32 }
Set r248 , 0
Set r243 , 4
Add r243 , r255
Add r243 , r248
Read r244 , r243
// read_register- end
// write_register- self: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r248 , 0
Set r245 , 2
Add r245 , r255
Add r245 , r248
Write r245 , r244
// write_register- end
// end assignment
// handle_struct_initialization end
// handle_reference - handled expression
// allocate_stack - current: 5 size: 1
Set r244 , 1
Add r254 , r244
// alloc_stack - end
// read_addr_of_self
Set r245 , 1
Add r245 , r255
// read_addr_of_self - end
// write_directly_to_reference_pointer - 248
Set r248 , 5
Add r248 , r255
Write r248 , r245
// write_directly_to_reference_pointer - end
// handle_reference - end
// assignment data: Data { stack_frame_offset: 5, size: 1, data_type: Reference { inside: Struct { name: "TestStruct" }, offset_of_data_from_reference_addr: 0 } }
// assignment- variable.is_reference: true data.is_reference: true 
// read_referenced_address
Set r245 , 5
Add r245 , r255
Read r245 , r245
Set r248 , 0
Add r245 , r248
// read_referenced_address - end
Set r243 , 0
Add r243 , r255
Write r243 , r245
// end assignment

// assignment
// variable declaration: a
// allocate_stack - current: 6 size: 1
Set r245 , 1
Add r254 , r245
// alloc_stack - end
// variable declaration end
// handle_struct_access- Data { stack_frame_offset: 0, size: 1, data_type: Reference { inside: Struct { name: "TestStruct" }, offset_of_data_from_reference_addr: 0 } } "TestStruct"
Set r242 , 0
// read_addr_of_register - self: Data { stack_frame_offset: 0, size: 1, data_type: Reference { inside: Struct { name: "TestStruct" }, offset_of_data_from_reference_addr: 0 } }
Set r248 , 0
Add r248 , r255
Read r248 , r248
Set r241 , 0
Add r248 , r241
Add r248 , r242
// read_addr_of_register - end
// allocate_stack - current: 7 size: 1
Set r241 , 1
Add r254 , r241
// alloc_stack - end
Set r242 , 7
Add r242 , r255
Write r242 , r248
// handle_struct_access- end
// assignment data: Data { stack_frame_offset: 7, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
// assignment- variable.is_reference: true data.is_reference: true 
// read_referenced_address
Set r242 , 7
Add r242 , r255
Read r242 , r242
Set r248 , 0
Add r242 , r248
// read_referenced_address - end
Set r240 , 6
Add r240 , r255
Write r240 , r242
// end assignment

Set r242 , 0
// read_register- self: Data { stack_frame_offset: 6, size: 1, data_type: Reference { inside: U32, offset_of_data_from_reference_addr: 0 } }
Set r239 , 0
Set r238 , 6
Add r238 , r255
Read r238 , r238
Set r248 , 0
Add r238 , r248
Add r238 , r239
Read r240 , r238
// read_register- end
Phrp r242 , r240

Halt


Halt
