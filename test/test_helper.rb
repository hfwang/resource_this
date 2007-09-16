require File.expand_path(File.join(File.dirname(__FILE__), '../../../../config/environment.rb'))
require 'action_controller/test_process'
require 'active_record/fixtures'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :dbfile => ":memory:")

ActiveRecord::Schema.define(:version => 1) do
  create_table :posts do |t|
    t.column :title,        :string
    t.column :body,         :text
    t.column :created_at,   :datetime
    t.column :updated_at,   :datetime
  end
  create_table :comments do |t|
    t.column :body,         :text
    t.column :post_id,      :integer
    t.column :created_at,   :datetime
    t.column :updated_at,   :datetime
  end
end

class Post < ActiveRecord::Base
  has_many :comments
  def validate
  end
end

class Comment < ActiveRecord::Base
  belongs_to :post
  def validate
  end
  validates_associated :post
end

class PostsController < ActionController::Base
  resource_this
end

class CommentsController < ActionController::Base
  resource_this :nested => [:posts]
end