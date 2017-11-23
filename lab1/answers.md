1.

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
3 hidden nodes = 3 hyper planes. I datan räcker inte 2st för det kan inte stänga in "circulär" data. Kolla föreläsningar och ändra

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

n=5
train
MSE   0.213102883101
CorrCoeff   0.889874165685

val
MSE   0.399443507195
CorrCoeff   0.789555492163

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

To check overfitting - compare the train error with the val error. Val error is much larger in overfitting. Also compare the actual value for error on validation depending on hidden nodes. Since some random is introduced, a low corr will also increase train

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


n=15, lambd=0.1
train
MSE   0.39523473978
CorrCoeff   0.797357325847

val
MSE   0.429091866314
CorrCoeff   0.779225370515

n=20, lambd=0.1
train
MSE   0.396730303764
CorrCoeff   0.796845147765

val
MSE   0.430193583667
CorrCoeff   0.778641418022

n=20, lambd=0.15
train
MSE   0.406405735016
CorrCoeff   0.794338948992

val
MSE   0.439054368436
CorrCoeff   0.776216242449
