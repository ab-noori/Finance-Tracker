require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  let(:user) { create(:user) } # Create a user using FactoryBot

  before do
    sign_in user # Assuming you have a sign_in helper method for Devise
  end

  describe 'GET /categories' do
    it 'displays the categories index page' do
      get categories_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /categories/new' do
    it 'displays the new category form' do
      get new_category_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST /categories' do
    it 'creates a new category' do
      category_attributes = attributes_for(:category, user:)

      expect do
        post categories_path, params: { category: category_attributes }
      end.to change(Category, :count).by(1)

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(categories_path)
    end
  end
end
