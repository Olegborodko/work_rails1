class Public::PicturesController < ApplicationController
	def index
   # @pictures = Picture.where(user_id: @current_user)
   @pictures = Picture.where(user_id: current_user.id)

    render :json => @pictures.collect { |p| p.to_jq_upload }.to_json
  end

  def create
    @picture = Picture.new(person_params)
    @picture.user=current_user
    #@picture.save!
    if @picture.save

      respond_to do |format|
        format.html {  
          render :json => [@picture.to_jq_upload].to_json, 
          :content_type => 'text/html',
          :layout => false
        }
        format.json {  
          render :json => [@picture.to_jq_upload].to_json     
        }
      end
    else 
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    render :json => true
  end

  private
  
  def person_params
      params.require(:picture).permit(:avatar)
  end
end
