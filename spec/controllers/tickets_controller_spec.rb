require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  let(:train) { create(:train) }
  let(:user) { create(:user)}
  let(:ticket) { create(:ticket, train_id: train.id, user_id: user.id) }


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

    it 'assigns a new ticket to @ticket' do
      get :new
      expect(assigns(:ticket)).to be_a_new(Ticket)
    end
  end

  describe 'GET show' do
    before do
      ticket
    end

    it 'responds successfully with an HTTP 200 status code' do
      get :show, params: { id: ticket }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get :show, params: { id: ticket }
      expect(response).to render_template('show')
    end

    it 'assigns ticket to @ticket' do
      get :show, params: { id: ticket }
      expect(assigns(:ticket)).to eq(Ticket.find(ticket.id))
    end
  end

  describe 'GET edit' do
    before do
      ticket
    end

    it 'responds successfully with an HTTP 200 status code' do
      get :edit, params: { id: ticket }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the edit template' do
      get :edit, params: { id: ticket }
      expect(response).to render_template('edit')
    end

    it 'assigns ticket to @ticket' do
      get :edit, params: { id: ticket }
      expect(assigns(:ticket)).to eq(Ticket.find(ticket.id))
    end
  end

  describe 'POST create' do
    context 'with valid attributes' do
      subject { post :create, params: { ticket: attributes_for(:ticket, train_id: train.id) } }

      it 'creates a new ticket' do
        expect { subject }.to change(Ticket, :count).by(1)
      end

      it 'redirects to the ticket' do
        post :create, params: { ticket: attributes_for(:ticket, train_id: train.id) }
        expect(response).to redirect_to ticket_path(Ticket.last)
      end
    end
  end

  describe 'DELETE destroy' do
    before do
      ticket
    end
    subject { delete :destroy, params: { id: ticket, train_id: train.id } }

    it 'deletes the ticket' do
      expect { subject }.to change(Ticket, :count).by(-1)
    end

    it 'redirects to ticket_path' do
      delete :destroy, params: { id: ticket,train_id: train.id}
      expect(response).to redirect_to tickets_path
    end
  end
end
