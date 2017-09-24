function [collision_free_path_flag, return_point] = find_path(p1, p2, EMPTY_SPACE)

collision_free_path_check_flag = check_path(p1, p2, EMPTY_SPACE);
return_point = p2;

if collision_free_path_check_flag == 1
    
    collision_free_path_flag = 1;
    
else
    
    dist = ((p1(1) - p2(1))^2 + (p1(2) - p2(2))^2)^(1/2);
    angle_diff = abs(p1(3) - p2(3));
    
    for i=1:10
        
        ratio_value = (p2(2) - p1(2)) / (p2(1)-p1(1));
%         angle_value = atan( (y2-y1) / (x2-x1) );
        angle_value = atan(ratio_value);
        hyp_value = (dist/10) * i;
        
        adj_value = hyp_value * cos(angle_value);
        new_point_x = p1(1) + adj_value;
        
        opp_value = hyp_value * sin(angle_value);
        new_point_y = p1(2) + opp_value;
        
        new_point_angle = (angle_diff/10) * i;
        
%         new_point = [new_point_x new_point_y p1(3)];
        new_point = [new_point_x new_point_y new_point_angle];
        
        collision_free_path_check_flag = check_path(p1, new_point, EMPTY_SPACE);
        
        if collision_free_path_check_flag == 1
            
            collision_free_path_flag = 1;
            return_point = new_point;
            
        else
            
            collision_free_path_flag = 0;
            
        end
        
    end
    
end

end