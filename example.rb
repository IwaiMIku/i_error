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