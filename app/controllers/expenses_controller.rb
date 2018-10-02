class ExpensesController < ApplicationController
  def index
     
     if params[:concept].present? and params[:category_id].present?
      @expenses = Expense.where("concept LIKE ? AND category_id=? ", "%#{params[:concept]}%", params[:category_id]).order("date DESC")
     elsif params[:concept].present? or params[:category_id].present?
      @expenses = Expense.where("concept LIKE ?", "%#{params[:concept]}%").or(Expense.where("category_id=?", params[:category_id])).order("date DESC")
     else
  	  @expenses = Expense.order("date DESC")
  	end   
  end
end
