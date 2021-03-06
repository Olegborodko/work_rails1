module Admin::AdministratorsHelper
	def user_position_edit(params)
		params.select! {|x| x!="" }

    return if params.first.split('_')[3] != 'position'


    if params.first.split('_')[4] == 'ASC'
      sort_up_to_down=true
    else
      sort_up_to_down=false
    end

#-----------------------------

    if sort_up_to_down
      #min

       for value in params
        m=value.split('_')[2].to_i
        min=m if !min
        min=m if m<min



      end

    else
      #max

      for value in params
        m=value.split('_')[2].to_i
        max=m if !max
        max=m if m>max

      end

    end


#-----------------------------

     for value in params
      m=value.split('_')

      user=User.find(m[1])

        if sort_up_to_down
          user.position=min
          user.save
          min=min+1
        else
          user.position=max
          user.save
          max=max-1
        end



     end

	end
end
