library(psych)
library(ggplot2)


hist(clubbedData$Obesity)


ggplot(clubbedData) + 
  geom_histogram(aes(x=Pizza,y=..density..), position="identity") + 
  geom_density(aes(x=Pizza,y=..density..))

ggplot(clubbedData) + 
  geom_histogram(aes(x=NoPizza,y=..density..), position="identity") + 
  geom_density(aes(x=NoPizza,y=..density..))

fitObesity <- lm(Obesity ~ Pizza + NoPizza, data = clubbedData)
fitBP <- lm(High.blood.pressure ~ Pizza + NoPizza, data = clubbedData)

