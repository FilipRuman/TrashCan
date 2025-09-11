// assignment
// variable declaration: array
Set r253 , 1
Add r254 , r253
// variable declaration end
// handle_reference
// array_initialization
Set r251 , 3
Add r254 , r251
Set r250 , 2
Set r249 , 1
Add r249 , r255
Write r249 , r250
// handle number
Set r249 , 66
Set r248 , 1
Add r254 , r248
Set r247 , 4
Add r247 , r255
Write r247 , r249
// handle number end
// offset_register: 247
// read_register- self.is_reference: false
Set r247 , 4
Add r247 , r255
Read r250 , r247
// read_register- end
// i-0 w-0 inside_data_type_size-1
Set r246 , 2
Add r246 , r255
Write r246 , r250
// handle number
Set r246 , 115
Set r247 , 1
Add r254 , r247
Set r245 , 5
Add r245 , r255
Write r245 , r246
// handle number end
// offset_register: 245
// read_register- self.is_reference: false
Set r245 , 5
Add r245 , r255
Read r250 , r245
// read_register- end
// i-1 w-0 inside_data_type_size-1
Set r244 , 3
Add r244 , r255
Write r244 , r250
// array_initialization- end
Set r250 , 1
Add r254 , r250
// read_addr_of_self
Set r244 , 1
Add r244 , r255
// read_addr_of_self - end
Set r245 , 6
Add r245 , r255
Write r245 , r244
// handle_reference - end
// assignment data: Data { stack_frame_offset: 6, size: 1, is_reference: true, data_type: Array { inside: U32 } }
// assignment- variable.is_reference: true data.is_reference: true 
// read_pointer_addr
Set r245 , 6
Add r245 , r255
Read r244 , r245
Set r245 , 0
Add r245 , r255
Write r245 , r244
// end assignment

// assignment
// variable declaration: i
Set r244 , 1
Add r254 , r244
// variable declaration end
// handle number
Set r243 , 1
Set r242 , 1
Add r254 , r242
Set r241 , 8
Add r241 , r255
Write r241 , r243
// handle number end
// assignment data: Data { stack_frame_offset: 8, size: 1, is_reference: false, data_type: U32 }
// assignment- variable.is_reference: true data.is_reference: false 
// offset_register: 240
// read_register- self.is_reference: false
Set r240 , 8
Add r240 , r255
Read r241 , r240
// read_register- end
Set r239 , 7
Add r239 , r255
Read r239 , r239
Write r239 , r241
// end assignment

// assignment
// variable declaration: out
Set r241 , 1
Add r254 , r241
// variable declaration end
// call_function_code
Set r238 , 3
Add r254 , r238
// call_function_code - handle reference variable
Set r237 , 4294967295
Add r237 , r254
// read_pointer_addr
Set r234 , 0
Add r234 , r255
Read r236 , r234
Write r237 , r236
// call_function_code - handle reference variable, end
// offset_register: 234
// read_register- self.is_reference: true
Set r234 , 7
Add r234 , r255
Read r234 , r234
Set r233 , 0
Add r234 , r233
Read r236 , r234
// read_register- end
Set r237 , 4294967294
Add r237 , r254
Write r237 , r236
Set r236 , :function-return0
Write r254 , r236
Set r237 , :function_index_0
Jmp r237
:function-return0
// function call output: Some(FunctionInputData { name: "index", data_type: U32, is_reference: false, stack_frame_offset: -3 })
// function call converted output data : Some(Data { stack_frame_offset: 10, size: 1, is_reference: false, data_type: U32 })
// assignment data: Data { stack_frame_offset: 10, size: 1, is_reference: false, data_type: U32 }
// assignment- variable.is_reference: false data.is_reference: false 
// offset_register: 236
// read_register- self.is_reference: false
Set r236 , 10
Add r236 , r255
Read r235 , r236
// read_register- end
Set r237 , 9
Add r237 , r255
Write r237 , r235
// end assignment

Set r235 , 0
// offset_register: 236
// read_register- self.is_reference: false
Set r236 , 9
Add r236 , r255
Read r237 , r236
// read_register- end
Phrp r235 , r237

Halt

:function_index_0
Cp r237 , r255
Cp r255 , r254
// Return
// index_array
// index_array - var:Data { stack_frame_offset: -1, size: 1, is_reference: true, data_type: Array { inside: U32 } }
Set r240 , 1
Add r254 , r240
// offset_register: 233
// read_register- self.is_reference: false
Set r233 , 4294967294
Add r233 , r255
Read r236 , r233
// read_register- end
Set r233 , 4294967295
// array indexing- var_to_index.is_reference: true
Cp r232 , r236
Set r234 , 1
Mul r232 , r234
// add 1 offset to account for 1'st register holding size of array
Set r234 , 1
Add r232 , r234
// read_pointer_addr
Set r230 , 4294967295
Add r230 , r255
Read r231 , r230
// reference_addr_register-r231  now holds base addr of array
Add r232 , r231
Cp r234 , r232
// reference_addr_register- r231, addr_register- r234
Set r230 , 1
Add r230 , r255
Write r230 , r234
// index_array - end
Set r233 , 4294967293
// offset_register: 232
// read_register- self.is_reference: true
Set r232 , 1
Add r232 , r255
Read r232 , r232
Set r234 , 0
Add r232 , r234
Read r231 , r232
// read_register- end
Add r233 , r255
Write r233 , r231
Cp r235 , r255
Cp r254 , r255
Cp r255 , r237
Read r235 , r235
Jmp r235

Halt
