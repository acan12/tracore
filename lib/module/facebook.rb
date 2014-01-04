module Facebook
  class FacebookData
    def self.facebook_friends(user)
      fbapi = Koala::Facebook::API.new(user.facebook.oauth_token)
      
      # existing_members = Facebook.uniq.pluck(:uid)
      # existing_invites = Invitation.uniq.pluck(:uid)

      friends = fbapi.get_connections("me", "friends?fields=id")
      
      friends.in_groups_of(10) do |group|
        
        group.each do |f|
          
          if f.present? && f["id"].present?
            fql_find_friends = "SELECT uid, first_name, last_name, email, sex, current_location, friend_count, pic FROM user WHERE uid='#{f["id"]}'"
            fr = fbapi.fql_query(fql_find_friends)
            
            if fr.present?
              p "uid=#{fr[0]["uid"]}  first_name=[#{fr[0]["first_name"]}]  last_name=[#{fr[0]["last_name"]}]"
              # self.create_invitation( fr[0], user, existing_members, existing_invites )          
            end
            
          end
          
        end
      end
      
    end
  end
end