function point_nearest = find_nearest_neighbour(rand_point,s)
first_point_flag = 1;

p1 = [rand_point(1) rand_point(2)];

for i=1:length(s)
    
    p = s(i).point;
    p2 = [p(1) p(2)];
    
    dist = ((p1(1) - p2(1))^2 + (p1(2) - p2(2))^2)^(1/2);
    
    if i == 1
        min_distance = dist;
        point_nearest = p;
    else
        if dist < min_distance
            min_distance = dist;
            point_nearest = p;
        end
    end
        
        
end