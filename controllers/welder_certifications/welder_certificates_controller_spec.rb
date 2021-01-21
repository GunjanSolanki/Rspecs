require 'rails_helper'

RSpec.describe WelderCertifications::WelderCertificatesController, type: :controller do
    before(:each) do
    @user = FactoryBot.create(:user, role_id: FactoryBot.create(:role, name:"client").id)
    @admin = FactoryBot.create(:user, role_id: FactoryBot.create(:role, name: "admin").id, account_active: true)
    @welder = FactoryBot.create(:welder)
    @welder_certificate = FactoryBot.create(:welder_certificate)
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

  describe 'POST #create' do
    context 'giving valid params' do
      subject { post :create, params: {welder_certificate: { cert_no: "Any name", welder_id: @welder_certificate.welder_id, standard: @welder_certificate.standard}} } 

      context 'with logged-in admin' do
        before { sign_in @admin }
        it { expect { subject }.to change(WelderCertificate, :count).by(1) }
      end

      context 'with logged-in user' do
        before { sign_in @user }
        it { expect(subject).to redirect_to(root_path) }
        it { expect { subject }.not_to change(WelderCertificate, :count) }
      end


      context 'without signing in' do
        it { expect(subject).to redirect_to(new_user_session_path) }
      end
    end
  end

  describe 'GET #edit' do
    subject { get :edit, params: { id: @welder_certificate.id }  }
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
    subject { patch :update, params: { welder_certificate: {cert_no: "Updated"}, id: @welder_certificate.id }}

    context 'with logged-in user' do
      before { sign_in @user }
      it { expect(subject).to redirect_to(root_path) }
    end

    context 'with logged-in admin' do
      before do 
        sign_in @admin
        subject
      end
      it {expect(@welder_certificate.reload.cert_no).to eq("Updated")}
      it {expect(subject).to redirect_to(welder_certifications_welder_certificate_path(@welder_certificate.id))}
    end

    context 'without logging in' do
      it { expect(subject).to redirect_to(new_user_session_path) }
    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, params: { id: @welder_certificate.id }}

    context 'with logged-in admin' do
      before { sign_in @admin }
      it { expect { subject }.to change(WelderCertificate, :count).by(-1) }
    end

    context 'with logged-in user' do
      before { sign_in @user }
      it { expect(subject).to redirect_to(root_path) }
      it { expect { subject }.not_to change(WelderCertificate, :count) }
    end

    context 'without signing in' do
      it { expect(subject).to redirect_to(new_user_session_path) }
    end
  end
end

