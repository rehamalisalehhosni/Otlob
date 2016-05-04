class Group < ActiveRecord::Base
belongs_to :user;
has_many :members ,dependent: :destroy;

end
