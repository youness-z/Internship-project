#Project : Data use cases
#Author: Youness ZARHALI

#File : DeepLearningModelLayer.py
#Content: This file is core Deep learning layer, which contains:
#       - Neural network architectures
#       - Neural network trainer
#       - Performance analysis



#Package importation----------------------------------------------------------------------------------------------------
#Generic importations
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
#Deep learning importations
from keras import models,layers,constraints,optimizers
from tqdm import tqdm



#=======================================================================================================================
# NEURAL NETWORK MODELS
#=======================================================================================================================

class NeuralNetwork():

    def __init__(self,designation,number_layers,layers_types_list,activation_function_list,number_neuron_list,dropout_parameters_list,loss_function,constraints_class,constraints_flag,output_size):
        self.designation = designation
        self.number_layers = number_layers
        if len(layers_types_list)!=number_layers:
            raise ValueError('Neural network construction : the length of the layers types list must be equal to number_layers')
        else:
            self.layers_types_list = layers_types_list
        if len(activation_function_list)!=number_layers :
            raise ValueError('Neural network construction : the length of the activation function list must be equal to number_layers')
        else:
            if len(dropout_parameters_list)!=number_layers:
                raise ValueError( 'Neural network construction : the length of dropout parameters list must be equal to number_layers')
        self.activation_function_list = activation_function_list
        self.number_neuron_list = number_neuron_list
        self.dropout_parameters_list = dropout_parameters_list
        self.loss_function = loss_function
        self.constraints_flag = constraints_flag
        if constraints_flag==True:
            self.constraints_class = constraints_class

    def Construction(self):
        NN = models.Sequential()
        for i in range(self.number_layers):
            if self.constraints_flag ==True:
                NN.add(self.layers_types_list[i](units=self.number_neuron_list[i],dropout=self.dropout_parameters_list[i], activation=self.activation_function_list[i], kernel_constraint=self.constraints_class))
            else:
                NN.add(self.layers_types_list[i](units=self.number_neuron_list[i], activation=self.activation_function_list[i]))
        NN.summary()
        return NN




#=======================================================================================================================
# NEURAL NETWORK TRAINER
#=======================================================================================================================


class NeuralNetworkTrainer():
    def __init__(self,neural_network_model,train_dataset,test_dataset,target_train,target_test,epochs,batch_size,optimiser):
        #test_dataset includes the target variables
        self.neural_network_model=neural_network_model
        if type(train_dataset)!= pd.core.frame.DataFrame or type(target_train)!= pd.core.frame.DataFrame:
            raise ValueError('Neural Network Trainer : the dataset is not of expected type : pandas dataframe')
        self.train_dataset = train_dataset
        self.test_dataset = test_dataset
        self.target_train = target_train
        self.target_test = target_test
        self.epochs = epochs
        self.batch_size = batch_size
        self.optimiser = optimiser

    def BatchedDataSet(self):
        X_batched = pd.DataFrame()
        for elt in list(self.train_dataset.columns.values):
            X_batched[elt] = np.array(self.train_dataset[elt], [1, self.batch_size]).tolist()[0]
        return X_batched

    def Train(self):
        Loss_evolution = []
        for e in tqdm(range(1, self.epochs + 1)):
            X_batched = self.BatchedDataSet()
            loss = self.neural_network_model.train_on_batch(X_batched, np.array(self.target_train))
            Loss_evolution.append(loss)
        trained_neural_network = self.neural_network_model
        return Loss_evolution,trained_neural_network

    def LossPerformanceAnalysis(self):
        plt.plot(self.Train()[0], label=('Neural network type:%d% loss evolution',self.neural_network_model.designation))
        plt.legend()
        plt.show()

    def ScorePerformanceAnalysis(self,score_analysis_function):
        self.Train()
        return score_analysis_function(self.target_test, self.neural_network_model.predict(self.test_dataset))



