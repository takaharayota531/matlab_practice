import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation

from tqdm import tqdm

# 定数の初期化
dx = 0.002 # 空間差分間隔[m]
c = 299792458.0 # 光速[m/s]
dt = dx/c * 0.99 # 時間差分間隔[s]
f = 3.5e9 # 周波数[Hz]
nx = 10000 # 計算点数
nt = 500 # 計算ステップ数

# 変数初期化
t = 0.0

eps = np.full(nx, 8.854187817e-12)
mu = np.full(nx, 1.2566370614e-6)

for i in range(nx//2-50):
    eps[nx//2 + 50+i] = 100 * 8.854187817e-12 # 比誘電率100の誘電体を設置
print(eps[nx//2 + 50])
print (eps[nx//2 + 51])
E_y = np.zeros(nx)
E_z = np.zeros(nx)
H_y = np.zeros(nx)
H_z = np.zeros(nx)

fig = plt.figure()
image_list = []
for _ in tqdm(range(nt)):

    # 電界のy成分を励振
    E_y[nx//2] = np.sin(2.0 * np.pi * f * t)

    t += dt/2
    E_y += -dt/(eps*dx) * (H_z - np.roll(H_z, shift=1)) # 式(16)
    E_z += dt/(eps*dx) * (H_y - np.roll(H_y, shift=1)) # 式(17)

    # 電界のy成分を励振
    E_y[nx//2] = np.sin(2.0 * np.pi * f * t)

    t += dt/2
    H_y += -dt/(mu*dx) * (E_z - np.roll(E_z, shift=-1)) # 式(19)
    H_z += dt/(mu*dx) * (E_y - np.roll(E_y, shift=-1)) # 式(20)

    img = plt.plot(E_y[nx//2 - 200 : nx//2 + 200], color="blue")
    plt.ylim(-3.0, 3.0)
    image_list.append(img)

ani = animation.ArtistAnimation(fig, image_list, interval=50)
ani.save("freeSpace2.gif", writer="pillow")