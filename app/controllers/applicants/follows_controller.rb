class Applicants::FollowsController < ApplicationController
  before_action :authenticate_applicant!

  def create
    # フォローレコードが1件もない場合は、レコードを作る
    Follow.find_or_create_by(applicant_id: params[:follow_id], follow_id: current_applicant.id)
    redirect_to applicants_applicant_path(current_applicant)
  end

  def destroy
    # フォローレコードを探し、フォローレコードを削除する
    #   TODO : 勝手に他のユーザーのフォローを外されないようにparams[:id]で対象のユーザーIDを受け取る
    Follow.find_by(applicant_id: params[:id], follow_id: current_applicant.id).destroy
    redirect_to applicants_applicant_path(current_applicant)
  end
end
