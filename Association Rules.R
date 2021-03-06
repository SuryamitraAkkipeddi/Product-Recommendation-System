#####################################################################################################
#################################### I> INSTALL PACKAGES ############################################
#####################################################################################################

install.packages('arules')

#####################################################################################################
#################################### II> LOAD THE LIBRARIES #########################################
#####################################################################################################

library(arules)
set.seed(123)

#####################################################################################################
#################################### III> IMPORT THE DATASET  #######################################
#####################################################################################################

dataset = read.csv('Market_Basket_Optimisation.csv', header = FALSE)
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)
summary(dataset)

#####################################################################################################
################################### IV> DATA PREPROCESSING ##########################################
#####################################################################################################

itemFrequencyPlot(dataset, topN = 10) # topN value can be altered

#####################################################################################################
################################## V> FIT/TRAIN ML MODEL TO THE TRAINING SET ########################
#####################################################################################################

rules = apriori(data = dataset, parameter = list(support = 0.004, confidence = 0.2))  # apriori

rules = eclat(data = dataset, parameter = list(support = 0.003, minlen = 2))          # eclat

#####################################################################################################
################################### VI> VISUALIZE THE RESULTS  ######################################
##################################################################################################### 

inspect(sort(rules, by = 'lift')[1:10])    # APRIORI- lift ratio can be altered

inspect(sort(rules, by = 'support')[1:15]) # ECLAT- support ratio can be altered

