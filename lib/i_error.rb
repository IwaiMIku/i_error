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
end