class AfterSignupController < ApplicationController
  include Wicked::Wizard
  steps :profile, :gender_info, :confidentiality, :hormones, :operations, :expectations, :how_found_us

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    @user.update(user_params)
    render_wizard @user
  end

  private

  def user_params
    params.require(:user).permit(
      :on_hormones,
      :wants_hormones,
      :hormone_info,
      :had_operation,
      :wants_operations,
      :operation_info,
      :expectations,
      :known_from
    )
  end
end
