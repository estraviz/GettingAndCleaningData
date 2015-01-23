Getting and Cleaning Data (project)
===================================

Introduction
------------

This repository contains my project for the course *["Getting and Cleaning Data"](https://www.coursera.org/course/getdata)* by [Jeff Leek, PhD](http://jtleek.com/), [Roger D. Peng, PhD](http://www.biostat.jhsph.edu/~rpeng/), [Brian Caffo, PhD](http://www.bcaffo.com/), from [John Hopkins Bloomberg School of Public Health](http://www.jhsph.edu/), through Coursera. It is the third course in the specialization of [Data Science](https://www.coursera.org/specialization/jhudatascience/1).  


Purpose
-------

The purpose of this project is to demonstrate own's ability to collect, work with, and clean a data set. The goal is to prepare *[tidy data](http://www.jstatsoft.org/v59/i10/paper)* that can be used for later analysis.


Rationale behind the data
-------------------------

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/).

Companies like [Fitbit](http://www.fitbit.com/), [Nike](http://www.nike.com/), and [Jawbone Up](https://jawbone.com/up) are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the [Samsung Galaxy S smartphone](https://en.wikipedia.org/wiki/Samsung_Galaxy_S). A full description is available at the site where the data was obtained (link [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)). 

The data that has been used in this project can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).


Files in this repository 
------------------------

* **run_analysis.R**: this file contains the R code that downloads and unzips the original data, operates with it and finally records a "tidy" dataset for later analysis, as commented before.
* **tidydata.txt**: the file finally obtained in the process.
* **CODEBOOK.md**: this is the code book for the resulting variables in the final dataset.
* **README.md**: this current file. 
