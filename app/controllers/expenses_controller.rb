class ExpensesController < ApplicationController
    before_action :authenticate_user! # Ensure that the user is authenticated
  
    def index
      # Retrieve the category based on category_id (you'll need to pass category_id as a parameter)
      @category = Category.find(params[:category_id])
  
      # Retrieve the list of transactions for the category, ordered by most recent
      @transactions = @category.expenses.order(created_at: :desc)
  
      # Calculate the total amount for the category
      @total_amount = @transactions.sum(:amount)
    end
  
    def new
      # Create a new expense associated with a category (you'll need to pass category_id as a parameter)
      @category = Category.find(params[:category_id])
      @expense = Expense.new
    end
  
    def create
      # Create a new expense associated with a category (you'll need to pass category_id as a parameter)
      @category = Category.find(params[:category_id])
      @expense = @category.expenses.build(expense_params)
  
      if @expense.save
        redirect_to category_expenses_path(@category), notice: 'Expense was successfully created.'
      else
        render :new
      end
    end
  end
  