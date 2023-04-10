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

  describe 'GET#new' do
    before { get :new, params: { question_id: answer.question } }


    it 'assigns a new Answer to @answer' do
      expect(assigns(:answer)).to be_a_new(Answer)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET#edit' do
    before { get :edit, params: { id: answer } }


    it 'assigns a new Answer to @answer' do
      expect(assigns(:answer)).to eq answer
    end

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST#create' do

  end
end
