require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'


class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = params[:user_text]
  
    @analyzed_text = TextAnalyzer.new(text_from_user)
    @mcl = @analyzed_text.most_used_letter.keys[0]
    @mul = @analyzed_text.most_used_letter.values[0]
    erb :results
  end 
end
