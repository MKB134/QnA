require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:answer) { create(:answer) }
  let(:user) { create(:user) }

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

  describe 'POST #create' do
    before { login(user) }
    let!(:answer) { create(:answer) }

    it 'assigns question to @question' do
      post :create, params: {question_id: answer.question, answer: attributes_for(:answer)}
      expect(assigns(:question)).to eq answer.question
    end

    context 'with valid attributes' do
      it 'saves a new answer in the database' do
        expect { post :create, params: {question_id: answer.question, answer: attributes_for(:answer)} }.to change(Answer, :count).by(1)
      end
      it 'redirects to show view' do
        post :create, params: {question_id: answer.question, answer: attributes_for(:answer)}
        expect(response).to redirect_to answer.question
      end
    end

    context 'with invalid attributes' do
      it 'does not save the answer' do
        expect { post :create, params: {question_id: answer.question, answer: attributes_for(:answer, :invalid)} }.to_not change(Answer, :count)
      end
      it 're-renders new view' do
        post :create, params: {question_id: answer.question, answer: attributes_for(:answer, :invalid)}
        expect(response).to render_template 'questions/show'
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'assigns requested answer to @answer' do
        patch :update, params: {id: answer, answer: attributes_for(:answer)}
        expect(assigns(:answer)).to eq answer
      end
      it 'changes answer attributes' do
        patch :update, params: {id: answer, answer: {body: 'new body'}}
        answer.reload
        expect(answer.body).to eq 'new body'
      end
      it 'redirects to updated answer' do
        patch :update, params: {id: answer, answer: attributes_for(:answer)}
        expect(response).to redirect_to answer
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: {id: answer, answer: attributes_for(:answer, :invalid)} }

      it 'does not change answer' do
        answer.reload
        expect(answer.body).to eq 'MyText'
      end
      it 're-renders edit view' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:answer) { create(:answer) }

    it 'delete the answer' do
      expect { delete :destroy, params: {id: answer} }.to change(Answer, :count).by(-1)
    end
    it 'redirects to index' do
      delete :destroy, params: {id: answer}
      expect(response).to redirect_to answer.question
    end
  end
end
