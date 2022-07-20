from tkinter import E
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation

from tqdm import tqdm
eps=np.full(10,1)
eps[10//2+3]=23
print(eps)