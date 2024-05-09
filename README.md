# DCLA
2-D Diffusion Limited Cluster Aggregation

## Abstract
A computational model for diffusion limited cluster aggregation was created for 2-D and 3-D lattices. They were probed for the fractal dimension of the clusters formed throughout the model by performing a power-law fit of the mass versus the radius of gyration. The fractal dimension was measured from this power-law fit via two different methods and in 2-D were found to have varying agreement with experimental data. By using the exponent from the power-law fit, which resulted in a $D_f$ of 1.47 ± 0.0826, it was found to have poor agreement, while the pre-factor tended to have better agreement with experimental data and resulted in $D_f$  = 1.73 ± 0.197. For 3-D, the calculated $D_f$ values were 2.27 ± 0.0545 and 2.33 ± 0.117 from the exponent and the pre-factor, respectively. Although these numbers do not have the best agreement with the expected values from experimental and numerical data, these models are a good start to begin performing deeper analysis and identifying trends. Suggestions for how to improve the model to get better agreement with literature data, such as including a diffusion coefficient, is also included. 

## Introduction 
Aggregation behavior is prevalent in a number of natural and industrial systems, such as polymer manufacturing, pharmaceutics, protein production, and many more [7]. Studies on aggregation growth and structure are key to understanding the nature of these processes. To this end, many models have been constructed that simulate aggregation processes, such as diffusion limited cluster aggregation (DLCA). In DLCA, a lattice is filled with monomers and they are allowed to move in a random walk, until they collide with one another to form larger clusters. Multiple clusters can exist at the same time within the lattice, unlike diffusion limited aggregation, where only one fractal is formed. DLCA models have been constructed to take in various inputs or be solved in multiple dimensions [1, 3]. Here, a model for DLCA in 2-D and 3-D is presented and the fractal dimension is measured.
Clusters formed from DLCA can be approximated as fractal objects. This approximation allows us to measure the fractal dimension, $D_f$, and use it to characterize our model and compare to experimental data. Fractal scaling relates the mass of each cluster, i, and size of the cluster by the fractal dimension, $D_f$,
 
$$i=k_f (R_g/a)^(D_f)$$ (1)
where R_g is the radius of gyration of the cluster, a is the size of the principle particle, and k_f is a pre-factor [7]. The radius of gyration is calculated by,

$$R_g^2 = 1/N \sum_(k=1)^N (\vec{r_k}-\vec{r_{mean}})^2$$ (2)
where $\vec{r_k}$ is the position of the $k^th$ particle, and $\vec{r_{mean}}$ is the position of the center of mass of the cluster [2]. The fractal dimension can be determined by fitting the data to Equation 1 once $i$, $R_g$, and $a$ are measured. The pre-factor, $k_f$, has also been shown to be related to the fractal dimension via,

$$k_f=4.46 D_f^(-2.08)$$	(3)
	
which was determined numerically [1]. Both Equation 1 and 2 will be used to characterize the clusters formed. Since these equations are only valid for large cluster sizes, any clusters smaller than $R_g/a$ = 10 in 2-D and $R_g/a$ = 2 in 3-D will not be considered.
According to Equations 1 and 3, in order to get values of D_f that agree with experimental calculations and other models [3, 6, 7], we should expect a $k_f$ of around 1.117 in order to obtain a $D_f$ of about 1.85 in 2-D. Similarly, to get a $D_f$ of about 2.45 in 3D, we should expect a $k_f$ of around 0.6916.

## Methods
There are a number of algorithms available to perform DLCA simulations [3 – 5]. For this model, first a number of assumptions were made. It is assumed that the user will input a value for the initial desired volume fraction, $\Phi_0$, and the N x N size of the lattice. In addition, it is assumed that all clusters have the same diffusion coefficient, regardless of cluster size or mass. Finally, periodic boundary conditions are imposed on all sides of the lattice such that clusters can move freely across all axes.
The model will first populate an N x N lattice with $ϕ_0$ probability that a given entry will be occupied. Then, it runs an initial check on each particle, populates an array with the $i$ and $j$ position of each particle and its assigned cluster label, and determines if any clusters have formed. Then, the model goes through every cluster and moves it one lattice unit in a randomly selected direction, or it may randomly select to not move at all. In this same step, the model will check to make sure that the selected cluster is not trying to move into a space that is already occupied. Once every cluster in the lattice has been assigned a random direction to move, the model checks for any cluster connections. If a cluster contacts another cluster directly (diagonal contacts are not considered), then the connecting clusters are considered one new cluster. The combined cluster is relabeled. In addition, every time a new cluster is formed, the model will measure its mass and R_g. If the cluster is spanning a boundary, then it scales every monomer in the cluster before it calculates its $R_g$.  This will continue until there are only 10 clusters remaining in a 2-D lattice.
This same approach was extended to three dimensional DLCA, which was ended when the number of clusters reached 30 clusters.  Figures 1 and 2 and the videos linked at the end of this document show what the simulations look like at various time steps for both 2-D and 3-D, respectively.

## Videos
•	[2-D DLCA](https://youtu.be/ZNiu7PEWYJ8)
•	[3-D DLCA](https://youtu.be/kUnzjyvJjbs)



## References
1.	Ehrl, Lyonel, et al. “Generation and Geometrical Analysis of Dense Clusters with Variable Fractal Dimension.” The Journal of Physical Chemistry B, vol. 113, no. 31, 6 June 2009, pp. 10587–10599., doi:10.1021/jp903557m.
2.	Fixman, Marshall. “Radius of Gyration of Polymer Chains.” The Journal of Chemical Physics, vol. 36, no. 2, 1962, pp. 306–310., doi:10.1063/1.1732501.
3.	Lattuada, Marco, et al. “A Simple Model for the Structure of Fractal Aggregates.” Journal of Colloid and Interface Science, vol. 268, no. 1, 15 July 2003, pp. 106–120., doi: 10.1016/j.jcis.2003.07.027.
4.	Meakin, Paul. “A Historical Introduction to Computer Models for Fractal Aggregates.” Journal of Sol-Gel Science and Technology, vol. 15, no. 2, 1999, pp. 97–117., doi: 10.1023/A:1008731904082.
5.	Meakin, Paul. “Models for Colloidal Aggregation.” Annual Review of Physical Chemistry, vol. 39, no. 1, 1988, pp. 237–267., doi: 10.1146/annurev.physchem.39.1.237.
6.	Thouy, R, and R Jullien. “A Cluster-Cluster Aggregation Model with Tunable Fractal Dimension.” Journal of Physics A: Mathematical and General, vol. 27, no. 9, 1994, pp. 2953–2963., doi: 10.1088/0305-4470/27/9/012.
7.	Wu, Hua, et al. “Dependence of Fractal Dimension of DLCA Clusters on Size of Primary Particles.” Advances in Colloid and Interface Science, vol. 195-196, 10 Apr. 2013, pp. 41–49., doi: 10.1016/j.cis.2013.04.001.



