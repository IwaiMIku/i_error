# frozen_string_literal: true

require "command_line/global"
require "google/cloud/translate/v2"
require_relative "i_error/version"

module IError
  class Error < StandardError; end
  # Your code goes here...
  puts "hello"
  
  def from_file(file='tmp.txt')
    File.readlines('tmp.txt').each do |line|
      input_string = "NoMethodError: undefined method chomp' for #<MatchData \"# head1\" 1:\"#\" 2:\"head1\">"
      puts input_string
      p result = command_line("trans :ja #{input_string}")
      p line.match(/(.+?)\(LoadError\)/) #正規表現
      puts "ruby: LoadErrorです. hoge.rb というファイルあるいはディレクトリがありません."
    end
  end

  lines = STDIN.readlines
    client = Google::Cloud::Translate::V2.new(
      key: ENV["GOOGLE_TRANSLATE_KEY"]
    )
  #contents = "environment.rb:5:in 'translate': wrong number of arguments (given 0, expected 3) (ArgumentError)
  #from environment.rb:17:in '<main>'"
    p lines
  lines.each do |line|
    p "hoge"
    translation = client.translate line, to: "ja"

    puts translation #=> Salve mundi!

    translation.from #=> "en"
    translation.origin #=> "Hello world!"
    translation.to #=> "la"
    translation.text #=> "Salve mundi!"
  end
end