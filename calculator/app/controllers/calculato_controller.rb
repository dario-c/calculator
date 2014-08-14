class CalculatoController < ApplicationController

def new
end

def create
	@quantity = params[:quantity].to_i
	@price = (params[:price]).to_i
	@subtotal = @quantity*@price
	render 'show'
end

end