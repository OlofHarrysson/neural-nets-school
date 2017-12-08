1.
Because the input layer is of dimension 2, a hyperplane dimension of 1, e.i. a line, must be able to separate the two classes for the problem to be solvable.

If you disregard the activation functions - the output from a hidden layer with one node is similar to a hyperplane, Wx + b. If that output would be 0, that point would be on the hyperplane. If it's below or above, that can be attributed to the different classes respectively.

2.
Accuracy train: 0.85, Loss: 0.326795876026
Accuracy val: 0.873, Loss: 0.292847275734

3.
7 hidden nodes are needed get a training accuracy over 95%.

4.
7 hidden -> Loss val: 1.39592456818. Increase is 1,1030772924
Measuring accuracy.
1 -> 0.873
2 -> 0.823
3 -> 0.835
4 -> 0.848
5 -> 0.831
6 -> 0.836
7 -> 0.819

5.
Since the data is circular, more hyperplanes are needed to "entrap" the inner data. 

6.
train
MSE: 0.264494618773
CorrCoeff: 0.859363948353

val
MSE   0.436503838003
CorrCoeff   0.798252758671

Since there is no noise the train data and val data has a strong correlation. This means that even if you fit the model to the training data very tightly, it will not over-fit the training data.

7.
n=3
train
MSE   0.354513776302
CorrCoeff   0.804978441342

val
MSE   0.444009891152
CorrCoeff   0.726105415025

n=6
train
MSE   0.208986759186
CorrCoeff   0.890274833162

val
MSE   0.398102223128
CorrCoeff   0.754891140325

n=7
train
MSE   0.167535784841
CorrCoeff   0.916457015243

val
MSE   0.424443940818
CorrCoeff   0.801403604715

n=9
train
MSE   0.135941742361
CorrCoeff   0.930696918325

val
MSE   0.483174244314
CorrCoeff   0.773358744271

If the validation error is much larger than the training error the model is probably overtrained. Since the method is not deterministic, the correlation coefficient affects the result. A high coefficient can mask an overtrained network.

It's also useful to see if the valitation error converges in a graph.

With these points in mind - when the hidden nodes = 7 is when the network starts to overtrain.

8.
n=10, lambd=0
train
MSE   0.161109393835
CorrCoeff   0.916619802074

val
MSE   0.469973628223
CorrCoeff   0.746429934497

n=10, lambd=0.1
train
MSE   0.39141086936
CorrCoeff   0.799933541451

val
MSE   0.429309765995
CorrCoeff   0.779678598137

n=10, lambd=0.2
train
MSE   0.40924063921
CorrCoeff   0.793328561582

val
MSE   0.441342411935
CorrCoeff   0.776023591246

n=10, lambd=0.8
train
MSE   0.461088508368
CorrCoeff   0.751881451183

val
MSE   0.486878412962
CorrCoeff   0.73821180227

n=8 lambd=0.005
train
MSE   0.225041157007
CorrCoeff   0.892743254537

val
MSE   0.370325966924
CorrCoeff   0.812985531054

n=8 lambd=0.015
train
MSE   0.247402140498
CorrCoeff   0.888256071109

val
MSE   0.372409692407
CorrCoeff   0.820726106524

Conclusion - 8 hidden nodes with lambda set to 0.015 were the best parameters I found

9.
Finding the right parameters for a neural network often seems like it's more of an art than a science. Even so, there exist some techniques to evaluate your network to find what's wrong with it. First of all, know your data.

To spot overtraining, compare the validation error with the training error to see if there is a large discrepancy. If there is, add a regularizer.

Often a larger network will overtrain and is in need of a regularizer.

10.

