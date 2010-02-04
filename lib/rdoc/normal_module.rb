require 'rdoc/class_module'

##
# A normal module, like NormalClass

class RDoc::NormalModule < RDoc::ClassModule

  ##
  # Included NormalModules

  alias ancestors includes

  ##
  # Appends +comment+ to the current comment, but separated by a rule

  def comment=(comment)
    return if comment.empty?
    comment = @comment << "\n# ---\n" << comment unless @comment.empty?

    super
  end

  def inspect # :nodoc:
    "#<%s:0x%x module %s includes: %p attributes: %p methods: %p aliases: %p>" % [
      self.class, object_id,
      full_name, @includes, @attributes, @method_list, @aliases
    ]
  end

  ##
  # This is a module, returns true

  def module?
    true
  end

  def pretty_print q # :nodoc:
    q.group 2, "[module #{full_name}: ", "]" do
      q.text "includes:"
      q.breakable
      q.seplist @includes do |inc| q.pp inc end

      q.text "attributes:"
      q.breakable
      q.seplist @attributes do |inc| q.pp inc end

      q.text "methods:"
      q.breakable
      q.seplist @method_list do |inc| q.pp inc end

      q.text "aliases:"
      q.breakable
      q.seplist @aliases do |inc| q.pp inc end
    end
  end

end

