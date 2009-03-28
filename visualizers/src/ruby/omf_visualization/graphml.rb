
module OMF
  module Visualization
    class GraphML
    
      # Create and return a GraphML instance with all the nodes in 'testbed"
      # pre-loaded from inventory.
      #
      def self.create_tb_map()
        ml = self.new
        ml.add_schema 'name', 'node'
        ml.add_schema 'x', 'node', 'x', 'integer', 100
        ml.add_schema 'y', 'node', 'y', 'integer', 100
    
    	require 'inventory'
        Inventory.add_nodes_to_graphml ml
    
        ml
      end
    
      def initialize()
        @doc = Document.new "<graphml/>"
        @g = @doc.root.add_element "graph", 'edgedefault' => 'undirected'
      end
    
      def add_schema(id, target, name = id, type = 'string', default = nil)
        attrs = {'id' => id, 'for' => target, 'attr.name' => name, 'attr.type' => type}
        k = @g.add_element "key", attrs
        if default
          dn = k.add_element 'default'
          dn.text = default
        end
      end
    
      def add_node(id, attrs = {})
        n = @g.add_element 'node', 'id' => id
        attrs.each do |key, val|
          d = n.add_element 'data', 'key' => key
          d.text = val
        end
      end
    
      def add_edge(from, to, attrs = {})
        n = @g.add_element 'edge', 'source' => from, 'target' => to
        attrs.each do |key, val|
          d = n.add_element 'data', 'key' => key
          d.text = val
        end
      end
    
      def write(output = $stdout, indent = 2)
        @doc.write(output, indent)
      end
    end

  end  # module Visualization
end  # module OMF

