class Post < ActiveRecord::Base
  validates_presence_of :title

  def initialize_with_defaults(attrs = nil, &block)
    initialize_without_defaults(attrs) do
      setter = lambda { |key, value| self.send("#{key.to_s}=", value) unless !attrs.nil? && attrs.keys.map(&:to_s).include?(key.to_s) }
      setter.call('created_at', Time.now.to_s(:db))
      yield self if block_given?
    end
  end
  alias_method_chain :initialize, :defaults
  
end
