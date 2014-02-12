class SpellsController < ApplicationController

  def create
    @spell = Spell.new(spell_params)
    if @spell.save
      flash[:notice] = "Spell added successfully."
      redirect_to spells_path
    else
      flash[:error] = "Whups, something went wrong."
      render :index
    end
  end

  def index
    @spells = Spell.all.order(:level, :name)
    @spell = Spell.new
  end

  protected

  def spell_params
    params.require(:spell).permit(:name, :url, :level)
  end

end
