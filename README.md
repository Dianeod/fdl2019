#fdl2019

## Introduction
In the associated notebook, we examineed how machine learning methods can be used to predict flood susceptibility in an area. The notebook focuses on the problems of predicting the flood susceptibility of an area and predicting the time taken for a river to reach its peak height after a rainfall event. Kdb+ was used to manage the time-series data, while Random Forest and XGBoost models were deployed via embedPy and the ML-Toolkit.

A more in depth discussion of the project can be found on ....

## Requirements

- embedPy

The python packages required to allow successful exectution of all functions within the machine learning toolkit can be installed via:

pip:
```bash
pip install -r requirements.txt
```

or via conda:
```bash
conda install --file requirements.txt
```

## Visualization
In order to plot the google maps graphics, gmaps must be enabled
```bash
jupyter nbextension enable --py --sys-prefix gmaps
```

## Downloading the data
Due to the vast amount of data used within the notebooks, some of the datasets were excluded from the data directory of this repo. In order to download the data, run the following q scripts found within code/download

```q
q flasdown.q
q streamdown.q -dir ../../data -sdate 2009.07.01 -edate 2019.06.30
q usgs_gage.q -dir ../../data -sdate 2009.07.01 -edate 2019.06.30
q warning.q
```
