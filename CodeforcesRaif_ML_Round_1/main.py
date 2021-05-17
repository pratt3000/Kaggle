from catboost import CatBoostClassifier
import numpy as np

model = CatBoostClassifier(iterations=10, learning_rate=0.1) #loss_function='CrossEntropy')
model.load_model("CBC.cbm",format="cbm")

t = int(input())
for i in range(0,t):

    arr = ["AWAY\n","DRAW\n","HOME\n","SKIP\n"]
    
    X = input()
    X = X.split()
    X.pop(1)
    X = np.array(list(map(float, X))).reshape([1,7])

    pred = model.predict(X)
    
    print(arr[int(pred)], flush=True)

    timepass = input()  
    # print(timepass)

