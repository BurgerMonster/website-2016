class MainController < ApplicationController
  before_action :get_contact, only: [:contact, :contact_confirm]


  def contact_confirm
    @contact.assign_attributes(contact_params)

    if @contact.valid?
      ContactMailer.submit(@contact).deliver_now
      redirect_to root_path
    else
      render :contact
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
