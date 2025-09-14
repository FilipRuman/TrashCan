// assignment
// variable declaration: direct
Set r253 , 1
Add r254 , r253
// variable declaration end
// handle_reference
// handle_struct_initialization Struct {
 //    size: 2,
 //    name: "NewType",
 //    properties: {
 //        "a": StructProperty {
 //            is_reference: false,
 //            data_type: U32,
 //            offset_from_struct_base: 0,
 //        },
 //        "b": StructProperty {
 //            is_reference: false,
 //            data_type: U32,
 //            offset_from_struct_base: 1,
 //        },
 //    },
 //}
Set r251 , 2
Add r254 , r251
// assignment
// handle number
Set r250 , 32
Set r249 , 1
Add r254 , r249
Set r248 , 3
Add r248 , r255
Write r248 , r250
// handle number end
// assignment data: Data { stack_frame_offset: 3, size: 1, is_reference: false, data_type: U32 }
// assignment- variable.is_reference: false data.is_reference: false 
// offset_register: 247
// read_register- self.is_reference: false
Set r247 , 3
Add r247 , r255
Read r248 , r247
// read_register- end
Set r246 , 1
Add r246 , r255
Write r246 , r248
// end assignment
// assignment
// handle number
Set r248 , 6
Set r246 , 1
Add r254 , r246
Set r247 , 4
Add r247 , r255
Write r247 , r248
// handle number end
// assignment data: Data { stack_frame_offset: 4, size: 1, is_reference: false, data_type: U32 }
// assignment- variable.is_reference: false data.is_reference: false 
// offset_register: 245
// read_register- self.is_reference: false
Set r245 , 4
Add r245 , r255
Read r247 , r245
// read_register- end
Set r244 , 2
Add r244 , r255
Write r244 , r247
// end assignment
// handle_struct_initialization end
Set r247 , 1
Add r254 , r247
// read_addr_of_self
Set r244 , 1
Add r244 , r255
// read_addr_of_self - end
Set r245 , 5
Add r245 , r255
Write r245 , r244
// handle_reference - end
// assignment data: Data { stack_frame_offset: 5, size: 1, is_reference: true, data_type: Struct { name: "NewType" } }
// assignment- variable.is_reference: true data.is_reference: true 
// read_pointer_addr
Set r245 , 5
Add r245 , r255
Read r244 , r245
Set r245 , 0
Add r245 , r255
Write r245 , r244
// end assignment

// assignment
// variable declaration: array
Set r244 , 2
Add r254 , r244
// variable declaration end
// array_initialization
Set r243 , 5
Add r254 , r243
Set r242 , 2
Set r241 , 8
Add r241 , r255
Write r241 , r242
// handle_struct_initialization Struct {
 //    size: 2,
 //    name: "NewType",
 //    properties: {
 //        "a": StructProperty {
 //            is_reference: false,
 //            data_type: U32,
 //            offset_from_struct_base: 0,
 //        },
 //        "b": StructProperty {
 //            is_reference: false,
 //            data_type: U32,
 //            offset_from_struct_base: 1,
 //        },
 //    },
 //}
