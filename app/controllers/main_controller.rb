class MainController < ApplicationController
  before_action :get_contact, only: [:about, :contact]


  def contact
    @contact.assign_attributes(contact_params)

    if @contact.valid?
      ContactMailer.submit(@contact).deliver_now
      redirect_to root_path
    else
      render :about
    end
  end


  private

  def get_contact
    @contact = Contact.new
  end

  def contact_params
    params.require(:contact).permit(*@contact.columns)
  end
end
