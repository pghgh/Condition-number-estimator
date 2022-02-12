function [averages_lb,averages_rb] = experiments_part_two()

    averages_lb = [];
    averages_rb = [];
    for i = 100:50:1500
        [E, delta_b] = rhs_perturbation(i);
        values_lb = [];
        values_rb = [];
        for j = 1:20
            A = generateRandomMatrix(i, -i, i);
            b = generateRandomVector(i, -i, i);
            [lb, rb] = bounds(A, E, b, delta_b);
            values_lb = horzcat(values_lb, lb);
            values_rb = horzcat(values_rb, rb);
        endfor
        averages_lb = horzcat(averages_lb, mean(values_lb));
        averages_rb = horzcat(averages_rb, mean(values_rb));
    endfor
    
    x = 100:50:1500;
    
    y1 = averages_lb; %cyan
    y2 = averages_rb; %blue
    
    figure(3);
    semilogy(x, y1,'c; averages lb;', x, y2, "b; averages rb;");
    title ({"Averages"});
    xlabel ("n"); ylabel ("average");
    legend ("location", "southoutside");

endfunction