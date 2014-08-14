class CalculatoController < ApplicationController


	def new
	end

TAX_TABLE = {
			es: 1.21,
			de: 1.19,
			fr: 1.12,
			no: 1.35,
			it: 1.20,
			ph: 1.12
		}

	def create
		@quantity = params[:quantity].to_i
		@price = (params[:price]).to_i
		@country_code = params[:country_code]
		@tax_rate = TAX_TABLE[@country_code.to_sym]
		@subtotal = (@quantity*@price)*(@tax_rate)
		@subtotal.round(2)
		render 'show'
	end

end