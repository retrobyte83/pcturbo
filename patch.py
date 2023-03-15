
# coding: utf-8

# In[2]:


import argparse
from pathlib import Path


# In[3]:


# Create the parser
parser = argparse.ArgumentParser()


# In[4]:


# Add an argument
parser.add_argument('--patch', type=str, required=True)
parser.add_argument('--target', type=str, required=True)


# In[5]:


# Parse the argument
args = parser.parse_args()
patch = args.patch
target = args.target


# In[30]:


with open(patch) as f:
    lines = f.readlines()


# In[48]:


fil = bytearray(Path(target).read_bytes())


# In[49]:


file = lines[0]
bytes = lines[1:]
    


# In[1]:


for line in bytes:
    vals = line.split()
    
    loc = vals[0].replace(":","")
    loc_val = (int("0x"+loc, 0))
    
    old = (int("0x"+vals[1], 0))
    new = (int("0x"+vals[2], 0))
    
    chk = fil[loc_val]
    if chk!=old:
        print("fail! {}".format(loc_val))
        exit()
    else:
        fil[loc_val]=new
    


# In[51]:


with open(target, "wb") as binary_file:
    # Write bytes to file
    binary_file.write(fil)

