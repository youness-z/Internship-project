#Project : Data use cases
#Author: Youness ZARHALI

#File : DeepLearningModelLayer.py
#Content: This file is core Deep learning layer, which contains:
#       - Neural network architectures
#       - Neural network trainer
#       - Performance analysis

#Package importation----------------------------------------------------------------------------------------------------
#Generic importations
from sklearn import *
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from PreprocessingLayer import *
#Machine learning importations
from sklearn.naive_bayes import GaussianNB,MultinomialNB,ComplementNB,BernoulliNB
from sklearn.tree import DecisionTreeRegressor
from sklearn.model_selection import cross_val_score,train_test_split,KFold
from sklearn.multiclass import *
from sklearn.cluster import KMeans
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import confusion_matrix,recall_score,precision_score

class Classifier():

    def __init__(self,model,dataset,bayesian_classifier_flag,NaiveBayesianClassifiers=[GaussianNB(),MultinomialNB(),ComplementNB(),BernoulliNB()]):
        if type(model)!= str:
            raise TypeError('Classifier : model is not of expected type')
        if type(dataset)!= DataSet:
            raise TypeError('Classifier : dataset are not of expected type')
        self.model = model
        self.dataset = dataset
        if type(bayesian_classifier_flag)!= bool:
            raise TypeError('Classifier : bayesian_classifier_fag are not of expected type')
        else:
            if bayesian_classifier_flag==False:
                if len(NaiveBayesianClassifiers)!=0:
                    raise ValueError('Classifier : bayesian_classifier_fag and NaiveBayesianClassifiers are not compatible')
            else:
                self.bayesian_classifier_fag = bayesian_classifier_flag
                self.NaiveBayesianClassifiers = NaiveBayesianClassifiers

    def NaiveModelBuilder(self):
        if self.model=='GaussianNB':
            return self.NaiveBayesianClassifiers[0]
        if self.model=='MultinomialNB':
            return self.NaiveBayesianClassifiers[1]
        if self.model=='ComplementNB':
            return self.NaiveBayesianClassifiers[2]
        if self.model=='BernoulliNB':
            return self.NaiveBayesianClassifiers[3]

    def ExoticModelBuilder(self,parameters):
        if self.model!='random forest':
            raise ValueError('Classifier : ExoticModelBuilder is not of expected name ')
        else:
            if len(parameters) != 2:
                raise ValueError('Classifier : ExoticModelBuilder is not of expected name ')
            training_set = self.dataset.Splitter('Train')
            return RandomForestClassifier(max_depth=parameters[0], random_state=parameters[0]).fit(training_set[0],training_set[1])

    def Trainer(self,classifier_type='Naive',globaltrainedmodelflag = True):
        global trained_model_variable
        if type(classifier_type) != str:
            raise TypeError('Classifier : classifier_type is not of expected type')
        else:
            if classifier_type in ['Naive','Exotic']:
                raise ValueError('Classifier : classifier_type is not of expected value')
        training_set = self.dataset.Splitter('Train')
        self.NaiveModelBuilder().fit(training_set[0], training_set[1])
        if globaltrainedmodelflag == True:
            trained_model_variable = self.NaiveModelBuilder()
            return self.NaiveModelBuilder()
        else:
            return self.NaiveModelBuilder()

    def Predictor(self,X):
        return self.Trainer.predict(X)

    def PerformanceAnalyser(self):
        X,Y = self.dataset.Splitter('X'),self.dataset.Splitter('Y')
        Accuracy = metrics.accuracy_score(Y[1], self.Predictor(X[1]))
        trained_model = trained_model_variable
        return Accuracy * 100, confusion_matrix(Y[0], trained_model.predict(X[0])), recall_score(Y[0],trained_model.predict(X[0]), average='macro'), precision_score(
            Y[0], trained_model.predict(X[0]), average='macro')

class Regressor():
    def __init__(self,model,dataset):
        if type(model)!= str:
            raise TypeError('Regressor : model is not of expected type')
        else:
            if model not in ['decision tree','XGB random forest']:
                raise ValueError('Regressor : model is not of expected value decision tree or XGB random forest')
        if type(dataset)!= DataSet:
            raise TypeError('Classifier : dataset are not of expected type')
        self.model = model
        self.dataset = dataset

    def ModelBuilder(self,parameters):
        if self.model!='XGB random forest' or self.model != 'decision tree':
            raise ValueError('Regressor : model is not supported ')
        else:
            if self.model=='XGB random forest': #random_state=42
                if len(parameters) != 2:
                    raise ValueError('Regressor : ModelBuilder parameters is not of expected length ')
                else:
                    training_set = self.dataset.Splitter('Train')
                    return xgb.XGBRFRegressor(random_state=42).fit(training_set[0], training_set[1])
            if self.model == 'decision tree':# max_depth=2
                if len(parameters) != 1:
                    raise ValueError('Regressor : ModelBuilder parameters is not of expected length ')
                else:
                    training_set = self.dataset.Splitter('Train')
                    return RandomForestClassifier(max_depth=parameters[0], random_state=parameters[0]).fit(
                        training_set[0], training_set[1])

