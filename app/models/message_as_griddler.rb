class MessageAsGriddler < Griddler::Email
  
  def initialize(params)
    @subject = params[:subject]
    @raw_html = params[:body]
    @from =
      {
        name: params[:from].partition('@').first,
        email: params[:from]
      }
    @to = params[:to]
    @headers =
      {
        'Date' => params[:date],
        'Message-ID' => params[:message_id],
        'In-Reply-To' => params[:in_reply_to],
        'References' => params[:references]
      }
  end
end
