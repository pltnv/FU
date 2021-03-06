text <- "(-195.996, NA); (-165.653, -176.5); (-160.267, -164.9); (-190.711, -188.3); (NA, NA); (-173.36, -220.8); (-137.019, -198); (NA, -185.2); (-226.29, NA); (NA, -148.9); (-165.95, -179.2); (-136.197, -235.6); (-140.211, -167.9); (-165.564, -167.3); (-151.58, -176.6); (-166.386, -151.9); (-180.454, -194.5); (-175.371, -112.5); (-182.294, -195.6); (-183.424, -175.3); (-156.16, -191.3); (-148.251, -191.2); (-167.912, NA); (-114.438, -135.7); (-161.956, -196); (-173.334, -185.9); (-202.289, -144.6); (-238.594, -132.8); (-148.56, -154); (-143.619, -199.2); (-178.339, -187.2); (-169.513, NA); (-155.53, -186.8); (-215.418, -139.3); (-137.883, -194.2); (-243.86, -197.6); (-196.43, -187.2); (-192.464, -151.5); (NA, -188.5); (-228.035, -144.2); (-204.89, -159.3); (-156.4, -190.7); (-169.777, -173.4); (-173.323, -130.7); (-186.659, -162.8); (-143.269, -220.4); (-204.113, -208.4); (-210.83, -151.5); (-218.032, -192.7); (-133.326, -175.9); (-181.445, -195.6); (NA, -162); (-254.814, -167.6); (-198.685, -197.2); (-177.373, -164.6); (-204.537, NA); (-183.497, -201.6); (-162.749, -176.9); (-167.413, NA); (-170.725, -148.9); (-190.903, -138); (-150.462, -222.2); (-193.617, -196.9); (-219.349, -185.1); (-163.31, -202.2); (-189.137, -163.8); (-192.406, -164.3); (-176.191, -177.6); (-166.083, -169.3); (-179.077, -254); (-171.852, -228.9); (-195.306, NA); (-149.868, -183.4); (-154.08, -167); (-189.088, NA); (-190.738, -132.4); (-210.325, -154.9); (-175.464, -139.5); (-186.047, -187.2); (-171.989, -177.4); (-189.55, -218.7); (-162.119, -156.8); (-180.824, -143.5); (-225.053, -243); (-178.781, -196.3); (-175.425, -187.2); (-167.215, -243.2); (-160.114, -163.1); (-133.996, -143); (-211.773, -218.9); (-197.105, -166); (-194.291, -185.9); (-184.125, -188.7); (-153.153, NA); (-211.635, -192.5); (-183.122, -175.7); (-178.232, -185.5); (-182.047, NA); (-134.692, -138.7); (-195.526, -168.9); (-171.468, -174.3); (NA, -161.8); (-228.754, -162.9); (-131.638, -175.5); (-186.776, -166.6); (-192.801, -217.9); (-187.035, -179); (-201.582, -173.1); (-181.342, -174.1); (-268.864, -211); (-224.358, -182.9); (-189.975, -171.5); (-170.182, -178.9); (-190.127, -141.8); (NA, -216.4); (-213.192, -246); (-151.345, -198.7); (-164.518, -175.5); (-136.95, -136.1); (-192.415, -162.2); (-171.691, -212.2); (-147.585, -206.5); (NA, -123.2); (NA, -188); (-176.696, -165); (-208.001, NA); (-167.301, -156.9); (-151.125, -225.9); (-229.679, -172.3); (-189.846, -168.6); (-172.851, -181.9); (-232.383, -92.1); (-166.602, -203.5); (-230.08, -208.2); (-201.475, -226.7); (-159.183, -198.4); (-191.844, -185.9); (-174.657, -190.4); (NA, -155.4); (-207.904, -222.8); (-162.058, -157.8); (-102.291, -181.1); (-190.928, -169.9); (-147.159, -193.7); (-207.433, -177.4); (-214.409, -160.7); (-171.597, -132.2); (-181.402, -120.8); (-179.975, -167); (-156.398, -163.9)"

library(stringr)

task3 <- matrix(data = sapply(strsplit(text, "; "), function(x) {
                      x <- unlist(strsplit(str_sub(x,2, nchar(x) - 1),", "))
                      x[toupper(x) != tolower(x)] <- NA
                      x <- as.double(as.character(x))
                      return (x)
                    }),
               byrow = T, ncol = 2)
task3 <- data.frame(task3)

colnames(task3) <- c("X", "Y")

task3 <- na.omit(task3)
task3


cor.test(task3$X, task3$Y, method = "pearson")$estimate # 1. Выборочный коэффициент корреляции Пирсона между X и Y

# 2.1
t.test(task3$X, task3$Y, conf.level = 0.95, alternative = "greater")$p.value # 2.1 значение P-value в проверке гипотезы о равенстве средних значений показателей фирм при альтернативной гипотезе о том, что среднее значение показателя больше у первой фирмы (без каких-либо предположений о равенстве дисперсий)
t.test(task3$X, task3$Y, conf.level = 0.95, alternative = "two.side")$p.value # 2.1 значение P-value в проверке гипотезы о равенстве средних значений показателей фирм при альтернативной гипотезе об их неравенстве (без каких-либо предположений о равенстве дисперсий)
ifelse(t.test(task3$X, task3$Y, conf.level = 0.1, alternative = "greater")$p.value < 0.05, 1, 0) # 2.2 На уровне значимости 0.1 можно ли утверждать, что средние значения показателей у фирм различны? Введите 1 - если да, и 0 - если нет

var.test(task3$X, task3$Y, conf.level = 0.1, alternative = "two.side")$p.value # 3.1 значение P-value в проверке гипотезы о равенстве дисперсий показателей двух фирм при альтернативной гипотезе об их неравенстве
1 - var.test(task3$X, task3$Y, conf.level = 0.1, alternative = "less")$p.value # 3.1 Введите значение P-value в проверке гипотезы о равенстве дисперсий показателей двух фирм при альтернативной гипотезе о том, что дисперсия показателя больше у второй фирмы
ifelse(var.test(task3$X, task3$Y, conf.level = 0.1, alternative = "less")$p.value < 0.05, 1, 0) # 3.2 На уровне значимости 0.1 можно ли утверждать, что о том, что дисперсия показателя больше у второй фирмы? Введите 1 - если да, и 0 - если нет
