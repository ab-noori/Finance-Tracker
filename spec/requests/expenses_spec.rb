require 'rails_helper'

RSpec.describe ExpensesController, type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }

  before do
    sign_in user
  end

  describe 'GET /new' do
    it 'returns a successful response' do
      get new_category_expense_path(category)
      expect(response).to be_successful
    end

    it "renders the 'new' template" do
      get new_category_expense_path(category)
      expect(response).to render_template(:new)
    end

    it 'assigns a new expense' do
      get new_category_expense_path(category)
      expect(assigns(:expense)).to be_a_new(Expense)
    end
  end
end
