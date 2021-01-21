# require 'rails_helper'

# RSpec.describe Settings::Radiography::IsotopesController, type: :controller do
#   user = FactoryBot.create(:user, role_id: Role.where(name: "client").first.id)
#   admin = FactoryBot.create(:user, role_id:  Role.where(name: "admin").first.id)
#   isotope = FactoryBot.create(:isotope )

#   describe 'GET #new' do
#     subject {get :new}
#     context 'with logged-in user' do
#       before { sign_in user }
#       it {expect(subject).to redirect_to(root_path)}
#     end

#     context 'with logged-in admin' do
#       before { sign_in admin }
#       it {expect(subject).to have_http_status(:success)}
#       it {expect(subject).to render_template(:new)}
#     end

#     context 'without logging in' do
#       it { expect(subject).to redirect_to(new_user_session_path) }
#     end
#   end

#   describe 'GET #index' do
#     subject { get :index }

#     context 'with logged-in admin' do
#       before { sign_in user }
#       it {expect(subject).to redirect_to(root_path)}
#     end

#     context 'with logged-in admin' do
#       before { sign_in admin }
#       it {expect(subject).to have_http_status(:success)}
#       it {expect(subject).to render_template(:index)}
#     end

#     context 'without logging in' do
#       it { expect(subject).to redirect_to(new_user_session_path) }
#     end
#   end

#   describe 'POST #create' do
#     context 'giving valid params' do
#       subject { post :create, params: {isotope: {name: "IQI type Creating"}} } 

#       context 'with logged-in admin' do
#         before { sign_in admin }
#         it { expect(subject).to redirect_to(settings_radiography_isotope_path(Isotope.last.id)) }
#         it { expect { subject }.to change(Isotope, :count).by(1) }
#       end

#       context 'with logged-in user' do
#         before { sign_in user }
#         it { expect(subject).to redirect_to(root_path) }
#         it { expect { subject }.not_to change(Isotope, :count) }
#       end


#       context 'without signing in' do
#         it { expect(subject).to redirect_to(new_user_session_path) }
#       end
#     end
#   end

#   describe 'GET #edit' do
#     subject { get :edit, params: { id: isotope.id }  }
#     context 'with logged-in user' do
#       before { sign_in user }
#       it { expect(subject).to redirect_to(root_path) }
#     end

#     context 'with logged-in admin' do
#       before { sign_in admin }
#       it {expect(subject).to have_http_status(:success)}
#       it {expect(subject).to render_template(:edit)}
#     end

#     context 'without logging in' do
#       it { expect(subject).to redirect_to(new_user_session_path) }
#     end
#   end

#   describe 'PATCH #update' do
#     subject { patch :update, params: { isotope: {name: "Updated"}, id: isotope.id }}

#     context 'with logged-in user' do
#       before { sign_in user }
#       it { expect(subject).to redirect_to(root_path) }
#     end

#     context 'with logged-in admin' do
#       before do 
#         sign_in admin
#         subject
#       end
#       it {expect(isotope.reload.name).to eq("Updated")}
#       it {expect(subject).to redirect_to(settings_radiography_isotope_path(isotope.id))}
#     end

#     context 'without logging in' do
#       it { expect(subject).to redirect_to(new_user_session_path) }
#     end
#   end

#   describe 'DELETE #destroy' do
#     subject { delete :destroy, params: { id: isotope.id }}

#     context 'with logged-in admin' do
#       before { sign_in admin }
#       it { expect(subject).to redirect_to(settings_radiography_exposure_methods_path) }
#       it { expect { subject }.to change(Isotope, :count).by(-1) }
#     end

#     context 'with logged-in user' do
#       before { sign_in user }
#       it { expect(subject).to redirect_to(root_path) }
#       it { expect { subject }.not_to change(Isotope, :count) }
#     end

#     context 'without signing in' do
#       it { expect(subject).to redirect_to(new_user_session_path) }
#     end
#   end
# end

