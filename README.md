
Requirements: 
- You will need JAVA 8 or 9 installed. 
- moa-feature-score.jar is required and it can be found in the directory with this README. 
- The datasets are also available at the root of this directory. 
- In a unix system you should be able to run the jar using moa-feature-score.sh, in a windows environment please create a bat file or use the command line. Further information about how to execute MOA can be found in here: https://moa.cms.waikato.ac.nz/getting-started/

This example will execute ClassifierWithFeatureImportance using ARF-MDI on the electricity dataset and it will create a debug_elec_ARF.csv with the feature scores (and other statistics). 
Please note that the location 'elecNormNew.arff' should correspond to where elecNormNew.arff has been extracted. 

This command can be copied and pasted in the MOA GUI: 
EvaluatePrequential -l (meta.ClassifierWithFeatureImportance -l (meta.AdaptiveRandomForest -l (ARFHoeffdingTree -k 6 -e 2000000 -g 50 -c 0.01) -o (Percentage (M * (m / 100))) -m 80) -w 452 -c debug_elec_ARF.csv) -s (ArffFileStream -f elecNormNew.arff) -f 45200

This command can be run from the command line: 
java -Xmx10g -Xss10M -cp moa-feature-score.jar moa.DoTask "EvaluatePrequential -l (meta.ClassifierWithFeatureImportance -l (meta.AdaptiveRandomForest -l (ARFHoeffdingTree -k 6 -e 2000000 -g 50 -c 0.01) -o (Percentage (M * (m / 100))) -m 80) -w 452 -c debug_elec_ARF.csv) -s (ArffFileStream -f elecNormNew.arff) -f 45200"
