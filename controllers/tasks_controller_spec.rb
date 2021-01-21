require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  before(:each) do
    @user = FactoryBot.create(:user, role_id: FactoryBot.create(:role, name:"client").id)
    @admin = FactoryBot.create(:user, role_id: FactoryBot.create(:role, name: "admin").id, account_active: true)
    @task = FactoryBot.create(:task)
  end

  describe 'GET #index' do
    subject { get :index }

    context 'with logged-in user' do
      before { sign_in @user }
      it {expect(subject).to render_template(:index)}
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

  describe 'GET #edit' do
    subject { get :edit, params: { id: @task.id }  }
    context 'with logged-in user' do
      before { sign_in @user }
      it { expect(subject).to redirect_to(root_path) }
    end

    context 'with logged-in admin' do
      before { sign_in @admin }
      it {expect(subject).to have_http_status(:success)}
      it {expect(subject).to render_template(:edit)}
    end

    context 'without logging in' do
      it { expect(subject).to redirect_to(new_user_session_path) }
    end
  end

  describe 'PATCH #update' do
    subject { patch :update, params: { task: {name: "Updated"}, id: @task.id }}

    context 'with logged-in user' do
      before { sign_in @user }
      it { expect(subject).to redirect_to(root_path) }
    end

    context 'with logged-in admin' do
      before do 
        sign_in @admin
        subject
      end
      it {expect(@task.reload.name).to eq("Updated")}
      it {expect(subject).to redirect_to(task_path(@task.id))}
    end

    context 'without logging in' do
      it { expect(subject).to redirect_to(new_user_session_path) }
    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, params: { id: @task.id }}

    context 'with logged-in admin' do
      before { sign_in @admin }
      it { expect(subject).to redirect_to(tasks_path) }
      it { expect { subject }.to change(Task, :count).by(-1) }
    end

    context 'with logged-in user' do
      before { sign_in @user }
      it { expect(subject).to redirect_to(root_path) }
      it { expect { subject }.not_to change(Task, :count) }
    end

    context 'without signing in' do
      it { expect(subject).to redirect_to(new_user_session_path) }
    end
  end
end

