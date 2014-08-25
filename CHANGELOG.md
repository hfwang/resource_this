# 1.0.0

* Gem-ification work
* Revert returning true { ... }, since it no longer exists in Rails 3.2

# Pre 1.0.0

* Added resource_this generator
* Add support for :path_prefix options on resource_this. Useful for admin namespaced controllers
* wrap some before_filters in returning true { ... } do
