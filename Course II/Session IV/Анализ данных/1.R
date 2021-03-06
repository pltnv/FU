text <- "160.6; 165.1; NA; 161.7; 139.9; 173.4; 159.3; 140.7; 143.6; 133.8; 165.6; 134.3; 205.8; 125.6; 165; 200.1; NA; 198.4; 119.5; 120.1; 146.6; 135.1; 175.1; 157.3; 144.9; 143.7; 183.7; 124; 184.6; NA; NA; NA; 145.7; 183.9; 218.1; 198.6; 141.4; 179.7; NA; 227.4; 181.3; 161.4; 123.3; 159.9; 31.3000000000001; 180.5; 159.6; 179.1; 118.4; 138.1; 99.2; 168.5; 183.5; NA; 153.4; 184.5; 135; 209; 181.2; NA; 188.5; 185.7; 221.9; NA; 156.9; 165; 159.1; 134.5; 119.5; 132.7; 195.9; 134.5; 193.9; 219.7; 121.9; 135.3; 168.6; NA; 152.6; 166.8; 161; 120.5; 155.9; NA; 115.2; 121.5; 170; 129.3; 134.8; 117.4; NA; 180.2; 145.6; 161.1; 128; 211.2; 174.4; 133.2; 154.2; 118.7; 167.2; 135.9; NA; 201.6; NA; 180.5; 160.2; 126.5; 139.8; 134.6; 168.8; 145; NA; 161.2; 130.7; 166.6; 176.7; 158.2; NA; 200.9; 171.2; 145.3; 157.3; 81.1; 148.7; 163.7; 167.9; NA; 138.9; 162.7; 172.3; 144.8; 150.7; 139.4; 196.7; NA; 149.7; 177.5; 111.8; 138.5; 107.6; 158.6; 135.8; NA; 88.6; 102.5; 98.8; 124.5; 147.5; 140.3; 175; 163.4; 169.8; 141.8; 118; 199; 164.6; 144.4; 123.2; 142.3; 201.8; 83.2; 187.3; 162.7; 162.9; 208.1; 143.6; 142.5; 141.6; NA; 182.8; 183.2; 175.1; 176.2; 172; 191; 135.9; 183.1; 133.8; NA; 162.3; 179.5; 110.6; 132.3; 179.2; NA; 108; 179.2; 163.5; 154.7; 177.9; 128.9; NA; 183.1; 168.1; 186; 164.2; 159.1; 153.3; 140.6; 133.9; 181.9; 228.4; NA; 103.8; 106.1; NA; 114.4; 164.4; NA; 168.2; 136.6; 182.9; 119.9; 163.5; 99.5; 178; 135.8; 170; 160.4; 151.6; 188.1; 164.6; NA; 195.2; 148.6; 161.1; 102.5; 122.7; 116.7; 130.9; 152.3; 122.1; 175.6; 134.8; 134.7; 134; 197; 94.7; 183.9; 176; 198.5; NA; 164.8; 139.8; 151; 171.4; 154.7; 125.4; 118.2; 131; 170.1; 142.1; 180.7; 152.6; 176.2; 191.8; 148.8; 185.8; 151.9; 125.4; 135.7; 169.3; 129.2; 122.5; 179.5; 157.1; 195.6; 158.9; 152.3; 321.1; NA; 111.3; 101.8; 110.1; 175.6; 362.5; 186.2; 158.8; 139.7; 108.4; NA; 80.5; NA; 145.3; 170.1; 161.9; 179; 131.9; 137.5; 194.1; 196.6; 188.4; NA; 129.3; 165.2; 187.8; 110.3; 161.6; NA; 174.8; 163.8; 160; 142.5; 131.3; 191.8; 169.6; 194.6; 190.9; 162.1"

library(e1071)
library(DescTools)

convert_text_task_1 <- function(X) {
  results <- list()
  X <- unlist(strsplit(text,"; "))
  X[toupper(X) != tolower(X)] <- NA
  X <- as.double(as.character(X))
  NA_COUNT <- sum(sapply(X, function(y) sum(is.na(y))))
  results$vector <- X
  X <- X[!is.na(X)]
  results$na_count <- NA_COUNT
  results$clear_vector <- X
  return (results)
}

task1 <- convert_text_task_1(text)
object <- task1$clear_vector

task1$na_count # Количество пропущенных значений в исходной выборке, обозначенные как "NA"
length(object) # Объем очищенной от пропусков выборки
mean(object) # Cреднее значение
sd(object) / sqrt(length(object)) # Ошибка выборки
sd(object) # Cтандартное отклонение (несмещенное)
var(object) # Исправленная дисперсия
summary(object)[2] # Первая квартиль
summary(object)[5] # Третья квартиль
summary(object)[5] - summary(object)[2] # Квартильный размах
summary(object)[3] # Медиана
max(object) # Максимальное значение в вариационном ряду
min(object) # Минимальное значение в вариационном ряду
max(object) - min(object) # Введите размах выборки
kurtosis(object, type = 2) # Эксцесс (формула по умолчанию в Excel)
skewness(object, type = 2) # Коэффициент асимметрии
(sd(object) / sqrt(length(object))) / sqrt(length(object)) # Значение ошибки выборки
MeanCI(object, conf.level = 0.99) # Границы 0.99-доверительного интервала для E(X)
VarCI(object, conf.level = 0.99) # Границы 0.99-доверительного интервала для Var(X)
quantile(object, probs = 0.85) # Квантиль уровня 0.85
length(boxplot(object)$out) # Общее количество выбросов
length(boxplot(task1$vector[!(task1$vector %in% boxplot(task1$vector)$out)])$out) # Без выбросов и NA
#quantile(lst)["25%"] - 1.5 * IQR(lst) # Нижняя граница нормы
#quantile(lst)["75%"] + 1.5 * IQR(lst) # Верхняя граница нормы