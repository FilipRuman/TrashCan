Set r252 , 64
Set r251 , 1
Add r251 , r255
Write r251 , r252
Set r251 , 1
Add r251 , r255
Read r251 , r253
Set r251 , 0
Add r251 , r255
Write r251 , r253
Set r251 , 1
Add r251 , r255
Read r251 , r253
Set r251 , 2
Add r251 , r255
Write r251 , r253

Set r251 , 86
Set r250 , 4
Add r250 , r255
Write r250 , r251
Set r250 , 4
Add r250 , r255
Read r250 , r253
Set r250 , 3
Add r250 , r255
Write r250 , r253
Set r250 , 4
Add r250 , r255
Read r250 , r253
Set r250 , 5
Add r250 , r255
Write r250 , r253

Set r248 , 5
Add r248 , r255
Read r248 , r250
Set r248 , 2
Add r248 , r255
Read r248 , r249
Gt r250 , r249 , r253 
Set r248 , 6
Add r248 , r255
Write r248 , r253
Set r249 , 6
Add r249 , r255
Read r249 , r253
Not r253 
Set r249 , :if0
Jmpc r253 , r249
Set r250 , 0
Set r247 , 169953608
Set r246 , 7
Add r246 , r255
Write r246 , r247
Set r246 , 7
Add r246 , r255
Read r246 , r248
Phrp r250 , r248

:if0 
Halt 
