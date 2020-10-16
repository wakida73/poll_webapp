class PollsController < ApplicationController
  def index
    @polls = Poll.where("ended_at > ?", DateTime.now)
  end

  def show
    @poll = Poll.find(params[:id])
    @lists = @poll.lists
  end

  def new
    @poll = Poll.new
    @poll.lists.build
  end

  def create
    @poll = Poll.create(poll_params)
    @poll.lists.build
    redirect_to  '/polls'

    #こう書くべきだけど余分にlistできてしまう
    # @poll = Poll.new(poll_params)
    # @poll.lists.build
    # if @poll.save
    #   redirect_to  '/polls'
    # else
    #   render 'new'
    # end
  end


  def destroy
    poll = Poll.find(params[:id])
    if poll.users
      poll.poll_users.destroy 
    end
    Poll.find(params[:id]).destroy
    redirect_to '/'
  end



  private
  def poll_params
    params.require(:poll).permit(:title,:description,:started_at,:ended_at,lists_attributes:[:text, :poll_id, ])
  end
end
