require 'rails_helper'

RSpec.describe TrainsController, type: :controller do
  let(:train) { create(:train) }

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

    it 'assigns a new train to @train' do
      get :new
      expect(assigns(:train)).to be_a_new(Train)
    end
  end

  describe 'GET show' do
    before do
      train
    end

    it 'responds successfully with an HTTP 200 status code' do
      get :show, params: { id: train }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get :show, params: { id: train }
      expect(response).to render_template('show')
    end

    it 'assigns train to @train' do
      get :show, params: { id: train }
      expect(assigns(:train)).to eq(Train.find(train.id))
    end
  end

  describe 'GET edit' do
    before do
      train
    end

    it 'responds successfully with an HTTP 200 status code' do
      get :edit, params: { id: train }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the edit template' do
      get :edit, params: { id: train }
      expect(response).to render_template('edit')
    end

    it 'assigns train to @train' do
      get :edit, params: { id: train }
      expect(assigns(:train)).to eq(Train.find(train.id))
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      subject { post :create, params: { train: attributes_for(:train) } }

      it 'creates a new train' do
        expect { subject }.to change(Train, :count).by(1)
      end

      it 'redirects to the train' do
        post :create, params: { train: attributes_for(:train) }
        expect(response).to redirect_to train_path(Train.last)
      end
    end

    context 'with invalid attributes' do
      subject { post :create, params: { train: attributes_for(:invalid_train) } }

      it 'does not save the new train' do
        expect { subject }.not_to change(Train, :count)
      end
    end
  end

  describe 'PUT update' do
    before do
      train
    end

    context 'with valid attributes' do
      it 'updates attributes' do
        put :update, params: { id: train,
                               train: attributes_for(:update_train) }
        train.reload
        expect(train.last_name_station).to eq 'Kiev'
      end

      it 'redirects to the updated train' do
        put :update, params: { id: train,
                               train: attributes_for(:train) }
        expect(response).to redirect_to train_path(Train.last)
      end
    end

    context 'with invalid attributes' do
      it 'does not update attributes' do
        put :update, params: { id: train,
                               train: attributes_for(:invalid_train) }
        train.reload
        expect(train.last_name_station).to eq('Harkiv')
      end
    end
  end

  describe 'DELETE destroy' do
    before do
      train
    end
    subject { delete :destroy, params: { id: train } }

    it 'deletes the train' do
      expect { subject }.to change(Train, :count).by(-1)
    end

    it 'redirects to trains_path' do
      delete :destroy, params: { id: train }
      expect(response).to redirect_to trains_path
    end
  end
end
