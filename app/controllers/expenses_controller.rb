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
    # Find the category
    @category = Category.find(params[:category_id])

    # Build a new expense and associate it with the category
    @expense = Expense.new(expense_params)
    @expense.user = current_user

    if @expense.save
      # Create an association between the expense and the category
      ExpenseCategoryAssociation.create(expense: @expense, category: @category)

      redirect_to category_path(@category), notice: 'Expense was successfully created.'
    else
      render :new
    end
  end

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
