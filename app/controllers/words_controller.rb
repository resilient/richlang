class WordsController < ApplicationController
	before_filter :authenticate_user!

  def index
    @words = current_user.words
  end

  def show
    @word = Word.find(params[:id])
  end

  def new
    @word = Word.new
  end

  def edit
    @word = Word.find(params[:id])
  end

  def create
    @word = current_user.words.build(params[:word])

    if @word.save
      redirect_to words_url, notice: 'Word was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @word = Word.find(params[:id])

    if @word.update_attributes(params[:word])
      redirect_to words_url, notice: 'Word was successfully updated.'
    else
      render action: "edit"
    end

  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy

    redirect_to words_url

  end
end
