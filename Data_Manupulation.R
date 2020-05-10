

#### CHAPTER 3 - DTA STRUCTURES ####



### VECTORS

my_vector = c(14,26,38,30) ### use c() to store several values in one variable

my_vector2= c("Hello","Good morning","Nice to meet you","Me too")

my_vector3 = c(10,20,30,"Hello")

# See type of my_vector3
class(my_vector3)

# Call 3 value of my_vector
my_vector[3]


### MATRICES

# Create matrix with values from my_vector, 2 rows and 2 columns
my_matrix = matrix(my_vector,nrow=2,ncol=2)

# Call
my_matrix

# Create vector with 9 integers from 1 to 9
1:9

my_matrix2 = matrix(1:9, nrow= 3, ncol = 3)
my_matrix2

# Access value on second row, second column
my_matrix2[2,2]

# Access second row
my_matrix2[2,]

# Access second column
my_matrix2[,2]

# Access sub-matrix with components on both first 2 rows and first 2 columns
my_matrix2[1:2,1:2]

# Access sub-matrix with components that are not on 3rd row and 3rd column
my_matrix2[-3,-3]


### DATA FRAMES

# Create data frame with 2 columns: my_vector and my_vector2
my_dataframe = data.frame(my_vector,my_vector2)
my_dataframe

# Look at data frame's overall type
class(my_dataframe)

# Look at columns' type
class(my_dataframe$my_vector)
class(my_dataframe$my_vector2)

# Call a column in a data frame
my_dataframe$my_vector # OR
my_dataframe[,1]

# Create sub data frame with first 3 rows only
my_little_dataframe= my_dataframe[1:3,]


### LISTS

# Create a list with 4 objects
my_list = list(my_vector,my_matrix,my_dataframe,my_vector2)

my_list

# Call First row of 3rd list's objects.
my_list[[3]][1,]


