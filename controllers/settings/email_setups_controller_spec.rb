require 'rails_helper'

RSpec.describe Settings::EmailSetupsController, type: :controller do
  before(:each) do
    @user = FactoryBot.create(:user, role_id: FactoryBot.create(:role, name:"client").id)
    @admin = FactoryBot.create(:user, role_id: FactoryBot.create(:role, name: "admin").id, account_active: true)
    @email_setup = FactoryBot.create(:email_setup )
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
      it { expect(subject).to redirect_to(new_user_session_path) }
    end
  end

  describe 'POST #create' do
    context 'giving valid params' do
      subject { post :create, params: {email_setup: {title: Faker::Name.name, from_email: Faker::Internet.email, subject: Faker::Name.name, sender_name: Faker::Name.name} } } 

      context 'with logged-in admin' do
        before { sign_in @admin }
        it { expect(subject).to redirect_to(settings_email_setup_path(EmailSetup.last.id)) }
        it { expect { subject }.to change(EmailSetup, :count).by(1) }
      end

      context 'with logged-in user' do
        before { sign_in @user }
        it { expect(subject).to redirect_to(root_path) }
        it { expect { subject }.not_to change(EmailSetup, :count) }
      end


      context 'without signing in' do
        it { expect(subject).to redirect_to(new_user_session_path) }
      end
    end
  end

  describe 'GET #edit' do
    subject { get :edit, params: { id: @email_setup.id }  }
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
    subject { patch :update, params: { email_setup: {title: "Updated"}, id: @email_setup.id }}

    context 'with logged-in user' do
      before { sign_in @user }
      it { expect(subject).to redirect_to(root_path) }
    end

    context 'with logged-in admin' do
      before do 
        sign_in @admin
        subject
      end
      it {expect(@email_setup.reload.title).to eq("Updated")}
      it {expect(subject).to redirect_to(settings_email_setup_path(@email_setup.id))}
    end

    context 'without logging in' do
      it { expect(subject).to redirect_to(new_user_session_path) }
    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, params: { id: @email_setup.id }}

    context 'with logged-in admin' do
      before { sign_in @admin }
      it { expect(subject).to redirect_to(settings_email_setups_path) }
      it { expect { subject }.to change(EmailSetup, :count).by(-1) }
    end

    context 'with logged-in user' do
      before { sign_in @user }
      it { expect(subject).to redirect_to(root_path) }
      it { expect { subject }.not_to change(EmailSetup, :count) }
    end

    context 'without signing in' do
      it { expect(subject).to redirect_to(new_user_session_path) }
    end
  end
end

