require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:answer) { create(:answer) }

  describe 'GET#show' do
    before { get :show, params: {id: answer} }

    it 'assigns request answer to @answer' do
      expect(assigns(:answer)). to eq answer
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end
end
