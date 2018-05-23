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