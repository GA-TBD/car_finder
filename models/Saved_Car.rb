class Saved_Car < ActiveRecord::Base
  belongs_to :account_of_user, class_name: :Account
end
