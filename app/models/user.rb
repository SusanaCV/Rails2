class User < ActiveRecord::Base
has_many :product 
has_many :transactions
end
