# Condition-number-estimator

This repository contains the implementation of a matrix condition number estimator, based on the condition estimation algorithm implemented in LINPACK [1], [2]. The algorithm was implemented for the course [Numerical Algorithms, University of Vienna, Summer Semester 2021](https://ufind.univie.ac.at/de/course.html?lv=052101&semester=2021S). 

## How to run the benchmark experiments

The user should simply run the script *experiments* where 3 figures will be generated.  

My implementation, titled *est_cond* in the benchmark experiments, is compared with the reference methods [cond](https://octave.sourceforge.io/octave/function/cond.html) and [condest](https://octave.sourceforge.io/octave/function/condest.html) in terms of the accuracy of the results and runtime. My implementation isn't as efficient and doesn't offer results as accurate as the reference methods, but it still delivers satisfactory results in both aspects, and this can be seen in figures 1 and 2.

<p align = "center">
<img src = "https://user-images.githubusercontent.com/68028868/153711069-9cab0408-c629-447b-91ed-bf15de53319f.png">
</p>
<p align = "center">
Figure 1: Comparison of magnitudes (between the results offered by <i>est_cond</i> and the two reference methods
</p>


<p align = "center">
<img src = "https://user-images.githubusercontent.com/68028868/153711067-65cd2d84-3a84-4e99-a63f-da1af04b760f.png">
</p>
<p align = "center">
Figure 2: Runtime comparisons of the three condition estimator implementations
</p>


[1]: Jack J Dongarra et al. LINPACK users’ guide. SIAM, 1979, pp. 1.11–1.13.  
[2]: A. K. Cline et al. “An Estimate for the Condition Number of a Matrix”. In: SIAM Journal on Numerical Analysis 16.2 (1979), pp. 368–375. url: <http://www.jstor.org/stable/2156842>
