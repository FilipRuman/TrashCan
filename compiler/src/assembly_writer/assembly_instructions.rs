use std::fmt::format;

use super::AssemblyData;
pub fn comment(text: &str) -> String {
    format!("// {text}\n")
}

/// Copies value from `x` registry into `y` registry.
pub fn cp(destination_registry: u8, source_registry: u8) -> String {
    format!("Cp r{destination_registry} , r{source_registry}\n")
}
/// Directly sets value of registry to specified value.
pub fn set(registry: u8, direct_value: u32) -> String {
    format!("Set r{registry} , {direct_value}\n")
}
////// Directly sets value of registry to specified value.
pub fn set_label(registry: u8, label_name: &str) -> String {
    format!("Set r{registry} , :{label_name}\n")
}
/// Reads value from memory at address in `x` into `y`.
pub fn read(destination_registry: u8, address_registry: u8) -> String {
    format!("Read r{destination_registry} , r{address_registry}\n")
}
/// Writes value from `y` to memory at address in `x`.
pub fn write(destination_address_registry: u8, source_registry: u8) -> String {
    format!("Write r{destination_address_registry} , r{source_registry}\n")
}
pub fn jmp(address_registry: u8) -> String {
    format!("Jmp r{address_registry}\n")
}
pub fn jmpc(address_registry: u8, condition_registry: u8) -> String {
    format!("Jmpc r{condition_registry} , r{address_registry}\n")
}
pub fn jmpc_label(
    label_name: &str,
    label_addr_conversion_register: u8,
    condition_registry: u8,
) -> String {
    set_label(label_addr_conversion_register, label_name)
        + &jmpc(label_addr_conversion_register, condition_registry)
}
pub fn jmp_label(label_name: &str, label_addr_conversion_register: u8) -> String {
    set_label(label_addr_conversion_register, label_name) + &jmp(label_addr_conversion_register)
}
pub fn label(label_name: &str) -> String {
    format!(":{label_name}\n")
}

pub fn add(a_register: u8, b_register: u8) -> String {
    format!("Add r{a_register} , r{b_register}\n")
}
pub fn sub(a_registry: u8, b_registry: u8) -> String {
    format!("Sub r{a_registry} , r{b_registry}\n")
}
pub fn mul(a_registry: u8, b_registry: u8) -> String {
    format!("Mul r{a_registry} , r{b_registry}\n")
}
pub fn modu(a_registry: u8, b_registry: u8) -> String {
    format!("Mod r{a_registry} , r{b_registry}\n")
}
pub fn neg(registry: u8) -> String {
    format!("Neg r{registry} \n")
}
pub fn div(a_registry: u8, b_registry: u8) -> String {
    format!("Div r{a_registry} , r{b_registry}\n")
}
pub fn abs(a_registry: u8, b_registry: u8) -> String {
    format!("Abs r{a_registry} , r{b_registry}\n")
}

pub fn and(a_registry: u8, b_registry: u8) -> String {
    format!("And r{a_registry} , r{b_registry}\n")
}
pub fn not(registry: u8) -> String {
    format!("Not r{registry}\n")
}
pub fn xor(a_registry: u8, b_registry: u8) -> String {
    format!("Xor r{a_registry} , r{b_registry}\n")
}
pub fn or(a_registry: u8, b_registry: u8) -> String {
    format!("Or r{a_registry} , r{b_registry}\n")
}
pub fn shr(a_registry: u8, b_registry: u8) -> String {
    format!("Shr r{a_registry} , r{b_registry}\n")
}
pub fn shl(a_registry: u8, b_registry: u8) -> String {
    format!("Shl r{a_registry} , r{b_registry}\n")
}

pub fn gte(a_registry: u8, b_registry: u8, out_registry: u8) -> String {
    format!("Gte r{a_registry} , r{b_registry} , r{out_registry}\n")
}
pub fn lte(a_registry: u8, b_registry: u8, out_registry: u8) -> String {
    format!("Lte r{a_registry} , r{b_registry} , r{out_registry}\n")
}
pub fn lt(a_registry: u8, b_registry: u8, out_registry: u8) -> String {
    format!("Lt r{a_registry} , r{b_registry} , r{out_registry}\n")
}
pub fn gt(a_registry: u8, b_registry: u8, out_registry: u8) -> String {
    format!("Gt r{a_registry} , r{b_registry} , r{out_registry}\n")
}
pub fn eq(a_registry: u8, b_registry: u8, out_registry: u8) -> String {
    format!("Eq r{a_registry} , r{b_registry} , r{out_registry}\n")
}
pub fn caddr(out_registry: u8) -> String {
    format!("Caddr r{out_registry}\n")
}

pub fn phrp(peripheral_index_registry: u8, data_registry: u8) -> String {
    format!("Phrp r{peripheral_index_registry} , r{data_registry}\n")
}
pub fn halt() -> String {
    "Halt\n".to_string()
}
