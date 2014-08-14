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

DISCOUNT = {
	0 => 1,
	100 => 0.98,
	500 => 0.97,
	1000 => 0.95,
	3000 => 0.93,
	10000 => 0.9
}

	def create
		@quantity = params[:quantity].to_i
		@price = (params[:price]).to_i
		@country_code = params[:country_code]
		@tax_rate = TAX_TABLE[@country_code.to_sym]
		@subtotal = @quantity*@price

		# if @subtotal >= 10000
		# 	@discount = 0.9
		# elsif @subtotal >= 3000
		# 	@discount = 0.93
		# elsif @subtotal >= 1000
		# 	@discount = 0.95
		# elsif @subtotal >= 500
		# 	@discount = 0.97
		# elsif @subtotal >= 100
		# 	@discount = 0.98
		# else
		# 	@disount = 1
		# end

		DISCOUNT.each do |key, value|
			if key.to_i <= @subtotal
				@discount = value
			end
		end

		@discounted = @subtotal * @discount
		@total = @discounted*@tax_rate

		@total.round(2)
		render 'show'
	end

end