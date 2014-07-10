class SpellsController < ApplicationController

  def create
    @spell = Spell.new(spell_params)
    @spell.user = User.find(params[:user_id])
    if @spell.save
      flash[:success] = "Spell added successfully."
      redirect_to user_spells_path(User.find(params[:user_id])) + '?#'
    else
      flash.now[:error] = "Whups, something went wrong."
      render :index
    end
  end

  def index
    @user = User.find(params[:user_id])
    @spells = @user.spells.order(:level, :name)
    @spells_by_level = Hash.new
    @spells.each do |spell|
      if @spells_by_level.has_key?(spell.level)
          @spells_by_level[spell.level] << spell
      else
        @spells_by_level[spell.level] = [spell]
      end
    end
    @spell = Spell.new

  end

  def show
    @spell = Spell.find(params[:id])
  end

  def update
    @spell = Spell.find(params[:id])
    if @spell.update(spell_params)
      flash[:success] = "Spell successfully edited."
      redirect_to user_spells_path(User.find(params[:user_id])) + '?#'
    else
      flash.now[:error] = "Whups, something went wrong."
      render :show
    end
  end


  protected

  def spell_params
    params.require(:spell).permit(:name, :url, :level)
  end

end
