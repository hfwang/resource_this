resouce_this
===========

Not scaffolding. Resourcing. Creates extremely customizable resource controllers with one line of code.


```ruby
class PostsController < ActionController::Base
 resource_this
end
```

...will generate the following code:

```ruby
class PostsController < ActionController::Base
  before_filter :load_post, :only => [ :show, :edit, :update, :destroy ]
  before_filter :load_posts, :only => [ :index ]
  before_filter :new_post, :only => [ :new ]
  before_filter :create_post, :only => [ :create ]
  before_filter :update_post, :only => [ :update ]
  before_filter :destroy_post, :only => [ :destroy ]

  protected
  def load_post
    @post = Post.find(params[:id])
  end

  def new_post
    @post = Post.new
  end

  def create_post
    @post = Post.new(params[:post])
    @created = @post.save
    return true
  end

  def update_post
    @updated = @post.update_attributes(params[:post])
    return true
  end

  def destroy_post
    @post = @post.destroy
  end

  def load_posts
    @posts = Post.find(:all)
  end

  public
  def index
    respond_to do |format|
      format.html
      format.xml  { render :xml => @posts }
      format.js
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @post }
      format.js
    end
  end

  def new
    respond_to do |format|
      format.html { render :action => :edit }
      format.xml  { render :xml => @post }
      format.js
    end
  end

  def create
    respond_to do |format|
      if @created
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to @post }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
        format.js
      else
        format.html { render :action => :new }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    respond_to do |format|
      if @updated
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to @post }
        format.xml  { head :ok }
        format.js
      else
        format.html { render :action => :edit }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      format.html { redirect_to :action => posts_url }
      format.xml  { head :ok }
      format.js
    end
  end
end
```

Nested Resources
===========

```ruby
class CommentsController < ActionController::Base
  resource_this :nested => [:posts]
end
```

This generates a very similar controller to the one above with adjusted redirects and one additional before_filter / loader method pair to grab the parent resource. In this case:

```ruby
  before_filter :load_post

  def load_post
    @post = Post.find(params[:post_id])
  end
```

Sorting, etc
===========

```ruby
class CommentsController < ActionController::Base
  resource_this :finder_options => {:order => 'created_on'}
end
```

...or, for lazily evaluated sorting options:

```ruby
class CommentsController < ActionController::Base
  resource_this :finder_options => Proc.new { finder_options }

  protected

  def finder_options
    order = case params[:sort]
      when 'date_reverse'          then 'created_on desc'
      else 'created_on'
    end
    {:order => order, :limit => params[:limit] || 10 }
  end

end
```

will_paginate
===========

will_paginate support is baked right in:

```ruby
class CommentsController < ActionController::Base
  resource_this :will_paginate => true
end
```

This works with the :finder_options option as well

Opinionated Software
===========

The separation of logic - DB operations in before_filters, rendering in the standard resource controller methods - makes this approach ridiculously easy to customize. Need to load an additional object for the :show action? Slap another before_filter on it. Need to change the path that the :update action redirects to? Override the :update action with your new rendering behavior.

Generator
===========

A resource_this generator is included - does the same thing as the 'resource' generator but adds 'resource_this' to the generated controller.

Questions? Comments? Flames? Patches?
===========
jnewland@gmail.com

Copyright
===========
Copyright (c) 2007 Jesse Newland, released under the MIT license
