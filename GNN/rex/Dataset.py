import numpy as np
import pandas

SNPcollect = pandas.read_csv("../Data/Support/SNPManual.csv")
data = pandas.read_csv("../Data/Geno.csv")
Positive = pandas.read_csv("../Data/Support/positive.csv")
Label = pandas.DataFrame(data.Cases.isin(Positive['Cases']).astype(int))
snplist = SNPcollect['SNV']
for snp in snplist:
    pair = SNPcollect.loc[SNPcollect['SNV'] == snp]
    EA = np.array_str(pair['EA'].values).split('\'')[1]
    OR = 2 ** pair['OR'].values[0]
    EAF = pair['EAF'].values[0]
    data[snp] = [case.count(EA) ** OR for case in data[snp]]

number = Label.value_counts()

Whole = pandas.concat([data, Label], axis=1)
pdata = Whole.loc[Label['Cases'] == 1]
zdata = Whole.loc[Label['Cases'] == 0]
# Whole.to_csv("../Data/Label.csv",index=False)
dealed = zdata.sample(n=7000)
New = pandas.concat([dealed, pdata])
New.sample(frac=1)
New.to_csv("../Data/beDataset_n.csv", index=False)
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


'''
number = Label.value_counts()

Whole = pd.concat([data, Label], axis=1)
pdata = Whole.loc[Label['Cases'] == 1]
zdata = Whole.loc[Label['Cases'] == 0]
# Whole.to_csv("../Data/Label.csv",index=False)
dealed = zdata.sample(n=6449)
New = pd.concat([dealed, pdata])
New.to_csv("../Data/bDataset.csv", index=False)
pass
'''
