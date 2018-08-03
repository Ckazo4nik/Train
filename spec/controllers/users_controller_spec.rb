require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET new' do
    it 'responds successfully with an HTTP 200 status code' do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end

    it 'assigns a new user to @user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'GET show' do
    before do
      user
    end

    it 'responds successfully with an HTTP 200 status code' do
      get :show, params: { id: user }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get :show, params: { id: user }
      expect(response).to render_template('show')
    end

    it 'assigns user to @user' do
      get :show, params: { id: user }
      expect(assigns(:user)).to eq(User.find(user.id))
    end
  end

  describe 'GET edit' do
    before do
      user
    end

    it 'responds successfully with an HTTP 200 status code' do
      get :edit, params: { id: user }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the edit template' do
      get :edit, params: { id: user }
      expect(response).to render_template('edit')
    end

    it 'assigns user to @user' do
      get :edit, params: { id: user }
      expect(assigns(:user)).to eq(User.find(user.id))
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      subject { post :create, params: { user: attributes_for(:user) } }

      it 'creates a new user' do
        expect { subject }.to change(User, :count).by(1)
      end

      it 'redirects to the user' do
        post :create, params: { user: attributes_for(:user) }
        expect(response).to redirect_to user_path(User.last)
      end
    end

    context 'with invalid attributes' do
      subject { post :create, params: { user: attributes_for(:invalid_user) } }

      it 'does not save the new user' do
        expect { subject }.not_to change(User, :count)
      end
    end
  end

  describe 'PUT update' do
    before do
      user
    end

    context 'with valid attributes' do
      it 'updates attributes' do
        put :update, params: { id: user,
                               user: attributes_for(:update_user) }
        user.reload
        expect(user.name).to eq 'Ira'
      end

      it 'redirects to the updated user' do
        put :update, params: { id: user,
                               user: attributes_for(:user) }
        expect(response).to redirect_to user_path(User.last)
      end
    end

    context 'with invalid attributes' do
      it 'does not update attributes' do
        put :update, params: { id: user,
                               user: attributes_for(:invalid_user) }
        user.reload
        expect(user.name).to eq('Orest')
      end
    end
  end

  describe 'DELETE destroy' do
    before do
      user
    end
    subject { delete :destroy, params: { id: user } }

    it 'deletes the user' do
      expect { subject }.to change(User, :count).by(-1)
    end

    it 'redirects to users_path' do
      delete :destroy, params: { id: user }
      expect(response).to redirect_to users_path
    end
  end
end
