function u = free_space_bot_check(rand_point, EMPTY_SPACE)
u = free_space_check(rand_point, EMPTY_SPACE);
if u == 1; %if point is in free space, check if all robot vertex are in free space
    
%     robot_vertex = plot_robot(rand_point);
    robot_vertex = find_corners(rand_point);
    u = 0; % assume robot will NOT be in free space
    
    u1 = free_space_check([robot_vertex(1,1),robot_vertex(2,1)], EMPTY_SPACE);
    if u1 == 1
        
        u2 = free_space_check([robot_vertex(1,2),robot_vertex(2,2)], EMPTY_SPACE);
%         u2 = free_space_check([x_2,y_2], EMPTY_SPACE);
        if u2 == 1
            
%             u3 = free_space_check([x_3,y_3], EMPTY_SPACE);
            u3 = free_space_check([robot_vertex(1,3),robot_vertex(2,3)], EMPTY_SPACE);
            if u3 == 1
                
%                 u4 = free_space_check([x_4,y_4], EMPTY_SPACE);
                u4 = free_space_check([robot_vertex(1,4),robot_vertex(2,4)], EMPTY_SPACE);
                if u4 == 1
                    
                    u = 1;
                    
                end
            end
        end
    end
    
end
    
end