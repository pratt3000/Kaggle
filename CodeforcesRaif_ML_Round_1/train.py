import pandas as pd
from sklearn.preprocessing import MinMaxScaler, StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score


X = pd.read_csv("Data/train.csv")
del X["Unnamed: 0"] #just order
del X["Time"] #for now

fir_cols = ["Division",
            # "Time",
            "home_team",
            "away_team",
            "Referee", 
            "home_coef", 
            "draw_coef", 
            "away_coef"
            ]

result = X["full_time_home_goals"]-X["full_time_away_goals"]
for i, val in enumerate(result):
    if val<0:
        result[i]=0
    elif val==0:    
        result[i]=1
    else:
        result[i]=2

X["Result"] = result   

y = X["Result"]

X.drop(['Result'],axis=1, inplace=True)
X = X[fir_cols]

std_sc = StandardScaler()
std_sc.fit(X)
X_temp = X.copy()

X_temp = std_sc.transform(X)

X = X_temp


X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.1, random_state=42, shuffle=True, stratify=y)

def get_accuracy(y_pred, y):
    return accuracy_score(y_pred, y)

from catboost import CatBoostClassifier

def run_model(MODEL):
    MODEL.fit(X_train, y_train)

    pred_train = MODEL.predict(X_train)

    print( "Train acc = ",get_accuracy(y_train, pred_train) )

    pred_val = MODEL.predict(X_test)
    print( "Validation acc = ",get_accuracy(y_test, pred_val) )


    return MODEL 

CBC = CatBoostClassifier(iterations=500, learning_rate=0.1) #loss_function='CrossEntropy')
CBC = run_model(CBC)
CBC.save_model("CBC.cbm",format="cbm")


