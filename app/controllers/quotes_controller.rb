class QuotesController < ApplicationController

    def index
        @quotes = Quote.all
    end


    def show
        @quote = Quote.find(params[:id])
    end

    def new
        @quote = Quote.new
    end

    def create 
        #render plain: params[:post].inspect
        @quote = Quote.new(quote_params)

        if(@quote.save)
            redirect_to @quote
        else
            render 'new'
        end

    end

    def edit
        @quote = Quote.find(params[:id])
    end

    def update
        @quote = Quote.find(params[:id])
        if(@quote.update(patch_params))
            redirect_to @quote
        else
            render 'edit'
        end

    end

    def destroy
        @quote = Quote.find(params[:id])
        @quote.destroy

        redirect_to '/'
    end



    private def quote_params
         params.require(:post).permit(:body, :authorName)
    end

    private def patch_params
        params.require(:quote).permit(:body, :authorName)
   end


end
