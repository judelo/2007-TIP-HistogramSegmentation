# 2007_TIP_HistogramSegmentation
The following Matlab functions implement the Fine to Coarse Histogram Segmentation described in our paper

J.Delon, A.Desolneux, J-L.Lisani and A-B.Petro,  
*A non parametric approach for histogram segmentation*, 
IEEE Transactions on Image Processing, vol.16, no 1, pp.253-261, Jan. 2007. 

The article is available [here](http://www.math-info.univ-paris5.fr/~jdelon/Pdf/2007_Histogram_Segmentation_IEEETIP.pdf).


Typical usage :

     u = double(imread('../images/lena.png'));
     H = hist(u(:),0:255);
     idx=FTC_Seg(H,0);       %idx should contain the list of all minima separating the modes of H 

The parameter e in the code controls the segmentation precision : 

+ large e => coarse segmentation
+ small e => fine segmentation 


Copyright (c) 2016 Julie Delon


![image](./segmentation.png)