Set r241 , 2
Add r254 , r241
// assignment
// handle number
Set r240 , 32
Set r239 , 1
Add r254 , r239
Set r238 , 15
Add r238 , r255
Write r238 , r240
// handle number end
// assignment data: Data { stack_frame_offset: 15, size: 1, is_reference: false, data_type: U32 }
// assignment- variable.is_reference: false data.is_reference: false 
// offset_register: 237
// read_register- self.is_reference: false
Set r237 , 15
Add r237 , r255
Read r238 , r237
// read_register- end
Set r236 , 13
Add r236 , r255
Write r236 , r238
// end assignment
// assignment
// handle number
Set r238 , 6
Set r236 , 1
Add r254 , r236
Set r237 , 16
Add r237 , r255
Write r237 , r238
// handle number end
// assignment data: Data { stack_frame_offset: 16, size: 1, is_reference: false, data_type: U32 }
// assignment- variable.is_reference: false data.is_reference: false 
// offset_register: 235
// read_register- self.is_reference: false
Set r235 , 16
Add r235 , r255
Read r237 , r235
// read_register- end
Set r234 , 14
Add r234 , r255
Write r234 , r237
// end assignment
// handle_struct_initialization end
// offset_register: 237
// read_register- self.is_reference: false
Set r237 , 13
Add r237 , r255
Read r242 , r237
// read_register- end
// i-0 w-0 inside_data_type_size-2
Set r234 , 9
Add r234 , r255
Write r234 , r242
// offset_register: 234
// read_register- self.is_reference: false
Set r234 , 14
Add r234 , r255
Read r242 , r234
// read_register- end
// i-0 w-1 inside_data_type_size-2
Set r237 , 10
Add r237 , r255
Write r237 , r242
// handle_struct_initialization Struct {
 //    size: 2,
 //    name: "NewType",
 //    properties: {
 //        "a": StructProperty {
 //            is_reference: false,
 //            data_type: U32,
 //            offset_from_struct_base: 0,
 //        },
 //        "b": StructProperty {
 //            is_reference: false,
 //            data_type: U32,
 //            offset_from_struct_base: 1,
 //        },
 //    },
 //}
Set r237 , 2
Add r254 , r237
// assignment
// handle number
Set r234 , 8
Set r235 , 1
Add r254 , r235
Set r233 , 19
Add r233 , r255
Write r233 , r234
// handle number end
// assignment data: Data { stack_frame_offset: 19, size: 1, is_reference: false, data_type: U32 }
// assignment- variable.is_reference: false data.is_reference: false 
// offset_register: 232
// read_register- self.is_reference: false
Set r232 , 19
Add r232 , r255
Read r233 , r232
// read_register- end
Set r231 , 17
Add r231 , r255
Write r231 , r233
// end assignment
// assignment
// handle number
Set r233 , 1
Set r231 , 1
Add r254 , r231
Set r232 , 20
Add r232 , r255
Write r232 , r233
// handle number end
// assignment data: Data { stack_frame_offset: 20, size: 1, is_reference: false, data_type: U32 }
// assignment- variable.is_reference: false data.is_reference: false 
// offset_register: 230
// read_register- self.is_reference: false
Set r230 , 20
Add r230 , r255
Read r232 , r230
// read_register- end
Set r229 , 18
Add r229 , r255
Write r229 , r232
// end assignment
// handle_struct_initialization end
// offset_register: 232
// read_register- self.is_reference: false
Set r232 , 17
Add r232 , r255
Read r242 , r232
// read_register- end
// i-1 w-0 inside_data_type_size-2
Set r229 , 11
Add r229 , r255
Write r229 , r242
// offset_register: 229
// read_register- self.is_reference: false
Set r229 , 18
Add r229 , r255
Read r242 , r229
// read_register- end
// i-1 w-1 inside_data_type_size-2
Set r232 , 12
Add r232 , r255
Write r232 , r242
// array_initialization- end
// assignment data: Data { stack_frame_offset: 8, size: 5, is_reference: false, data_type: Array { inside: Struct { name: "NewType" } } }
// assignment- variable.is_reference: false data.is_reference: false 
// offset_register: 232
// read_register- self.is_reference: false
Set r232 , 8
Add r232 , r255
Read r242 , r232
// read_register- end
Set r229 , 6
Add r229 , r255
Write r229 , r242
// offset_register: 229
// read_register- self.is_reference: false
Set r229 , 9
Add r229 , r255
Read r242 , r229
// read_register- end
Set r232 , 7
Add r232 , r255
Write r232 , r242
// end assignment
Set r242 , 0
// offset_register: 229
// read_register- self.is_reference: false
Set r229 , 1
Add r229 , r255
Read r232 , r229
// read_register- end
Phrp r242 , r232

Halt

Halt
