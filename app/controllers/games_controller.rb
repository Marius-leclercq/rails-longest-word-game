require "open-uri"


class GamesController < ApplicationController
  def new
    @letters = ("a".."z").to_a.sample(10)
  end

  def score
    @play = params[:play]
    url = "https://wagon-dictionary.herokuapp.com/#{@play}"
    @word = JSON.parse(URI.open(url).read)
    @letters = params[:letters].split('')
    if @word['found'] == false
      @message = 'so bad buddy'
    elsif @play.include?(@letters.to_s)
      @word[:lenght]
    end
  end
end
