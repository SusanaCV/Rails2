class User < ActiveRecord::Base
has_many :product, :transaction
end
