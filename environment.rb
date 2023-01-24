require 'net/http'
require 'uri'
require 'json'

def translate(contents, source, target)
  url = URI.parse('https://translation.googleapis.com/language/translate/v2')
  params = {
    q: contents,
    source: source,
    target: target,
    format: "text",
    key: 'GOOGLE_TRANSLATE_KEY'
  }
  url.query = URI.encode_www_form(params)
  p res = Net::HTTP.get_response(url)
  JSON.parse(res.body)['data']['translations'].first['translatedText']
end

translate("hello", :en, :es)