class UserMailer < ApplicationMailer
  default :from => "hariramya2018@gmail.com" # if from is not specified it will be set as from.

 def login_email(user)
   @name = user["name"]
   @url = "http://localhost:3000"
   mail(:to => user["email"],
        :subject => "successfully Logged into HappyReads!!")

 end

 def activity_mail(user,book)
   @user = user
   @book = book
   mail(:to => user["email"],
        :subject => "Book added to MyList")
 end

end
