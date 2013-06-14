class WordsController < ApplicationController
	before_filter :authenticate_user!
  respond_to :html, :json

  def index
    @search_word = params[:search]

    @words = current_user.words.search(@search_word).order("created_at DESC")
    #@words = Word.search(@search_word).order("created_at DESC")

    @words_count = @words.size
  end

  def show
    @word = Word.find(params[:id])
  end


  def edit
    @word = Word.find(params[:id])
  end

  def new
    @word = Word.new
  end

  def create
    @word = current_user.words.build(params[:word])

    if @word.save
      redirect_to words_path
    else
      redirect_to words_path, notice: I18n.t('.something_wrong')
    end
  end

  def update
    @word = Word.find(params[:id])

    @word.update_attributes(params[:word])
    respond_with @word
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy

    redirect_to words_path
  end
end
