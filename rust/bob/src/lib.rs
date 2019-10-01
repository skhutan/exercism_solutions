enum Statement {
  QuestionShout,
  Question,
  Shout,
  Empty,
  Other,
}

pub fn reply(message: &str) -> &str {
  match get_statement(message) {
    Statement::QuestionShout => return "Calm down, I know what I'm doing!",
    Statement::Question => return "Sure.",
    Statement::Shout => return "Whoa, chill out!",
    Statement::Empty => return "Fine. Be that way!",
    Statement::Other => return "Whatever.",
  }
}

fn get_statement(message: &str) -> Statement {
  let trimmed_message = message.trim();
  let is_empty = trimmed_message.is_empty();
  let is_question = trimmed_message.ends_with("?");
  let is_shout = trimmed_message.to_uppercase() == trimmed_message
    && trimmed_message.to_lowercase() != trimmed_message;

  match trimmed_message {
    _ if is_question && is_shout => return Statement::QuestionShout,
    _ if is_question => return Statement::Question,
    _ if is_shout => return Statement::Shout,
    _ if is_empty => return Statement::Empty,
    _ => return Statement::Other,
  }
}
