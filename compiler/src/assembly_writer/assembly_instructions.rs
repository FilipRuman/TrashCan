pub fn syscall(
    syscall_id_register: u8,
    input_data_register: u8,
    output_data_register: u8,
) -> String {
    format!("Syscall r{syscall_id_register} , r{input_data_register} , r{output_data_register}\n")
}
pub fn comment(text: &str) -> String {
    format!("// {}\n", text.replace("\n", "\n //"))
}

pub fn idt(register: u8) -> String {
    format!("Idt r{register}\n")
}

/// Copies value from `x` register into `y` register.
pub fn cp(destination_register: u8, source_register: u8) -> String {
    format!("Cp r{destination_register} , r{source_register}\n")
}
/// Directly sets value of register to specified value.
pub fn set(register: u8, direct_value: u32) -> String {
    format!("Set r{register} , {direct_value}\n")
}
////// Directly sets value of register to specified value.
pub fn absolute_set_label(register: u8, label_name: &str) -> String {
    format!("Set r{register} , :{label_name}\n")
}
////// Directly sets value of register to specified value.
pub fn relative_set_label(register: u8, label_name: &str) -> String {
    format!("RSet r{register} , :{label_name}\n")
}
/// Reads value from memory at address in `x` into `y`.
pub fn read(destination_register: u8, address_register: u8) -> String {
    format!("Read r{destination_register} , r{address_register}\n")
}
/// Writes value from `y` to memory at address in `x`.
pub fn write(destination_address_register: u8, source_register: u8) -> String {
    format!("Write r{destination_address_register} , r{source_register}\n")
}
pub fn iret(address_register: u8) -> String {
    format!("Iret r{address_register}\n")
}

pub fn relative_jmp(address_register: u8) -> String {
    format!("RJmp r{address_register}\n")
}
pub fn jmp(address_register: u8) -> String {
    format!("Jmp r{address_register}\n")
}
pub fn relative_jmpc(address_register: u8, condition_register: u8) -> String {
    format!("RJmpc r{address_register} , r{condition_register}\n")
}
pub fn jmpc(address_register: u8, condition_register: u8) -> String {
    format!("Jmpc r{condition_register} , r{address_register}\n")
}
pub fn jmpc_label(
    label_name: &str,
    label_addr_conversion_register: u8,
    condition_register: u8,
) -> String {
    relative_set_label(label_addr_conversion_register, label_name)
        + &relative_jmpc(label_addr_conversion_register, condition_register)
}
pub fn jmp_label(label_name: &str, label_addr_conversion_register: u8) -> String {
    relative_set_label(label_addr_conversion_register, label_name)
        + &relative_jmp(label_addr_conversion_register)
}
pub fn label(label_name: &str) -> String {
    format!(":{label_name}\n")
}

pub fn add(a_register: u8, b_register: u8) -> String {
    format!("Add r{a_register} , r{b_register}\n")
}
pub fn sub(a_register: u8, b_register: u8) -> String {
    format!("Sub r{a_register} , r{b_register}\n")
}
pub fn mul(a_register: u8, b_register: u8) -> String {
    format!("Mul r{a_register} , r{b_register}\n")
}
pub fn modu(a_register: u8, b_register: u8) -> String {
    format!("Mod r{a_register} , r{b_register}\n")
}
pub fn neg(register: u8) -> String {
    format!("Neg r{register} \n")
}
pub fn div(a_register: u8, b_register: u8) -> String {
    format!("Div r{a_register} , r{b_register}\n")
}
pub fn abs(a_register: u8, b_register: u8) -> String {
    format!("Abs r{a_register} , r{b_register}\n")
}

pub fn and(a_register: u8, b_register: u8) -> String {
    format!("And r{a_register} , r{b_register}\n")
}
pub fn not(register: u8) -> String {
    format!("Not r{register}\n")
}
pub fn xor(a_register: u8, b_register: u8) -> String {
    format!("Xor r{a_register} , r{b_register}\n")
}
pub fn or(a_register: u8, b_register: u8) -> String {
    format!("Or r{a_register} , r{b_register}\n")
}
pub fn shr(a_register: u8, b_register: u8) -> String {
    format!("Shr r{a_register} , r{b_register}\n")
}
pub fn shl(a_register: u8, b_register: u8) -> String {
    format!("Shl r{a_register} , r{b_register}\n")
}

pub fn gte(a_register: u8, b_register: u8, out_register: u8) -> String {
    format!("Gte r{a_register} , r{b_register} , r{out_register}\n")
}
pub fn lte(a_register: u8, b_register: u8, out_register: u8) -> String {
    format!("Lte r{a_register} , r{b_register} , r{out_register}\n")
}
pub fn lt(a_register: u8, b_register: u8, out_register: u8) -> String {
    format!("Lt r{a_register} , r{b_register} , r{out_register}\n")
}
pub fn gt(a_register: u8, b_register: u8, out_register: u8) -> String {
    format!("Gt r{a_register} , r{b_register} , r{out_register}\n")
}
pub fn eq(a_register: u8, b_register: u8, out_register: u8) -> String {
    format!("Eq r{a_register} , r{b_register} , r{out_register}\n")
}
pub fn caddr(out_register: u8) -> String {
    format!("Caddr r{out_register}\n")
}

pub fn phrp(peripheral_index_register: u8, data_register: u8) -> String {
    format!("Phrp r{peripheral_index_register} , r{data_register}\n")
}
pub fn halt() -> String {
    "Halt\n".to_string()
}
