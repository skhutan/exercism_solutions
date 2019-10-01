pub fn is_armstrong_number(num: u32) -> bool {
  let count = num.to_string().chars().count() as u32;
  let digits: Vec<_> = num
    .to_string()
    .chars()
    .map(|d| d.to_digit(10).unwrap())
    .collect();

  let sum = digits.iter().map(|d| d.pow(count)).sum();

  num == sum
}
