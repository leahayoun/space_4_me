class OnboardingController < ApplicationController
  include Wicked::Wizard
  steps :step1, :step2, :step3, :step4, :step5, :step6



  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    if @user.update(user_params)
      # Calcul du step suivant
      next_step_index = steps.index(step) + 1
      next_step = steps[next_step_index] || steps.last
      redirect_to wizard_path(next_step)
    else
      render_wizard @user
    end
  end

  private

  def user_params
    case step
    when :step2
      params.require(:user).permit(:date_of_birth, :gender, :gender_other, :birth_sex, :birth_sex_other)
    when :step3
      params.require(:user).permit(
        :hormonal_treatment_status,
        :treatment_androtardyl, :treatment_nebido,
        :treatment_bicalutamide, :treatment_decapeptyl,
        :treatment_progesterone, :treatment_estreva,
        :treatment_oestrodose, :treatment_oesclim,
        :treatment_dermestril, :treatment_provames,
        :treatment_estrofem, :treatment_progynova,
        :treatment_neofollin, :treatment_gynodian
      )
    else
      {}
    end
  end
end
