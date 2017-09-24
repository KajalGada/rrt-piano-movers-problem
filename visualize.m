close all;
clear all;
clc;

% Plotting Free Space
EMPTY_SPACE = [];
EMPTY_SPACE = [EMPTY_SPACE; 10, 130, 70, 190];
EMPTY_SPACE = [EMPTY_SPACE; 70, 150, 130, 170];
EMPTY_SPACE = [EMPTY_SPACE; 130, 130, 190, 190];
EMPTY_SPACE = [EMPTY_SPACE; 150, 70, 170, 130];
EMPTY_SPACE = [EMPTY_SPACE; 130, 10, 190, 70];
hold on;
rectangle('Position', [0, 0, 200, 200], 'FaceColor',[0 .5 .5])
for oid = 1:size(EMPTY_SPACE,1)
    curr_poly = EMPTY_SPACE(oid,:);
    width =  curr_poly(3)-curr_poly(1);
    height = curr_poly(4)-curr_poly(2);
    rectangle('Position', [curr_poly(1), curr_poly(2), width, height], 'FaceColor',[1 1 1], 'EdgeColor','w')
end

% Start and goal position
s_I = [30,160,1.57];
s_G = [160,30,0];

plot_robot(s_I);
plot_robot(s_G);

plot(s_I(1), s_I(2), 'gO')
plot(s_G(1), s_G(2), 'rO')

% Creating structure to store1 all points
s = struct('point',{},'parent_point',{});

i = 0;
j = 1;
earest_neighbour_point = s_I;

s(1).point = s_I;
s(1).parent_point = s_I;

stopWhile = 1;
path_found_flag = 0;

while stopWhile == 1
    
    i = i + 1

    % Generate a random point
    [r_x,r_y,r_t] = random_point();
    rand_point = [r_x,r_y,r_t];

    % Check if point is in free space
%     free_space_flag = free_space_bot_check(rand_point, EMPTY_SPACE)

%     if free_space_flag == 1
    
        %have to find the nearest neighbour first
%         nearest_neighbour_point = s_I;
    nearest_neighbour_point = find_nearest_neighbour(rand_point,s);
    
        % find a path and check it is collision free
    [collision_free_path_flag, new_point] = find_path(nearest_neighbour_point, rand_point, EMPTY_SPACE);
    
    if collision_free_path_flag == 1
        
        j = j + 1
        %add it to the tree.
        plot(new_point(1), new_point(2), 'bO')
        a = [new_point(1), nearest_neighbour_point(1)];
        b = [new_point(2), nearest_neighbour_point(2)];
        plot(a,b,'b')
        s(j).point = new_point;
        s(j).parent_point = nearest_neighbour_point;


    end
    
%     end
    
    if i == 2000
        
        stopWhile = 0
        path_found_flag = 0 %0 means path not found
        
    elseif rand_point == s_G  %and there is a collision free path
        
        if collision_free_path_flag == 1
            
            stopWhile = 0
            path_found_flag = 1 %1 means path found
        
        end
    
    end
    
    if path_found_flag == 1
        
        stopWhile2 = 1;
        path = [];
        
        pnt_add = s_G;
        path = [path; pnt_add];
        
        while stopWhile2 == 1
            
            pnt_add = find_parent(pnt_add, s);
            
            path = [path; pnt_add];
            
            if pnt_add == s_I
                
                stopWhile2 = 0
                
            end
            
        end
        
        for k=1:(length(path)-1)
            a = [path(k,1) path(k+1,1)];
            b = [path(k,2) path(k+1,2)];
            plot(a,b,'r--o')
        end
        
        figure,
        hold on;
        rectangle('Position', [0, 0, 200, 200], 'FaceColor',[0 .5 .5])
        for oid = 1:size(EMPTY_SPACE,1)
            curr_poly = EMPTY_SPACE(oid,:);
            width =  curr_poly(3)-curr_poly(1);
            height = curr_poly(4)-curr_poly(2);
            rectangle('Position', [curr_poly(1), curr_poly(2), width, height], 'FaceColor',[1 1 1], 'EdgeColor','w')
        end
        
        for l=1:(length(path)-1)
            u = [path(l,1) path(l+1,1)];
            v = [path(l,2) path(l+1,2)];
            plot_robot(path(l,:))
            plot(u,v,'r--o')
        end
        
        plot_robot(path(l+1,:))
        
    end

end %while loop



















