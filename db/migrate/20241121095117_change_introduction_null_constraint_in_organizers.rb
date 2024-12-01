class ChangeIntroductionNullConstraintInOrganizers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :organizers, :introduction, true
  end
end
