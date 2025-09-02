let out_val : u32 = print(0x0A214948);
print_raw(out_val);


halt()

fn print(a : u32) -> u32{
	print_raw(a);
	return 25;
}





