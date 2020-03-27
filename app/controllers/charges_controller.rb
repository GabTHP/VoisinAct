class ChargesController < ApplicationController
    def new
      @project = Project.find(params[:project_id])
    end

    def create
      # Amount in cents
      @amount = params[:donation_amount].to_i
      @project = Project.find(params[:project_id])
      puts "$"*60
      puts @project
      puts "$"*60

      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })

      if charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount*100,
        description: 'Rails Stripe customer',
        currency: 'eur',
      })
      
        @project.amount_state += @amount*100
        @project.save

      end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end  
end

