class UserStocksController < ApplicationController
    def create
        stock = Stock.check_db(params[:ticker])
        if stock.blank?
          stock = Stock.new_lookup(params[:ticker])
          stock.save
        end
        @user_stock = UserStock.create(user: current_user, stock: stock)
        flash.now[:notice] = "Stock #{stock.name} was added"
        redirect_to my_portfolio_path
    end
    def destroy
      stock = Stock.find(params[:id])
      user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first.destroy
      flash[:notice] = " Stock Removed"
      redirect_to my_portfolio_path
    end    
end
