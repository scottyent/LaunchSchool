class TextAnalyzer
  def process
    text = File.read("./sample_text.txt")
    yield(text)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split(/\n\n/).size} paragraphs" }
analyzer.process { |text| puts "#{text.split(/\n/).size} lines" }
analyzer.process { |text| puts "#{text.split.size} words" }

# analyzer.process { 'example_2.txt' }
# analyzer.process { 'example_3.txt' }

# Sample Output
# 3 paragraphs
# 15 lines
# 126 words