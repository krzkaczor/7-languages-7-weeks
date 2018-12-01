class Tree
  attr_accessor :children, :node_name

  def initialize(name, children = [])
    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end

  def visit
    yield self
  end
end

def from_object(object_shape)
  return [] if object_shape.empty?

  return object_shape.collect {|name, children| Tree.new(name, from_object(children))}
end

t = from_object ({
  'grandpa' => {
    'dad' => {
      'child 1' => {},
      'child 2' => {}
    },
    'uncle' => {
      'child 3' => {},
      'child 4' => {}
    }
  }
})

t[0].visit_all { |node| puts node.node_name }