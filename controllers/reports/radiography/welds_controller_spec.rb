require 'rails_helper'

RSpec.describe Reports::Radiography::WeldsController, type: :controller do
    before(:each) do
    @user = FactoryBot.create(:user, role_id: FactoryBot.create(:role, name:"client").id)
    @admin = FactoryBot.create(:user, role_id: FactoryBot.create(:role, name: "admin").id, account_active: true)
    @report = FactoryBot.create(:report)
    @weld = FactoryBot.create(:weld, report_id: @report.id )
  end

  describe 'GET #index' do
    subject { get :index , params: {report_id: @report.id, task_id: @report.task_id} }

    context 'with logged-in admin' do
      before { sign_in @user }
      it {expect(subject).to redirect_to(root_path)}
    end

    context 'with logged-in admin' do
      before { sign_in @admin }
      it {expect(subject).to have_http_status(:success)}
      it {expect(subject).to render_template(:index)}
    end

    context 'without logging in' do
      it { expect(subject).to redirect_to(new_user_session_path) }
    end
  end
end

