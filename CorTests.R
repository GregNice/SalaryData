#Read in Equifax/CCIC comparison dataset
library(readxl)
ccicEquiSalData <- read_excel("ccicEquiSalData.xlsx", 
                                col_types = c("text", "text", "text", 
                                              "text", "numeric", "numeric", "numeric", 
                                              "numeric", "numeric", "numeric", 
                                              "numeric", "numeric", "numeric", 
                                              "numeric"))

#Take a peak
View(ccicEquiSalData)

#Run spearman rank cor.test on salary
cor.test( ~ equifax_meanOfmedian + ccic_meanOfmedian,
          data = ccicEquiSalData,
          method = "spearman",
          continuity = FALSE,
          conf.level = 0.95)

#Run pearson product moment cor.test on salary
cor.test( ~ equifax_meanOfmedian + ccic_meanOfmedian,
          data = ccicEquiSalData,
          method = "pearson",
          continuity = FALSE,
          conf.level = 0.95)

plot( equifax_meanOfmedian ~ ccic_meanOfmedian,
      data = ccicEquiSalData,
      pch = 16)

#Run spearman cor.test on match rate
cor.test( ~ equifax_matchRate + ccic_matchRate,
          data = ccicEquiSalData,
          method = "spearman",
          continuity = FALSE,
          conf.level = 0.95)

#Run Pearson cor.test on match rate
cor.test( ~ equifax_matchRate + ccic_matchRate,
          data = ccicEquiSalData,
          method = "pearson",
          continuity = FALSE,
          conf.level = 0.95)

plot( equifax_matchRate ~ ccic_matchRate,
      data = ccicEquiSalData,
      pch = 16)

#Run spearman cor.test on match rate
cor.test( ~ equifax_error + ccic_error,
          data = ccicEquiSalData,
          method = "spearman",
          continuity = FALSE,
          conf.level = 0.95)

#Run pearson cor.test on match rate
cor.test( ~ equifax_error + ccic_error,
          data = ccicEquiSalData,
          method = "pearson",
          continuity = FALSE,
          conf.level = 0.95)

plot( equifax_error ~ ccic_error,
      data = ccicEquiSalData,
      pch = 16)