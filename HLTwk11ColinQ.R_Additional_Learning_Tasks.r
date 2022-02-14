data("PlantGrowth") #Get Date
head(PlantGrowth)   #Peak at data

#Intiate boxplt
f <- ggplot(PlantGrowth, aes(x=group, y=weight, color= group)) + 
  geom_boxplot(outlier.color = "red", #Highlight the outlier
  )
f

#Apply client brand
#f+scale_color_manual(values=c("#12B2BA", "#EF5858", "#FED217"))
ClientPrimary = "#12B2BA"

#Apply RAG colouring knowing the positive and negative outcome
f <-f + labs(title = "A comparison of proprietary chemicals on plant growth\n", 
             title.colour = "#12B2BA",
             x = "Test Group", #Relabel X axis
             y = "Plant weight" #Relabel y axis
) +
  scale_color_manual(values=c("grey", "#b30000", "#00b300")) #Add custom RAG colour

#Re-colour text
f <-f + theme(plot.title = element_text(size = 15, face = "bold", color =ClientPrimary ),
              axis.title.x=element_text(colour=ClientPrimary),
              axis.title.y=element_text(colour=ClientPrimary),              
              axis.text.x=element_text(colour=ClientPrimary),
              axis.text.y=element_text(colour=ClientPrimary)) +
  scale_x_discrete(labels=c("Control","Test 1","Test 2"))  #Relabel X axis group to match legend
f  

f <- f  + theme(legend.position="none") # Drop the legend as it's cleaner without
f




#1. Write an R program to create three vectors a, b, c with 5 integers. Combine the three vectors to become a 3×5 matrix where each column represents a vector. 
  #Print the content of the matrix. 
  #Plot a graph and label correctly.
a <- c(1,2,3,4,5)                 #Vector - no type control
b <- as.integer(c(10,8,6,4,2))    #Vector as integer
c <- sample(1:10, 5, replace=F)   #Vector as random integer
d <- data.frame(a,b,c)            #Combine vectors to dataframe
print(d)                          #Print dataframe

#Not a great visual but not much to be done with 5 3 dimensional datapoints
#install.packages("scatterplot3d")  # Install
library("scatterplot3d")            # load
scatterplot3d(x=d$a, xlab = "A: 5 fixed numbers",
              y=d$b, ylab = "B: 5 fixed integers",
              z=d$c, zlab = "C: 5 random integers",
              main="Plotting 3 integer vars",
              pch = 16, color="Red")


#visualization of correlations as alternate option
library(GGally)
ggcorr(d, method = c("everything", "pearson"))


#2. Write a R program to create a Data frames which contain details of 5 employees and display the details. (Name, Age, Role and Length of service).
df2 <- data.frame(
  Name = c("John","Jane","James","Judy","Jim"),
  Age = c(18,22,25,65,12),
  Role = c("Analyst","Reporting","QA","PMO","Lead"),
  LoS = c(2,6,3,6,2),
  stringsAsFactors = FALSE
  )
df2


#3. Import the GGPLOT 2 library and plot a graph using the qplot function. X axis is the sequence of 1:20 and the y axis is the x^2. Label the graph appropriately. install.packages("ggplot2",dependencies = TRUE)
library(ggplot2)

#Create data frame
x3 = seq(from = 1, to = 20) #Sequence x
y3 = x3^2                   #Create y as x^2
df3 <- data.frame(x3,y3)    #combine to dataframe

#Line plot
ggplot(data=df3, aes(x=x3, y=y3)) +
  geom_line()+
  geom_point()+
  labs(
    title="Plotting x to power of 2 for the values 1 to 20",
    x="Sequentional numbers 1 to 20",
    y="X^2")

#4. Create a simple bar plot of five subjects
Subject = c("Maths","Science","IT","History","Art")
PassCount <- sample(1:100, 5, replace=F)
barplot(PassCount,names.arg=Subject,xlab="Subject",ylab="Count of passes",main="Count of students passing per subject")

#5. Write a R program to take input from the user (name and age) and display the values.
my.name <- readline(prompt="Enter name: ")

my.age <- as.integer(readline(prompt="Enter age: "))

print(paste("Hi,", my.name, "you are", my.age, "years old."))

#6. Write a R program to create a sequence of numbers from 20 to 50 and find the mean of numbers from 20 to 50 and sum of numbers.
x6 <- seq(from = 20, to = 50)
MeanX = mean(x6)
SumX = sum(x6)
MeanX
SumX

#7. Write a R program to create a vector which contains 10 random integer values between -50 and +50
x7 <- sample(-50:50, 10, replace=F)
x7

#1. Write a R program to get the first 10 Fibonacci numbers.
Previous <- 0 #Default 1st value
Current <- 1  #Default 2nd value
Fibonacci_10 <- as.integer(c(Previous,Current)) #Store initial 2 values
for(y in 1:10){ #Loop 10 times
  New <- Previous + Current   #Combine previous 2 values to create latest
  Fibonacci_10 <-  append(Fibonacci_10, New) #Store the new value of sequence in vector
  Previous <- Current         #Increment the previous value up to current
  Current <- New              #Increment the current value up to new
}
Fibonacci_10 #Print 

#2. Write a R program to print the numbers from 1 to 100 and print "Fizz" for multiples of 3, print "Buzz" for multiples of 5, and print "FizzBuzz" for multiples of both.

for (x in 1:100) {
  Msg <- paste(x, ":")
  if (x%%3== 0 & x%%5!= 0) {
    Msg <- paste(x, ":Fizz")
  }
  if (x%%3!= 0 & x%%5== 0) {
    Msg <- paste(x, ":Buzz")
  }
  if (x%%3== 0 & x%%5== 0) {
    Msg<- paste(x, ":Fizzbuzz")
  }
  print(Msg)
}
  
