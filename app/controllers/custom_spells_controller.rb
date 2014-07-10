class CustomSpellsController < ApplicationController

  before_action :set_user, only: [:create, :index, :new]
  before_action :set_spell, only: [:show, :update]

  def create
    @custom_spell = CustomSpell.new(custom_spell_params)
    @custom_spell.user = User.find(params[:user_id])
    if @custom_spell.save
      flash[:success] = "Custom spell created successfully."
      redirect_to user_custom_spells_path(User.find(params[:user_id]))
    else
      flash.now[:error] = "Whups, something went wrong."
      render :new
    end
  end

  def new
    @custom_spell = CustomSpell.new
  end

  def update
    if @custom_spell.update(custom_spell_params)
      flash[:success] = "Custom spell successfully edited."
      redirect_to user_custom_spells_path(User.find(params[:user_id]))
    else
      flash.now[:error] = "Whups, something went wrong."
      render :show
    end
  end

  protected

  def custom_spell_params
    params.require(:custom_spell).permit(:name, :school, :level, :casting_time, :components, :area, :range, :target, :duration, :saving_throw, :spell_resistance, :description)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_spell
    @custom_spell = CustomSpell.find(params[:id])
  end

end
