function [time_cond, time_condest, time_est_cond, magnitudes_condest, magnitudes_est_cond] = experiments_part_one()

    time_cond = [];
    
    time_condest = [];
    
    time_est_cond = [];
    
    magnitudes_condest = [];
    
    magnitudes_est_cond = [];
    
    for i = 100:50:500
        A = generateRandomMatrix(i, -i, i);
        
        tic();
        y = cond(A, 1);
        elapsedTime = toc();
        time_cond =  horzcat(time_cond,elapsedTime);
        
        tic();
        x1 = condest(A);
        elapsedTime = toc();
        time_condest =  horzcat(time_condest,elapsedTime);
        
        tic();
        x2 = est_cond(A);
        elapsedTime = toc();
        time_est_cond =  horzcat(time_est_cond,elapsedTime);
        
        magnitudes_condest = horzcat(magnitudes_condest, magnitude(x1, y));
        magnitudes_est_cond = horzcat(magnitudes_est_cond, magnitude(x2, y));
    endfor
    
    x = 100:50:500;
    
    y1 = time_cond; %cyan
    y2 = time_condest; %blue
    y3 = time_est_cond; %green
    y4 = magnitudes_condest; % black
    y5 = magnitudes_est_cond; % red
    
    figure(1);
    semilogy (x, y1,"c;time cond;", x, y2, "b;time condest;", x, y3, "g;time est cond;");
    title ({"Runtime comparisons"});
    xlabel ("n"); ylabel ("running time");
    legend ("location", "southoutside");

    figure(2);
    semilogy(x, y4, 'k;magnitudes condest - cond;', x, y5, 'r;magnitudes est cond - cond;');
    title ({"Magnitudes"});
    xlabel ("n"); ylabel ("magnitude");
    legend ("location", "southoutside");
    
endfunction