class ListsController < ApplicationController
  def update
    @poll = Poll.find(params[:poll_id])
    @list = List.find(params[:id])
    @test = PollUser.new
  
    if @poll.users === []
      logger.debug('テスト2') 
      @test.poll_id = @list.poll_id
      @test.user_id = current_user.id
      @test.save
    end
  
    @poll.users.each do |u|
      if u.id === current_user.id
        logger.debug('テスト1')  
        flash[:alert] ="投票は一人一票までです" 
        redirect_to  poll_path(@list.poll_id)
        return  
        
      else
        logger.debug('テストyes')  
        @test.poll_id = @list.poll_id
        @test.user_id = current_user.id
        @test.save
      end
    end
  
    @list.count = @list.count+1
    @list.save!

    redirect_to  poll_path(@list.poll_id)

    # poll = current_user.polls.build do |t|
      
    #   t.title = @poll.title
    #   t.started_at  = @poll.started_at
    #   t.ended_at = @poll.ended_at
    # end
    # if @list.save && @poll.save
    #   render :json => current_user.polls
    # end

  end

  
end
