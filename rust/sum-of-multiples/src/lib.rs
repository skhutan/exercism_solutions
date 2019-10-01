pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    (1..limit).filter(|x| multiples(x, factors)).sum()
}

fn multiples(num: &u32, factors: &[u32]) -> bool {
    factors.iter().any(|factor| is_factor(num, factor))
}

fn is_factor(num: &u32, factor: &u32) -> bool {
    match factor {
        0 => false,
        _ => num % factor == 0,
    }
}
