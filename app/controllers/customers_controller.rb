class CustomersController < ApplicationController
  def show
	  @customer = Customer.find(params[:id])
	  @customer = current_customer
  end

  def edit
  	  @customer = Customer.find(params[:id])
  	  if @customer != current_customer
      redirect_to _products_path
      end
  end

  def update
      @customer = Customer.find(params[:id])
      if @customer.update(customer_params)
      flash[:notice] = "登録情報を更新しました"
      redirect_to customer_path(@customer.id)
      else
      render :edit
      end
  end

  def cancel
      @customer = Customer.find(params[:id])
      @customer.cancel
      flash[:notice] = "Book was successfully destroyed."
      redirect_to home_path
  end

  private
  def customer_params
     params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :address, :phone_number, :email, :account_status)
  end
end
