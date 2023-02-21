# frozen_string_literal: true

require "command_line/global"
require "google/cloud/translate/v2"
require_relative "i_error/version"

module IError
  class Error < StandardError; end
  
  lines = STDIN.readlines
  client = Google::Cloud::Translate::V2.new(
    key: ENV["GOOGLE_TRANSLATE_KEY"]
  )
  
  puts lines
  lines.each do |line|
    translation = client.translate lines, to: "ja"

    puts translation #=> Salve mundi!
  end
end

  client = Google::Cloud::Translate::V2.new(
    key: ENV["GOOGLE_TRANSLATE_KEY"]
  )
  contents = "environment.rb:5:in 'translate':
  wrong number of arguments (given 0, expected 3) (ArgumentError)
  from environment.rb:17:in '<main>'"

  translation = client.translate contents, to: "ja"

  puts translation #=> Salve mundi!