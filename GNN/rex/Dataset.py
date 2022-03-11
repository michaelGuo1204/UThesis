import pandas

import pandas as pd

data = pandas.read_csv("../Data/Geno.csv")
'''
phenos=data.to_numpy()
hit=[]
for row in phenos:
    if re.search(r"(M1[5-9])\w",np.array_str(row)):
      hit.append(row[0])

positive=pandas.DataFrame(hit)
positive.to_csv("../Data/positive.csv")
'''
'''
Positive = pandas.read_csv("../Data/Support/positive.csv")
Label=data.Cases.isin(Positive['Cases']).astype(int)
number=Label.value_counts()
Whole=pd.concat([data.Cases,Label],axis=1)
#Whole.to_csv("../Data/Label.csv",index=False)
pass
'''
Positive = pandas.read_csv("../Data/Support/positive.csv")
Label = pandas.DataFrame(data.Cases.isin(Positive['Cases']).astype(int))
number = Label.value_counts()

Whole = pd.concat([data, Label], axis=1)
pdata = Whole.loc[Label['Cases'] == 1]
zdata = Whole.loc[Label['Cases'] == 0]
# Whole.to_csv("../Data/Label.csv",index=False)
dealed = zdata.sample(n=6449)
New = pd.concat([dealed, pdata])
New.to_csv("../Data/bDataset.csv", index=False)
pass
