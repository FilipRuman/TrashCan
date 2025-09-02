// assignment
Set r253 , 1
Add r254 , r253
// variable declaration: out_val
// variable declaration end
Set r251 , 169953608
Set r250 , 1
Add r254 , r250
Set r249 , 1
Add r249 , r255
Write r249 , r251
// call_function_code
Set r248 , 2
Add r254 , r248
Set r245 , 0
Set r246 , 1
Add r246 , r245
Add r246 , r255
Read r246 , r246
Set r247 , 4294967295
Add r247 , r254
Write r247 , r246
Set r246 , :function-return0
Write r254 , r246
Set r247 , :function_print_0
Jmp r247
:function-return0
// function call output: [FunctionInputData { name: "print", data_type: U32, stack_frame_offset: -2 }]
// function call converted output data : [Data { stack_frame_offset: 2, size: 1, data_type: U32 }]
// assignment data: Data { stack_frame_offset: 2, size: 1, data_type: U32 }
Set r245 , 2
Add r245 , r255
Read r252 , r245
Set r245 , 0
Add r245 , r255
Write r245 , r252
Set r245 , 2
Add r245 , r255
Read r252 , r245
Set r245 , 0
Add r245 , r255
Write r245 , r252
// end assignment

Set r252 , 0
Set r246 , 0
Add r246 , r255
Read r245 , r246
Phrp r252 , r245

Halt
:function_print_0
Cp r245 , r255
Cp r255 , r254
Set r246 , 0
Set r249 , 4294967295
Add r249 , r255
Read r247 , r249
Phrp r246 , r247

// Return
Set r247 , 25
Set r246 , 1
Add r254 , r246
Set r249 , 1
Add r249 , r255
Write r249 , r247
Set r244 , 4294967294
Set r243 , 1
Add r243 , r255
Read r249 , r243
Add r244 , r255
Write r244 , r249
Cp r252 , r255
Cp r254 , r255
Cp r255 , r245
Read r252 , r252
Jmp r252

Halt
