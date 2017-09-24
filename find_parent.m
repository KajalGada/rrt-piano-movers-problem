function pnt_add = find_parent(pnt_add, s)
stopWhile = 1;
k = 1;
while stopWhile == 1
    point_found = s(k).point;
    if point_found == pnt_add
        stopWhile = 0;
        pnt_add = s(k).parent_point;
    end
    k = k + 1;
end
end