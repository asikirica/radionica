# =============================================================================
# Source
# https://github.com/TatevKaren/artificial-neural-network-business_case_study/
# =============================================================================
# Import libraries
import numpy as np
import pandas as pd
import tensorflow as tf
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import OneHotEncoder, LabelEncoder, StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix, accuracy_score



# Checking the tensorflow version
print(tf.__version__)

# Loading the data
bank_data = pd.read_csv("dataset.csv")

# Taking  all rows and all columns in the data except the last column as X (feature matrix)
X = bank_data.iloc[:,3:-1].values
y = bank_data.iloc[:, -1].values
print("Independent variables are:", X)
print("Dependent variable is:", y)


# Transforming the gender variable, labels are chosen randomly
le = LabelEncoder()
X[:,2] = le.fit_transform(X[:,2])
print(X)

# Transforming the geography column variable, labels are chosen randomly, the ct asks for argument [1] the index of the target vb
ct = ColumnTransformer(transformers = [('encoder', OneHotEncoder(),[1])], remainder = 'passthrough')
X = np.array(ct.fit_transform(X))
print(X)

# Splitting the data into train and test
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)
print(X_train.shape, X_test.shape)
print(y_train.shape, y_test.shape)

# Data Scaling/normalization of the features that will go to the NN
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)



# Initializing the ANN by calling the Sequential class fromm keras of Tensorflow
ann = tf.keras.models.Sequential()

# Number of Units = 6 and Activation Function = Rectifier
ann.add(tf.keras.layers.Dense(units = 6, activation = 'relu'))

# Number of Units = 6 and Activation Function = Rectifier
ann.add(tf.keras.layers.Dense(units = 6, activation = 'relu'))

# Number of Units = 1 and Activation Function = Sigmoid
ann.add(tf.keras.layers.Dense(units = 1, activation = 'sigmoid'))



# Compiling the ANN
ann.compile(optimizer = 'adam', loss = 'binary_crossentropy', metrics = ['accuracy'])

# Training the ANN model on training set  (fit method always the same)
ann.fit(X_train, y_train, batch_size = 32, epochs = 100)



# Use ANN model to predict the probability of the customer leaving the bank
print(ann.predict(sc.transform([[1, 0, 0, 600, 1, 40, 3, 60000, 2, 1, 1, 50000]])))
print(ann.predict(sc.transform([[1, 0, 0, 600, 1, 40, 3, 60000, 2, 1, 1, 50000]])) > 0.5)

# Vector of predictions and real values
y_pred_prob = ann.predict(X_test)

# Probabilities to binary
y_pred = (y_pred_prob > 0.5)
print(np.concatenate((y_pred.reshape(len(y_pred),1), y_test.reshape(len(y_test),1)), 1))

# Confusion Matrix
confusion_matrix = confusion_matrix(y_test, y_pred)
print("Confusion Matrix", confusion_matrix)
print("Accuracy Score", accuracy_score(y_test, y_pred))
