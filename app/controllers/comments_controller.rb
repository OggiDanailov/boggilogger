class CommentsController < ApplicationController
  def new
  end


  def create
  	comment = Comment.new(comment_params)
  	comment.user_id = current_user.id 
  	comment.post_id = params[:post_id]
   
  	respond_to do |format|
  		if comment.save
  			format.html {redirect_to "/posts/#{params[:post_id]}"}
  			# format.js	
  		else
  			format.html {render :new}
    		# format.js
  		end
  	end
  end

  def  destroy
    comment = Comment.find(params[:comment_id])
    comment.destroy
      redirect_to '/'

  end


private
	def comment_params
		params.require(:comment).permit(:content, :post_id, :user_id)
	end

end
