class StringCalculator
  DEFAULT_DELIMITERS = [",", "\n"].freeze

  def self.add(numbers)
    return 0 if numbers.empty?
    
    delimiters, numbers = extract_delimiters(numbers)
    extracted_numbers = numbers.split(Regexp.union(delimiters)).map(&:to_i)
    
    validate_negatives(extracted_numbers)
    
    extracted_numbers.reject { |number| number > 1000 }.sum
  end

  private

  def self.extract_delimiters(numbers)
    return [DEFAULT_DELIMITERS, numbers] unless numbers.start_with?("//")

    match_number = numbers.match(/^\/\/(\[.*?\]|\S+)\n(.*)/)
    delimiter_part, numbers = match_number.captures
    delimiters = DEFAULT_DELIMITERS.dup

    if delimiter_part.start_with?("[") && delimiter_part.end_with?("]")
      delimiters.concat(delimiter_part.scan(/\[([^\]]+)\]/).flatten.compact)
    else
      delimiters << delimiter_part
    end
    [delimiters, numbers]
  end

  def self.validate_negatives(numbers)
    negatives = numbers.select(&:negative?)
    raise "negative numbers not allowed #{negatives.join(', ')}" unless negatives.empty?
  end
end
