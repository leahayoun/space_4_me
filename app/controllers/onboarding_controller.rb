class OnboardingController < ApplicationController
  include Wicked::Wizard
  steps :step1, :step2, :step3, :step4, :step5, :step6

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
      params.require(:user).permit(:on_hormones, :wants_hormones, :hormone_info,
                                  :had_operation, :wants_operations, :operation_info,
                                  :expectations, :known_from)
    end
end
