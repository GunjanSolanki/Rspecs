require 'spec_helper'
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = FactoryBot.create(:user, role_id: FactoryBot.create(:role, name:"client").id)
    @admin = FactoryBot.create(:user, role_id: FactoryBot.create(:role, name: "admin").id, account_active: true)
  end

  describe 'GET #new' do
    subject {get :new}
    context 'with logged-in user' do
      before { sign_in @user }
      it {expect(subject).to redirect_to(root_path)}
    end

    context 'with logged-in admin' do
      before { sign_in @admin }
      it {expect(subject).to have_http_status(:success)}
      it {expect(subject).to render_template(:new)}
    end

    context 'without logging in' do
      it { expect(subject).to redirect_to(new_user_session_path) }
    end
  end

  describe 'GET #index' do
    subject { get :index }

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
      it { expect(get(:index)).to redirect_to(new_user_session_path) }
    end
  end

  describe 'GET #client_users' do
    subject { get :client_users }

    context 'with logged-in admin' do
      before { sign_in @user }
      it {expect(subject).to redirect_to(root_path)}
    end

    context 'with logged-in admin' do
      before { sign_in @admin }
      it {expect(subject).to have_http_status(:success)}
      it {expect(subject).to render_template(:client_users)}
    end

    context 'without logging in' do
      it { expect(get(:client_users)).to redirect_to(new_user_session_path) }
    end
  end

  describe 'GET #inspectors' do
    subject { get :inspectors }

    context 'with logged-in admin' do
      before { sign_in @user }
      it {expect(subject).to redirect_to(root_path)}
    end

    context 'with logged-in admin' do
      before { sign_in @admin }
      it {expect(subject).to have_http_status(:success)}
      it {expect(subject).to render_template(:inspectors)}
    end

    context 'without logging in' do
      it { expect(get(:inspectors)).to redirect_to(new_user_session_path) }
    end
  end

  describe 'GET #admins' do
    subject { get :admins }

    context 'with logged-in admin' do
      before { sign_in @user }
      it {expect(subject).to redirect_to(root_path)}
    end

    context 'with logged-in admin' do
      before { sign_in @admin }
      it {expect(subject).to have_http_status(:success)}
      it {expect(subject).to render_template(:admins)}
    end

    context 'without logging in' do
      it { expect(get(:admins)).to redirect_to(new_user_session_path) }
    end
  end

  describe 'POST #create' do
    context 'giving valid params' do
      subject { post :create, params: { user: {email: Faker::Internet.email, password: 'password', role_id: @user.role.id, active_account: true} } }

      context 'with logged-in admin' do
        before { sign_in @admin }
        it { expect(subject).to redirect_to(user_path(User.last.id)) }
        it { expect { subject }.to change(User, :count).by(1) }
      end

      context 'with logged-in user' do
        before { sign_in @user }
        it { expect(subject).to redirect_to(root_path) }
        it { expect { subject }.not_to change(User, :count) }
      end


      context 'without signing in' do
        it { expect(subject).to redirect_to(new_user_session_path) }
      end
    end
  end


  describe 'GET #show' do
    subject { get :show, params: { id: @user.id } }
    context 'with logged-in user' do
      before { sign_in @user }
      it { expect(subject).to render_template(:show) }
    end

    context 'with logged-in admin' do
      before { sign_in @admin }
      it {expect(subject).to have_http_status(:success)}
      it {expect(subject).to render_template(:show)}
    end
  end

  describe 'GET #edit' do
    subject { get :edit, params: { id: @user.id } }
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
    subject { patch :update, params: { user: {email: 'Updated@updated.com'}, id: @user.id } }

    context 'with logged-in user' do
      before { sign_in @user }
      it { expect(subject).to redirect_to(root_path)}
    end

    context 'with logged-in admin' do
      before do 
        sign_in @admin
        subject
      end
      it {expect(@user.reload.email).to eq("updated@updated.com")}
      it {expect(subject).to redirect_to(user_path(@user.id))}
    end

    context 'without logging in' do
      it { expect(subject).to redirect_to(new_user_session_path) }
    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, params: { id: @user.id }}

    context 'with logged-in admin' do
      before { sign_in @admin }
      it { expect(subject).to redirect_to(users_path) }
      it { expect { subject }.to change(User, :count).by(-1) }
    end

    context 'with logged-in user' do
      before { sign_in @user }
      it { expect(subject).to redirect_to(root_path) }
      it { expect { subject }.not_to change(User, :count) }
    end

    context 'without signing in' do
      it { expect(subject).to redirect_to(new_user_session_path) }
    end
  end
end
