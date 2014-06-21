class Notifier < ActionMailer::Base

  # default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.email_friend.subject
  #




  # :to, :subject, :from - bu ucu gerekiyor methodlarda. yada
  # en yukarda class'dan sonra :default declare ediceksin





  def email_friend(article, sender_name, receiver_email)
    @article = article
    @sender_name = sender_name
    mail :to => receiver_email, :subject => "An item that would interest you...", :from =>  "admin@isgetir.com"
  end

  def comment_added(comment)
    @job = comment.job
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% " + @job.user.email
    mail :to => @job.user.email,
         :subject => t('general.new_comment_for') + " #{@job.title}", :from =>  "admin@isgetir.com"
  end

  def user_added(user)
    @user = user
    mail :to => "coffeelatte2007@gmail.com",
         :subject => "New User:" + " #{@user.email}",
         :from =>  "admin@isgetir.com"
  end

  def article_added(article)
    @article = article
    mail :to => "coffeelatte2007@gmail.com",
         :subject => "#{@article.user.email} " + " added item" + "  #{@article.title}",
         :from =>  "admin@isgetir.com"
  end

  def email_owner(article, emailer_name, emailer_email, message)
    @article = article
    @emailer_name = emailer_name
    @emailer_email = emailer_email
    @message = message

    mail :to => article.user.email,
             :subject => "#{emailer_name} " + " wants to contact you",
             :from =>  emailer_email

  end
end

