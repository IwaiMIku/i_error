# frozen_string_literal: true

require "command_line/global"

require_relative "i_error/version"

module IError
  class Error < StandardError; end
  # Your code goes here...
  puts "hello"
  
  File.readlines('tmp.txt').each do |line|
    input_string = "NoMethodError: undefined method chomp' for #<MatchData \"# head1\" 1:\"#\" 2:\"head1\">"
    puts input_string
    p result = command_line("trans :ja #{input_string}")
    p line.match(/(.+?)\(LoadError\)/) #正規表現
    puts "ruby: LoadErrorです. hoge.rb というファイルあるいはディレクトリがありません."
  end

  require "google/cloud/translate/v2"
client = Google::Cloud::Translate::V2.new(
  key: ENV["GOOGLE_TRANSLATE_KEY"]
)
contents = "environment.rb:5:in 'translate': wrong number of arguments (given 0, expected 3) (ArgumentError)
from environment.rb:17:in '<main>'"

translation = client.translate contents, to: "ja"

puts translation #=> Salve mundi!

translation.from #=> "en"
translation.origin #=> "Hello world!"
translation.to #=> "la"
translation.text #=> "Salve mundi!"
end

