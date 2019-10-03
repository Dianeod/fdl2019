# FDL NASA 2019 - Disaster Prevention, Progress and Response for Flooding

## Introduction
In the associated notebook, we examine how machine learning methods can be used to predict flood susceptibility in an area. The notebook focuses on the problems of predicting the flood susceptibility of an area and predicting the time taken for a river to reach its peak height after a rainfall event. Kdb+ was used to manage the joining and preprocessing of complex time-series datasets, while Random Forest and XGBoost models pythons scikit-learn  via embedPy and the ML-Toolkit.

A more in depth discussion of the project can be found at ...

## Requirements

- JupyterQ

The python packages required to allow successful exectution of all functions within this whitepaper can be installed via:

pip:
```bash
pip install -r requirements.txt
```

or via conda:
```bash
conda install --file requirements.txt
```

In addition to the python functionality [JupyterQ](https://code.kx.com/v2/ml/jupyterq) is necessary for the running of the notebook.

## Visualization
In order to plot the google maps graphics, gmaps must be enabled
```bash
jupyter nbextension enable --py --sys-prefix widgetsnbextension

jupyter nbextension enable --py --sys-prefix gmaps
```

## Downloading the data
Due to the vast amount of data used within the notebooks, some of the datasets were excluded from the data directory of this repo. In order to download the data, run the following q scripts found within code/download. These scripts have been written with Linux based systems in mind as primary development was completed on such a system.


```bash
q flasdown.q 							     /flash dataset
q usgs_gage.q -dir ../../data -sdate 2009.07.01 -edate 2019.06.30    /usgs gage information
q streamdown.q -dir ../../data -sdate 2009.07.01 -edate 2019.06.30   /usgs surfacewater data
q warning.q 							     /NOAA warning thresholds
```

The prism dataset collected from http://www.prism.oregonstate.edu/explorer/bulk.php can be cloned from the following github
```
git clone https://github.com/Dianeod/fdl2019
```
###Warning
``The prism dataset takes up ~107M of memory
