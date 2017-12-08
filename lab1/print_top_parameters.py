import numpy as np

f = open("model_results.txt")
lines = f.read().split("\n")
heading = lines[0]
lines = lines[1:-1]

val_accuracies = np.asarray([line.split(" ")[4] for line in lines])

top_val_accuracies = []
for _ in range(5):
  top_accuracy = np.argmax(val_accuracies)
  val_accuracies = np.delete(val_accuracies, top_accuracy)
  top_val_accuracies.append(top_accuracy)

print(heading)
for i in top_val_accuracies:
  print(lines[i])