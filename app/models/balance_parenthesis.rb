# return true if the string is balanced
def balance_parenthesis?(str)
  opening_chars = ['(', '{', '[']
  closing_chars = [')', '}', ']']
  stack = []

  # Iterate each char of string.
  # Match the char with opening or closing chars
  # If it's belongs to opening chars push it to the stack
  # IF it's belongs to closing chars check last element and match it with
  # index with its revelnent closing tags

  str.chars.each do |char|
    if opening_chars.include?(char)
      stack << char
    elsif closing_chars.include?(char)
      element = stack.last
      return false if stack.empty? || opening_chars.index(element) != closing_chars.index(char)

      stack.pop
    end
  end
  return true if stack.empty?

  false
end

puts 'Input:'
str = gets.chomp
puts balance_parenthesis?(str)
