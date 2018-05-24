# Data Preprocessing Template

# Importando os dados
dataset = read.csv('Data.csv')

# Tratando os dados faltantes
dataset$Age = ifelse(is.na(dataset$Age), # Se nao tem o dado
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)), # Usa a media
                     dataset$Age) # Senao usa o proprio dado
dataset$Salary = ifelse(is.na(dataset$Salary), # Se nao tem o dado
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)), # Usa a media
                        dataset$Salary) # Senao usa o proprio dado

# Codificando dados de categorias (qualitativos)
dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1, 2, 3))
dataset$Purchased = factor(dataset$Purchased,
                         levels = c('No', 'Yes'),
                         labels = c(0, 1))

# Dividindo o conjunto de dados entre Treinamento e Teste
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Colocando todos os dados na mesma escala (Feature Scaling)
training_set[, 2:3] = scale(training_set[, 2:3])
test_set[, 2:3] = scale(test_set[, 2:3])