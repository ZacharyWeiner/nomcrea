class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    proposal = Proposal.find(params[:proposal_id])

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => proposal.price * 100,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    if charge[:paid]
      proposal.is_paid = true
      proposal.charge_id = charge[:id]
    end 
    byebug

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to proposal_path(proposal)
  end
end
