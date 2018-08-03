require 'rails_helper'

RSpec.describe StationsController, type: :controller do
  let(:station) { create(:station) }

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

    it 'assigns a new station to @station' do
      get :new
      expect(assigns(:station)).to be_a_new(Station)
    end
  end

  describe 'GET show' do
    before do
      station
    end

    it 'responds successfully with an HTTP 200 status code' do
      get :show, params: { id: station }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get :show, params: { id: station }
      expect(response).to render_template('show')
    end

    it 'assigns station to @station' do
      get :show, params: { id: station }
      expect(assigns(:station)).to eq(Station.find(station.id))
    end
  end

  describe 'GET edit' do
    before do
      station
    end

    it 'responds successfully with an HTTP 200 status code' do
      get :edit, params: { id: station }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the edit template' do
      get :edit, params: { id: station }
      expect(response).to render_template('edit')
    end

    it 'assigns station to @station' do
      get :edit, params: { id: station }
      expect(assigns(:station)).to eq(Station.find(station.id))
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      subject { post :create, params: { station: attributes_for(:station) } }

      it 'creates a new station' do
        expect { subject }.to change(Station, :count).by(1)
      end

      it 'redirects to the station' do
        post :create, params: { station: attributes_for(:station) }
        expect(response).to redirect_to station_path(Station.last)
      end
    end

    context 'with invalid attributes' do
      subject { post :create, params: { station: attributes_for(:invalid_station) } }

      it 'does not save the new station' do
        expect { subject }.not_to change(Station, :count)
      end
    end
  end

  describe 'PUT update' do
    before do
      station
    end

    context 'with valid attributes' do
      it 'updates attributes' do
        put :update, params: { id: station,
                               station: attributes_for(:update_station) }
        station.reload
        expect(station.name).to eq'Lviv'
      end

      it 'redirects to the updated station' do
        put :update, params: { id: station,
                               station: attributes_for(:station) }
        expect(response).to redirect_to station_path(Station.last)
      end
    end

    context 'with invalid attributes' do
      it 'does not update attributes' do
        put :update, params: { id: station,
                               station: attributes_for(:invalid_station) }
        station.reload
        expect(station.name).to eq('Station')
      end
    end
  end

  describe 'DELETE destroy' do
    before do
      station
    end
    subject { delete :destroy, params: { id: station } }

    it 'deletes the station' do
      expect { subject }.to change(Station, :count).by(-1)
    end

    it 'redirects to stations_path' do
      delete :destroy, params: { id: station }
      expect(response).to redirect_to stations_path
    end
  end
end
