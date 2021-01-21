require 'rails_helper'

RSpec.describe EquipmentController, type: :controller do
  before(:each) do
    @user = FactoryBot.create(:user, role_id: FactoryBot.create(:role, name:"client").id)
    @admin = FactoryBot.create(:user, role_id: FactoryBot.create(:role, name: "admin").id, account_active: true)
    @supplier = FactoryBot.create(:supplier)
    @equipment_type = FactoryBot.create(:equipment_type)
    @department = FactoryBot.create(:department)
    @supplier =  FactoryBot.create(:supplier)
    @equipment_location = FactoryBot.create(:equipment_location)
    @equipment = FactoryBot.create(:equipment, user_id: @user.id, supplier_id: @supplier.id, department_id: @department.id,
    								equipment_location_id: @equipment_location.id, equipment_type_id: @equipment_type.id )
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
      subject { post :create, params: {equipment: {name: "equipment Creating", supplier_id: @supplier.id, department_id: @department.id,
  				equipment_location_id: @equipment_location.id,  equipment_type_id: @equipment_type.id, user_id: @user.id }} } 
      context 'with logged-in admin' do
        before { sign_in @admin }
        it { expect(subject).to redirect_to(equipment_path(Equipment.last.id)) }
        it { expect { subject }.to change(Equipment, :count).by(1) }
      end

      context 'with logged-in user' do
        before { sign_in @user }
        it { expect(subject).to redirect_to(root_path) }
        it { expect { subject }.not_to change(Equipment, :count) }
      end


      context 'without signing in' do
        it { expect(subject).to redirect_to(new_user_session_path) }
      end
    end
  end

  describe 'GET #edit' do
    subject { get :edit, params: { id: @equipment.id }  }
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
    subject { patch :update, params: { equipment: {name: "Updated"}, id: @equipment.id }}

    context 'with logged-in user' do
      before { sign_in @user }
      it { expect(subject).to redirect_to(root_path) }
    end

    context 'with logged-in admin' do
      before do 
        sign_in @admin
        subject
      end
      it {expect(@equipment.reload.name).to eq("Updated")}
      it {expect(subject).to redirect_to(equipment_path(@equipment.id))}
    end

    context 'without logging in' do
      it { expect(subject).to redirect_to(new_user_session_path) }
    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, params: { id: @equipment.id }}

    context 'with logged-in admin' do
      before { sign_in @admin }
      it { expect(subject).to redirect_to(equipment_index_path) }
      it { expect { subject }.to change(Equipment, :count).by(-1) }
    end

    context 'with logged-in user' do
      before { sign_in @user }
      it { expect(subject).to redirect_to(root_path) }
      it { expect { subject }.not_to change(Equipment, :count) }
    end

    context 'without signing in' do
      it { expect(subject).to redirect_to(new_user_session_path) }
    end
  end
end

