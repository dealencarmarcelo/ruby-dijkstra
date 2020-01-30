def calculate_cost(origin_node, target_node, matrix)
    max_value = 9999
    cost = []
    adjacent = []
    closed_node = []

    matrix.each_with_index do |v, i|
        cost[i] = max_value
        adjacent[i] = -1
        closed_node[i] = false
    end

    cost[origin_node] = 0
    adjacent[origin_node] = -1
    closed_node[origin_node] = true

    current_node = origin_node

    while current_node != target_node
        matrix.each_with_index do |v, i|
            if matrix[current_node][i] != 0 && closed_node[i] != true
                if cost[current_node] + matrix[current_node][i] < cost[i]
                    adjacent[i] = current_node
                    cost[i] = cost[current_node] + matrix[current_node][i]
                end
            end
        end
        max_value = 9999
        matrix.each_with_index do |v, i|
            if closed_node[i] == false && cost[i] < max_value
                max_value = cost[i]
                current_node = i
            end
        end
        closed_node[current_node] = true
    end

    print_values(current_node, target_node, cost, adjacent)
end

def print_values(current_node, target_node, cost, adjacent)

    print "Vertex, Cost, Path -> #{target_node}, #{cost[target_node]}, " 

    current_node = target_node
    k = 0
    values = []

    while current_node != -1
        values[k] = current_node
        current_node = adjacent[current_node]
        k += 1
    end

    for i in (0..values.size-2)
        k -= 1
        print "#{values[k]} - "
    end

    k -= 1
    print "#{values[k]}"
    puts "\n\n\n"
end