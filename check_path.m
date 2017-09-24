function collision_free_path_flag = check_path(p1, p2, EMPTY_SPACE)
collision_free_path_flag = 0; %assume path collides

% step one: check if both points and mid-point are in free space
mid_point_x = (p1(1) + p2(1)) / 2;
mid_point_y = (p1(2) + p2(2)) / 2;
mid_point = [mid_point_x mid_point_y p1(3)];

point_free_space_flag = 0;
    
point_free_space_flag_1 = free_space_bot_check(mid_point, EMPTY_SPACE);

if point_free_space_flag_1 == 1
    
    point_free_space_flag_2 = free_space_bot_check(p1, EMPTY_SPACE);
    
    if point_free_space_flag_2 == 1
        
        point_free_space_flag_3 = free_space_bot_check(p2, EMPTY_SPACE);
        
        if point_free_space_flag_3 == 1
            
            point_free_space_flag = 1;
            
        end 
    end 
end
    
if point_free_space_flag == 1
    
    %step two: check distance between both point
    %if distance is more than 2 split the path and check each segment
    %else distance is less than 2 means collision free
    
    points_distance = ( (p1(1) - p2(1))^2 + (p1(2) - p2(2))^2 );
    
    if points_distance > 2
        
        mid_point_flag_1 = find_path(p1, mid_point, EMPTY_SPACE);
        mid_point_flag_2 = find_path(mid_point, p2, EMPTY_SPACE);
        
        if mid_point_flag_1 == 1
            if mid_point_flag_2 == 1     
                collision_free_path_flag = 1;
            end
        end
        
    else
        
        collision_free_path_flag = 1;   % 1 is path free
        
    end %inner_if
    
else
    collision_free_path_flag = 0;   % 0 is path has collision

end %outer_if

end