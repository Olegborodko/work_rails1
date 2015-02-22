# -*- coding: utf-8 -*-
class Public::PicturesController < ApplicationController
	def index
   # @pictures = Picture.where(user_id: @current_user)

   #@pictures = Picture.where(user_id: current_user.id)
    if current_user
    @pictures=Picture.where(user_id: current_user.id)
    elsif current_admin
    @pictures=Picture.where(user_id: current_admin.id)
    end

    render :json => @pictures.collect { |p| p.to_jq_upload }.to_json
  end

  def create
    @picture = Picture.new(person_params)

     if current_user
     @picture.user=current_user
     elsif current_admin
     @picture.user=current_admin
     end

    


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
      params.require(:picture).permit(:avatar, :role)
  end
end
