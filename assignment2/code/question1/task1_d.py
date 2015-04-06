"""Code to produce plot for d"""
__author__ = 'eng-188do'
__date__ = '18/03/15'


import numpy as np
import matplotlib.pyplot as plt
from task1 import run_euler_iteration

if __name__ == '__main__':
    rng = np.random.RandomState(10)  # random number generator
    delta_t = 0.001  # time step
    final_t = 5.0  # final time point
    nNeurons = 10  # number of neurons
    lambda_val = 1  # value for lambda
    i_val = 1  # the value for I
    f_vector = rng.randn(nNeurons)  # F vector
    r_vector = np.zeros(nNeurons)  # initial rates
    print(f_vector)

    firing_rate_storage = run_euler_iteration(delta_t, final_t, nNeurons, lambda_val, i_val, f_vector, r_vector)
    x = np.arange(-1.5,1.5, 0.01)
    plt.plot(x,x,color='#C2C2C2')
    plt.plot(f_vector, firing_rate_storage[1:, -1], 'x', markersize=10, markeredgewidth=2.5)
    plt.ylabel('r(t=2)')
    plt.xlabel('r$_{\\text{inf}}$')
    #plt.show()
    fig = plt.gcf()
    #fig.set_size_inches(18.5, 10.5)
    fig.set_size_inches(14, 8)
    plt.show()
    fig.savefig('qd_2.png', dpi=100)