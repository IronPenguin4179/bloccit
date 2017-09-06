class FavoriteMailer < ApplicationMailer
    default from: "jrwalker314@yahoo.com"
    
    def new_comment(user, post, comment)
        headers["Message-ID"] = "<comments/#{comment.id}@blooming-inlet-80859.herokuapp.com>"
        headers["In-Reply-To"] = "<post/#{post.id}@blooming-inlet-80859.herokuapp.com>"
        headers["References"] = "<post/#{post.id}@blooming-inlet-80859.herokuapp.com>"
        
        @user = user
        @post = post
        @comment = comment
        
        mail(to: user.email, subject: "New comment on #{post.title}")
    end
end
