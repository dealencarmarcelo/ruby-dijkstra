require './base.rb'
require './dijkstra.rb'

matrix = get_base

origin_node = 0

for i in (1..matrix.size)
    target_node = i
    calculate_cost(origin_node, target_node, matrix) if target_node.between?(1, matrix.size-1)
end
