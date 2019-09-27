RandomForestClassifier:.p.import[`sklearn.ensemble]`:RandomForestClassifier
XGBClassifier:.p.import[`xgboost]`:XGBClassifier
np:.p.import[`numpy]
precision_recall_curve:.p.import[`sklearn.metrics]`:precision_recall_curve
average_precision_score:.p.import[`sklearn.metrics]`:average_precision_score
preprocessing:.p.import[`sklearn]`:preprocessing
plt:.p.import[`matplotlib]`:pyplot
train_test_split:.p.import[`sklearn.model_selection]`:train_test_split
plt:.p.import`matplotlib.pyplot

pr_curve:{[Xtest;ytest;classifiers]

 plts:{[Xt;yt;cl;x]
  clf:cl[x];
  ypredict:clf[`:predict][Xt]`;
  yscores:(clf[`:predict_proba][Xt]`)[;1];
  conf:.ml.confdict[yt;ypredict;1b];
  meanclassavg:avg (conf[`tp]%(sum conf[`tp`fn]);conf[`tn]%(sum conf[`tn`fp]));
  print "\n","Accuracy for ",string[x],": ",string (count where ypredict=yt)%count yt,"\n\n";
  print "Meanclass accuracy for ",string[x],": ",string[meanclassavg],"\n\n";
  show .ml.classreport[ypredict;yt];
  prt:precision_recall_curve[yt;yscores]`;
  average_precision:average_precision_score[yt;yscores]`;
  plt[`:plot][prt[1];prt[0];`linewidth pykw 3;
    `label pykw string[x],"=",string[average_precision]];

  plt[`:xlabel][`Recall;`fontsize pykw 14];
  plt[`:ylabel][`Precision;`fontsize pykw 14];
  plt[`:ylim][0.0; 1.05];
  plt[`:xlim][0.0; 1.0];
  plt[`:legend][`loc pykw "upper right";`fontsize pykw 11];
  plt[`:tight_layout][];
  (enlist `pred)!enlist ypredict}[Xtest;ytest;classifiers]each key classifiers;
 `plt`model!(plt[`:show][];plts`pred)}

