# Data Preprocessing Template

# Importando as bibliotecas
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importando os dados
dataset = pd.read_csv('Data.csv')
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 3].values

# Tratando os dados faltantes
from sklearn.preprocessing import Imputer
imputer = Imputer(missing_values = 'NaN', strategy = 'mean', axis = 0)
imputer = imputer.fit(X[:, 1:3]) # pegando colunas 1 e 2 - superior excludente
X[:, 1:3] = imputer.transform(X[:, 1:3])

# Codificando dados de categorias (qualitativos)
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelencoder_X = LabelEncoder()
X[:, 0] = labelencoder_X.fit_transform(X[:, 0])
onehotencoder = OneHotEncoder(categorical_features = [0])
X = onehotencoder.fit_transform(X).toarray()
labelencoder_y = LabelEncoder()
y = labelencoder_y.fit_transform(y)