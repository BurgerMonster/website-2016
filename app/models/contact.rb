class Contact
  include ActiveModel::Model

  attr_accessor :name, :email, :subject, :message

  validates :name, :message, presence: true
  validates :email, email: true


  def initialize(attributes = {})
    super
    @name ||= nil
    @email ||= nil
    @subject ||= nil
    @message ||= nil
  end

  def self.column_names
    self.new.instance_variable_names.map { |v| v.sub("@", "").to_sym }
  end

  def name=(value)
    @name = formatter(value)
  end

  def email=(value)
    @email = formatter(value)
  end

  def subject=(value)
    @subject = formatter(value)
  end

  def message=(value)
    @message = formatter(value)
  end


  private

  def formatter(value)
    return nil if !value.is_a?(String)
    value = value.squeeze(" ").strip
    value.empty? ? nil : value
  end
end
