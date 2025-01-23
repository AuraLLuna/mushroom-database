# OVERVIEW
In this project, I explored a dataset involving characteristics of mushrooms such as whether or not they are poisonous or edible mushroom. Using PostgreSQL and pgAdmin for the environment, I cleaned, transofrmed and quiered the dataset. The original dataset is from a dataset from the "Mushroom Classification" page on [Kaggle -> Mushroom Class](https://www.kaggle.com/datasets/uciml/mushroom-classification). There are no authors however UCI Machine Learning and Meg Risdel are known collaborators of this data set. From this project, I developed a better understanding of SQL quieries and data manipulation techniques. 

# 1) Choosing Dataset and Enviroment
The dataset includes 22 categorical features describing different types of mushrooms. I used PostgreSQL with the pgAdmin interface. A table was created to store the dataset, and SQL quieries were used to find different insights on the dataset.

# 2) Processing Raw Dataset
The dataset was originally placed into a table as originally represented in the csv file. It was later altered for better readibly and straightforward because it made more sense
The dataset was initially loaded into a table with its raw form of data as originally represented in the csv file. To imporve readibilty and usability, the data was cleaned and modified. An example would be be changing the ring_numbers value from 'n','o','t' -> 0,1,2. This made it more straightforward for querying. mushrooms_db.sql was somehting I developed in order to create the new clean csv file.

# 2) Querying the Dataset
Using Chat GPT, I was able to generate 15 questions about the dataset that I would use to create querys. The mushrooms_clean_db.sql includes all 15 questions and their answers.

## Mushrooms Classification - Raw dataset
The original legend for each value in its respective columns.

- classes: edible=e, poisonous=p)
- cap-shape: bell=b,conical=c,convex=x,flat=f, knobbed=k,sunken=s
- cap-surface: fibrous=f,grooves=g,scaly=y,smooth=s
- cap-color: brown=n,buff=b,cinnamon=c,gray=g,green=r,pink=p,purple=u,red=e,white=w,yellow=y
- bruises: bruises=t,no=f
- odor: almond=a,anise=l,creosote=c,fishy=y,foul=f,musty=m,none=n,pungent=p,spicy=s
- gill-attachment: attached=a,descending=d,free=f,notched=n
- gill-spacing: close=c,crowded=w,distant=d
- gill-size: broad=b,narrow=n
- gill-color: black=k,brown=n,buff=b,chocolate=h,gray=g, green=r,orange=o,pink=p,purple=u,red=e,white=w,yellow=y
- stalk-shape: enlarging=e,tapering=t
- stalk-root: bulbous=b,club=c,cup=u,equal=e,rhizomorphs=z,rooted=r,missing=?
- stalk-surface-above-ring: fibrous=f,scaly=y,silky=k,smooth=s
- stalk-surface-below-ring: fibrous=f,scaly=y,silky=k,smooth=s
- stalk-color-above-ring: brown=n,buff=b,cinnamon=c,gray=g,orange=o,pink=p,red=e,white=w,yellow=y
- stalk-color-below-ring: brown=n,buff=b,cinnamon=c,gray=g,orange=o,pink=p,red=e,white=w,yellow=y
- veil-type: partial=p,universal=u
- veil-color: brown=n,orange=o,white=w,yellow=y
- ring-number: none=n,one=o,two=t
- ring-type: cobwebby=c,evanescent=e,flaring=f,large=l,none=n,pendant=p,sheathing=s,zone=z
- spore-print-color: black=k,brown=n,buff=b,chocolate=h,green=r,orange=o,purple=u,white=w,yellow=y
- population: abundant=a,clustered=c,numerous=n,scattered=s,several=v,solitary=y
- habitat: grasses=g,leaves=l,meadows=m,paths=p,urban=u,waste=w,woods=d

## Mushrooms Classification - Altered dataset
New legend after alteration of the csv file. The cleaned set was used for SQL query. Only changes from the orginal legend above are shown here.

- bruises: bruises=TRUE,no=FALSE
- stalk-root: missing=NULL
- ring-number: none=0,one=1,two=2
