class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    EmailReceiver.call(@email)
  end
end
