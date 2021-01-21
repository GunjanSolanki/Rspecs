require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  before(:each) do
    @user = FactoryBot.create(:user, role_id: FactoryBot.create(:role, name:"client").id)
    @admin = FactoryBot.create(:user, role_id: FactoryBot.create(:role, name: "admin").id, account_active: true)
    @task = FactoryBot.create(:task)
    @report = FactoryBot.create(:report, task_id: @task.id)
    @acceptance_criterium = FactoryBot.create(:acceptance_criterium)
    @procedure = FactoryBot.create(:procedure)
    @ref_standard = FactoryBot.create(:ref_standard)
    @client = FactoryBot.create(:client)
    @test_method = FactoryBot.create(:test_method)
  end

  describe 'POST #create' do
    context 'giving valid params' do
      subject { post :create, params: {report: { task_id: @task.id, acceptance_criterium_id: @acceptance_criterium.id, procedure_id: @procedure.id, ref_standard_id: @ref_standard.id,
      																	client_id: @client.id, test_method_id: @test_method.id}}, xhr: true } 

      context 'with logged-in admin' do
        before { sign_in @admin }
        it { expect { subject }.to change(Report, :count).by(1) }
      end

      context 'with logged-in user' do
        before { sign_in @user }
        it { expect(subject).to redirect_to(root_path) }
        it { expect { subject }.not_to change(Report, :count) }
      end


      context 'without signing in' do
        it { expect(subject).to have_http_status(:unauthorized) }
      end
    end
  end

  describe 'GET #edit' do
    subject { get :edit, params: { id: @report.id, task_id: @task.id }  }
    context 'with logged-in user' do
      before { sign_in @user }
      it { expect(subject).to redirect_to(root_path) }
    end

    context 'with logged-in admin' do
      before { sign_in @admin }
      it {expect(subject).to render_template(:edit)}
    end

    context 'without logging in' do
      it { expect(subject).to redirect_to(new_user_session_path) }
    end
  end

  describe 'PATCH #update' do
    subject { patch :update, params: { report: {order_number: "Updated"}, id: @report.id, task_id: @task.id }}

    context 'with logged-in user' do
      before { sign_in @user }
      it { expect(subject).to redirect_to(root_path) }
    end

    context 'with logged-in admin' do
      before do 
        sign_in @admin
        subject
      end
      it {expect(@report.reload.order_number).to eq("Updated")}
      it {expect(subject).to redirect_to(edit_task_report_path(id: @report.id, task_id: @task.id))}
    end

    context 'without logging in' do
      it { expect(subject).to redirect_to(new_user_session_path) }
    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, params: { id: @report.id, task_id: @task.id  }, xhr: true}

    context 'with logged-in admin' do
      before { sign_in @admin }
      it { expect { subject }.to change(Report, :count).by(-1) }
    end

    context 'with logged-in user' do
      before { sign_in @user }
      it { expect(subject).to redirect_to(root_path) }
      it { expect { subject }.not_to change(Report, :count) }
    end

    context 'without signing in' do
      it { expect(subject).to have_http_status(:unauthorized) }
    end
  end
end

