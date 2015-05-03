class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    user = User.find_by_email(@email.from[:email])
    user.posts.create!(
      subject: @email.subject,
      body: @email.body
    )
  end
end
