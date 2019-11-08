## Feature Scoring using Tree-Based Ensembles for Evolving Data Streams
This is the repository for the methods presented in the paper _"Feature Scoring using Tree-Based Ensembles for Evolving Data Streams"_. The algorithms have been implemented using MOA 2017.10, we are going to update it to the latest version of MOA prior to submitting it to the official MOA repository. 

Assigning scores to individual features is a popular method for estimating the relevance of features in supervised learning. An accurate feature score estimation provides essential insights in sensitive domains, which is decisive to explain how features influence a given decision, contributing to the interpretability of the model. 
Learning from streaming data adds several challenges to machine learning tasks, including limited resources and changes to the underlying data distribution (i.e., evolving data streams). 
In this work, we introduce and analyze methods to efficiently estimate the Mean Decrease in Impurity (MDI) and COVER measures using ensembles of incremental decision trees. To achieve current scores in evolving data streams, we employ tree-ensembles that incorporate active drift detection. 

ClassifierWithFeatureImportance.java
HoeffdingTree.java
AdaptiveRandomForest.java
OzaBagHAT.java

FeatureScore.java (interface implemented by classes that yield feature scores: AdaptiveRandomForest, OzaBagHAT)

## Requirements 
* You will need JAVA 8 or 9 installed
* ``moa-feature-score.jar`` is required and it can be found in this repository. You may also build the jar yourself, we just provide it for convenience. 
* The datasets are also available in the subdirectory `data`
* In a unix system you should be able to run the jar using ``moa-feature-score.sh``, in a windows environment please create a bat file or use the command line. Further information about how to execute MOA can be found in here: https://moa.cms.waikato.ac.nz/getting-started/


## Citing the paper
To cite the feature score methods in a publication, please cite the following paper: 
> Heitor Murilo Gomes, Rodrigo Fernandes de Mello, Bernhard Pfahringer, Albert Bifet. 
> Feature Scoring using Tree-Based Ensembles for Evolving Data Streams. In IEEE Big Data, IEEE, 2019.

## Example
* This example will execute ClassifierWithFeatureImportance using ``ARF-MDI`` on the electricity dataset and it will create a ``debug_elec_ARF.csv`` with the feature scores (and other statistics). 
Please note that the location ``elecNormNew.arff`` should correspond to where ``elecNormNew.arff`` has been extracted. 

* This command can be copied and pasted in the MOA GUI: 

``EvaluatePrequential -l (meta.ClassifierWithFeatureImportance -l (meta.AdaptiveRandomForest -l (ARFHoeffdingTree -k 6 -e 2000000 -g 50 -c 0.01) -o (Percentage (M * (m / 100))) -m 80) -w 452 -c debug_elec_ARF.csv) -s (ArffFileStream -f elecNormNew.arff) -f 45200``

* This command can be run from the command line: 

``java -Xmx10g -Xss10M -cp moa-feature-score.jar moa.DoTask "EvaluatePrequential -l (meta.ClassifierWithFeatureImportance -l (meta.AdaptiveRandomForest -l (ARFHoeffdingTree -k 6 -e 2000000 -g 50 -c 0.01) -o (Percentage (M * (m / 100))) -m 80) -w 452 -c debug_elec_ARF.csv) -s (ArffFileStream -f elecNormNew.arff) -f 45200"``
