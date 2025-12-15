class OnboardingController < ApplicationController
  include Wicked::Wizard
  steps :step1, :step2, :step3, :step4, :step5, :step6

  def show
    @user = current_user
    render_wizard #préciser la step associée
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
        :treatment_androtardyl, :treatment_nebido, :treatment_bicalutamide,
        :treatment_decapeptyl, :treatment_progesterone, :treatment_estreva,
        :treatment_oestrodose, :treatment_oesclim, :treatment_dermestril,
        :treatment_provames, :treatment_estrofem, :treatment_progynova,
        :treatment_neofollin, :treatment_lupron, :treatment_gynodian
      )
    when :step4
      params.require(:user).permit(
        :operation_status,
        :operation_torsoplastie, :operation_phalloplastie, :operation_metaiodoplastie,
        :operation_hysterectomie, :exercices_voix_m, :sport, :operation_fronto_orbital_contouring,
        :operation_rhinoplastie, :operation_genioplastie, :operation_tracheal_shave,
        :operation_glottoplastie, :operation_augmentation_mammaire, :operation_vaginoplastie,
        :operation_labiaplastie, :operation_orchiectomie, :operation_liposculpture_feminisante,
        :operation_bbl, :exercices_voix_f, :epilation_laser
      )
    when :step5
      params.require(:user).permit(:how_found)
    when :step6
      params.require(:user).permit(:expectations_info)
    else
      {}
    end
  end
end
