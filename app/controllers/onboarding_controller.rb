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
                                  :expectations, :known_from, :hormonal_treatment_status,
                               :treatment_androtardyl, :treatment_nebido,
                               :treatment_bicalutamide, :treatment_decapeptyl,
                               :treatment_progesterone, :treatment_estreva,
                               :treatment_oestrodose, :treatment_oesclim,
                               :treatment_dermestril, :treatment_provames,
                               :treatment_estrofem, :treatment_progynova,
                               :treatment_neofollin, :treatment_gynodian)
    end
end
