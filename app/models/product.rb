class Product < ActiveRecord::Base
	 belongs_to :user , :transaction
end
