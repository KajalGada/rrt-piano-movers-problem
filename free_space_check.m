function z = free_space_check(rand_point, EMPTY_SPACE)
z = 0; % 0 -> not in free space 1 -> free space
for i = 1:size(EMPTY_SPACE,1)
    
    if rand_point(1) > EMPTY_SPACE(i,1)
        
        if rand_point(2) > EMPTY_SPACE(i,2)
            
            if rand_point(1) < EMPTY_SPACE(i,3)
                
                if rand_point(2) < EMPTY_SPACE(i,4)
                    
                    z = 1; % 1 -> free space
                end
            end
        end
    end
end %for

end