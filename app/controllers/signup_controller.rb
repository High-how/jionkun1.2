class SignupController < ApplicationController
  def create
    @member = Member.new(
      name: session[:name],
      tel: session[:tel],
      birthday: session[:birthday],
      postcode: session[:postcode],
      city: session[:city],
      block: session[:block],
      building: session[:building],
      secularname: session[:secularname],
      dharmaname: session[:dharmaname],
      deceased: session[:deceased]
    )
    if @member.save
      session[:id] = @member.id
      redirect_to root_path
    else
      render '/signup/step1'
    end
  end

  def step1
    @member = Member.new
  end

  def step2
    session[:name] = member_params[:name]
    session[:tel] = member_params[:tel]
    session[:birthday] = member_params[:birthday]
    session[:postcode] = member_params[:postcode]
    session[:city] = member_params[:city]
    session[:block] = member_params[:block]
    session[:building] = member_params[:building]
    @member = Member.new 
  end

  def step3
    session[:secularname] = member_params[:secularname]
    session[:dharmaname] = member_params[:dharmaname]
    session[:deceased] = member_params[:deceased]
    @member = Member.new 
  end

  private

  def member_params
    params.require(:member).permit(
      :name,
      :tel,
      :birthday,
      :postcode,
      :city,
      :block,
      :building,
      :secularname,
      :dharmaname,
      :deceased,
      :spring,
      :summer,
      :autumn,
      :winter
  )
  end
end
