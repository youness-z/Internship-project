#Project : Data use cases
#Author: Youness ZARHALI

#File : PreprocessingLayer.py
#Content: This file is core Data Preprocessing layer, which contains:
#       - Numerical Data preprocessor


#Package importation
from sklearn import preprocessing
from sklearn.model_selection import train_test_split
import pandas as pd
from tabulate import tabulate
from statistics import *
from math import nan

#Class architecture

class DataSet():
    def __init__(self,file,target_features):
        self.file = file
        self.target_features = target_features

    def ToPandas(self):
        return pd.read_csv(self.file, sep=',')

    def GetFeatures(self):
        return self.ToPandas().columns

    def Splitter(self,designation='X_train',size=0.33):
        if type(designation) != str:
            raise TypeError('DataSet : designation is not of expected type str')
        else:
            if designation == 'X_train':
                return train_test_split(self.ToPandas()[[f for f in self.GetFeatures() if f not in self.target_features]],
                                        self.ToPandas()[self.target_features], test_size=size, random_state=42)[0]
            if designation == 'X_test':
                return train_test_split(self.ToPandas()[[f for f in self.GetFeatures() if f not in self.target_features]],
                                        self.ToPandas()[self.target_features], test_size=size, random_state=42)[1]
            if designation == 'y_train':
                return train_test_split(self.ToPandas()[[f for f in self.GetFeatures() if f not in self.target_features]],
                                        self.ToPandas()[self.target_features], test_size=size, random_state=42)[2]
            if designation == 'y_test':
                return train_test_split(self.ToPandas()[[f for f in self.GetFeatures() if f not in self.target_features]],
                                        self.ToPandas()[self.target_features], test_size=size, random_state=42)[3]
            if designation == 'Train':
                return train_test_split(self.ToPandas()[[f for f in self.GetFeatures() if f not in self.target_features]],
                                        self.ToPandas()[self.target_features], test_size=size, random_state=42)[:2]
            if designation == 'Test':
                return train_test_split(self.ToPandas()[[f for f in self.GetFeatures() if f not in self.target_features]],
                                        self.ToPandas()[self.target_features], test_size=size, random_state=42)[2:]
            if designation == 'Y':
                return train_test_split(self.ToPandas()[[f for f in self.GetFeatures() if f not in self.target_features]],
                                        self.ToPandas()[self.target_features], test_size=size, random_state=42)[1],train_test_split(self.ToPandas()[[f for f in self.GetFeatures() if f not in self.target_features]],
                                        self.ToPandas()[self.target_features], test_size=size, random_state=42)[3]
            if designation == 'X':
                return train_test_split(self.ToPandas()[[f for f in self.GetFeatures() if f not in self.target_features]],
                                        self.ToPandas()[self.target_features], test_size=size, random_state=42)[0],train_test_split(self.ToPandas()[[f for f in self.GetFeatures() if f not in self.target_features]],
                                        self.ToPandas()[self.target_features], test_size=size, random_state=42)[2]
            if designation == 'All':
                return train_test_split(self.ToPandas()[[f for f in self.GetFeatures() if f not in self.target_features]],
                                        self.ToPandas()[self.target_features], test_size=size, random_state=42)

class DataCleaner():
    def __init__(self,dataset):
        if type(dataset) != DataSet:
            raise TypeError('NumericalDataPreprocessor : dataset is not of expected type DataSet')
        self.dataset = dataset

    def Remover(self,dropping_variables):
        return self.dataset.ToPandas().drop(dropping_variables, inplace=True, axis=1)

    def Cleaner(self):
        data_set = self.dataset.ToPandas()
        for i in range(len(data_set[0].count())):
            if nan in data_set[i]:
                data_set.drop([i])
        return data_set

class NumericalDataPreprocessor():
    def __init__(self,dataset):
        if type(dataset) != DataSet:
            raise TypeError('NumericalDataPreprocessor : dataset is not of expected type DataSet')
        self.dataset = dataset

    def DatasetView(self):
        return self.dataset.ToPandas()

    def GetVariables(self):
        return self.dataset.GetFeatures()

    def Scaling(self,scaling_type,features,scaling_functions=None):
        if self.type != 'numerical':
            raise ValueError('Numerical Data Preprocessor : scaling is not possible for non numerical data')
        else:
            scaled_dataset = self.dataset.ToPandas()[features]
            if scaling_type == 'mean-variance normalised':
                return preprocessing.StandardScaler().fit(scaled_dataset).transform(scaled_dataset)
            if scaling_type == 'min-max normalised':
                return preprocessing.MinMaxScaler().fit(scaled_dataset).transform(scaled_dataset)
            if scaling_type == 'customised':
                if list(scaling_functions.keys())!=features:
                    raise ValueError('Numerical Data Preprocessor : the keys of the scaling functions dict is not equal to features')
                else:
                    for x in features:
                        scaled_dataset.assign(x= scaling_functions[x])
                    return scaled_dataset

    def SamplingTypeCheck(self,features,size):
        sampling_dict = {f:self.dataset.ToPandas()[f][:size] for f in features}
        checking_list=[[type(sampling_dict[f][i])==float for i in range(size)] for f in features]
        for item in checking_list:
            if any(item)==False:
                raise ValueError('Numerical Data Preprocessor : numerical data checking has failed')
        return 'Numerical data checking succeded'

    def DataStatistics(self,features,statistics_designations = [mean(),median_high(),median_low(), quantiles(),stdev(),variance()]):
        if features != 'list':
            raise ValueError('Numerical Data Preprocessor : DataStatistics features are not of expected type')
        else:
            statistic_dict = [[designation,designation(self.dataset.ToPandas()[features])] for designation in statistics_designations ]
            return tabulate(statistic_dict,headers = statistics_designations,tablefmt = "orgtbl")

    def Visulaliser(self):
        pass



